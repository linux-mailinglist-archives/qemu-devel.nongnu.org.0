Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0444C559D23
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:18:24 +0200 (CEST)
Received: from localhost ([::1]:45834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4l4h-0007AO-4A
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o4kxS-0004ka-KM
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:10:54 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:34810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o4kxP-0003jq-7J
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:10:54 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-101ab23ff3fso4199860fac.1
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KKwYtMkVAJC7iXqgMJX8OEQfA8pwhndori+/PclxM6o=;
 b=fAm8WRfknSnaY4X0oJlyhVwkidhKP4LDchbOyu3LYS8pxlozR2QwR+x3LmBXul2Ug+
 g9tefellVV6SZFS4NbSpqcxhlo2nJibWtUvqWewIPQ9g4veIV+V/QGLzL8BIkGDIGs0e
 3/qfYo5HIIVrRFeVJJoX8WJGosT0PRS+AUmMRsdirdqkAaoubJFWPW2vrO/q9/btFfgs
 NMaKX6OYJJOvwSqgAQj6iAt30W91XiizOQGq/rMef+VFNTB/V1yFaXzIT4L8JuqffQj0
 7qxJI4/XSWJH363UDSSC4uCupmkq5C8SKIrV9TbxF7F5fdiWXCKjUlS32i3KtkqOAdU2
 g0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KKwYtMkVAJC7iXqgMJX8OEQfA8pwhndori+/PclxM6o=;
 b=GILBOas+2bTJ+973i1IUdAWcgVgd7nHPKC3La0QDjcg9gmVtqXtteDI5Ie+1HneoaF
 4IlE4V3MuASAG17kKFiumGOmFe11mu+Oy0I/e0RmDV8HMxmRDeu345SjR/uNHwllnkC3
 bxP53ZqKux5H2svlHe8UlHH+P7vSEWH8Sr8vv1Wv5fozTzJQhyYkSwa6/HPj4K3SF/0+
 bWM94bUKM15CLGeEmfqwUTkn4ijjf2evB68azlkqlI39MUF9eM66t1kjj0sauCE/LB+3
 Yg4ehgnh5g+QwPSe9GcmnxjCfS4BHFJjzq2G5Slj8DEOp2Lm+QO1Q4sT+kCIbvnJQpIt
 Dx+g==
X-Gm-Message-State: AJIora8boczS0lPPc1NpHPD7pEmZKYY1ed/ojHJPcREbM2AzR9dHwaOx
 HWiudeZmGLvEfJ5q9V4fUDfkxhtIEUah1oHsN7E=
X-Google-Smtp-Source: AGRyM1vxNH0pZZFqqu0/8avNblUKPEqIjiJsEMcHJaEbGNIlD0Vl+bKLxWmxp4qkcrdrESJQ+FscdxaTlFE8ZhxF8Cg=
X-Received: by 2002:a05:6870:204c:b0:101:6275:67de with SMTP id
 l12-20020a056870204c00b00101627567demr2359957oad.101.1656083449988; Fri, 24
 Jun 2022 08:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220623153844.7367-1-jag.raman@oracle.com>
In-Reply-To: <20220623153844.7367-1-jag.raman@oracle.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 24 Jun 2022 16:10:37 +0100
Message-ID: <CAJSP0QVQ7AMq20MwP2KAas17-ZbhntnKOyhbTt7BDDyJo8g5tQ@mail.gmail.com>
Subject: Re: [PATCH] msi: fix MSI vector limit check in msi_set_mask()
To: Jagannathan Raman <jag.raman@oracle.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=stefanha@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

On Thu, 23 Jun 2022 at 16:42, Jagannathan Raman <jag.raman@oracle.com> wrote:
>
> MSI supports a maximum of PCI_MSI_VECTORS_MAX vectors - from 0 to
> PCI_MSI_VECTORS_MAX - 1.
>
> msi_set_mask() was previously using PCI_MSI_VECTORS_MAX as the upper
> limit for MSI vectors. Fix the upper limit to PCI_MSI_VECTORS_MAX - 1.
>
> Fixes: Coverity CID 1490141
> Fixes: 08cf3dc61199 vfio-user: handle device interrupts
>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/pci/msi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/pci/msi.c b/hw/pci/msi.c
> index 5c471b9616..058d1d1ef1 100644
> --- a/hw/pci/msi.c
> +++ b/hw/pci/msi.c
> @@ -322,9 +322,9 @@ void msi_set_mask(PCIDevice *dev, int vector, bool mask, Error **errp)
>      bool msi64bit = flags & PCI_MSI_FLAGS_64BIT;
>      uint32_t irq_state, vector_mask, pending;
>
> -    if (vector > PCI_MSI_VECTORS_MAX) {
> +    if (vector >= PCI_MSI_VECTORS_MAX) {
>          error_setg(errp, "msi: vector %d not allocated. max vector is %d",
> -                   vector, PCI_MSI_VECTORS_MAX);
> +                   vector, (PCI_MSI_VECTORS_MAX - 1));
>          return;
>      }
>
> --
> 2.20.1
>
>

