Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C728F623BD4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 07:28:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot10b-00029E-IT; Thu, 10 Nov 2022 01:25:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot10U-000289-EM
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:25:46 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot10T-0008Qk-18
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:25:46 -0500
Received: by mail-pf1-x433.google.com with SMTP id z26so1041599pff.1
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 22:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=23qHkaFNj9aYRMMJ3RksdGA2UgOinYhFW/VeC2eRFU4=;
 b=enkwHh5XwmprXeoFG5ZTkA97g22aC3TeIvrWnPkyfWbxlxSwb333AV7Qm8AI5Hq4D8
 iaRONlga+X58wqtYsCAB+exbOljuGEsZezGPgojcPvpxeLYQVfFpZLvVB23O/Kkz853n
 KEDv8p8zzyM7suwYvmi93NKflEiJgNkNRhb53IVbpCQxHLAqZ2EQn1OqJRFnnjFUoQQo
 pIHb8gUlddrQFd06Abzn9rF1e6d6U2Dkh0vHcdrJG0Frau+W0UcA8qHajMPfyESQTLsf
 1JdPf91fBv4u+zwsGpnoj3J90uwGSJq77fYZACyD7ncevAVKmi57EoKCTtx34AkjMBBL
 Vqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=23qHkaFNj9aYRMMJ3RksdGA2UgOinYhFW/VeC2eRFU4=;
 b=i+1mdckaYgAFfw7aQ9KHFVdylVmuFhFXD1/Q/FrnfgVfwiTULcSNhWuRBXGg7CkkeN
 3Fpf+LdZfKnD5YTmWzA+Z5vg6YS+JGqU7lRQjAvMwBawZbO2/B5GcLLs/Rlqj3vSDTLC
 gYSGOwkRVdbxpcLY6RSVHeGhp3cQ8S0bCw+Uz42ukHDDAISJtdDhZkKYhiPW0V157MtF
 MwAGAgiRfgzsfQ0ZXXKXeXdh93dJ1N5XKo3Bc70PtztEbbBZDfvDiVKe3iki6UnYxATB
 BQ2MshGd8ICFfoSkg77ahgDvEbxKJv5QDQsIBMkUvsDfGee/X8H32woSDe6+pWLmTrnI
 Cxhw==
X-Gm-Message-State: ACrzQf0RrriTFADqye6ngi7LjxIu4vM/ujhKLr0D4SmuU4v37GvPPeZq
 /+b9F/oBc/rVpWe6KMQKQA/eHUjB5kPYz2Ar
X-Google-Smtp-Source: AMsMyM6Xzja4dgtYeVj3n4R9/1GtLGPYyFlXtwhGDffRGGHAtwdDtcoX3Aspwu2iEE4k6NUC8I7PoA==
X-Received: by 2002:a63:a05:0:b0:46b:3ba2:3365 with SMTP id
 5-20020a630a05000000b0046b3ba23365mr1874717pgk.425.1668061543892; 
 Wed, 09 Nov 2022 22:25:43 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a17090ade0400b002108cabbe31sm2289003pjv.9.2022.11.09.22.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 22:25:43 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, virtio-fs@redhat.com,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Yan Vugenfirer <yan@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 06/10] scsi: Use qemu_get_runtime_dir()
Date: Thu, 10 Nov 2022 15:23:25 +0900
Message-Id: <20221110062329.13363-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110062329.13363-1-akihiko.odaki@daynix.com>
References: <20221110062329.13363-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::433;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

qemu_get_runtime_dir() is used to construct the default paths.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 scsi/qemu-pr-helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 196b78c00d..adb7baecaa 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -77,10 +77,10 @@ static int gid = -1;
 
 static void compute_default_paths(void)
 {
-    g_autofree char *state = qemu_get_local_state_dir();
+    g_autofree char *run = qemu_get_runtime_dir();
 
-    socket_path = g_build_filename(state, "run", "qemu-pr-helper.sock", NULL);
-    pidfile = g_build_filename(state, "run", "qemu-pr-helper.pid", NULL);
+    socket_path = g_build_filename(run, "qemu-pr-helper.sock", NULL);
+    pidfile = g_build_filename(run, "qemu-pr-helper.pid", NULL);
 }
 
 static void usage(const char *name)
-- 
2.38.1


