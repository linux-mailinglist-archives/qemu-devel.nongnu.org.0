Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 566D75EC34F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:53:49 +0200 (CEST)
Received: from localhost ([::1]:54218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odA5s-0006th-Cr
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8SN-00042X-AF
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:59 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:38650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8SK-0005Kb-Kz
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:54 -0400
Received: by mail-pf1-x42e.google.com with SMTP id a29so9377112pfk.5
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FMvqR5WvHSrhd6FoBOh5bPNiyVgL3g0xwaaD6f1HGpU=;
 b=eYVp0IzcpRkRm4hHQ6hxqgYHCR+3r8adOWkVxrTjTVRAGdZsxHE5r6KaFWAQ/iX+G7
 7jXh8uk+TQjVHDBgWjfUxKjiCPQqIaw05YW7fUof+0P2PcOispOdE5aNoROUab5rFYW8
 0CmcsBuvVqD0EvZ9E1Dq4ayj8q31q0bu1AulgH3z/W//7cUYNnlpKvJWtVBM6PbDDuKl
 kWhVucWfTpe7aqmf0wmfgFR5MAQwxCL8srhMLCqZ9CC2KACa0UBef1E3Vl9BVAK+37YM
 42zInMx04dwQX6Luy19GtqavJE5CcVcIv7oBsZfpLDsZWRzYh/P80ZJfTLR+NR/anQ7+
 Sg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FMvqR5WvHSrhd6FoBOh5bPNiyVgL3g0xwaaD6f1HGpU=;
 b=0kJWLmxV9/K5lfPXyOoPFKWmTCHTfcDlII26fn2mc6oiwbmllIBcQZuufqkN2gH/bV
 8P2nBX6dcJ752jEtMfpA3pPmd63IYxTS6PAcyZNgh17LzJaG7iQ5gsOXmfObbbmHsojb
 2UiRMEmh+KtiH+sx2ZNXjbupllDvxro8H0AxTfc7u7clmBq+950c0NwFDU2r1woGiE5p
 WCYmlVo8hEr1FQthP0UH+A1HXnqZJ5CKMA4X6tcoZvCWJaCm6h3OmXEU5znxPbQwE/AP
 20fNEVTAP3eqtPtgHrZu8BER+KSuHc5+TujRse8eWViEam5QOPfNKv6B4ay1eAWC/akb
 nhPA==
X-Gm-Message-State: ACrzQf0HI5hpYA5s/wA/ZRWr43EHD/GZe+DQhRDmwv8USU4zeHou1paN
 dhlLwsid7SLuqDyekOivDhpLWxTD9S0=
X-Google-Smtp-Source: AMsMyM48oMCL0JvL10DtcKQemOiaxFIdEAO2Nn0XqumtUGLR/bomvEKx5AnK2QUA+2+lFXpZ/iYc3Q==
X-Received: by 2002:a05:6a00:1989:b0:546:410f:bdd2 with SMTP id
 d9-20020a056a00198900b00546410fbdd2mr28293064pfl.83.1664276929264; 
 Tue, 27 Sep 2022 04:08:49 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:48 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v4 48/54] io/channel-watch: Drop the unnecessary cast
Date: Tue, 27 Sep 2022 19:06:26 +0800
Message-Id: <20220927110632.1973965-49-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

There is no need to do a type cast on ssource->socket as it is
already declared as a SOCKET.

Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v2)

Changes in v2:
- new patch: "io/channel-watch: Drop the unnecessary cast"

 io/channel-watch.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/io/channel-watch.c b/io/channel-watch.c
index 89f3c8a88a..43d38494f7 100644
--- a/io/channel-watch.c
+++ b/io/channel-watch.c
@@ -130,13 +130,13 @@ qio_channel_socket_source_check(GSource *source)
     FD_ZERO(&wfds);
     FD_ZERO(&xfds);
     if (ssource->condition & G_IO_IN) {
-        FD_SET((SOCKET)ssource->socket, &rfds);
+        FD_SET(ssource->socket, &rfds);
     }
     if (ssource->condition & G_IO_OUT) {
-        FD_SET((SOCKET)ssource->socket, &wfds);
+        FD_SET(ssource->socket, &wfds);
     }
     if (ssource->condition & G_IO_PRI) {
-        FD_SET((SOCKET)ssource->socket, &xfds);
+        FD_SET(ssource->socket, &xfds);
     }
     ssource->revents = 0;
     if (select(0, &rfds, &wfds, &xfds, &tv0) == 0) {
-- 
2.34.1


