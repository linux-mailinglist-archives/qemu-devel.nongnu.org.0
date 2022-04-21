Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8CA50A519
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:19:46 +0200 (CEST)
Received: from localhost ([::1]:58046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZWz-0005zI-PQ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhYka-0005Kc-IB
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:29:44 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:42906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhYkY-0008DI-NC
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:29:44 -0400
Received: by mail-yb1-xb35.google.com with SMTP id p65so9358519ybp.9
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zxcalJAJ5b/ceOlClf6wVJ9t1Zip2X2Zw4s8oizPwzc=;
 b=PDUdPHucd0AgOkS7U6N4ryAh3xsHLEOrSG61fzVbjyOOLKqVV1S91w8pT5TM1E3LVO
 V+2ypeXzERCK3WondTTpyieI8cvHeJ76a1o3PPEMLSzy8/q1QOIU1hDTKXd4xtCbWdWj
 SFQdVa+Im/bo3M/J+iNLrrWFgxtlhWjytioty8f/EB30luWVVIQqolBvJSiOgBYVFWvt
 Z/Eq6fFpXDCkOhg+jD23/PCcgYoj86hyzx0xS2YEwJEbtd/UneDTeQ0Wld9xwuy8c0WD
 BJUrTWAN01IW4xxtUpNghaxy660GyrMlv3xNlYEJfhKBPHIBbtI/Ds8nSRZHiLzjVewa
 8TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zxcalJAJ5b/ceOlClf6wVJ9t1Zip2X2Zw4s8oizPwzc=;
 b=7kL1Mo0NDVCsZycmZytqtJ58ASnk6E5OsqgnB7830gmgnkuE/cG5pT3BxKDXi1JvPO
 kXSCHLheb2yLG7ThU0g9/FMWztJz8scvxX4NyZfwlJxHonhthiyMd4+v8FRKUaVGjS3v
 WdFYBLWUmaV0SshKcpDtuEcV240vOX/1hKvuTnfr37cxHiugagwuiTcVOB3q/hTIlSBO
 FhnfhndQeD2XKQtVaCVawbfSDBh96RJnN4s1A7O9ajAqoqnTaoQaIdjk4XAFC+RR/AxR
 kBBlco1ZTN5BQXByjFpE5Qur0l0/VQVl4ahAOOfs7yiYfocqoC0orG3LdQ586y1p1URw
 ERHQ==
X-Gm-Message-State: AOAM530+oEBKEHyrLbYb23zfPkTAK1AoM4ip95jbBcPssjkde2pyxiTz
 6tKTrAEqrI9HAnRalHA1FcJ6eCVsXeV8H68FQi4/hA==
X-Google-Smtp-Source: ABdhPJy18aJbXFZeJbDYMajIM59vOgl6MMt9knzHPFSm7azymnpbrJPZl4sERRaBJUkZEReCqsTjZbZ6+QPGVnpVjDI=
X-Received: by 2002:a05:6902:34f:b0:645:463a:b824 with SMTP id
 e15-20020a056902034f00b00645463ab824mr201026ybs.39.1650554980489; Thu, 21 Apr
 2022 08:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220413172246.73708-1-gautamnagrawal@gmail.com>
In-Reply-To: <20220413172246.73708-1-gautamnagrawal@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 16:29:29 +0100
Message-ID: <CAFEAcA8Zs9SStbHYPgprODCav1BkMFqKhizt5Yp_XmZ05bfLLQ@mail.gmail.com>
Subject: Re: [PATCH v2] Warn user if the vga flag is passed but no vga device
 is created
To: Gautam Agrawal <gautamnagrawal@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: stefanha@gmail.com, thuth@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 13 Apr 2022 at 18:23, Gautam Agrawal <gautamnagrawal@gmail.com> wrote:
>
> A global boolean variable "vga_interface_created"(declared in softmmu/globals.c)
> has been used to track the creation of vga interface. If the vga flag is passed
> in the command line "default_vga"(declared in softmmu/vl.c) variable is set to 0.
> To warn user, the condition checks if vga_interface_created is false
> and default_vga is equal to 0.If "-vga none" is passed, this patch will not warn the
> user regarding the creation of VGA device.
>
> The initialisation of Global variable "vga_interface_created" in softmmu/globals.c
> has also been corrected.
>
> The warning "A -vga option was passed but this
> machine type does not use that option; no VGA device has been created"
> is logged if vga flag is passed but no vga device is created.
>
> "vga_interface_created" has also been included in "xen_machine_pv.c" and
> "fuloong2e.c". This patch has been tested for x86_64, i386, sparc, sparc64 and arm boards.
>
> Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/581
> ---
>  hw/isa/isa-bus.c          | 1 +
>  hw/mips/fuloong2e.c       | 1 +
>  hw/pci/pci.c              | 1 +
>  hw/sparc/sun4m.c          | 2 ++
>  hw/sparc64/sun4u.c        | 1 +
>  hw/xenpv/xen_machine_pv.c | 1 +
>  include/sysemu/sysemu.h   | 1 +
>  softmmu/globals.c         | 1 +
>  softmmu/vl.c              | 6 ++++++
>  9 files changed, 15 insertions(+)

You've missed the uses of vga_interface_type in hw/hppa/machine.c
and hw/ppc/spapr.c. ("git grep vga_interface_type" will give you the
list of all the files which touch that variable.)

thanks
-- PMM

