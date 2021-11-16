Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B939453A55
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 20:42:19 +0100 (CET)
Received: from localhost ([::1]:41060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn4LR-00055n-Mm
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 14:42:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn4Ij-0002PR-Q6
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 14:39:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn4Ih-0004yk-M6
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 14:39:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637091565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GIpUvbEKDGJYwbOfsTk6d6DEwisEvrspb/CuiSeCHVA=;
 b=IH+KXMUdxS/l6YmhrU9OwL9ngMUDKF9fy95NxPfr75GJw285E4XfjSTx0/zUGDEUOxZWrz
 DJm9w66XjQnajoovWMamUQvSlPZuJrrJ8iKH6judLK+YypU9X/4ud7E9ytTkpMHqpVbA1d
 WEcxNRs7aMdryNYQG5f1lWUsGyI8bc0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-_d8OkTj2NpW8spw4634T_A-1; Tue, 16 Nov 2021 14:39:18 -0500
X-MC-Unique: _d8OkTj2NpW8spw4634T_A-1
Received: by mail-wm1-f70.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso185597wms.1
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 11:39:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GIpUvbEKDGJYwbOfsTk6d6DEwisEvrspb/CuiSeCHVA=;
 b=dEiJohBS3JtaE9TAJLebyk0397GpDMFc80t3Qf4KYnnVvu8S1DzYQcpbQhPa5jucY9
 yUPmPyhOsNd4l/ToRuF7PJu4xKZpix9UuDw1fqPxYZuKTDy22Z7g5aovEbPQoFSkgBiF
 RQzWYU90DpYTq9MR4Q5HH9BDHhZ3FKstqOd1uwxEIfo/tjIlDB35oTXlLrtuErb6hsSE
 rK1ERzECr6eTY3FLRmOXvm/uR7EaGdpo+3jxxaFa3bu+ZSXWhI0PgNPZqo8WpDchIAqH
 IsAUcW9xKBtTkeiQ9wkZ7EDsFdA1mvjdtGof7Qp0Cn5OkHLR1awAEMFXqKQ8oNSW9ddg
 h2ag==
X-Gm-Message-State: AOAM530KOP6+ImwO8SOa5/NovrAMUgmbf6B1R6FzkN5wgOG44sayokm2
 qUufxOebydu8GdGVet5woH17xrot+t0/L3jTdQPDcgZWwth113rIGlK85/p8BdvEySNfg3CI8DV
 KnefVpfwLf+BP3eNGPAtVZdFPjlJ17mP4mJ5aAbUqIQmv6sjC7QjlLlOAtV42D/3G
X-Received: by 2002:a05:600c:3516:: with SMTP id
 h22mr10605726wmq.62.1637091557340; 
 Tue, 16 Nov 2021 11:39:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxYZhdZbg6ZIVKy9F0viwLO8PKJrjjd0VFOyKVlcPGxVOZf9ya4tZ8iiMYdQfdMqieJIQE+Q==
X-Received: by 2002:a05:600c:3516:: with SMTP id
 h22mr10605693wmq.62.1637091557098; 
 Tue, 16 Nov 2021 11:39:17 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 x1sm18388004wru.40.2021.11.16.11.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 11:39:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0] hw/net/rocker: Remove unused definitions
Date: Tue, 16 Nov 2021 20:39:15 +0100
Message-Id: <20211116193915.2792721-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Jiri Pirko <jiri@resnulli.us>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/rocker/rocker.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/net/rocker/rocker.h b/hw/net/rocker/rocker.h
index 412fa44d017..d22bbd2bf80 100644
--- a/hw/net/rocker/rocker.h
+++ b/hw/net/rocker/rocker.h
@@ -36,13 +36,8 @@ static inline GCC_FMT_ATTR(1, 2) int DPRINTF(const char *fmt, ...)
 }
 #endif
 
-#define __le16 uint16_t
-#define __le32 uint32_t
-#define __le64 uint64_t
-
 #define __be16 uint16_t
 #define __be32 uint32_t
-#define __be64 uint64_t
 
 static inline bool ipv4_addr_is_multicast(__be32 addr)
 {
-- 
2.31.1


