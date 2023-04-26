Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7066EF261
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:43:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcZP-00020a-Qq; Wed, 26 Apr 2023 06:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcZM-0001oG-1S
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:40:16 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcZK-0003hj-Dm
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:40:15 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-63d4595d60fso42183195b3a.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505613; x=1685097613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ILeEC45O4cCOmKoGJEqXwqlDpUW0IKc6Vq1tRoBknx4=;
 b=vGgetQFezXfg4pWqt8w3rrAMHzjoDXNaBJ5gz21gDW0/HLKFAf+HEUBe2i79s8JviV
 uO2KuUHjYoOrYJdUZHS4iCSACJAGG2KNTmMw67DQdfQWz1kg0fKfZ1lC0LPclyouH4S6
 nFE41ysefOygP+a96sTGLuLYTJRmdBoslJ+5cTTV4l6mVsM5Ab/B2G9UmRbgnyITytFp
 LN9b6ZnPNuZrjajnOR36oz7IAmHkrXIDv8QiCkBaALwEH3J4A94y3d/jN3VbCbGwKnjf
 hWRXNYvB5qqF4Ftg7vgcxETANWlnlKwitmqFuUJx5oabxpJFGMg3WsQtw56tSDrS7B3I
 x1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505613; x=1685097613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILeEC45O4cCOmKoGJEqXwqlDpUW0IKc6Vq1tRoBknx4=;
 b=hMuTNPCxTM0UsnBPLFhjBc9ECnQ7swOLE28B4vMIoli3C11Si0y3QSIA+qLyCjsxGZ
 klmaByt6dHxaY9SyQYDN8g+5e45KDc4lP+zmsv8i9N/IddKVBc2RcWOmDE88ktuQTdPv
 s2cA6rle+Nzc8szRBJcvDgCd0SjWsKAqCld9Zjz/Ohm4ukZJxiXZdERuOkYGsLsgG6rU
 pqUkzdmHW8usIalZsYsLtcJgvkW/nKNRbwHet/EKHVMigKGqr6OFvdwi98Wdv9B/yH3/
 O53IjkE4CiUwP5FZixcZW7h0/KpzVwNOXO3lY9iA0e4T1A/+UhFwI19NJedOW5IY5rxl
 Lgfw==
X-Gm-Message-State: AC+VfDw7L+PwALUbJOSj5pnn4nIyhsWTkAZaRdMjnczd5dCGgX4pDKoY
 39bbI21uJ4/PY161pD8TA9OOfw==
X-Google-Smtp-Source: ACHHUZ49yAjPsaOLc5slyb3urKzpNHkqmSkSKFiVXIvBvlvQrzEPzN5rYc8N5BOVNN8YrPbTjJ0UlA==
X-Received: by 2002:a05:6a20:7490:b0:ee:9647:45fa with SMTP id
 p16-20020a056a20749000b000ee964745famr2392903pzd.20.1682505613278; 
 Wed, 26 Apr 2023 03:40:13 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:40:12 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 48/48] docs/system/devices/igb: Note igb is tested for DPDK
Date: Wed, 26 Apr 2023 19:37:16 +0900
Message-Id: <20230426103716.26279-49-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 docs/system/devices/igb.rst | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/docs/system/devices/igb.rst b/docs/system/devices/igb.rst
index afe036dad2..60c10bf7c7 100644
--- a/docs/system/devices/igb.rst
+++ b/docs/system/devices/igb.rst
@@ -14,7 +14,8 @@ Limitations
 ===========
 
 This igb implementation was tested with Linux Test Project [2]_ and Windows HLK
-[3]_ during the initial development. The command used when testing with LTP is:
+[3]_ during the initial development. Later it was also tested with DPDK Test
+Suite [4]_. The command used when testing with LTP is:
 
 .. code-block:: shell
 
@@ -22,8 +23,8 @@ This igb implementation was tested with Linux Test Project [2]_ and Windows HLK
 
 Be aware that this implementation lacks many functionalities available with the
 actual hardware, and you may experience various failures if you try to use it
-with a different operating system other than Linux and Windows or if you try
-functionalities not covered by the tests.
+with a different operating system other than DPDK, Linux, and Windows or if you
+try functionalities not covered by the tests.
 
 Using igb
 =========
@@ -32,7 +33,7 @@ Using igb should be nothing different from using another network device. See
 :ref:`pcsys_005fnetwork` in general.
 
 However, you may also need to perform additional steps to activate SR-IOV
-feature on your guest. For Linux, refer to [4]_.
+feature on your guest. For Linux, refer to [5]_.
 
 Developing igb
 ==============
@@ -68,4 +69,5 @@ References
 .. [1] https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/82576eb-gigabit-ethernet-controller-datasheet.pdf
 .. [2] https://github.com/linux-test-project/ltp
 .. [3] https://learn.microsoft.com/en-us/windows-hardware/test/hlk/
-.. [4] https://docs.kernel.org/PCI/pci-iov-howto.html
+.. [4] https://doc.dpdk.org/dts/gsg/
+.. [5] https://docs.kernel.org/PCI/pci-iov-howto.html
-- 
2.40.0


