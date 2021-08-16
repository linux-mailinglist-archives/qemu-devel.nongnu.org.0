Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716493EDCD5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 20:08:35 +0200 (CEST)
Received: from localhost ([::1]:33138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFh2I-0000p4-Hn
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 14:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFgyg-0005Gl-Op
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 14:04:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFgye-0005eG-9q
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 14:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629137087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yVr0VQQosAtHxyUcL35E8kd9mLrtiVCl383ah7sIDQ0=;
 b=Y1xwfSj56qM6gfSDbO/LP1yajghVsnOKDEhLYgFG6ghRn3sAgIGLkBtfT43dNcvPWmqNia
 OwblSS1xgljyDBBGnjqZyvQIcfaFpqCsVarVjYcveajjBa4T6TiHdzvrdHwrkluMaEfRqN
 a8XB3A7PSIAbZv6gY2dgMLqdZ1PLUcQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-KAbKVumYMdq2HWU6UqQBtA-1; Mon, 16 Aug 2021 14:04:46 -0400
X-MC-Unique: KAbKVumYMdq2HWU6UqQBtA-1
Received: by mail-wr1-f71.google.com with SMTP id
 m5-20020a5d6a050000b0290154e83dce73so5688726wru.19
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 11:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yVr0VQQosAtHxyUcL35E8kd9mLrtiVCl383ah7sIDQ0=;
 b=dIgIlor1zOfx8nlV6AqWCC7jfsn++Um19XuXi83dWjvzD+e0701XHNJq5kJhAfGbmC
 dUtcZ7e9RiCNl3z4pya8I9ITfEQ/pDGFpe2BEkposojYRMVa1oTnd6hMaLJiJ0CGpVML
 kX7Fe7UDvUJ53sCxUWXg9NQc9UntVP6LCleV5Q6hMkKuMcGNR2v7Kd7KH0vAIQSFSPS3
 R93tg60V+M2OSYzEhduaLIcfBzbPbnVqdKiSDIw6pfMapixsCj/0oNh4/pkPG9Bv2FcL
 Vp44CUWkw0UmTQrmBYHtVhYrbX1mXW6t/Wxa+uxyyp3AaaIZjrS6Thcc6oQ/7UMrQy/j
 pdlg==
X-Gm-Message-State: AOAM530q72CPiNtva9T6gZBw4jak0tVTwV00KL52WxIyvU3zEAp++Oih
 /sTb1azx4UFl7S2L267RA3OVHPJYsjOE6QfrVdq+viJ3j/tDtnJiTxxxR54DHsOO3NBGoCHZ5yf
 UQF6f8CQZ4u+MTtdHMXrAqa7j16ga66LUR14Uul51XxvQnw8UV6piVm8RJys3Ux3g
X-Received: by 2002:adf:f747:: with SMTP id z7mr14126078wrp.194.1629137084718; 
 Mon, 16 Aug 2021 11:04:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSd8JkYzxFzJfSPwA6IZyD+UO8zixS87khBZLCCSveQxwWLtdCOJfKj2KWjV5XTwRGy//BSg==
X-Received: by 2002:adf:f747:: with SMTP id z7mr14126049wrp.194.1629137084491; 
 Mon, 16 Aug 2021 11:04:44 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id e10sm12272149wrt.82.2021.08.16.11.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 11:04:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-storage-daemon: Only display FUSE help when FUSE is
 built-in
Date: Mon, 16 Aug 2021 20:04:42 +0200
Message-Id: <20210816180442.2000642-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qing Wang <qinwang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When configuring QEMU with --disable-fuse, the qemu-storage-daemon
still reports FUSE command line options in its help:

  $ qemu-storage-daemon -h
  Usage: qemu-storage-daemon [options]
  QEMU storage daemon

    --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>
             [,growable=on|off][,writable=on|off]
                           export the specified block node over FUSE

Remove this help message when FUSE is disabled, to avoid:

  $ qemu-storage-daemon --export fuse
  qemu-storage-daemon: --export fuse: Invalid parameter 'fuse'

Reported-by: Qing Wang <qinwang@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index fc8b1506297..10a1a33761d 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -98,10 +98,12 @@ static void help(void)
 "                         export the specified block node over NBD\n"
 "                         (requires --nbd-server)\n"
 "\n"
+#ifdef CONFIG_FUSE
 "  --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>\n"
 "           [,growable=on|off][,writable=on|off]\n"
 "                         export the specified block node over FUSE\n"
 "\n"
+#endif /* CONFIG_FUSE */
 "  --monitor [chardev=]name[,mode=control][,pretty[=on|off]]\n"
 "                         configure a QMP monitor\n"
 "\n"
-- 
2.31.1


