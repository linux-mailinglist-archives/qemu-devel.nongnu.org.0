Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27484337AE9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 18:34:35 +0100 (CET)
Received: from localhost ([::1]:36154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPCk-0002Y8-2s
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 12:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lKP6N-0006OU-7N
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:27:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lKP6J-00036g-KT
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615483674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UTreVqTZ+UfW91Fsn5Nu+DxDjvCb3Sk4DQaybDK1ywA=;
 b=hY93bZYIcwbf7OGMzrq4qUTLdUCu91KTK2ixnigodazhwoKgmQntnjqUXNn855eGzBz6xz
 onx5Rw0l7hf5GWtrfsmsP2agkWZvV4riy60KHSaDpz6dB9urXaA8zSxNeeWrHdiltMf2D7
 IwStkIrjKWygmOGG8j+qlBdsCde+T30=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-gXX8tJRpOvu7A7RmP8iYGA-1; Thu, 11 Mar 2021 12:27:47 -0500
X-MC-Unique: gXX8tJRpOvu7A7RmP8iYGA-1
Received: by mail-qk1-f197.google.com with SMTP id b127so14314510qkf.19
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 09:27:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HqvpyYan55AKqxoJj0T7i6e+K5kYldsJqJf9ie4TgBc=;
 b=bHYkTbnxXWGdkyBC64T8+sJCYwX0vBSgIcxJYenAxyRpVmuQfuTTaPwS0iPH2BUpa8
 zwqGX8DPR8pSoUWT5q6gTcifaydlRsceCq8BVRbtpSF6PJHrFlkoXehUzEs8uohcTFO9
 1VUhVwJ/y88fsiK7c0Tg/wTYkmRVE0q1hwAZs2570yQ5BCYP7moP2IcU/5hxGWawxbHd
 FMYIxOwjkyU/MHcsaznCiMs3HI6I/se11Rcj99K5ir5WmqgSI9PUeubTez0ubBdlrrEc
 MjPr/fSXqHLR+tQ2z0QHqT3VQ9bqS05TNIIRHy4CoK0zhZZvF5uHhLZ6A7mTSVT/vE6/
 AWtA==
X-Gm-Message-State: AOAM5326tcArn11n6VjMN7ZJxPpnLD9R236vqDGqIVgWdr6hGvd/5c0H
 zJ8t68OSD5flGdAs7h4lVlk0us1IhHSoC0+wMfIuoiJeNgDxBDshkEJrgK2OFUHyrVmZStBfm/e
 U98NZq8QFB7A8m6U=
X-Received: by 2002:aed:2068:: with SMTP id 95mr8499446qta.181.1615483666999; 
 Thu, 11 Mar 2021 09:27:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTA/IE/SNkmAAmMMrRnJZzXbJzT62zcd0lATv4sBRfzKq/NHz0TOmiixhhAQ2eCy30kCJH/g==
X-Received: by 2002:aed:2068:: with SMTP id 95mr8499432qta.181.1615483666787; 
 Thu, 11 Mar 2021 09:27:46 -0800 (PST)
Received: from xz-x1 ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id a9sm2104340qtx.96.2021.03.11.09.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:27:46 -0800 (PST)
Date: Thu, 11 Mar 2021 12:27:44 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/2] hw/mips/jazz: Use generic I/O bus via get_system_io()
Message-ID: <20210311172744.GI194839@xz-x1>
References: <f776956e-dd3b-98f8-4b99-0cd234d227c0@amsat.org>
 <20210310191255.1229848-1-f4bug@amsat.org>
 <20210310194924.GF6530@xz-x1>
 <5e53b99f-548c-8da9-f6fd-9c764642350b@amsat.org>
 <20210310202919.GH6530@xz-x1>
 <a97eb0b5-d3fd-ca44-4490-c5e5bc796699@amsat.org>
 <a64ff8f0-5db1-c338-b99b-7a74a150a770@amsat.org>
MIME-Version: 1.0
In-Reply-To: <a64ff8f0-5db1-c338-b99b-7a74a150a770@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Alexander Bulekov <alxndr@bu.edu>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Mar 11, 2021 at 05:21:49PM +0100, Philippe Mathieu-Daudé wrote:
> So using:
> 
> -- >8 --
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 874a8fccdee..8ce2d7f83b9 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -713,6 +713,12 @@ static MemoryRegion
> *memory_region_get_flatview_root(MemoryRegion *mr)
>                  continue;
>              }
>          }
> +        if (mr && mr->addr) {
> +            error_report("Detected flatview root memory region '%s' with"
> +                         " non-zero base address (0x%"HWADDR_PRIx"):
> aborting",
> +                         memory_region_name(mr), mr->addr);
> +            abort();
> +        }
> 
>          return mr;
>      }

(Attaching again...)

-- 
Peter Xu

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-memory-Make-sure-root-MR-won-t-be-added-as-subregion.patch"

From 4fe7614f2087117aa912fd3d33d43ba02f2b50b1 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Thu, 11 Mar 2021 11:40:21 -0500
Subject: [PATCH] memory: Make sure root MR won't be added as subregion

Add a bool for MR to mark whether this MR is a root MR of an AS.  We bail out
asap if this MR is added as a subregion of another MR.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/exec/memory.h | 1 +
 softmmu/memory.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c6fb714e499..211f10e877e 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -477,6 +477,7 @@ struct MemoryRegion {
     bool ram_device;
     bool enabled;
     bool warning_printed; /* For reservations */
+    bool is_root_mr;
     uint8_t vga_logging_count;
     MemoryRegion *alias;
     hwaddr alias_offset;
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 874a8fccdee..aebaa956258 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2442,6 +2442,7 @@ static void memory_region_add_subregion_common(MemoryRegion *mr,
                                                MemoryRegion *subregion)
 {
     assert(!subregion->container);
+    assert(!subregion->is_root_mr);
     subregion->container = mr;
     subregion->addr = offset;
     memory_region_update_container_subregions(subregion);
@@ -2819,6 +2820,7 @@ void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name)
 {
     memory_region_ref(root);
     as->root = root;
+    root->is_root_mr = true;
     as->current_map = NULL;
     as->ioeventfd_nb = 0;
     as->ioeventfds = NULL;
-- 
2.26.2


--8t9RHnE3ZwKMSgU+--


