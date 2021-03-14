Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C605E33A8C9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:31:25 +0100 (CET)
Received: from localhost ([::1]:46108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaCi-00019z-NN
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaAx-0007nf-2o
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:29:35 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaAv-0003XV-NY
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:29:34 -0400
Received: by mail-wr1-x435.google.com with SMTP id e18so4810788wrt.6
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 16:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lpMrq2wl7tmbBfa/QUj59Ff3j8xcGG28cgdr4SMcAKU=;
 b=TAb8AB+nb2GDC4JtYhd9CpvSLG+l4XhtP3YqWMMdKZ3XOMw9gpSShXKAN/9bOtbw/n
 iIVbxaN87pRvuNq/GfizEx7XOypvHZmiiU/XTJIxgt5Mpjo0wk4FOx6QzElQGS3O0tdQ
 b0dXrfty2C6U5y9wb73h6DsrwRbhS/4Qo2BySVLxBfRR65zwQmrP3regZurPLYRUZAsi
 Y/9unTlqnsbdoAy4Eb8lREPtLny0m3iLSAsEwercRPkeR4uAFJ7tl9jS5tMv7a9K/KYa
 meRDAaEYYRuA7jszi86BvfR8c1EUTFGqwwc9jAClsmIZsmNM8JZxQv1ZqlcJzZscWDAM
 wZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lpMrq2wl7tmbBfa/QUj59Ff3j8xcGG28cgdr4SMcAKU=;
 b=e4heWo6amWk+3tuR3TiEuauO8zEOX7Cq9BgLr8IdB8T33sUJ7frCrYYqB+e6Jh/i5c
 IvcKE3A4tL6J1HKO+ZBHRVF9r8KKuAeVjbQNnT63FJIZ7qyHEGwr6MI+nicEm6ZD2bFk
 7O0tvzzuX4/0pP8oSZO398HLvktxDg+J2Le8hr00v1uqbOjqIPi7FjK6MpJ0dvcVi2go
 /mRHtzS43YZXhgfCa9CzbH1xNcZTgIayUdYfy/6JvnXL17wZMC8amz6ryVtORocJpp1p
 X+QbZw7oleF5M3LjvmIAyP1p1cio1bquCXfMpdiQY6GxV62xZ2IUT8Qij88u9UXZIV1x
 /79A==
X-Gm-Message-State: AOAM530/6EvrRhr3l3us6ofZaDrQNw/oQT53kj2Oy8JdoB9eX3XO2K2R
 4ea9GAo1v9Gu0F/w5xqbWIm8O38gizi13A==
X-Google-Smtp-Source: ABdhPJwyfXUbRK3t/WOE6dO5sJ2XrOeNoIE7Xi+kpEQzmpezA5Nj+OBE1U9z4VGM5QTJSLZlt9Xx2Q==
X-Received: by 2002:adf:9544:: with SMTP id 62mr906615wrs.128.1615764572160;
 Sun, 14 Mar 2021 16:29:32 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s23sm10102316wmc.29.2021.03.14.16.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 16:29:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/8] target: Introduce TARGET_HAS_IOPORT
Date: Mon, 15 Mar 2021 00:29:08 +0100
Message-Id: <20210314232913.2607360-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210314232913.2607360-1-f4bug@amsat.org>
References: <20210314232913.2607360-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Rolnik <mrolnik@gmail.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Have target architectures providing CPU access to I/O bus
define TARGET_HAS_IOPORT.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/targets/avr-softmmu.mak    | 1 +
 default-configs/targets/i386-softmmu.mak   | 1 +
 default-configs/targets/x86_64-softmmu.mak | 1 +
 3 files changed, 3 insertions(+)

diff --git a/default-configs/targets/avr-softmmu.mak b/default-configs/targets/avr-softmmu.mak
index e3f921c0199..4652ce136bc 100644
--- a/default-configs/targets/avr-softmmu.mak
+++ b/default-configs/targets/avr-softmmu.mak
@@ -1,2 +1,3 @@
 TARGET_ARCH=avr
+TARGET_HAS_IOPORT=y
 TARGET_XML_FILES= gdb-xml/avr-cpu.xml
diff --git a/default-configs/targets/i386-softmmu.mak b/default-configs/targets/i386-softmmu.mak
index 5babf71895d..969008859b6 100644
--- a/default-configs/targets/i386-softmmu.mak
+++ b/default-configs/targets/i386-softmmu.mak
@@ -1,3 +1,4 @@
 TARGET_ARCH=i386
+TARGET_HAS_IOPORT=y
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/i386-32bit.xml
diff --git a/default-configs/targets/x86_64-softmmu.mak b/default-configs/targets/x86_64-softmmu.mak
index 75e42bc8404..2d35270f020 100644
--- a/default-configs/targets/x86_64-softmmu.mak
+++ b/default-configs/targets/x86_64-softmmu.mak
@@ -1,4 +1,5 @@
 TARGET_ARCH=x86_64
 TARGET_BASE_ARCH=i386
+TARGET_HAS_IOPORT=y
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/i386-64bit.xml
-- 
2.26.2


