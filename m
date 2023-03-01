Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4206A6F33
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:19:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOCK-0000Iz-I7; Wed, 01 Mar 2023 10:16:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBh-00087p-OH
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:14 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBb-0007bQ-V7
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:13 -0500
Received: by mail-wr1-x435.google.com with SMTP id l25so13607689wrb.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gLoSAqw2g9SSYzDjVUbVFG04TNYZLvZZTMSrfeOd4FU=;
 b=yrLjFlmT9gma5NA+2rSx0JYNqUrwRbL7Tly037x7+tF7sbg23KeJA6Yt3EdxFijx0g
 Txmhjh+1z60PMCnnVtHLN4+vJAwiT5isENsDjI9kJ4h8AI/Ly10LBzrsLu/Gikp+Rfdr
 TKGhKJlCH0pYD24JkdGSDW2vkihHwXJ5OVo0vhqcJabRiBRzhQ0FjNg31HpfqZHy4kT3
 Vr6xTpJQEFkp5ueBQq8kTpVgnkvC0ixB3m8R0TdwMuHKNWfeZ0mhYl0rvNU5xNUjqo9/
 ODIoqbWvBN3yBEVFTtXAW13dXk5XLCWyQNKD15YBuNPHh8XeOw5KDefA7O0qeQtnK8aJ
 4wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gLoSAqw2g9SSYzDjVUbVFG04TNYZLvZZTMSrfeOd4FU=;
 b=I3O1puaT9opZI4BbMWiJlhUDI1rV/p7YHJ5xFOQVOrLBmOGtm/nbUOy3R4PuRPNNvm
 iCUjMXh4C8dgShx9vjxnqxiDxQ7CBEisRuvGvs729fAKYIXqi4tT9JuDTda9yYmP7sAe
 eBcigSVOs+7PSkSH75ziPjfWlhIJc0zMStxQC4nbOXiDuwFbMJIBsEX2RdX1IiOrni6v
 FHCOo7VspLKB40hlKZHv8cKIpWn2p2qLdQ/1g3z8+f8j7VIDJ9/KjutqUEoKyK8Tnm/A
 ZcP2td6tVqjO3Qb4WAJLU4aixIAum95AT2VUHGE93QjmEsVyQhxS+PidzsvRjDYlzTKq
 kElA==
X-Gm-Message-State: AO0yUKXihE4NtYSPUIAqwbvD0Waf5mz4Ycg8JIrWX+VA9cyeBtWyribf
 BHjR5v7xq1ajEnXFhNBg7Bt/9Q==
X-Google-Smtp-Source: AK7set8y5k+ttcVn6a4plaFskrLVHVcPGfqHDWguIFhSz2pKjezyFLoFGofDLPFb4b/oSDQ6iXCcgw==
X-Received: by 2002:a5d:468e:0:b0:2c7:1b42:1cec with SMTP id
 u14-20020a5d468e000000b002c71b421cecmr5000464wrq.23.1677683766517; 
 Wed, 01 Mar 2023 07:16:06 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k10-20020adfd84a000000b002c55551e6e9sm13082916wrl.108.2023.03.01.07.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:16:05 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 034AB1FFBB;
 Wed,  1 Mar 2023 15:16:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL v2 03/24] tests: be a bit more strict cleaning up fifos
Date: Wed,  1 Mar 2023 15:15:43 +0000
Message-Id: <20230301151604.1948813-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When we re-factored we dropped the unlink() step which turns out to be
required for rmdir to do its thing. If we had been checking the return
value we would have noticed so lets do that with this fix.

Fixes: 68406d1085 (tests/unit: cleanups for test-io-channel-command)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230228190653.1602033-4-alex.bennee@linaro.org>

diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
index 04b75ab3b4..c6e66a8c33 100644
--- a/tests/unit/test-io-channel-command.c
+++ b/tests/unit/test-io-channel-command.c
@@ -42,6 +42,7 @@ static void test_io_channel_command_fifo(bool async)
     g_auto(GStrv) dstargv = g_strsplit(dstargs, " ", -1);
     QIOChannel *src, *dst;
     QIOChannelTest *test;
+    int err;
 
     if (mkfifo(fifo, 0600)) {
         g_error("mkfifo: %s", strerror(errno));
@@ -61,7 +62,10 @@ static void test_io_channel_command_fifo(bool async)
     object_unref(OBJECT(src));
     object_unref(OBJECT(dst));
 
-    g_rmdir(tmpdir);
+    err = g_unlink(fifo);
+    g_assert(err == 0);
+    err = g_rmdir(tmpdir);
+    g_assert(err == 0);
 }
 
 static void test_io_channel_command_fifo_async(void)
-- 
2.39.2


