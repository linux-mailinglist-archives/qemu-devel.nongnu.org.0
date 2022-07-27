Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6F358216C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 09:44:55 +0200 (CEST)
Received: from localhost ([::1]:38068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGbiw-0006va-RY
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 03:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGbaG-0005xv-Po
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:35:57 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:35717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGbaF-0002IP-B8
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:35:56 -0400
Received: by mail-pl1-x62e.google.com with SMTP id t2so1448561ply.2
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 00:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dhIcUePJ3TCkM/NTCNUzXkEdR1JjTZt6sHSrXk6NROo=;
 b=MmdL13Lj+w30ngceHHtgOP1S8yoSjr2txit0046rW5A5TdN1qMerDv+m/XBJHp4dfS
 F2v1qK+HXFD30VpYrJ4DttdAsdEkFGnJAVAymXFXPiXr/bzp17eweUaJfDY7WA6ce7Z0
 VJja9W/kyBW6olaTpTnb5h0aRMstgH0E7UzeViKx9tmQL6NO7Z+72Tn/txtoF0rcxOuC
 B8/N0ArlqdWLhhXPi2lvrDjFANSBjquBO9cXu5eM4AH9IrMPQP0TCXnm6XFilL0l13Qo
 QfBwNXyoiqX/rHOt6g4kzow6tZsPR9lKSTZvG7aruvyn9g75XojKnK2kKI93O0T8y6u4
 IVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dhIcUePJ3TCkM/NTCNUzXkEdR1JjTZt6sHSrXk6NROo=;
 b=e14EOThJilDZ5hDw4YDTEl5N6bvb9Dl0ndLZHqHwwFxH39led76TKQ8wuh0Qb2/waT
 uh9i438TasUYAPz46qpxDZRCxXNUZr9yCkdDntXLPP/ogaaUSt5Ho83K3k7SkF/iPJuB
 SuxEMWN1Qdt8UAjVnHmAcRNeV2gev7Fjwfkqjc2rdh/rxDO0WwhqzX+Gy/r1uumwURlJ
 mpeX6IyJ7xFJVPvUjntTXctY+bxFGVocME+64h2JqxdYhO5cQyIlY2S2e1nayISz9uLl
 LrPHjaJyPNmx0TqUyuPyJdTrFIr1bqm8j4EXxrOs/q+m0vDkD9HQ0q7j65Nwz9MJW69d
 yIdw==
X-Gm-Message-State: AJIora+YLnHWBrpODWG1C6jvp/Jux7wtyAZFpFZhVVArRimVuFaBCXho
 G4mtQG/sm0GAmAtqj6kzfzkcrdYdt0w=
X-Google-Smtp-Source: AGRyM1vdwLN9rLfd4M94cvlpSrVy8R1nO/NIj/aKH6FzUjjerkK+fJs9CJDMSxcFU9quOCj+7ImfSg==
X-Received: by 2002:a17:903:245:b0:16b:9b6d:20bc with SMTP id
 j5-20020a170903024500b0016b9b6d20bcmr19580228plh.14.1658907353783; 
 Wed, 27 Jul 2022 00:35:53 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a170902ccc700b0016c09a0ef87sm10533834ple.255.2022.07.27.00.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 00:35:52 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Stefan Weil <sw@weilnetz.de>
Subject: [PATCH 2/5] util/oslib-win32: Add a helper to get the Windows version
Date: Wed, 27 Jul 2022 15:35:39 +0800
Message-Id: <20220727073542.811420-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727073542.811420-1-bmeng.cn@gmail.com>
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62e.google.com
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

This adds a helper to get the Windows version via the RtlGetVersion
call, for QEMU codes to determine the Windows version at run-time.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 include/sysemu/os-win32.h |  2 ++
 util/oslib-win32.c        | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index edc3b38a57..1e324026a4 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -204,6 +204,8 @@ ssize_t qemu_recv_wrap(int sockfd, void *buf, size_t len, int flags);
 ssize_t qemu_recvfrom_wrap(int sockfd, void *buf, size_t len, int flags,
                            struct sockaddr *addr, socklen_t *addrlen);
 
+void os_get_win_version(RTL_OSVERSIONINFOEXW *info);
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 5723d3eb4c..6d2387b9ff 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -547,3 +547,18 @@ int qemu_msync(void *addr, size_t length, int fd)
      */
     return qemu_fdatasync(fd);
 }
+
+void os_get_win_version(RTL_OSVERSIONINFOEXW *info)
+{
+    typedef LONG (WINAPI *rtl_get_version_t)(PRTL_OSVERSIONINFOEXW);
+
+    /* RtlGetVersion is available starting with Windows 2000 */
+    HMODULE module = GetModuleHandle("ntdll");
+    PVOID fun = GetProcAddress(module, "RtlGetVersion");
+    rtl_get_version_t rtl_get_version = (rtl_get_version_t)fun;
+
+    info->dwOSVersionInfoSize = sizeof(RTL_OSVERSIONINFOEXW);
+    rtl_get_version(info);
+
+    return;
+}
-- 
2.34.1


