Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6D23F8CC3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:13:25 +0200 (CEST)
Received: from localhost ([::1]:40390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJIwO-0008Jo-2A
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImy-000681-Nv
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:40 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImx-00006g-1B
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:40 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso2632449wmi.5
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7G7OytPvUukFyBCYon8vLCnjKjIk5le1XSdFjDgae8k=;
 b=gCEnH5BnOQia1jM+VJhFBwh3DzunjGhBK0mmVtEVOG07UUnnlY1nmdAjR/YkggVIrO
 I5q0e1q9ZQb2uObjJOirzJaZdG2M4GH2S2UUxOP30RO8MoMUzuY5zxMJKqfgwcppQatc
 hJ97c0tBUAVg/1YGAFXlimsE10nj/NHoyLiYQUeKIbkzN6SKHHORU74BPnTgVBM29cri
 Q0xcMmcu9YpuSc5z5Sw7yCBAu3EaUUrlKKVoURpaOmHrLeoenClQTnToK5+lrghIjYyU
 qdNslqtdI1TVeejkd3Vvo0MmAvvks9eH9QvtXFluVbQPT+Lq7qTtzkzL7OD52RSdpee6
 mbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7G7OytPvUukFyBCYon8vLCnjKjIk5le1XSdFjDgae8k=;
 b=MoEMhf/DgvLa1kkCqQFYIoFMomQyPVibLIVWvzp8YAx6XTLcneynhehoI3b/AKXZ9C
 DIj2X47qvs6njfpSZCY0urWp9MdGKZD5VZ5P3CBr6V7v8lI8fwIlgpInjb8lMDKXQJa+
 xa9EWkVQgYFqgID6MEw8RH26nMKa19OGjGBNTeuiSkDUir38R6IueEuNQre+l+0xhMzT
 R14O8/vCfKpiWCoN5XXX0IUeW3HX8izdvh5Cva+N/gjxEuM50gvu9QMAEy0dG6C1wUuG
 NTNbArnkcUu6sq10dyCjNzBeTQoewCU9suU1axid5fbCBhewtsLxQoIIxR63VcWfQpLe
 R8SA==
X-Gm-Message-State: AOAM533iYQ8HehGuvUhOinapQ4ABO+WzfSOxCF1jvmfwim2M2Tr5FMD5
 pJvuMCLpYdsS5KuFMbDrpZz0TryDEBk8pw==
X-Google-Smtp-Source: ABdhPJzU/1fiLfl7zkQCeSID96ietXsvCod22JRM2hGfLr+jD69Nz62iHcXewRujlYtjBATtn07o3A==
X-Received: by 2002:a1c:25c7:: with SMTP id l190mr1105053wml.118.1629997417779; 
 Thu, 26 Aug 2021 10:03:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/37] gdbstub: Zero-initialize sockaddr structs
Date: Thu, 26 Aug 2021 18:02:57 +0100
Message-Id: <20210826170307.27733-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zero-initialize sockaddr_in and sockaddr_un structs that we're about
to fill in and pass to bind() or connect(), to ensure we don't leave
possible implementation-defined extension fields as uninitialized
garbage.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20210813150506.7768-3-peter.maydell@linaro.org
---
 gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 52bde5bdc97..5d8e6ae3cd9 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3218,7 +3218,7 @@ static bool gdb_accept_socket(int gdb_fd)
 
 static int gdbserver_open_socket(const char *path)
 {
-    struct sockaddr_un sockaddr;
+    struct sockaddr_un sockaddr = {};
     int fd, ret;
 
     fd = socket(AF_UNIX, SOCK_STREAM, 0);
@@ -3247,7 +3247,7 @@ static int gdbserver_open_socket(const char *path)
 
 static bool gdb_accept_tcp(int gdb_fd)
 {
-    struct sockaddr_in sockaddr;
+    struct sockaddr_in sockaddr = {};
     socklen_t len;
     int fd;
 
-- 
2.20.1


