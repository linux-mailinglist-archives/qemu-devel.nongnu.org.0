Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF99B6778C9
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 11:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJtod-0002tc-6p; Mon, 23 Jan 2023 05:12:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pJtoX-0002tC-SK
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 05:12:35 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pJtoW-0007Bs-Bk
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 05:12:33 -0500
Received: by mail-ej1-x62b.google.com with SMTP id mg12so29072784ejc.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 02:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=k1U1LJazUrh352ajTZulatQ504t3VG+NxD1mtJ+Eayo=;
 b=Q7fzLf72Ko4NfdCK8V05Qk1VyqnfzlgQTlBUXDGGNvVw0nZQTl0XUGc8jFYm/Gq1pT
 aES3dWlrHKqw4QFnKKdBZqYQODmMXv4BGOCDmUT7dULwHqx1STVIGqhB2wPN4J4TCP6W
 9pTYJfMqZRqAeBRTQJNQ5HDCxz5UUPhi3xhK/xJV5h6KkBdvDtj4W+HVcE4OZ0boh9NI
 2H0gHyhxnuGuGDAUl+cj2bjiM8Z1HHJ8mJA+dH5b2L0XbLK4QHY5TfLcQQffDyimb5h3
 aSVfuiYgzJLsHcr/LbTtECtUyk3jh3LjxdDL+uA1Np/Kgea3AHzVrMlT+Yy0znVeVKeI
 TbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k1U1LJazUrh352ajTZulatQ504t3VG+NxD1mtJ+Eayo=;
 b=dJg4hHWlOip2rpn15sLGJyd9RTf6dGwQbkExqvRI1vwrH20j2sqfAB+enGs5ZxKFD/
 ZyftbAjvZHYB5qt63AFWQixujy9JCW+VqVnthiZrN3hK2B9Z0QxroEOlJNB2iW17woss
 zgkCfFyxThm/p15OyxqywHaZ0oIT8U0fbDuW3jGHMGv0YzyyEqJZRGFsF9OxdRIimwa2
 oDu2RFTCXK2x7OGLbDDN7/Nx/wgSeYi4+KfzS40DQBjUrL2Ys8ku0B9GESOe9A2Ft4Ar
 PEFWP10OgnANMfRn55jXsS4udxou5vnZu5059HewLfUycsFJwhtKhnthBp93tikFGdve
 4+wA==
X-Gm-Message-State: AFqh2krkxSKrVD1YYrIoIb1RNmVFgzDcHrTZ80NDDVMZq8adLadcAP1n
 DXOyJIdDF8WKkrmeeaJLW7sTRA==
X-Google-Smtp-Source: AMrXdXuk0ArtYxBZFs4Gr8l5fbTIuLY1C8/gkoKhQnsCZVop0Ezu8a0lIOb2yvWQLfDN3g7EMSCDiA==
X-Received: by 2002:a17:906:c28e:b0:871:2032:946a with SMTP id
 r14-20020a170906c28e00b008712032946amr25533845ejz.5.1674468750944; 
 Mon, 23 Jan 2023 02:12:30 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 21-20020a170906319500b0086faa5b06d4sm11843926ejy.181.2023.01.23.02.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 02:12:30 -0800 (PST)
Date: Mon, 23 Jan 2023 11:12:29 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v6 4/5] riscv: Correctly set the device-tree entry
 'mmu-type'
Message-ID: <20230123101229.okef2kaqubwvybfh@orel>
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
 <20230123090324.732681-5-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123090324.732681-5-alexghiti@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62b.google.com
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

On Mon, Jan 23, 2023 at 10:03:23AM +0100, Alexandre Ghiti wrote:
> The 'mmu-type' should reflect what the hardware is capable of so use the
> new satp_mode field in RISCVCPUConfig to do that.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  hw/riscv/virt.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

