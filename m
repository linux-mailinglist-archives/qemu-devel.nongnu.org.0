Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F16C32BA2B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 20:19:06 +0100 (CET)
Received: from localhost ([::1]:43602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHX1V-0005cT-HM
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 14:19:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWvZ-0000NT-9F
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:12:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWvU-0006yL-L9
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:12:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614798771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oQ53tkWrp+KNAV5jr5E0Yd+AAzWqxTKyNH3MXsvMcQY=;
 b=KY3BsIDBPIpF2FmTl4SPFqewZwI69Fc2UMw1tRrJw4j0LQtx7ffwM+TLaTM/4+Xx35buX8
 JfNPtbCxfHlS3TSWthdVCyQYRVCoaXJq1fEvys1VU87g9Olbo4Yh4S1UnVhJtoBsakTIis
 rXBXAthbNvn8orqhhXkd7fLTUylC2Lk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-ToFesamSNWKEgIMnfuw5Rg-1; Wed, 03 Mar 2021 14:12:50 -0500
X-MC-Unique: ToFesamSNWKEgIMnfuw5Rg-1
Received: by mail-wr1-f69.google.com with SMTP id g2so6334191wrx.20
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 11:12:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oQ53tkWrp+KNAV5jr5E0Yd+AAzWqxTKyNH3MXsvMcQY=;
 b=B7HAD5CsSHzlQTC/1MK5wmNxwM8N7jxkcjH6zgA8SQi6uhzDXk47P1i/MMq3qxcsA0
 BjbBal5C1g9fP/6NTJpSYgMUevfU7L5U7DIs3KWlQEO7LVuMl6iPDFBus5WczgPdD06Y
 PM+gIsqNkG2z9AxzSNt1a4Yyto5kVpm1oSeUprZ4ib5VhGeTSvpV1jCDFIilVrFzPAlV
 PcoZF5SUBI4fTWHanoUG7xquKR0/6h9krv66TOGukypFEZBkfLJBvnv1HpG7u/BQ63fY
 AO1ycZ28lR982u9GdXs3Sszsi/Aqcm06VmWejFlrNlgcc389IP/V2k0fmvvnYRbMrBMQ
 IN9w==
X-Gm-Message-State: AOAM530cXNhpt3bnKSxqrQBVegCCROh8dSQGoKL59pOU0zs0hLYnDdgG
 ae+8J2vk8ZqJdbsatlxdHum/C0cK+Ine5npvIylmgxsTR7f/7pOA/M95wHij52bpenXp1IxLoOj
 DrMv4zt/RXy0c+Y7lD7uXObB2ohmkEWqppR+IKkgFHjGVN5Po9MqsXGFjPVhzr6Sr
X-Received: by 2002:a5d:4441:: with SMTP id x1mr237389wrr.56.1614798768595;
 Wed, 03 Mar 2021 11:12:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHTDhfewwPm3ptxhLftX31Jg88sQIBIyES19/h2UGeP8kX83MU0iK2F7p74uwCS+h7MR0X6g==
X-Received: by 2002:a5d:4441:: with SMTP id x1mr237359wrr.56.1614798768412;
 Wed, 03 Mar 2021 11:12:48 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w16sm20019656wrk.41.2021.03.03.11.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 11:12:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 08/10] hw/net: rtl8139: Remove the logic of padding
 short frames in the receive path
Date: Wed,  3 Mar 2021 20:12:03 +0100
Message-Id: <20210303191205.1656980-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303191205.1656980-1-philmd@redhat.com>
References: <20210303191205.1656980-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <1614763306-18026-8-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/rtl8139.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 4675ac878e9..cbfe29a2867 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -827,7 +827,6 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
 
     uint32_t packet_header = 0;
 
-    uint8_t buf1[MIN_BUF_SIZE + VLAN_HLEN];
     static const uint8_t broadcast_macaddr[6] =
         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -939,17 +938,6 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
         }
     }
 
-    /* if too small buffer, then expand it
-     * Include some tailroom in case a vlan tag is later removed. */
-    if (size < MIN_BUF_SIZE + VLAN_HLEN) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE + VLAN_HLEN - size);
-        buf = buf1;
-        if (size < MIN_BUF_SIZE) {
-            size = MIN_BUF_SIZE;
-        }
-    }
-
     if (rtl8139_cp_receiver_enabled(s))
     {
         if (!rtl8139_cp_rx_valid(s)) {
-- 
2.26.2


