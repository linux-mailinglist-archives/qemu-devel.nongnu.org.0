Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AC859F6FD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:59:07 +0200 (CEST)
Received: from localhost ([::1]:34742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnAA-0003Pl-Nf
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmsz-0002H4-Hk
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:41:21 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmsy-0001L5-2K
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:41:21 -0400
Received: by mail-pl1-x636.google.com with SMTP id jm11so15166184plb.13
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=EZVtm0SvUeW5TzKWeVkn+QL0GZmVIRTePkK09k2LuDo=;
 b=I7tZixZ9DlnNl6LPagcrRUkB0muB8Kr4lbWvRANjZKoLQaUI1TBZw5E/nr3yliNlrL
 qmjELqZpnRUK4OHhhq/zjS023cbRlnGmmpeHjNPt9uakCLHhtME7EV9Z3feYZLkepYEH
 TQq+5KMp6vbLFv+o9WUmd5cZgcwzP9mYr+6TklYIKzuajTEVxrBk5EeCEmhUDQpN9rrj
 ufn+TJw3KfDB7UGUXCkSjGS50ExUF524oMcmW1fRHXcT5J8fyNg73rvOm0IZFFrEZPpz
 KOXUYVm+XqJqs99q1w8KYnJKq1QCGhiQwPyLNPJoLcw+be0b0bG5GbID2VMzb00EwJ+n
 K3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=EZVtm0SvUeW5TzKWeVkn+QL0GZmVIRTePkK09k2LuDo=;
 b=H9qX+VZP+MYyqYKCARzBJj+TkNruC55wvTcqDnQLk8ndEzzcY8MmFLM9qlQ7B+lsmq
 g/y5zolQRIodRcPAiYUlGHTexDqdZIYQcuXQkvMUCTJuz0bWk7ES1ms8FESGyDsNvZGo
 OzYt0zQ7M17bUsY0oTBUQEn0SuAm0tlzy4E94xzdqQZNsArz01dKmqf1Fs38ORPRvs1Q
 eptB4aK/wOgZ3pTp2Qf64O6YtZh3olML4/wxc7ghgcyp/vvlQuaSQXwCN6Ei3wylETnz
 y/pRr1bHhajmW35eyQPRETYcXBUJYow1E2uCqkYOwlHg3WMYlaYguxJOchJwHabXvMqQ
 4/+A==
X-Gm-Message-State: ACgBeo2AZUs9T2AoB7D/Y4zi0kRiu27RLv4DYqeKONMbYXcZ8XLGWUVC
 ujPnJ0qj3cgXdGaYxurSbgKPH0mVDEY=
X-Google-Smtp-Source: AA6agR5KyV54s6DsPFRoE58SNQ2NsWhlTYaIlHqJcYpxnDphITa6Sf6W+FId74ZmhmuvOta4x+8zsA==
X-Received: by 2002:a17:902:9886:b0:172:bb36:70f1 with SMTP id
 s6-20020a170902988600b00172bb3670f1mr26829368plp.139.1661334077298; 
 Wed, 24 Aug 2022 02:41:17 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:41:17 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 04/51] semihosting/arm-compat-semi: Avoid using hardcoded /tmp
Date: Wed, 24 Aug 2022 17:39:42 +0800
Message-Id: <20220824094029.1634519-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

Use g_get_tmp_dir() to get the directory to use for temporary files.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 semihosting/arm-compat-semi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index e741674238..d5e66cc298 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -503,7 +503,8 @@ void do_common_semihosting(CPUState *cs)
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
-        len = asprintf(&s, "/tmp/qemu-%x%02x", getpid(), (int)arg1 & 0xff);
+        len = asprintf(&s, "%s/qemu-%x%02x", g_get_tmp_dir(),
+                       getpid(), (int)arg1 & 0xff);
         if (len < 0) {
             common_semi_set_ret(cs, -1);
             break;
-- 
2.34.1


