Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989024421DF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:46:42 +0100 (CET)
Received: from localhost ([::1]:47254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mheCX-0006qe-E6
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcHC-0008PQ-CX
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcHA-0008PA-8U
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635792198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IhijWbgKLTtnsiOPXsxu08OvEiKOisd4DyugRUJL+wM=;
 b=LiEtPUIT/VHaeR71/PRdu8X2dhiWyQqqjysNBaoWJYu1i5ko3GWwBq+hINSEQq4lysgQCt
 3fG2ta3UW1UUPMbPooQWZCIB3VFQf3gvAvj6mUoU/ARkdYIfbiV0TwRNSw1XzyXtrmh5KC
 wsd/thCj8t5O+oIk7MgRxwso/t13O3A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-c12j1quRM-ik7Nu0KUrHkQ-1; Mon, 01 Nov 2021 14:43:17 -0400
X-MC-Unique: c12j1quRM-ik7Nu0KUrHkQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 y10-20020adffa4a000000b0017eea6cb05dso2676426wrr.6
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IhijWbgKLTtnsiOPXsxu08OvEiKOisd4DyugRUJL+wM=;
 b=3Ud1fTVUo0D0hcUwjnH/GizDKi23i/uGRnqlQp4orizxPKMxChcfmGs79rTMQqjBmY
 v3glQjdSOBp57c0bWuzL7Np0HEC3E0LasaWj0EBQGTiugiYZeR75HUqQ97pPzl5lZdqk
 blQ8BmzwUYpLzwshrEbeQgb3tIRjGrusz93bn7cYNH61HdG/Zl2yBCsYIll9M3TC2QDD
 sv67AFFgp2zA5mZP9aFhD+vsk456uDw4IU3D+Cgq990l49OqsqfaFWZMwW/LAAoqL25P
 UmMP2WTjTDRg4r6bcbaRUUQlhhPcg17KY8XlhwwcBSwpBdb3koVQEmO9lTL6PgPZSd1h
 Rwuw==
X-Gm-Message-State: AOAM533205wLzXroQLPqkwrwzgcY6tlzpNKZPPw/pxP1lRSAGwuusnkj
 NdsYjxVmLtk6mfHJtr2PZ/TPXfiKZ/7WDZBg+D2mPe5av9i0RR4Wr+VNWeBIhDVsP2CFfMfsKpc
 NNE3QpS2845f+uS/Aifzq7beAU6u9BUuXPKMINnUfg2DlXmlxIWBFvXq3JKRCn9yz
X-Received: by 2002:a5d:69c5:: with SMTP id s5mr36834200wrw.283.1635792196285; 
 Mon, 01 Nov 2021 11:43:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfnLqbxMIwErwRSz3QcOyUFEpGwdo7C00sF7zicqDvDsgPuicCaBl0IzZM7tQ3NZN+0CiKtw==
X-Received: by 2002:a5d:69c5:: with SMTP id s5mr36834164wrw.283.1635792196085; 
 Mon, 01 Nov 2021 11:43:16 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 l124sm304374wml.8.2021.11.01.11.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 11:43:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/10] hw/core: Declare meson source set
Date: Mon,  1 Nov 2021 19:42:52 +0100
Message-Id: <20211101184259.2859090-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101184259.2859090-1-philmd@redhat.com>
References: <20211101184259.2859090-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we want to be able to conditionally add files to the hw/core
file list, use a source set.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20211028150521.1973821-3-philmd@redhat.com>
---
 meson.build         | 4 +++-
 hw/core/meson.build | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index b0927283976..85f1e43dfe6 100644
--- a/meson.build
+++ b/meson.build
@@ -2365,6 +2365,7 @@
 chardev_ss = ss.source_set()
 common_ss = ss.source_set()
 crypto_ss = ss.source_set()
+hwcore_ss = ss.source_set()
 io_ss = ss.source_set()
 linux_user_ss = ss.source_set()
 qmp_ss = ss.source_set()
@@ -2806,7 +2807,8 @@
 
 chardev = declare_dependency(link_whole: libchardev)
 
-libhwcore = static_library('hwcore', sources: hwcore_files + genh,
+hwcore_ss = hwcore_ss.apply(config_host, strict: false)
+libhwcore = static_library('hwcore', sources: hwcore_ss.sources() + genh,
                            name_suffix: 'fa',
                            build_by_default: false)
 hwcore = declare_dependency(link_whole: libhwcore)
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 6af4c5c5cbc..cc1ebb8e0f4 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -1,5 +1,5 @@
 # core qdev-related obj files, also used by *-user and unit tests
-hwcore_files = files(
+hwcore_ss.add(files(
   'bus.c',
   'hotplug.c',
   'qdev-properties.c',
@@ -11,7 +11,7 @@
   'irq.c',
   'clock.c',
   'qdev-clock.c',
-)
+))
 
 common_ss.add(files('cpu-common.c'))
 softmmu_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
-- 
2.31.1


