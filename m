Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1275A52AAF8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 20:34:59 +0200 (CEST)
Received: from localhost ([::1]:37804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr21z-00014t-SQ
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nalanzeyu@gmail.com>)
 id 1nr1aL-0008Tg-KZ
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:06:18 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nalanzeyu@gmail.com>)
 id 1nr1aJ-0001Uz-DB
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:06:16 -0400
Received: by mail-pl1-x630.google.com with SMTP id n18so18052203plg.5
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 11:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YJXByTstbvOjhMep3d58apDCFYsPwTWYbwiq8khGfhM=;
 b=BentGF7qf9AV7vxbnS+5JdTvhThubNqknXNV2U4FRnjxHgiV1tzEZHDcugLoWYWiMw
 4ZrgGlmsyf6TdP5DtF0mXzDNJfvycDKJl0+6De9/8K8oCTksWP4MVy3HMRl70ryzAIWh
 eZzl6U6Ynsdpn0QlagOcptvpTSt4uJKOlHYC1UPS9t6oTD92SFC5OLN5xBQ0EdW/Pm9c
 8UhXqdYTE43Po8+BlE12gLE4+PwFRGd/HFCKsVI5iOun63Da9NG17Rf2Log2HKc5F7K6
 sBj4wNuaPjbz+zQ3zE/WfVJdNPWqYCF0dkwg9R78Z0ZJ06NZ+sXzvl+I5GxFcCwzIXth
 z40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YJXByTstbvOjhMep3d58apDCFYsPwTWYbwiq8khGfhM=;
 b=W1KuhkV7VAyziEeFjWrHIE+4CWGmdlyLKkBF99KTNmWNnwELNw16YiNcSIeCJuMiSB
 y3IO1umnzQLA9A03do1ISsjM2LfrdXYr8/vUe94bsGMzR9Yiw9ABaQGIXhQ2XxcCsx7g
 z7qe0lESujNDwzbqcVymm0s2IFj+58iaMum049KfTRvz9S41mcKOCPbIn04wby2+6i17
 6yHo4oq3KTQW265ZUoFvVla4k4md37BvYyVwuauvATmkoJ9botx/Z1otq75h93H1eqis
 XkD+nmZ6CoRRVTL3IEzkgYQgCYTkXhAuaFFz+eJxun+HGa0LhLLCLm6zA51EBJWkXndo
 LDYw==
X-Gm-Message-State: AOAM533UXYngDscOJZEmVXm/kAJl2w4cYRLsQCyZF54/NNyH5m53bGwv
 0DCHh7WzZS2lyB/Yx+9QP/sKYTn71QSI6w==
X-Google-Smtp-Source: ABdhPJzR3eA5I46nKf5Y+UE4lyVUZa9JZuPhqDYy2/5jvYF/YTJ6rgCyb0NxqFcyaxsw9UORz2MqZg==
X-Received: by 2002:a17:903:2290:b0:161:afab:f48c with SMTP id
 b16-20020a170903229000b00161afabf48cmr3127549plh.64.1652810773354; 
 Tue, 17 May 2022 11:06:13 -0700 (PDT)
Received: from Nlzy-MiAir-Fedora.. ([45.66.217.9])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a170902a3c500b0015e8d4eb231sm7158675plb.123.2022.05.17.11.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 11:06:13 -0700 (PDT)
From: Yan Cangang <nalanzeyu@gmail.com>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	Yan Cangang <nalanzeyu@gmail.com>
Subject: [PATCH] linux-user: fix ioctl() arguments printing in strace support
Date: Wed, 18 May 2022 02:06:05 +0800
Message-Id: <20220517180605.109867-1-nalanzeyu@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=nalanzeyu@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 17 May 2022 14:33:17 -0400
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

When both of the following conditions are satisfied, ioctl() arguments
printing in strace support is not working:
    - highest bit of ioctl() request command is 1
    - sizeof abi_long is 8 bytes

print_ioctl() and print_syscall_ret_ioctl() find IOCTLEntry by this way:

    /* ie->target_cmd is int, arg1 is abi_long, both are signed */
    for (ie = ioctl_entries; ie->target_cmd != 0; ie++)
        if (ie->target_cmd == arg1)
            break;

Operator "==" will convert target_cmd to abi_long by sign extension,
resulting in a negative number, will not match any ioctl request number.

This patch simply changes type of target_cmd to unsigned int, avoids sign
extension. ioctl command values are 32-bit constants, explain highest bit
as sign bit is pointless.

Signed-off-by: Yan Cangang <nalanzeyu@gmail.com>
---
 linux-user/user-internals.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index ddc260e465..550d16e2dd 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -35,7 +35,7 @@ typedef abi_long do_ioctl_fn(const IOCTLEntry *ie, uint8_t *buf_temp,
                              int fd, int cmd, abi_long arg);
 
 struct IOCTLEntry {
-    int target_cmd;
+    unsigned int target_cmd;
     unsigned int host_cmd;
     const char *name;
     int access;
-- 
2.36.1


