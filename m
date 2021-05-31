Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DECE395531
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 08:02:16 +0200 (CEST)
Received: from localhost ([::1]:38346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnb0B-0005kl-6q
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 02:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapf-0005Zv-Cm
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:23 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapd-0003vt-Iz
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:23 -0400
Received: by mail-pl1-x62f.google.com with SMTP id v12so4647285plo.10
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 22:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ltY72nVCK5TD5ps8fDCHUS2LTRD8qK8p7I13wFYy/w=;
 b=FQAQwiLaPrc6M9XYDEcETipLElSsh0a5poFIobF1pvCUcZOTaU1upETL8XguThcMt4
 OLo2lo9roYiqoiraX5Unf6NxkuG5EjjS0pTbZSWFIx8KGz0SwXicT5CqN6JWpJTGjTnq
 cE3UiDWspqONxjqC3p7hrlPfamVuNy8YEYKwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ltY72nVCK5TD5ps8fDCHUS2LTRD8qK8p7I13wFYy/w=;
 b=jYmxZCkP9sn/7W6NXIsV7PoHReCMJnaDxaHFp9E7l0kGL2HNJlwBndq17ru4n7YZkP
 Q/OiBFVh/KrVSeaD95t7B817FU4DqHT8r/KQh9F1jiNcsCl0AveBgFRKXTmcJkBfCeDp
 ViuNo/ocdcnWK7MltU+gW8zlpMGMgtJXM7fAl+OZbqluHlXKBaAlNqjKAvtGJ+QgjF3p
 nPdAI0nAUvCOdB5BCLmDwBHjBkI3KSbGmjYakvwb4oDVm7N+kJjDt9+SKq56vhMR849M
 5N8mTB9NDt2eY4UHafZOCmTESGWM2N4mYMuJ+V9+toli0UcPBhN/Of8rQT91NmzEcJro
 MTng==
X-Gm-Message-State: AOAM531EcjxvD57/TqevsKwdQnDa2vprtopxeRMIauSJMxvqvJ0twuiM
 hkFj/Wec/zqxzzSZ5Pzf9rqMRdp3sXVX9w==
X-Google-Smtp-Source: ABdhPJyL2IdKPd2kX9yCMt4rULbyQOwmDnMb8jYzqLBZMljwhiN8Mj+nwv2Gi5ZYkvPYWDzAsZG1xA==
X-Received: by 2002:a17:902:6546:b029:101:abf0:d882 with SMTP id
 d6-20020a1709026546b0290101abf0d882mr11708422pln.73.1622440280120; 
 Sun, 30 May 2021 22:51:20 -0700 (PDT)
Received: from spacetanuki.lan ([202.12.244.32])
 by smtp.gmail.com with ESMTPSA id b10sm4744058pfi.122.2021.05.30.22.51.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 May 2021 22:51:19 -0700 (PDT)
From: YAMAMOTO Takashi <yamamoto@midokura.com>
To: qemu-devel@nongnu.org
Cc: YAMAMOTO Takashi <yamamoto@midokura.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 10/11] linux-user: a crude hack for libcontainer
 (CLONE_PARENT) [!MERGE]
Date: Mon, 31 May 2021 14:50:17 +0900
Message-Id: <20210531055019.10149-11-yamamoto@midokura.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
In-Reply-To: <20210531055019.10149-1-yamamoto@midokura.com>
References: <20210531055019.10149-1-yamamoto@midokura.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=yamamoto@midokura.com; helo=mail-pl1-x62f.google.com
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

runc uses clone() with a combination of flags which we don't
support. This commit works it around by ignoring CLONE_PARENT.

[!MERGE] because this is just a crude hack for the very specific
application.

Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
---
 linux-user/syscall.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 56a3c37d83..7645ed36e4 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6553,6 +6553,8 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
         pthread_mutex_destroy(&info.mutex);
         pthread_mutex_unlock(&clone_lock);
     } else {
+        flags &= ~CLONE_PARENT; /* XXX crude hack for libcontainer. */
+
         /* if no CLONE_VM, we consider it is a fork */
         if (flags & CLONE_INVALID_FORK_FLAGS) {
             return -TARGET_EINVAL;
-- 
2.21.1 (Apple Git-122.3)


