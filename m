Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31AD495D51
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 11:10:53 +0100 (CET)
Received: from localhost ([::1]:60478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAqsd-0003b4-Ll
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 05:10:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nApc1-0007W5-DD
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 03:49:37 -0500
Received: from [2607:f8b0:4864:20::533] (port=37632
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nApbx-0005BI-9M
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 03:49:35 -0500
Received: by mail-pg1-x533.google.com with SMTP id e9so4084795pgn.4
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 00:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EE/lsINW1r+Q3Q2LVVyGEEM3pfR635LiwaCBWKJdX1w=;
 b=3RsqwQiwXKH4a4CSuJXN/1eMuzMzrNIrQibvL9Mc2Hs8ym+/vK0ZjAadGIR1HiHF6B
 o9FirPJvSOwQof4/42zdbiUoNjQTZndiWJRU439d0+whWV/qC1gv+aP+Wshbr42ifKgJ
 8wJpM7191BmKjFJ1O8V4FTMIw7T9JAgREfQ93RCZiCShnODp8FUmkUDXFzmajXXBYNoa
 TWDdTY6k+AWcV/gRF1IgfNriVqWrQqLAmoaF/1WBizdmxVYximCVq+MAzaGzLUNfna1d
 vSBHPRCAhSn3BiP0lzzp6LtI9hCVheqj+8F3hxflm93LNIkGT9Q+xHOFhg0mZ7su8Pu/
 wArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EE/lsINW1r+Q3Q2LVVyGEEM3pfR635LiwaCBWKJdX1w=;
 b=kp28jklIzSBkwLgwU2aeoZME5rdvSPJUZsPRRyS7T4NaSQ5rZpbgZPLRJ6bUMPz2MZ
 FtGj/lLjdI6Bn8KDIBGkk5s0fD45JOuDWJ6YDtarEq60hpfGoyAXvvkFW8fjOs+Ctsas
 V0I2wDTGA06MCquYFiiICA6vgb4sJZYgvowK9B/+HdY/hx8jqVEq8gmKynUp5PsCyiQw
 MqxjU5J+ulVRXE3yiMiJWInZDNc6/bpnCht/EjiM3UcN0gqB56s3C7eb8JH5PEIgcWrc
 c6cuwb28d1bkPeqLH+cmlfAK8fwxk+qRxiMEFRk/4G8UqWI+HO2KZXBz4oecR3ly9tGG
 Oc2g==
X-Gm-Message-State: AOAM532h/4NHCdVEurB9KnmlAmiREN1S4GkZfHHpKmes2m2BY9TnFqsv
 oClKijECerDrH4gijeBJY3PY
X-Google-Smtp-Source: ABdhPJwGyXvL5n54jqB+9XrLPiYUhTgBvs0Wa+bH3P+/4JXJ/vIdnfOH170JvbWcLgP88vC9fa2PjQ==
X-Received: by 2002:a05:6a00:23c8:b0:4c2:6a7:95c5 with SMTP id
 g8-20020a056a0023c800b004c206a795c5mr2951718pfc.53.1642754971138; 
 Fri, 21 Jan 2022 00:49:31 -0800 (PST)
Received: from localhost ([139.177.225.237])
 by smtp.gmail.com with ESMTPSA id u9sm6413097pfi.14.2022.01.21.00.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 00:49:30 -0800 (PST)
From: Xie Yongji <xieyongji@bytedance.com>
To: Coiby.Xu@gmail.com, stefanha@redhat.com, marcandre.lureau@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com
Subject: [PATCH 1/2] libvhost-user: Add vu_notify_config_change() to support
 config change notify
Date: Fri, 21 Jan 2022 16:46:43 +0800
Message-Id: <20220121084644.217-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=xieyongji@bytedance.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a new API vu_notify_config_change() to support
sending VHOST_USER_SLAVE_CONFIG_CHANGE_MSG message to notify
that the configuration space has changed.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 subprojects/libvhost-user/libvhost-user.c | 20 ++++++++++++++++++++
 subprojects/libvhost-user/libvhost-user.h |  8 ++++++++
 2 files changed, 28 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 787f4d2d4f..ff95ccd6f3 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -1545,6 +1545,26 @@ vu_set_config(VuDev *dev, VhostUserMsg *vmsg)
     return false;
 }
 
+bool vu_notify_config_change(VuDev *dev)
+{
+    bool ret;
+    VhostUserMsg vmsg = {
+        .request = VHOST_USER_SLAVE_CONFIG_CHANGE_MSG,
+        .flags = VHOST_USER_VERSION,
+        .size = 0,
+    };
+
+    if (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_CONFIG)) {
+        return false;
+    }
+
+    pthread_mutex_lock(&dev->slave_mutex);
+    ret = !vu_message_write(dev, dev->slave_fd, &vmsg);
+    pthread_mutex_unlock(&dev->slave_mutex);
+
+    return ret;
+}
+
 static bool
 vu_set_postcopy_advise(VuDev *dev, VhostUserMsg *vmsg)
 {
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index 3d13dfadde..dd14242a7b 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -491,6 +491,14 @@ bool vu_dispatch(VuDev *dev);
  */
 void *vu_gpa_to_va(VuDev *dev, uint64_t *plen, uint64_t guest_addr);
 
+/**
+ * vu_notify_config_change:
+ * @dev: a VuDev context
+ *
+ * Notify that the configuration space has changed. Returns FALSE on failure.
+ */
+bool vu_notify_config_change(VuDev *dev);
+
 /**
  * vu_get_queue:
  * @dev: a VuDev context
-- 
2.20.1


