Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820A14170D4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:27:42 +0200 (CEST)
Received: from localhost ([::1]:60310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjMj-00023s-JU
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKR-0007aS-S7
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:19 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKO-0000N4-Ne
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:19 -0400
Received: by mail-ed1-x52d.google.com with SMTP id eg28so35033615edb.1
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=36xUxYH1Afi8N5W5cIUwxmt2NMki93xyDotZiunEpyA=;
 b=DX1nMRA/XSePVaMqJql5UEf3NsseYA21HWcWaUWEQFV5aclxYY1Ca2wdijbGCsZKqO
 zb5g48ZjTGymg1PvOMVsceD8wW3JgI/Y+Blwwuc3UJX9f7Kpal68wH8n1O1uhRkd478x
 6ANjwsVnNJyJRplet0wajomFUttpscb9i0SVzu0shQwajMwyF9Qs5ly+OSn6aMi6nI6G
 T1FZc9JfFXCz5xesHHq7znSmQvQ2ctacINB6pseGjzXKKTQb8sqM++YAakfe+5F1gblB
 3c7uMXl/O7HKcQCi6pq19Sr5UAYEZfczxbW7Pbm5lsuQb6WswgmYYS00+MDRYx2RHHBK
 Fegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=36xUxYH1Afi8N5W5cIUwxmt2NMki93xyDotZiunEpyA=;
 b=AxRotAvav1OlllWsfX/cNZkjkmSuiy7yI+TrP0jWpxmzmR4PvqP+88AcjVGj8IE+xL
 q3dnapyzf3cp7hTbxwcsrEylBO4beWwm3+J6qlltmJV3WBAlc5qq7kvejnp0SR7Z/YcG
 8TjahIBFQbCBiT6YSAALqjHbNy6YCIQAljJRI+8/fnr4iGO52iYG87ts7Q0xczJ1oTw2
 4tLAq1JrKuX400jPBsEd3DL8iAn4HTLSpgPA2FY1wytSlMbhZuUmu2f8XyCergkhCE+q
 7uIYIFdC2gioTvzc5WcLhbDYDECgwq4uda4ctWdCO7LMQC+X8O/rra+oQbm6Zu+slEhA
 lOSA==
X-Gm-Message-State: AOAM532Lf3Hg8/3Ed78LDezXTb6z/J6k2NyTfIepRzt+NTQWdHoDF+ip
 mO+GGhlVppY/gt4VdijWDSyGzebUmQc=
X-Google-Smtp-Source: ABdhPJzemQpp4Gfux8Y3IK3pP5AiRKUtaF2SrpitD5RPD/CogTIoHNO4Jo+/oUqF98GUAqm/f2Hzuw==
X-Received: by 2002:a17:906:d798:: with SMTP id
 pj24mr10261555ejb.1.1632482712827; 
 Fri, 24 Sep 2021 04:25:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/26] Kconfig: Add CONFIG_SGX support
Date: Fri, 24 Sep 2021 13:24:45 +0200
Message-Id: <20210924112509.25061-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: yang.zhong@intel.com, philmd@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

Add new CONFIG_SGX for sgx support in the Qemu, and the Kconfig
default enable sgx in the i386 platform.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-32-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configs/devices/i386-softmmu/default.mak | 1 +
 hw/i386/Kconfig                          | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/configs/devices/i386-softmmu/default.mak b/configs/devices/i386-softmmu/default.mak
index 84d1a2487c..598c6646df 100644
--- a/configs/devices/i386-softmmu/default.mak
+++ b/configs/devices/i386-softmmu/default.mak
@@ -22,6 +22,7 @@
 #CONFIG_TPM_CRB=n
 #CONFIG_TPM_TIS_ISA=n
 #CONFIG_VTD=n
+#CONFIG_SGX=n
 
 # Boards:
 #
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index ddedcef0b2..962d2c981b 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -6,6 +6,10 @@ config SEV
     select X86_FW_OVMF
     depends on KVM
 
+config SGX
+    bool
+    depends on KVM
+
 config PC
     bool
     imply APPLESMC
@@ -21,6 +25,7 @@ config PC
     imply PVPANIC_ISA
     imply QXL
     imply SEV
+    imply SGX
     imply SGA
     imply TEST_DEVICES
     imply TPM_CRB
-- 
2.31.1



