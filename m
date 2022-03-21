Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EC74E2CB3
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:46:33 +0100 (CET)
Received: from localhost ([::1]:58196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKEq-0004ED-WF
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:46:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzj-0005GN-NH
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:31:01 -0400
Received: from [2a00:1450:4864:20::62b] (port=42704
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzh-0004wN-JS
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:30:55 -0400
Received: by mail-ej1-x62b.google.com with SMTP id j15so16517354eje.9
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 08:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WJyvP+SIF5jPjbPOJyz08xQ6LGqBG0ozT6/7S65ug8o=;
 b=MR8YemZG5XpYeJuJqnG1SDf58KwHNhV7YRXu4bQ9C5PhyI3QO65/VYbRcqGFlZQyER
 0uSgjM7seykog4la72SBIbbr374uvE3wyYAqGHGNc+HdpHG4UlAad9EQc9YAQTevnizg
 vYLSzJ5qMtyhvE1o2leRgL/Y0Uhal3+2YmSrXHZyJIQX2ZoOqf0T2LPcp0iLASTTh5bP
 NyZvdtO2zh5ZUCmO3DKayNWFqLAbBFCcR6wEAPqHqO3K9D/cYVRGA8hHKh9AlCCPCZHl
 7U6U23NXavhdnFBOrb61mUxkrK/g1Zt1Zl3/+rEJHlSSNCfrEpnJ/uRNg0Kd4lcrpkYm
 +7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WJyvP+SIF5jPjbPOJyz08xQ6LGqBG0ozT6/7S65ug8o=;
 b=bC3BZyt6jJqcT0WoK831lPvceIttlt9JNs+wLd/CZJ6QKjC64vHqzHBXJR0wAoyvq1
 9QFcmMg8RpluCT+xVhCJHQ2/zuo77Ftdpd0lXi+R/ihYYPFQSphxC5Rpwy7QGsezwQdL
 AEhXGIKCtWteHJlfCMcTsai9chFplvqb/0Fyap0AjTfX1GEhrUK/mRkDB9I4zfDamx8g
 1mkcnpyY6SPmNmdAJx9hPzpT+JmeufDa5i2M0wUIskfPUsYzEF2vZT3vXWQM/s3ZVMV9
 CpsyrhUBFpsRZPEZbniYCkEGdo1iBl+YARcmq/Mz8mj7Tvo1wO/945xFHvNThoUwBpV3
 qJlA==
X-Gm-Message-State: AOAM5318FiXqb2hVS9mNVMdSrjwmYxxie3jfzSdblBa2YmMa7T/6LXoI
 XIptMbH7JipjuyMRNunKFIXXYQ==
X-Google-Smtp-Source: ABdhPJw8XmNIlg0PWGtkAzIfCH8mKrZHNR7GpQdJspDnjY3YZIpq2A2ziPp6geEvAR0AqJHJAF82bA==
X-Received: by 2002:a17:907:3eaa:b0:6df:b058:96a with SMTP id
 hs42-20020a1709073eaa00b006dfb058096amr16336812ejc.368.1647876650482; 
 Mon, 21 Mar 2022 08:30:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 i10-20020aa7dd0a000000b00419286d4824sm2849582edv.40.2022.03.21.08.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 08:30:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4EF151FFBF;
 Mon, 21 Mar 2022 15:30:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 07/13] vhost-user.rst: add clarifying language about
 protocol negotiation
Date: Mon, 21 Mar 2022 15:30:31 +0000
Message-Id: <20220321153037.3622127-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220321153037.3622127-1-alex.bennee@linaro.org>
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 Jiang Liu <gerry@linux.alibaba.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the language about feature negotiation explicitly clear about the
handling of the VHOST_USER_F_PROTOCOL_FEATURES feature bit. Try and
avoid the sort of bug introduced in vhost.rs REPLY_ACK processing:

  https://github.com/rust-vmm/vhost/pull/24

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Jiang Liu <gerry@linux.alibaba.com>
Message-Id: <20210226111619.21178-1-alex.bennee@linaro.org>

---
v2
  - use Stefan's suggested wording
  - Be super explicit in the message descriptions
---
 docs/interop/vhost-user.rst | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 08c4bf2ef7..948d69c9ad 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -331,6 +331,18 @@ bit was dedicated for this purpose::
 
   #define VHOST_USER_F_PROTOCOL_FEATURES 30
 
+Note that VHOST_USER_F_PROTOCOL_FEATURES is the UNUSED (30) feature
+bit defined in `VIRTIO 1.1 6.3 Legacy Interface: Reserved Feature Bits
+<https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-4130003>`_.
+VIRTIO devices do not advertise this feature bit and therefore VIRTIO
+drivers cannot negotiate it.
+
+This reserved feature bit was reused by the vhost-user protocol to add
+vhost-user protocol feature negotiation in a backwards compatible
+fashion. Old vhost-user master and slave implementations continue to
+work even though they are not aware of vhost-user protocol feature
+negotiation.
+
 Ring states
 -----------
 
@@ -889,7 +901,8 @@ Front-end message types
   Get the protocol feature bitmask from the underlying vhost
   implementation.  Only legal if feature bit
   ``VHOST_USER_F_PROTOCOL_FEATURES`` is present in
-  ``VHOST_USER_GET_FEATURES``.
+  ``VHOST_USER_GET_FEATURES``.  It does not need to be acknowledged by
+  ``VHOST_USER_SET_FEATURES``.
 
 .. Note::
    Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must
@@ -905,7 +918,8 @@ Front-end message types
   Enable protocol features in the underlying vhost implementation.
 
   Only legal if feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` is present in
-  ``VHOST_USER_GET_FEATURES``.
+  ``VHOST_USER_GET_FEATURES``.  It does not need to be acknowledged by
+  ``VHOST_USER_SET_FEATURES``.
 
 .. Note::
    Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must support
-- 
2.30.2


