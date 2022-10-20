Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109BF6061C5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:38:17 +0200 (CEST)
Received: from localhost ([::1]:57966 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVkV-0007eS-G3
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:38:15 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVRA-0007fP-04
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU64-0002dq-PA
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:30 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU5z-0000oQ-Jr
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:23 -0400
Received: by mail-wr1-x429.google.com with SMTP id bv10so33914581wrb.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yShOXbzELIGNaOPIz9eBhTKjXWoTlNpcm8mEq/fJPX4=;
 b=UTWSgz944WdZdCwlIR1s1kjj2VLZgGDDjOCxSUFtZz97cEt7YVYw9L35LfTEW9fil+
 AsMadMYNH7MoFWKefYiQ4JQ57j5Nc/JYDvZ8CMDMpg6OmlsDn5H6n8lR6Q8hZGgTojtO
 sTKLSyyogIbUcMp/q/oQGPJ4jMAp2N1+P+aFEOiKE2MScE7V2J2+SOHif6nR5jCIv3vl
 f6krnF3yXpEvp1W/u0HLW9Bl7PyYnZnehlgDQmOUoTk9mW/qPt/tj9cN0lRAzsiZR++k
 OBa0WpF5N7DDgSdRpxLwqquVuBOSdB55DXB06HDMZtzC3mJ1CGkrGD6u0qB8G9wkpT12
 kI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yShOXbzELIGNaOPIz9eBhTKjXWoTlNpcm8mEq/fJPX4=;
 b=jXxy6hZYwkFis3l/CEv7WQWkwQo7TCjfC4hCxfNzhFnEf2E7rXEN63GB5yYMVL31uN
 ZhV+1rfWoJiQMXBXh7nYo3Zd5SR7ERdYRWyXPOo7lx80hY8Lujl77U/CAMF8wSGVc1PU
 rarj32dEHCWG9ZBLDxCGhoMMfa4u97BZHW3Tzla5ctriWPjbf3diSJ8JssQV4G3onkD+
 uO2caSzNfIC+OSdDa/HtlFsJTTM5KxZhAI8qD8UPmPxMDQc/3JQvY4Mn05Yr7yAHQowZ
 8c8vcSyZ0zISu/6i86gblq1M5kntoJLzmdSpewBg9FyIfZ61Y3LQWcoeh8tekEU883V2
 VMOg==
X-Gm-Message-State: ACrzQf1FWsgs9xfL/W87ajSTiReV7/izRA0JdR3zi3JAVs2iRhPZH07P
 rxtENd3ljsifL5mp7PyCUcd6Cg==
X-Google-Smtp-Source: AMsMyM7mokVp+v6By4f8jibwlpiqHhGa9NWysjaT0flOcE8HX3W4AkPep9mLCVRSgj5OCnwnk4FHOg==
X-Received: by 2002:a5d:4a4d:0:b0:22d:c8cb:8687 with SMTP id
 v13-20020a5d4a4d000000b0022dc8cb8687mr8211142wrs.554.1666266737119; 
 Thu, 20 Oct 2022 04:52:17 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a5d4b02000000b0022ed6ff3a96sm15958829wrq.39.2022.10.20.04.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:52:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C50301FFC0;
 Thu, 20 Oct 2022 12:52:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 08/26] tests/tcg: use regular semihosting for nios2-softmmu
Date: Thu, 20 Oct 2022 12:51:51 +0100
Message-Id: <20221020115209.1761864-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The nios2 code now plugs into the common semihosting code so we can
use the same redirect invocation as the other boards. There is however
a bug raised for the fact the tests don't seem to be completing
properly and silently passing anyway:

  https://gitlab.com/qemu-project/qemu/-/issues/1258

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/nios2/Makefile.softmmu-target | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/tcg/nios2/Makefile.softmmu-target b/tests/tcg/nios2/Makefile.softmmu-target
index c3d0594a39..bc7fd55060 100644
--- a/tests/tcg/nios2/Makefile.softmmu-target
+++ b/tests/tcg/nios2/Makefile.softmmu-target
@@ -25,8 +25,7 @@ LDFLAGS += -Wl,-T$(LINK_SCRIPT) -static -nostdlib $(CRT_OBJS) -lgcc
 %: %.o $(LINK_SCRIPT) $(CRT_OBJS)
 	$(call quiet-command, $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS), LD, $@)
 
-# FIXME: nios2 semihosting writes to stdout, not a chardev
-QEMU_OPTS = -M 10m50-ghrd,vic=on -semihosting >$@.out -kernel
+QEMU_OPTS = -M 10m50-ghrd,vic=on -semihosting-config enable=on,target=native,chardev=output -kernel
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=0
 TESTS += $(MULTIARCH_TESTS)
-- 
2.34.1


