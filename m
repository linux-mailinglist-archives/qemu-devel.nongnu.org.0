Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E0A4334F1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:44:00 +0200 (CEST)
Received: from localhost ([::1]:59178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnXD-0006rE-Bg
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAs-0000Nu-E0
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAp-0002SY-3E
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZvsHGqUvEzawW0OH5Cw6jRuRtAArFcbkyalTetDkgLs=;
 b=PriiuFejb3k7e9+H8KSNDLMAt3aAYxJ9vkmIkfVOgAUYS68brAxIcpHEeQUpvlv+9pb0TX
 Jh0YBwHHT6BAo/0BYvxkFlLoI0l2G94z+lZ29UAURNMyfiLM7C0TiTqRXsTBoIKbgGFaBI
 wC9vz0nCAkymTcQ+BdKV3xadkQysTSo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-Yvubqow8NCCZdMOrlqsNIg-1; Tue, 19 Oct 2021 07:20:43 -0400
X-MC-Unique: Yvubqow8NCCZdMOrlqsNIg-1
Received: by mail-ed1-f71.google.com with SMTP id
 h19-20020aa7de13000000b003db6ad5245bso17346394edv.9
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZvsHGqUvEzawW0OH5Cw6jRuRtAArFcbkyalTetDkgLs=;
 b=o4HW88DfkK0zx3fU/JkrU99CxA6jr4Z1odwkdt3u3mWFQwHxt1GTFqmFPiad0GLmXQ
 xXW1JRazyKS+873PsHbKU7OG3NpGJNMfv8P8x8G42J3OIM7ephnuljOz6xq+d9aXeZnm
 ZqUGeel8G1K12vRjy7oCuTFIkysRgpbPFkNnqxlQbZl1/1U+ZRomMP9js1dkt/qR0/Cy
 DRdlPytnn0084cdDMrCXzDYEkKuZ/K9xvGeNDH7glEdKT7WdGcFiszTt++MHTikxaZav
 QMuJbCRHB5Vq5xfjpCHSdYO3y2UgDPc1hJVF/J1LzfNFN7p6Teiy//7GgE9GIgbx6qNJ
 IrOA==
X-Gm-Message-State: AOAM532nrT6mJwjBHnww/kDSvHKBVLGSef817vKeA2/c4iDLAUhIdTZd
 XvyScPKvXpmrPElWw4n6Nqv03pB7vmB1LBNzu9RYSDJtUCf3qtw8CfO8OkPYqIJYOjnQciqEhec
 nxPY4pa1RMWxvBpfZ2bpJq+1tRe9DxYx98jpNv8ld0qo9jEC1VtpWBJhr2MZL
X-Received: by 2002:a17:906:2f16:: with SMTP id
 v22mr36754143eji.126.1634642441818; 
 Tue, 19 Oct 2021 04:20:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIgobyabUkvvho4Lvp1aRwIMh5EU3jn1r0ifzjyzIa1NUCwj9Re5Slor2S3MDLqWuO9TVEBQ==
X-Received: by 2002:a17:906:2f16:: with SMTP id
 v22mr36754116eji.126.1634642441600; 
 Tue, 19 Oct 2021 04:20:41 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id jg21sm6936193ejc.14.2021.10.19.04.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:20:41 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:20:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/29] libvhost-user: fix VHOST_USER_REM_MEM_REG skipping
 mmap_addr
Message-ID: <20211019111923.679826-22-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


