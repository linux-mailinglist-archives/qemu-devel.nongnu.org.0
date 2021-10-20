Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233EC4349E0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:13:07 +0200 (CEST)
Received: from localhost ([::1]:36318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9Ws-0003MN-7o
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hp-0004RE-2h
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hn-0003On-Ev
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZvsHGqUvEzawW0OH5Cw6jRuRtAArFcbkyalTetDkgLs=;
 b=Y/Eq+RNPzmrwnosGSrFEUXn0xw9mf1WBHYp1NS/8IGpDTRVJozdQDPvY9n7U9Oaw7p1a8E
 OtbzPdhiywJhl5gqf5yPcrZQH2lccA73ZZpYVBjPqag2SGV9D/VhmNikACGlOP6IVKT6dB
 4M/aJdlPxlthvvaTz5HEC3B/UzwXQgQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-ncuMOGNINNeiliGN5Osf5w-1; Wed, 20 Oct 2021 06:20:17 -0400
X-MC-Unique: ncuMOGNINNeiliGN5Osf5w-1
Received: by mail-ed1-f71.google.com with SMTP id
 h19-20020aa7de13000000b003db6ad5245bso20618627edv.9
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZvsHGqUvEzawW0OH5Cw6jRuRtAArFcbkyalTetDkgLs=;
 b=Sx87zVXcR+hPqje1OwBhBWAHTkCxsvuHWs2HZL4PXOl+KNxAEgi4jwv6FAf+LWwRzv
 Q9wHYIT//7F2m8MwIP01IO36swrssoHyOKW9M/Sh8pCXzvuNEtxkgczoa8bRefX5LXjK
 w/YSlY0lysnNSx5Xrxst116SlV5SQh2m8idLSPyY+SghkGEt+7FYE5vY4ycZl2w0Wj5x
 Gv2bdCob+27rtwf5baLuFR9xvQH3nri4gdBTVWKzde4cBQr+CzYGCSm+f5LRoJlqd6h0
 xGCK/0VZvZB3lzS2SAGSDJOLnKJK+KnHzJMDza880RoRhegicg715iekQ/BxggZ3qT/L
 dqQg==
X-Gm-Message-State: AOAM531v+p3LqTXpG8HSnFn+r0OefHNlYK7ja1ua5cWFFEf2f0IxaiRO
 XPaytLYpDe8EB8fxiGEVe76n91qj+DZVjdRQHYdt/gF7wA0L4uQbzATcWk5Hp8TXFKun2CEFlAR
 k0CBcbSQgnO4oPWg6pRac6Is2j8ZxqN/YGwA3lrOMAxxTxDmjf3rp5cjpAp0i
X-Received: by 2002:a05:6402:2682:: with SMTP id
 w2mr61456731edd.185.1634725214966; 
 Wed, 20 Oct 2021 03:20:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQy583AmKX2slw7zHi91/whr0PCck3FwQyvGpPBuu3KeIiOdzWNjHCsbyWe2JlaEFhI22nDg==
X-Received: by 2002:a05:6402:2682:: with SMTP id
 w2mr61456686edd.185.1634725214719; 
 Wed, 20 Oct 2021 03:20:14 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id e22sm997194edu.35.2021.10.20.03.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:14 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 21/44] libvhost-user: fix VHOST_USER_REM_MEM_REG skipping
 mmap_addr
Message-ID: <20211020101844.988480-22-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 David Hildenbrand <david@redhat.com>, qemu-stable@nongnu.org,
 Coiby Xu <coiby.xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We end up not copying the mmap_addr of all existing regions, resulting
in a SEGFAULT once we actually try to map/access anything within our
memory regions.

Fixes: 875b9fd97b34 ("Support individual region unmap in libvhost-user")
Cc: qemu-stable@nongnu.org
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Coiby Xu <coiby.xu@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211011201047.62587-1-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index bf09693255..787f4d2d4f 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -816,6 +816,7 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
             shadow_regions[j].gpa = dev->regions[i].gpa;
             shadow_regions[j].size = dev->regions[i].size;
             shadow_regions[j].qva = dev->regions[i].qva;
+            shadow_regions[j].mmap_addr = dev->regions[i].mmap_addr;
             shadow_regions[j].mmap_offset = dev->regions[i].mmap_offset;
             j++;
         } else {
-- 
MST


