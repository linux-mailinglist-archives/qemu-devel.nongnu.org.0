Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14134470FA
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 00:31:42 +0100 (CET)
Received: from localhost ([::1]:33952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjV9x-0003Wb-WC
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 19:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mjV8C-0001N2-MY
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 19:29:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mjV89-0000BD-Bm
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 19:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636241388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WBocdxEvetR8i5U0Y7CdMI5VGrRQcVltzEW6WBPQ+KQ=;
 b=g6DcRsJSpvVSBE4Igf07gX5iVgp3EO+qkTEHi4uu0yzUvHBqyC+zo6ACp3kybBHEJ4nR1H
 z+SCkY1VBOAyk+K1Hu8kzVCnu3Gbkk6K5G1jDrSjzOJnluAAQ5ud6UtVTvLMA8ItqcNf3F
 xzCJpIKgTSAPfrrS8y9JodN3xyPx7V8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-kA8aB35wN621OMdb44R_cQ-1; Sat, 06 Nov 2021 19:29:47 -0400
X-MC-Unique: kA8aB35wN621OMdb44R_cQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so2776096wro.19
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 16:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WBocdxEvetR8i5U0Y7CdMI5VGrRQcVltzEW6WBPQ+KQ=;
 b=b34r3ZqiwC8CuDOcFcWZhIQ2QPm40zUpFCwF1Ad8JC4H5qPsNE0AGdY/8V4kDN9xET
 TFamH8xjoB3qBoyhU1oeW+bl5ka6lZ9I1P9LsECndh7Zqx7BpnEMXJ2xdf71Npfcjv28
 +tFNT1HYuUghZ8LeMXh1wLbpB+i4n8PWqqMwSYtUqPjVcIJQxz2OzxHaxczt7fdKV95U
 RsjotBIVUFohOZCqhkf0Bi+MWBPwk1c5pw1hS9mL92r3bGEQZGpjnW8yX7a3UuMZ4mzH
 HffT+6Toe9qecS62FAJavnYuRUrVCvoDAWdWuMFRhFrAzXHaaGhs7AKv4I0jv3X6qgrP
 CulQ==
X-Gm-Message-State: AOAM532Pko9Up+HS/enkNim3hCVK8fOB+JMfKGtRzVvVHMGeTQ873H+a
 uUS7PQqR3pYPVryq5Cvq5Tv45QElucWY8j0fZn4YG1Vmq/T3wqyePwCqn8nT53qTGqzp6ozv+bl
 kOgG3jcPtx8qiEe8SzdIvUgiYc9NByBLdvx5dmhor/36fjKY/pLXMy2C1ErYEnJzCdZk=
X-Received: by 2002:a05:6000:1a85:: with SMTP id
 f5mr29968405wry.361.1636241385878; 
 Sat, 06 Nov 2021 16:29:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbgXaTfMCElkJi/JLJyoprXZmtMoCgno0VkCWPa3CcsvkiJ6DRPa2EIa32i0hdoThZcowf0g==
X-Received: by 2002:a05:6000:1a85:: with SMTP id
 f5mr29968363wry.361.1636241385540; 
 Sat, 06 Nov 2021 16:29:45 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id o12sm8185582wmq.12.2021.11.06.16.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 16:29:44 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] docs: fix qemu incorrect tag
Date: Sun,  7 Nov 2021 00:29:41 +0100
Message-Id: <20211106232941.46184-3-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211106232941.46184-1-quintela@redhat.com>
References: <20211106232941.46184-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?=
 <huangy81@chinatelecom.cn>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

The patchset merged in 71864eadd9a ("migration/dirtyrate:
introduce struct and adjust DirtyRateStat") was targeting
QEMU 6.1 but got merged later, so correct the tag for 6.2.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 qapi/migration.json | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 87146ceea2..f0aefdab64 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1740,7 +1740,7 @@
 #
 # @dirty-rate: dirty rate.
 #
-# Since: 6.1
+# Since: 6.2
 #
 ##
 { 'struct': 'DirtyRateVcpu',
@@ -1774,7 +1774,7 @@
 #
 # @dirty-bitmap: calculate dirtyrate by dirty bitmap.
 #
-# Since: 6.1
+# Since: 6.2
 #
 ##
 { 'enum': 'DirtyRateMeasureMode',
@@ -1796,13 +1796,13 @@
 # @calc-time: time in units of second for sample dirty pages
 #
 # @sample-pages: page count per GB for sample dirty pages
-#                the default value is 512 (since 6.1)
+#                the default value is 512 (since 6.2)
 #
 # @mode: mode containing method of calculate dirtyrate includes
-#        'page-sampling' and 'dirty-ring' (Since 6.1)
+#        'page-sampling' and 'dirty-ring' (Since 6.2)
 #
 # @vcpu-dirty-rate: dirtyrate for each vcpu if dirty-ring
-#                   mode specified (Since 6.1)
+#                   mode specified (Since 6.2)
 #
 # Since: 5.2
 #
-- 
2.33.1


