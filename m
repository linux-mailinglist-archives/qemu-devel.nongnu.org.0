Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C125B43E4B7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:14:36 +0200 (CEST)
Received: from localhost ([::1]:45380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg76w-0002Ga-4n
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg6yL-0006ji-63
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:05:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg6yH-00078l-SM
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635433536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bgN4VtmbpKha1U3dbSRWObWfSCBYh9C5Ynebd+aNbtU=;
 b=WUBXmjcwI5YDMjaD2tpxBKq1E2IYtqo1lsbJs8NKAd5jpz9V9TOJAQD9AHN46fGFuGK/uT
 IQ2TeE48U0E5FxK56rXwemKP9sgpKTlow4jPJTmnLEchXkY2CFJzIYZFLdgdr4Z/KnkqD8
 1CLfQXSUti5k3PkuEdOl1Yrpfkel3Zs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-f_1ua9ihPxuGDV2o8o3dHQ-1; Thu, 28 Oct 2021 11:05:35 -0400
X-MC-Unique: f_1ua9ihPxuGDV2o8o3dHQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso2246908wrc.2
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bgN4VtmbpKha1U3dbSRWObWfSCBYh9C5Ynebd+aNbtU=;
 b=VLrOcDrs+SmaFdazM59jjwtd/i6vxkoa2zRcP/wRpeCrAf1qeboa3T7zDQ7EA3XtN7
 ipYmijZJUhq/CZX/mGjBz/qJkpaJZOvpcH+C0rDHt+ZMhLLYtmA1yJWO6Bj4G501evCF
 LE1C0/OTNhKFMKVkLQ8ZcLAu+TyvtJEo0QDye6WGAaebiWfODi8hlGIxA0Y0gTuhDvY0
 ONtoVMGFzlS6SljI6WKUEhfAQa39AKw4QWMVlkJoNgnE57rPq8eX42nIkyE784rdJqRg
 upfrCoCr3fq1poA3muhj3GEmDsFmjtVPqTW0MZizENPqmDtNDkuUt9AVfQptp0Q5FoeR
 qJhA==
X-Gm-Message-State: AOAM530M/Dm3/uTHug79qN4xNXHtHlgtCISW/ryz7TTkMu8ORKADV0Hq
 l0vZOPycCL7Tj/hmGU8J0CD8plyQnITspkUXg9y9Rdvb9BoAH4mOYLE2uCDtq/ZKxKw5ySmmILq
 TOzcjnTUS4nCdufjQrOBTukljvrihHc3zqaW4RrS+UoN4DcATPQXRD5PiLrC+KKt1
X-Received: by 2002:a05:600c:4ca9:: with SMTP id
 g41mr5044235wmp.139.1635433533876; 
 Thu, 28 Oct 2021 08:05:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBY6nM4w+6cGO0BZPqNwsdGY74MpF1H5H5JYsXRWlFcytsIqWLK8OMU19gFFGgxqk/oSM8Fg==
X-Received: by 2002:a05:600c:4ca9:: with SMTP id
 g41mr5044197wmp.139.1635433533600; 
 Thu, 28 Oct 2021 08:05:33 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l8sm4265906wry.43.2021.10.28.08.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:05:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] hw/core: Declare meson source set
Date: Thu, 28 Oct 2021 17:05:19 +0200
Message-Id: <20211028150521.1973821-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028150521.1973821-1-philmd@redhat.com>
References: <20211028150521.1973821-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we want to be able to conditionally add files to the hw/core
file list, use a source set.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build         | 4 +++-
 hw/core/meson.build | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 2c5b53cbe2e..2eb76c187c3 100644
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
@@ -2805,7 +2806,8 @@
 
 chardev = declare_dependency(link_whole: libchardev)
 
-libhwcore = static_library('hwcore', sources: hwcore_files + genh,
+hwcore_ss = hwcore_ss.apply(config_host, strict: false)
+libhwcore = static_library('hwcore', sources: hwcore_ss.sources() + genh,
                            name_suffix: 'fa',
                            build_by_default: false)
 hwcore = declare_dependency(link_whole: libhwcore)
diff --git a/hw/core/meson.build b/hw/core/meson.build
index a829cc4245b..4d04069f85f 100644
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


