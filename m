Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD4948AD64
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 13:14:56 +0100 (CET)
Received: from localhost ([::1]:55056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7G3D-0007k2-Fx
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 07:14:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniellalee111@gmail.com>)
 id 1n7Fzg-00055A-SB; Tue, 11 Jan 2022 07:11:16 -0500
Received: from [2607:f8b0:4864:20::1036] (port=44987
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daniellalee111@gmail.com>)
 id 1n7FzZ-0004NI-6V; Tue, 11 Jan 2022 07:11:11 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so5472205pji.3; 
 Tue, 11 Jan 2022 04:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jGbdQDYvE4v48Trz/6YmPH5c3vAOaZc9KqkCE+2SVRE=;
 b=oD+Z3B3RSuUyP/U8Z5rhFQmMrZ6Ti+pmvc2uN6W+4mhjCoVO7Fx3PqXXJj41QhDWdd
 1X3l0aGyAeE31sRA4gWdC0B0stlVLZWC+qQGcp+sxZ6XvbwpZEEwWtwApr4sSZ3IkasS
 Y6+s6NWUeZFqofzo9o2GKhcIh0tSvOmmAZs2BmeE2XU+RZ2Vg3yV8PZnWXOH3K3LYnr4
 bQbVJ0M7e+mel/uqXWeFQPZZSzKgbGYa+VPp2mPgZ+x5EMa5kZrTRsF4+XE6E6BCK7n4
 5VZH/x6YzDM43//WXxVwxxVvW7hJx5r0l56Wo7vkq9/g5/3q4HGYXPr3aVm+ybptjVFb
 dpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jGbdQDYvE4v48Trz/6YmPH5c3vAOaZc9KqkCE+2SVRE=;
 b=L+EquEPeOeeEKZkW0/tBvSEBQe1xbCUfLPQ0LWmw7rhC9EWw6RZqW3wziYXLTdZOWE
 718F0qgtaDTo+E/5h08GoXD/aZG+yqI2+wJEd9GHREYw3CpCKJq02hfy/iOYuLS3zsCc
 RlINU+2JCIJ1coIPGnjAYI4mju1MtezFjeeOFKhMlJSEyDLeEXH/AYY11O2JVDvZiZue
 l3u8tZy8rx2XwV4xlsDTu+F2VOQB91yWQoSxsewR/LtOtAcmTcArKACfob+tMF9nIsq7
 AJc0cB1QIDtpvukPRKrbToU8y3JPKAiBDYOpsFEKtIAFzubsT2DrOkzLnxsfq6yuobyI
 ayRg==
X-Gm-Message-State: AOAM531gos1OluF6ZsTMEwsKAfPevl08IOBlaMYg4spke2bLR44uvQ0e
 OzFSUEpG+n50Spc5MdGXTNA=
X-Google-Smtp-Source: ABdhPJy8176sV+AR6mJskaJYvLg5sdQfrxD3KP/pBlIMSieQsAK7fpCQ46uWXS+y3rFMgfX7X+Q6zg==
X-Received: by 2002:a17:90b:3ecc:: with SMTP id
 rm12mr2748895pjb.225.1641903065943; 
 Tue, 11 Jan 2022 04:11:05 -0800 (PST)
Received: from localhost.localdomain ([106.52.23.176])
 by smtp.googlemail.com with ESMTPSA id oo14sm2553230pjb.34.2022.01.11.04.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 04:11:05 -0800 (PST)
From: Daniella Lee <daniellalee111@gmail.com>
To: stefanha@redhat.com, fam@euphon.net, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] Fix null pointer dereference in util/fdmon-epoll.c
Date: Tue, 11 Jan 2022 20:10:59 +0800
Message-Id: <20220111121059.3345034-1-daniellalee111@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=daniellalee111@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: daniellalee111@gmail.com, pai.po.sec@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Orginal qemu commit hash: de3f5223fa4cf8bfc5e3fe1fd495ddf468edcdf7
In util/fdmon-epoll.c, function fdmon_epoll_update, variable "old_node" 
maybe NULL with the condition, while it is directly used in the statement and 
may lead to null pointer dereferencen problem.
Variable "r" in the condition is the return value of epoll_ctl function,
and will return -1 when failed.
Therefore, the patch added a check and initialized the variable "r".


Signed-off-by: Daniella Lee <daniellalee111@gmail.com>
---
 util/fdmon-epoll.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/util/fdmon-epoll.c b/util/fdmon-epoll.c
index e11a8a022e..3c8b0de694 100644
--- a/util/fdmon-epoll.c
+++ b/util/fdmon-epoll.c
@@ -38,10 +38,12 @@ static void fdmon_epoll_update(AioContext *ctx,
         .data.ptr = new_node,
         .events = new_node ? epoll_events_from_pfd(new_node->pfd.events) : 0,
     };
-    int r;
+    int r = -1;
 
     if (!new_node) {
-        r = epoll_ctl(ctx->epollfd, EPOLL_CTL_DEL, old_node->pfd.fd, &event);
+        if (old_node) {
+            r = epoll_ctl(ctx->epollfd, EPOLL_CTL_DEL, old_node->pfd.fd, &event);
+        }
     } else if (!old_node) {
         r = epoll_ctl(ctx->epollfd, EPOLL_CTL_ADD, new_node->pfd.fd, &event);
     } else {
-- 
2.17.1


