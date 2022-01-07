Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8FF487614
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:01:01 +0100 (CET)
Received: from localhost ([::1]:53254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5mzU-0002v2-VG
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:01:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5mtJ-0003WR-9F; Fri, 07 Jan 2022 05:54:37 -0500
Received: from [2a00:1450:4864:20::32a] (port=56185
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5mtF-0008M7-I5; Fri, 07 Jan 2022 05:54:36 -0500
Received: by mail-wm1-x32a.google.com with SMTP id c66so3617600wma.5;
 Fri, 07 Jan 2022 02:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ow3SZqynToXpYuYefz018ZnoAMd3khg8ReRtVnTvO0=;
 b=YV6B7z3YnN+CO8N6OI8j4BFDuIr4brqE9b5Q62CdiDuPYcjqZEpmOEjqs7gr4vJRt4
 0GbeF1Ypjuh3SRb78APDSGtNKvAukxH0mCSKAD7uCX+SwbDAYhcwGwPU/8Gor1R5XGwu
 WUn9SD2zyj32qi9RITMpCQL27XReHNSE3DGeHOEPtuwCDPR6DQzhYyP6PTGXyJ3Qt/7+
 sHlCHIbTrHuHHKtlAsWeETT/Eepudnk3u2bDmMMWvXdD06x7qxygEp5poG02CEZrOmh/
 Llvof+5afhk17j0X1A2b36wzSzNYztbwMTxxETU7ntInte7TIAS+QzY4Ua5rX2vbV3n2
 a3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/ow3SZqynToXpYuYefz018ZnoAMd3khg8ReRtVnTvO0=;
 b=vPGq158Hp1xyPsspveDSYLpz2OK1pPlH7epgy1KohQxMcxxB49N24cN5yiPvfvAtmj
 Nm1lJLS9j8fUnMtGRK0jhoX3XnY+bUNpvfmeoy2twQ6Gj7frc/pwTK1+/y5mN9JrTgLd
 4XSgEJneMhZmmuCUUdYVVDzh8TNEP7gnpkW8xwXYC3KPQWTfALCJne+4A9TZxHKozuY4
 l7ifZAcD3ZSZr4+pFl5+BsGezFDqFjtGBjW1pPVV4YTKn9qR67K4YSR/vaT4tj4ks2v7
 2sVoDfM8BOVFXJQ23ZGLPHw7s+AmLHXzKlY2D0V3oxCFnRM69PZMmOuHPGGgqlSxchLd
 INxQ==
X-Gm-Message-State: AOAM531cZp1tpFepv8HnT1gvhWOzHUjwGZS723opG6vCx0vQ+nj+exQW
 im2/1XgKokf9M6RRHrgawavqkabHUVTzwA==
X-Google-Smtp-Source: ABdhPJzFSoJE908mysCrf4VxJuy1jBtMBu13vgSvlrt8sEqy1ApX/Le/tB2bZqT+ZNJUBaMdj8USWg==
X-Received: by 2002:a7b:cf33:: with SMTP id m19mr4836106wmg.30.1641552871663; 
 Fri, 07 Jan 2022 02:54:31 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id a3sm4302398wrm.52.2022.01.07.02.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 02:54:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] qemu-storage-daemon: Add vhost-user-blk help
Date: Fri,  7 Jan 2022 11:54:19 +0100
Message-Id: <20220107105420.395011-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107105420.395011-1-f4bug@amsat.org>
References: <20220107105420.395011-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qing Wang <qinwang@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Add missing vhost-user-blk help:

  $ qemu-storage-daemon -h
  ...
    --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,
             addr.type=unix,addr.path=<socket-path>[,writable=on|off]
             [,logical-block-size=<block-size>][,num-queues=<num-queues>]
                           export the specified block node as a
                           vhosts-user-blk device over UNIX domain socket
    --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,
             fd,addr.str=<fd>[,writable=on|off]
             [,logical-block-size=<block-size>][,num-queues=<num-queues>]
                           export the specified block node as a
                           vhosts-user-blk device over file descriptor
  ...

Fixes: 90fc91d50b7 ("convert vhost-user-blk server to block export API")
Reported-by: Qing Wang <qinwang@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Fix 'vhost-user-blk' spelling (eblake)
---
 storage-daemon/qemu-storage-daemon.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 52cf17e8ace..9d76d1114d4 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -104,6 +104,19 @@ static void help(void)
 "                         export the specified block node over FUSE\n"
 "\n"
 #endif /* CONFIG_FUSE */
+#ifdef CONFIG_VHOST_USER_BLK_SERVER
+"  --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,\n"
+"           addr.type=unix,addr.path=<socket-path>[,writable=on|off]\n"
+"           [,logical-block-size=<block-size>][,num-queues=<num-queues>]\n"
+"                         export the specified block node as a\n"
+"                         vhost-user-blk device over UNIX domain socket\n"
+"  --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,\n"
+"           fd,addr.str=<fd>[,writable=on|off]\n"
+"           [,logical-block-size=<block-size>][,num-queues=<num-queues>]\n"
+"                         export the specified block node as a\n"
+"                         vhost-user-blk device over file descriptor\n"
+"\n"
+#endif /* CONFIG_VHOST_USER_BLK_SERVER */
 "  --monitor [chardev=]name[,mode=control][,pretty[=on|off]]\n"
 "                         configure a QMP monitor\n"
 "\n"
-- 
2.33.1


