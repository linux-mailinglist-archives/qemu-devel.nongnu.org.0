Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEE74ECFFA
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:21:29 +0200 (CEST)
Received: from localhost ([::1]:50644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhd1-0000SG-JK
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:21:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsn-0007rj-0S
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:37 -0400
Received: from [2a00:1450:4864:20::131] (port=37757
 helo=mail-lf1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsj-000393-QT
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:36 -0400
Received: by mail-lf1-x131.google.com with SMTP id k21so38084119lfe.4
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QNnC0TQU0ReP+KGfor31X/vaX8OqceFn3K2Y/AEfmEs=;
 b=brLI2MrAmu+dQrZeAgllnXPpTeq9LjaOLdYyacGYK/cWSJAhca6pjrxc1Dcjp4HdSK
 1WNomNG+hdH3lEeVcipGDZJIRsVv6XlO3vRKEDgq/lNTPVX1ttii7/cwRoh7vcV7Vk82
 I/Frae3Pqo1vm+GGxzlCvvtLlUGpG3RbOfOLtDqGEVYJMc8UG1SBGyLCmwww6W95ye11
 /ogN0BJoX+fO+5dfScXkJKb9V+puMADHqBMkCMQn2M8+bis0tJsLyxjEo2zU5lFhsRdf
 fExmnsa3oDISI7EqhkG8rEarMcsu6bJGDv0rzou6dk8vrgmABw01CDZ59TUdbJuGcEuc
 9GpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QNnC0TQU0ReP+KGfor31X/vaX8OqceFn3K2Y/AEfmEs=;
 b=CtGfSQyv8FW2A6634tsHoPEjf6NklDaW92CRSOd6O034exyAqW7VdWVoQd79iC2agg
 GhMAD75sWT50reMlu1JCuccoLEDq6vDmP0R/T5ecSEi+D0ENnE7poLY+VyQjuwZntT4I
 UD0140dLc6fXZsXAQMLg+YJS8+RS2VC8n1HJdyQHGgddLTMpfuFlEZp9uBodkgRJLed5
 w0PZ7FGpwQDUy4QRwDAJl89J9AV8rdsp9j5oS3IeTrZBdaxfwAzgvLLwwBnVRLBRezrL
 V/szefOkIwFxJvzHEIrgg1hWcS7Br3mCl3jQowqbAbm82fUNPVy6RNYp8IAn4epR5sYx
 u7FQ==
X-Gm-Message-State: AOAM532DJsnzedg3Z+UFSZg6wq1m6lZyU/wo6/k3CM3MoXM5TnR/ONcU
 FbBsPgIJC2ATaiZsUhpK17QRtw==
X-Google-Smtp-Source: ABdhPJwbmkx/sb7yJjCVqaaRiueADNb83Pd2nBtoKBId/4+xiIL5K9dYsIRbBlzMv6PLgwP30aTTdw==
X-Received: by 2002:ac2:5cd9:0:b0:44a:2586:a2a2 with SMTP id
 f25-20020ac25cd9000000b0044a2586a2a2mr8475706lfq.611.1648675771414; 
 Wed, 30 Mar 2022 14:29:31 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:31 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 01/45] block: BlockDriver: add .filtered_child_is_backing
 field
Date: Thu, 31 Mar 2022 00:28:18 +0300
Message-Id: <20220330212902.590099-2-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::131
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x131.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:14 -0400
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, qemu-devel@nongnu.org,
 hreitz@redhat.com, vsementsov@openvz.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unfortunately not all filters use .file child as filtered child. Two
exclusions are mirror_top and commit_top. Happily they both are private
filters. Bad thing is that this inconsistency is observable through qmp
commands query-block / query-named-block-nodes. So, could we just
change mirror_top and commit_top to use file child as all other filter
driver is an open question. Probably, we could do that with some kind
of deprecation period, but how to warn users during it?

For now, let's just add a field so we can distinguish them in generic
code, it will be used in further commits.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block/commit.c                   |  1 +
 block/mirror.c                   |  1 +
 include/block/block_int-common.h | 13 +++++++++++++
 3 files changed, 15 insertions(+)

diff --git a/block/commit.c b/block/commit.c
index 851d1c557a..7722a392af 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -238,6 +238,7 @@ static BlockDriver bdrv_commit_top = {
     .bdrv_child_perm            = bdrv_commit_top_child_perm,
 
     .is_filter                  = true,
+    .filtered_child_is_backing  = true,
 };
 
 void commit_start(const char *job_id, BlockDriverState *bs,
diff --git a/block/mirror.c b/block/mirror.c
index d8ecb9efa2..824b273fc7 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1578,6 +1578,7 @@ static BlockDriver bdrv_mirror_top = {
     .bdrv_child_perm            = bdrv_mirror_top_child_perm,
 
     .is_filter                  = true,
+    .filtered_child_is_backing  = true,
 };
 
 static BlockJob *mirror_start_job(
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 8947abab76..9d91ccbcbf 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -119,6 +119,19 @@ struct BlockDriver {
      * (And this filtered child must then be bs->file or bs->backing.)
      */
     bool is_filter;
+    /*
+     * Only make sense for filter drivers, for others must be false.
+     * If true, filtered child is bs->backing. Otherwise it's bs->file.
+     * Only two internal filters use bs->backing as filtered child and has this
+     * field set to true: mirror_top and commit_top.
+     *
+     * Never create any more such filters!
+     *
+     * TODO: imagine how to deprecate this behavior and make all filters work
+     * similarly using bs->file as filtered child.
+     */
+    bool filtered_child_is_backing;
+
     /*
      * Set to true if the BlockDriver is a format driver.  Format nodes
      * generally do not expect their children to be other format nodes
-- 
2.35.1


