Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D5932A10A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:37:45 +0100 (CET)
Received: from localhost ([::1]:55930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5Db-0004eQ-Bl
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lH5Ce-0004C0-Hm
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 08:36:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lH5Cb-0002zi-Bn
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 08:36:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614692198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CPcY/JvP08en1kSuwR+KjydWV7u2XTQCdgdGCv98oz0=;
 b=Z7by+ybCwHB/L/+U1Zzt1DncrBJWIIIN3A6DOX1HNWihPgarjEqUmmhXFzbHxgBb+ixpq1
 g0G+W7qDKuXysXKK2SGPq/hprx5x9AOMPvTN5g1dkCcXkMPgX3bZ018sd0JlLOJ5c9m9PG
 KxEv2JGyfYh0/VWIUgGl1NGSdPPLe7s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-tmbBSUeGPwegiW8DXXrrnA-1; Tue, 02 Mar 2021 08:36:36 -0500
X-MC-Unique: tmbBSUeGPwegiW8DXXrrnA-1
Received: by mail-wm1-f72.google.com with SMTP id s192so1176378wme.6
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 05:36:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CPcY/JvP08en1kSuwR+KjydWV7u2XTQCdgdGCv98oz0=;
 b=ihxQXgy9BA1C6ideS4+u4HNdycwADz0r1fnW3jUaOA/m+gzXJxNeY+bKsM25e870Zz
 m8oCAIkKfyksA1oWO5SlJL/cEDRYkX3dk314TG1bx6SxsYe0U2QKdSbSIuHIcRdaS9Ga
 g1EPq2Ht5UAaV5vQ5F/lad21694QethG1MrAe94Cp1krvBUQZLex7QPfXBuMBBYv/faA
 7T34nqOnWwJlRMvNWNdrJeBxUq1+KRc5wYAcdn6ppkH6+83q0mPnwxR57ND8zEJtLhdv
 q8EX7NEEdg+6sG47AwusLLsrDxwceQdcPquG6Flt9yvHZaAzFi/FWnA6k+vns9OUGPHS
 7aXA==
X-Gm-Message-State: AOAM5333YtjX0bgPb940ZCW9d85MF+1fzgZD/FoLiJWjSaF9l0jNMI3H
 m3u1NiHcTJg6glNpRpaHicZwfwzInxCog0JMyLegeVMVOuCG3pCcSZPufl9R/hsoZldOSxEvP4z
 s75gC11vLomfltD0=
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr4131026wmi.117.1614692195223; 
 Tue, 02 Mar 2021 05:36:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCLrw8pNpjtIFysn5hMCnBQ4EuvmhQkucNNEJtb/MXhSrrS0wRxq/jq0Iu7OMc4eHA2012Og==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr4130997wmi.117.1614692194930; 
 Tue, 02 Mar 2021 05:36:34 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id r7sm28832936wre.25.2021.03.02.05.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 05:36:34 -0800 (PST)
Date: Tue, 2 Mar 2021 14:36:31 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH 1/2] elf_ops: correct loading of 32 bit PVH kernel
Message-ID: <20210302133631.xcs66agqx3y3irci@steredhat>
References: <20210302090315.3031492-1-david.edmondson@oracle.com>
 <20210302090315.3031492-2-david.edmondson@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20210302090315.3031492-2-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 02, 2021 at 09:03:14AM +0000, David Edmondson wrote:
>Because sizeof(struct elf64_note) == sizeof(struct elf32_note),
>attempting to use the size of the currently defined struct elf_note as
>a discriminator for whether the object being loaded is 64 bit in
>load_elf() fails.
>
>Instead, take advantage of the existing glue parameter SZ, which is
>defined as 32 or 64 in the respective variants of load_elf().
>
>Fixes: 696aa04c84c6 ("elf-ops.h: Add get_elf_note_type()")
>Signed-off-by: David Edmondson <david.edmondson@oracle.com>
>---
> include/hw/elf_ops.h | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>
>diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
>index 8e8436831d..78409ab34a 100644
>--- a/include/hw/elf_ops.h
>+++ b/include/hw/elf_ops.h
>@@ -598,9 +598,7 @@ static int glue(load_elf, SZ)(const char *name, int fd,
>             nhdr = glue(get_elf_note_type, SZ)(nhdr, file_size, ph->p_align,
>                                                *(uint64_t *)translate_opaque);
>             if (nhdr != NULL) {
>-                bool is64 =
>-                    sizeof(struct elf_note) == sizeof(struct elf64_note);
>-                elf_note_fn((void *)nhdr, (void *)&ph->p_align, is64);
>+                elf_note_fn((void *)nhdr, (void *)&ph->p_align, SZ == 64);
>             }
>             data = NULL;
>         }
>-- 
>2.30.0
>
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


