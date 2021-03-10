Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3983346E9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 19:38:08 +0100 (CET)
Received: from localhost ([::1]:37726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK3ih-0002Tu-70
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 13:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK3ca-0005Vd-QE
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:31:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK3cZ-00039B-6Q
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:31:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615401106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q5DY/aN4CG9GqGVr+tCHRu+SWwcj5rYLvRE4za5fNpY=;
 b=FV2Tzk7Xk0iQ8Uasf+BiLCtNLVXMXvmQVaDpE+BYpU2QGsVeaq/aGohumQXNR4rzMO2vDe
 +7b/wFJPgkD8LU0D3YN7vTjP5hctnlbnWLPJpFVnKi6m684ZF9kVd44AAEdjNpCr5LGQsY
 2ifVQq0816qFNNdWJtVO1lhdQxvAoUg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-GFwgh4BtOhmy_Caf-BPJZw-1; Wed, 10 Mar 2021 13:31:43 -0500
X-MC-Unique: GFwgh4BtOhmy_Caf-BPJZw-1
Received: by mail-ej1-f71.google.com with SMTP id en21so7622596ejc.2
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 10:31:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q5DY/aN4CG9GqGVr+tCHRu+SWwcj5rYLvRE4za5fNpY=;
 b=DGxOrxZQIweJi+T5E5YWy/n6XEbirGATFjZRmRsMhFt1qAzBFoEqfAG061yrUYDEWt
 ofATLs18+U3y8bcU2v5XiyiZXoS5EdH7cgRO7fV96WFH1gJ6ApgAyP9Yj/GVldMxFUea
 Bk7m8+hSw55JjjVjMyaRCWyzLcgULTSeKu3V4kkfv0mG9PVa+QawZu7HvlpOKyJYWEG7
 FhwmCa9RghscXXhHlQtaJCD0THGHEw/i80cpYjUF8+VJwzU1iCtCAwI9HDLKh1+EXh1P
 l762KQK83DT7bIh8MB+F8SL8g2i14u2vUsQrEzYkTtTpO8X1BaATNIZ1Y7N1L45bx2MX
 nZmg==
X-Gm-Message-State: AOAM532cfK2JXj0jv+bxtb1YDVLZLGFrq4qVNoZToinNVFYVdqNbRF8b
 ctdhXETXnPhZXu7oPWZeUSDr/E5Qt2U2P/vgpOKiXwgcerSqJ7ie+lBcqjbnArQyuDHqraS6+4z
 wC8q2+UmqfKqTS26q3KQW0lknl6V5qDZu60gHB2owwis+YWKxhZjhL2Qrmqvt7yGg
X-Received: by 2002:a17:907:9709:: with SMTP id
 jg9mr4969915ejc.276.1615401101627; 
 Wed, 10 Mar 2021 10:31:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWTQg6EygPmC2GgxVCIA7ul6jWqPeNaDFR+Z37X4bE302PLYRiq0SEAQM4DxlQUSPeQ/yRpA==
X-Received: by 2002:a17:907:9709:: with SMTP id
 jg9mr4969891ejc.276.1615401101378; 
 Wed, 10 Mar 2021 10:31:41 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z9sm41099edr.75.2021.03.10.10.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 10:31:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/7] net/eth: Better describe _eth_get_rss_ex_dst_addr's
 offset argument
Date: Wed, 10 Mar 2021 19:31:19 +0100
Message-Id: <20210310183123.1212612-4-philmd@redhat.com>
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

The 'offset' argument represents the offset to the ip6_ext_hdr
header, rename it as 'ext_hdr_offset'.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/eth.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/eth.c b/net/eth.c
index b9ceb30a194..ed047b5760b 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -401,7 +401,7 @@ eth_is_ip6_extension_header_type(uint8_t hdr_type)
 
 static bool
 _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
-                        size_t rthdr_offset,
+                        size_t ext_hdr_offset,
                         struct ip6_ext_hdr *ext_hdr,
                         struct in6_address *dst_addr)
 {
@@ -412,12 +412,12 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
         size_t input_size = iov_size(pkt, pkt_frags);
         size_t bytes_read;
 
-        if (input_size < rthdr_offset + sizeof(*ext_hdr)) {
+        if (input_size < ext_hdr_offset + sizeof(*ext_hdr)) {
             return false;
         }
 
         bytes_read = iov_to_buf(pkt, pkt_frags,
-                                rthdr_offset + sizeof(*rthdr),
+                                ext_hdr_offset + sizeof(*rthdr),
                                 dst_addr, sizeof(*dst_addr));
 
         return bytes_read == sizeof(*dst_addr);
-- 
2.26.2


