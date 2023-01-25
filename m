Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB3267B555
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 16:02:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKhGe-0003Zc-Tt; Wed, 25 Jan 2023 10:00:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pKhGY-0003YY-0A
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 10:00:50 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pKhGW-0005un-DB
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 10:00:45 -0500
Received: by mail-ej1-x62e.google.com with SMTP id rl14so45054154ejb.2
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 07:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DkCMA5p8shoIw9bXSUeqIvRFNyjW3JdiSdkKDaGgizk=;
 b=WSNlVa93DFrkSdvK83vWG1r6N8LQvZ+uSkD2f79Qzm5PyxrR9IyPTYgnx0YH393SMB
 ty9cL8MJBREvxa8oUmeeoB0PQUBP/+07RbaiOWBzRWu/WMSRvIxCXT0zy0E1EPzQ2TcN
 5EHE1uLGROJNf4Q7vSrj0gmMvA1/uZd+qvVgVzkQIGuUKwchsE+HS4rHVmgxrOT+1Y/M
 o+NzVsHVCI1Kn5fc2bkP1zuAOPUvGTztzzPlziPrbUjPS8GAKtOIMgwjgJ4hxXqgB2LT
 y9CLdV5j9Xju9f2YG0lqsBV642UicI/4rX1q2/viOScYtHMWEyvLJde5EEpIn+OLvCdT
 g7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DkCMA5p8shoIw9bXSUeqIvRFNyjW3JdiSdkKDaGgizk=;
 b=odAdDe7PKAGr2qiTH6WL9o7fO3n74iY5bb5jL+P9Erd+gabSPRtS9yy8CZmwvm40ha
 CD26ly5Y0C3zNqrWLyNGYhqeWHPvpxZNifKbziAZe/lbEnKxaENac4KXGYIKBi6KzO3O
 SSe+Vou3JipLjshPNkBWgModFE/YEoE885nSux0NsQKs/1ByNuqakI/QVc5uLPSOjZqf
 0dLkAwgv87pV9VXNqAUk+dYDDswKg0UQZdcb/wo60LB3GUFMvMeaiofSWRDo8cR8x1pr
 fYjhxZbnlRyntoyEmQml0p5egHmphzbsBh4on/vrNJG3U75q6OeR5pzMEnwI+DHisel3
 /v8g==
X-Gm-Message-State: AFqh2koTCYkuuNKLOehHonpsRGa6RJlAboMNdfcNHf3ZGoC105lr34Ac
 VgDumFAbFQpIKDNr+jqi3wbu3A==
X-Google-Smtp-Source: AMrXdXtraShb0epMn+qzqjLaZ7jNwWVUMmQ5bQjYdCq52g2oM+DGwq0KYfwipbVgQqUsHS14yWkCcA==
X-Received: by 2002:a17:906:f0d1:b0:84d:450b:8767 with SMTP id
 dk17-20020a170906f0d100b0084d450b8767mr33485607ejb.21.1674658842607; 
 Wed, 25 Jan 2023 07:00:42 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a17090635d200b007c0b28b85c5sm2434816ejb.138.2023.01.25.07.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 07:00:42 -0800 (PST)
Date: Wed, 25 Jan 2023 16:00:35 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Subject: Re: [PATCH v7 3/5] riscv: Allow user to set the satp mode
Message-ID: <20230125150035.mx6y65aqx7si32mm@orel>
References: <20230125084107.1580972-1-alexghiti@rivosinc.com>
 <20230125084107.1580972-4-alexghiti@rivosinc.com>
 <20230125120107.mjh54hcmustfplgi@orel>
 <CAHVXubjxRZmhzWJz3fcpC7enec_1VRs7qnhE=UFx4ijYN55UsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHVXubjxRZmhzWJz3fcpC7enec_1VRs7qnhE=UFx4ijYN55UsQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Jan 25, 2023 at 01:23:45PM +0100, Alexandre Ghiti wrote:
> On Wed, Jan 25, 2023 at 1:01 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Wed, Jan 25, 2023 at 09:41:05AM +0100, Alexandre Ghiti wrote:
...
> > > +    if (!rv32) {
> > > +        for (int i = satp_mode_max - 1; i >= 0; --i) {
> >
> > satp_mode_max can be zero when configs only support mbare, so we need
> > to be careful here. We should only run this loop when it's greater than
> > zero.
> 
> If satp_mode_max == 0, we don't enter the loop, so no problem for me.
>

Oh, right, i is signed. I reviewed this right after reviewing some
unsigned comparisons and had the wrong thought process engaged...
And now I recall that when I'd read this before in previous revisions
I had had the same impulse at least once, but those times I noticed
it was signed before sending comments. Anyway, sorry for the noise.

Thanks,
drew

