Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E262F7F35
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:16:15 +0100 (CET)
Received: from localhost ([::1]:49130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Qpi-0001bO-Ap
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:16:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0QlN-0005gW-Qo
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:11:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0QlJ-0000Xl-BK
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:11:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610723497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3PM3c1hDQViy2jaBMDNzLZyG4cMXsFVA914IRG0X4aE=;
 b=RAJJoRT6bSCyDtfMX0ZiSVFuUSyypdQaLX7t3MM9udRD27zISfB4uLqmrjOCr8DJxDZPO6
 wOxHgRhNac7e/gucH3fHc36cqj9mq3LYajC/IXuU1y3PGfDnZJ4kNmzN/YN4f55wiHld/o
 ujJ2V3/EvfDNWaZazoGS0wKuqRhG0YU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-AZogWQhYM2i4x8f7PeN7BQ-1; Fri, 15 Jan 2021 10:11:35 -0500
X-MC-Unique: AZogWQhYM2i4x8f7PeN7BQ-1
Received: by mail-ej1-f71.google.com with SMTP id q11so3704543ejd.0
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 07:11:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3PM3c1hDQViy2jaBMDNzLZyG4cMXsFVA914IRG0X4aE=;
 b=Ib2dxB6P1Tk4clb/4AR8Vi5K7TRHEL9Ybem/bz9ngmg1kneOM2RbAWpyp2KwDucR8v
 QU0Ll5ECtbg7u/Fsz7eaqUxZrx6HKQIpg15vB4A1iJArBhDkmJ5sBG6b1xK2I70O4yqq
 VlEG+5lWgfw43gnYlLPdSoNak8va/6++WwDrWT53XmSdJ+rdMG595hXRFTaC5FW24qN9
 jzNiqCt4TO1ES7bX7qNp5rntyd60PTCOUInmVZ1BMKuaeBp7eOkTkMlqSuo/CHI4l4zA
 yrUiltogFVjKZ354aTkZjxkQAM6gCvRdlSwXLGl6w6l53knlk1bPgTGv24NB2IoPKxar
 qePw==
X-Gm-Message-State: AOAM531GmbR5dEqtqFLTWJeMXFYK53cQ8DiFhZwHWJvUk72sjFL3RtjJ
 mrusyLRYHgMBprGCiEHRQUFcngslM29MvY7TvNOVjUFeSCrj2mUgTxBd26kbja7qdMcsHNKxxYw
 PLAWafUCEx1J+I/Msz9yKVQx/hGrpMiocCc9GpH69xiS8XwUEpbubplIbgG5uIQKh
X-Received: by 2002:aa7:cf8f:: with SMTP id z15mr9983953edx.17.1610723494115; 
 Fri, 15 Jan 2021 07:11:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGG5WFa98szbRYtdHYJooNykcw+TMtNUae42zrxemdVkW7aD5lVRkUJlBfEauO5r9KCeQzog==
X-Received: by 2002:aa7:cf8f:: with SMTP id z15mr9983927edx.17.1610723493947; 
 Fri, 15 Jan 2021 07:11:33 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n2sm3687044ejj.24.2021.01.15.07.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:11:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] net/eth: Simplify _eth_get_rss_ex_dst_addr()
Date: Fri, 15 Jan 2021 16:11:25 +0100
Message-Id: <20210115151126.3334333-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115151126.3334333-1-philmd@redhat.com>
References: <20210115151126.3334333-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The length field is already contained in the ip6_ext_hdr structure.
Check it direcly in eth_parse_ipv6_hdr() before calling
_eth_get_rss_ex_dst_addr(), which gets a bit simplified.

Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/eth.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/net/eth.c b/net/eth.c
index 1e0821c5f81..7d4dd48c1ff 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -407,9 +407,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
 {
     struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
 
-    if ((rthdr->rtype == 2) &&
-        (rthdr->len == sizeof(struct in6_address) / 8) &&
-        (rthdr->segleft == 1)) {
+    if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
 
         size_t input_size = iov_size(pkt, pkt_frags);
         size_t bytes_read;
@@ -528,10 +526,12 @@ bool eth_parse_ipv6_hdr(const struct iovec *pkt, int pkt_frags,
         }
 
         if (curr_ext_hdr_type == IP6_ROUTING) {
-            info->rss_ex_dst_valid =
-                _eth_get_rss_ex_dst_addr(pkt, pkt_frags,
-                                         ip6hdr_off + info->full_hdr_len,
-                                         &ext_hdr, &info->rss_ex_dst);
+            if (ext_hdr.ip6r_len == sizeof(struct in6_address) / 8) {
+                info->rss_ex_dst_valid =
+                    _eth_get_rss_ex_dst_addr(pkt, pkt_frags,
+                                             ip6hdr_off + info->full_hdr_len,
+                                             &ext_hdr, &info->rss_ex_dst);
+            }
         } else if (curr_ext_hdr_type == IP6_DESTINATON) {
             info->rss_ex_src_valid =
                 _eth_get_rss_ex_src_addr(pkt, pkt_frags,
-- 
2.26.2


