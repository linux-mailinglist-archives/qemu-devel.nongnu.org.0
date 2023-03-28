Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A9F6CB795
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 09:03:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph3LD-0008O6-AW; Tue, 28 Mar 2023 03:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ph3Ko-0008NZ-SK
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 03:01:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ph3Km-0005EK-PH
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 03:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679986889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QrsGDXkgH2s5fVZvHEGR02tMqiFQ0isT4B/W2SRMmgM=;
 b=G2w48BmfBh/KiNJmk83HoEM73jVKuzHWqs7L0iES8bW0wxMLFnOAAgG4vrM2+e8YMWwEn1
 NkW9y583SVKdWFPwFy1j3hi0NMuzwcTxL5ktUMF1OWCeR5Ax/YBaIapjSR4nLSSK2JvTFY
 8Pj7nU25RwTbOYOYksbnBc4tS07NhVs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-uZDe_cguOUC3w1cB3BcoaQ-1; Tue, 28 Mar 2023 03:01:27 -0400
X-MC-Unique: uZDe_cguOUC3w1cB3BcoaQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 175E1101A531;
 Tue, 28 Mar 2023 07:01:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC7DE492C13;
 Tue, 28 Mar 2023 07:01:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B0FE421E6926; Tue, 28 Mar 2023 09:01:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v2 1/1] hw/arm: do not free machine->fdt in arm_load_dtb()
References: <20230323204414.423412-1-danielhb413@gmail.com>
 <20230323204414.423412-2-danielhb413@gmail.com>
Date: Tue, 28 Mar 2023 09:01:25 +0200
In-Reply-To: <20230323204414.423412-2-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Thu, 23 Mar 2023 17:44:14 -0300")
Message-ID: <87zg7x2wca.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> At this moment, arm_load_dtb() can free machine->fdt when
> binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
> retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
> the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
> machine->fdt. And, in that case, the existing g_free(fdt) at the end of
> arm_load_dtb() will make machine->fdt point to an invalid memory region.
>
> After the command 'dumpdtb' were introduced a couple of releases ago,
> running it with any ARM machine that uses arm_load_dtb() will crash
> QEMU.
>
> Let's enable all arm_load_dtb() callers to use dumpdtb properly. Instead
> of freeing 'fdt', assign it back to ms->fdt.
>
> Note that all current callers (sbsa-ref.c, virt.c, xlnx-versal-virt.c)
> are assigning ms->fdt before arm_load_dtb() is called, regardless of
> whether the user is inputting an external FDT via '-dtb'. To avoid
> leaking the board FDT if '-dtb' is used (since we're assigning ms->fdt
> in the end), free ms->fdt before load_device_tree().
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Fixes: bf353ad55590f ("qmp/hmp, device_tree.c: introduce dumpdtb")
> Reported-by: Markus Armbruster <armbru@redhat.com>i
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/arm/boot.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 50e5141116..de18c0a969 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -549,6 +549,13 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>              goto fail;
>          }
>  
> +        /*
> +         * If we're here we won't be using the ms->fdt from the board.
> +         * We'll assign a new ms->fdt at the end, so free it now to
> +         * avoid leaking the board FDT.
> +         */
> +        g_free(ms->fdt);
> +

"We will" is not true: we will not if we goto fail.  Leaves ms->fdt
dangling, doesn't it?

>          fdt = load_device_tree(filename, &size);
>          if (!fdt) {
>              fprintf(stderr, "Couldn't open dtb file %s\n", filename);
               g_free(filename);
               goto fail;
           }
           g_free(filename);
       } else {
           fdt = binfo->get_dtb(binfo, &size);
           if (!fdt) {
               fprintf(stderr, "Board was unable to create a dtb blob\n");
               goto fail;
           }

If we succeed, we'll assign @fdt to ms->fdt (next hunk).  Won't this
leak old ms->fdt?

       }

> @@ -689,7 +696,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
>                                         rom_ptr_for_as(as, addr, size));
>  
> -    g_free(fdt);
> +    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
> +    ms->fdt = fdt;
>  
>      return size;


