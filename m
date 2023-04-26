Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF3C6EF788
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 17:09:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prgky-0005I9-OO; Wed, 26 Apr 2023 11:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1prgkw-0005HW-FN
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 11:08:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1prgkv-00084s-18
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 11:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682521706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qgDYXeiXC/YOp4Nu274kFBzFD/Pen8KuCVob2dbNFQ4=;
 b=Buf4EjmowoTcvP9UZq3KgbUX0hU2RmS5J5tPe/AE9m50Oz8b4zHAb41Ueui7Yp73LoUA35
 hZ0hid+bjomiO0LRDvjcCQQYLMlAZtpvgyqy4oUO+UYMf8a8LiQqrYObKCC5Za8+PEQBcV
 SU0MoRQ1n7TuqsJ18o49x1mz2/2xJ1k=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-LfkuFcYBMGebyo-sxKWaVw-1; Wed, 26 Apr 2023 11:08:23 -0400
X-MC-Unique: LfkuFcYBMGebyo-sxKWaVw-1
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-51f10b8b27dso4286973a12.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 08:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682521702; x=1685113702;
 h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
 :mime-version:references:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qgDYXeiXC/YOp4Nu274kFBzFD/Pen8KuCVob2dbNFQ4=;
 b=IUA9s4CeMAgeRWkLcPxXd+HmGOIogm8HlD1UM2hqFi6n0/Dz7PH1kplIjO8gBCs+n2
 A5pVYNLrHilE/ORqTH+mMaHu+PjKZ5rfIuCFKL7dfA/ZiGXgpw09+WXnrwBI0WPBaXXb
 w5WXa2Ix2ZXHNREp7N2KHSNVQNXIduY43AxnlYvT9nlwf9+pXe5nexVRnIty1TIGrUq6
 pzlZ5nZGY4YbtqB5i6BXQwYqT0kenIw2op/Sk2OjHyJrlxttmlmk81HaD1CXif3FDF2I
 fX+h/NYQM0WurcnU7hLv46U3pFF/y9Tv6E0Al1Dz+WncO7nuiqT8kzqG/l+1WihewHaU
 k5PQ==
X-Gm-Message-State: AAQBX9fT7qNgf92TmxE+0BzwfTXPCxeSeqWzGzj4KD6L6eHnqjtcBUBA
 dkFflu7ZjLZUBJdyr9tYlQFEGXRrs0l90ybWkd9JKwX9vxKZGF/4yXj0OekLaEDZILJjhUNDJOi
 roUSvc35JGb1DhiiD+DQ3tyyW5UVsPAg=
X-Received: by 2002:a17:90b:1e4f:b0:23f:29a:5554 with SMTP id
 pi15-20020a17090b1e4f00b0023f029a5554mr18996310pjb.48.1682521702458; 
 Wed, 26 Apr 2023 08:08:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zqdow0poy2NkKtWdii8qy9XwPSBgyLVKXMT3YIM5uRPT4kuNncdWLlmDhzED/XG4Q6lj1CtT3HQs0TJpR/+wY=
X-Received: by 2002:a17:90b:1e4f:b0:23f:29a:5554 with SMTP id
 pi15-20020a17090b1e4f00b0023f029a5554mr18996284pjb.48.1682521702074; Wed, 26
 Apr 2023 08:08:22 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Apr 2023 17:08:21 +0200
From: Andrea Bolognani <abologna@redhat.com>
References: <20230421043353.125701-1-sunilvl@ventanamicro.com>
 <b882e2cf-8e7f-eacc-27cf-05364a065290@gmx.de>
 <CABJz62ME20bT8v9TK4h+RcujHK_eY+wRF1UK9aN+Ww8Fg_=QQg@mail.gmail.com>
 <bcb3e2c4-e35f-58b7-5a58-8e5ba76754b4@linaro.org>
MIME-Version: 1.0
In-Reply-To: <bcb3e2c4-e35f-58b7-5a58-8e5ba76754b4@linaro.org>
Date: Wed, 26 Apr 2023 17:08:21 +0200
Message-ID: <CABJz62PonP2C0OjYZy0FxpoPwL0=+xmnDjjVAkLAYMyovp9sVQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Enable booting M-mode or S-mode FW from
 pflash0
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Sunil V L <sunilvl@ventanamicro.com>, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, Apr 21, 2023 at 11:31:44PM +0200, Philippe Mathieu-Daud=C3=A9 wrote=
:
> On 21/4/23 18:48, Andrea Bolognani wrote:
> > For what it's worth, this change seems to go in the right direction
> > by making things similar to other architectures (x86, Arm) so I'd
> > love to see it happen.
>
> Unfortunately another arch that followed the bad example of using
> a R/W device for the CODE region and not a simple ROM.

I'm not sure if that mitigates your concern, but at least when using
libvirt you're usually going to get one R/O pflash for the CODE part
and one R/W pflash for the VARS part.

This is the case today on x86_64 and aarch64, and with this change
the same would be true on riscv64 going forward.

--=20
Andrea Bolognani / Red Hat / Virtualization


