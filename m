Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174F43346F6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 19:40:17 +0100 (CET)
Received: from localhost ([::1]:41052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK3km-0003qV-4v
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 13:40:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK3cx-0005qh-Up
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:32:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK3cr-0003EG-EP
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615401124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AL0j1J/qe/7XitsoK9+V0I0JiSKNuHRh+kEClor55V0=;
 b=RD7wWrlFfCJWGWQFPs4EEPc0ia+Qw8yFA5tCITZ121xW12dXexPkmBLH8hxrHBbzcD77pO
 Wp7dYdZzY3bBH5T2XPMSdT/ct2LdrL8PTDoIFoQy3s9vCJHhvAWRmD0/61L0gEjqZHj56Q
 1oXOEODXUqeMXwjqXSjKhrzJaPsoTBM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-WyKWPLTiMEyiPG-1VtjOqw-1; Wed, 10 Mar 2021 13:32:03 -0500
X-MC-Unique: WyKWPLTiMEyiPG-1VtjOqw-1
Received: by mail-ej1-f69.google.com with SMTP id mj6so7638925ejb.11
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 10:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AL0j1J/qe/7XitsoK9+V0I0JiSKNuHRh+kEClor55V0=;
 b=q74dn1qWKSy7SHohk2dsBFh3E+fORnX/ZED+irphtfDWA4BFpsMD5VgVfrzQLbi3XB
 C72vfjesO7OLrIn04iCEncxUoyw0XeIU7RJR9zEWsQxUmXTZa+qn8AqUDpAPEHg3aliL
 17vqg91lgcqPuL1O7cF7RXZc3P4Pdk3kJfEOwVtDE3bJ2kP8n764N3IHrSEHeW5FRXRV
 F9CBJw1AHw/n7e2f/B4y/97GCbTh05FfLM/2+Hx2Y313v9GXON1BY6zAZ4gPbKfy6BC7
 DymC1/d+kmB+pUL6bFUuln+R9J2o4yF0msWxBA2jv7k0jVC1zdUpBWnsRSutA8w8a0yD
 p8+w==
X-Gm-Message-State: AOAM530IpTO5SHOG3UcLzCJLEYm4cjbZMPq3PoHNoFXes/mPJBr8SPqR
 egeIEEi+ltxYNHDxJ+6YlFFPCw4mguowGsoQqb0IE0CLr3Yc7pk6oTb9ZSy7ZKYEuX+OaLyEj1w
 6Qll/JAXFoqPYuPyOh2KG4KvG1tXmQh3aH8sbJy+YjrXtLSJlqC7VOxa49BDlkzgc
X-Received: by 2002:aa7:c4cc:: with SMTP id p12mr4666936edr.325.1615401121833; 
 Wed, 10 Mar 2021 10:32:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKNj+qW2K71MVh/nPK8L/+yxc1cWWElb7IG3ciBrD3rEW2oU0jbxDk5sx1CbFoPi2bOUhNEA==
X-Received: by 2002:aa7:c4cc:: with SMTP id p12mr4666918edr.325.1615401121702; 
 Wed, 10 Mar 2021 10:32:01 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l18sm131048ejk.86.2021.03.10.10.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 10:32:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 7/7] net/eth: Add an assert() and invert if() statement to
 simplify code
Date: Wed, 10 Mar 2021 19:31:23 +0100
Message-Id: <20210310183123.1212612-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310183123.1212612-1-philmd@redhat.com>
References: <20210310183123.1212612-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To simplify the function body, invert the if() statement, returning
earlier.
Since we already checked there is enough data in the iovec buffer,
simply add an assert() call to consume the bytes_read variable.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/eth.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/net/eth.c b/net/eth.c
index 284ade4ab0b..f5fde6d83e3 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -416,15 +416,14 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
     bytes_read = iov_to_buf(pkt, pkt_frags, ext_hdr_offset,
                             &rt_hdr, sizeof(rt_hdr));
     assert(bytes_read == sizeof(rt_hdr));
-
-    if ((rt_hdr.rtype == 2) && (rt_hdr.segleft == 1)) {
-        bytes_read = iov_to_buf(pkt, pkt_frags, ext_hdr_offset + sizeof(rt_hdr),
-                                dst_addr, sizeof(*dst_addr));
-
-        return bytes_read == sizeof(*dst_addr);
+    if ((rt_hdr.rtype != 2) || (rt_hdr.segleft != 1)) {
+        return false;
     }
+    bytes_read = iov_to_buf(pkt, pkt_frags, ext_hdr_offset + sizeof(rt_hdr),
+                            dst_addr, sizeof(*dst_addr));
+    assert(bytes_read == sizeof(*dst_addr));
 
-    return false;
+    return true;
 }
 
 static bool
-- 
2.26.2


