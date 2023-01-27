Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6807B67EB8C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 17:49:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLRtI-0002Qx-Eg; Fri, 27 Jan 2023 11:47:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pLRt4-0002Jh-R3; Fri, 27 Jan 2023 11:47:38 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pLRt3-0005eC-61; Fri, 27 Jan 2023 11:47:38 -0500
Received: by mail-ed1-x531.google.com with SMTP id x10so5235838edd.10;
 Fri, 27 Jan 2023 08:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XRQJvU+ym4k6vuRjsbWIQuA8Cz7gpqd3a0L4wd5ZgL4=;
 b=S8vA4zsHhXUOtISPi/x8xOTgn53BpJHQ1cN/C93OqJ8zdkA/67ZVdlHag4GMTuY6vO
 iBYZgx2r36NodJhbqyWCU66uAN9qaLFB3bpBlJeUiV97Qd0FlVSNsxnoU/vJcYxFHQI3
 4SJew7r4cznYwozHod/kKGend1oL5VQjNn9VWnV0yJiM2ZJEz69nfznZjrKK+XxJ/ge8
 cxApXQg7lG1FHvuBG3iwUGk6wcBp79pTzQE/m4AsT5whQLS+xdBW8gfXpfZ1hVTtppmg
 W5CQPAWBQeFsOa2p1NivwddKZ0G4VWpvhMFi4IZTkmliJenjTYHSoxNTF3sbOJBBCG3U
 1Qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XRQJvU+ym4k6vuRjsbWIQuA8Cz7gpqd3a0L4wd5ZgL4=;
 b=2ygvOTmyBwyhyvsXBBlo8ZYMefDpPN9zvOq0ABfMz5xc5JqzYO6TQ+RnY4i6okeVoZ
 lDAzEV59iB2y7RUsKp23wzLkmGFW3jevk+qwNDbJEbZPa44pTwIpx0J2nzu+CTQd5fLA
 4N+c3k2ynxy3ymXKFFfKn4+E6iaRzde1QyWBHo7yudFarhH2I10wGI4ba3Rrm84noUrz
 yPZYwkMpBzRHBmvQxewqk8cwBjE/0RQ16VLW6g/KZIvx2I2PHAxx/VaOoPVknOhioS/p
 JL7KJ1k9qs+0DJOey4zpTxdS903k3U9fd4DNijjGYqTyKpBfZaiUB32ueEd0YXDEYjk1
 ogWw==
X-Gm-Message-State: AFqh2krQAuiDyA2mmD9EP+79/M4VH8E4M+lPaiwwkZZJpeuB+xmgMQZq
 CHrlL8Tqvn97fi0vrHIZc7d0S2RamTXyXw==
X-Google-Smtp-Source: AMrXdXuci6C4+kFVxm9TSFNST0oJL285+AIeaRczPfrRy81RZF3Ti51H3Mj72aIPBjLF1wccRVIHQg==
X-Received: by 2002:a05:6402:28cb:b0:49e:db43:1722 with SMTP id
 ef11-20020a05640228cb00b0049edb431722mr26958367edb.18.1674838056009; 
 Fri, 27 Jan 2023 08:47:36 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a056402050f00b0049ef70a2894sm2574414edv.38.2023.01.27.08.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 08:47:35 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 5/7] hw/i386/pc_{q35,
 piix}: Reuse MachineClass::desc as SMB product name
Date: Fri, 27 Jan 2023 17:47:16 +0100
Message-Id: <20230127164718.98156-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127164718.98156-1-shentey@gmail.com>
References: <20230127164718.98156-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

No need to repeat the descriptions.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 2 +-
 hw/i386/pc_q35.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index df64dd8dcc..ee9d9a4175 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -197,7 +197,7 @@ static void pc_init1(MachineState *machine,
     if (pcmc->smbios_defaults) {
         MachineClass *mc = MACHINE_GET_CLASS(machine);
         /* These values are guest ABI, do not change */
-        smbios_set_defaults("QEMU", "Standard PC (i440FX + PIIX, 1996)",
+        smbios_set_defaults("QEMU", mc->desc,
                             mc->name, pcmc->smbios_legacy_mode,
                             pcmc->smbios_uuid_encoded,
                             pcms->smbios_entry_point_type);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index dc94ce1081..a97846ab9b 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -198,7 +198,7 @@ static void pc_q35_init(MachineState *machine)
 
     if (pcmc->smbios_defaults) {
         /* These values are guest ABI, do not change */
-        smbios_set_defaults("QEMU", "Standard PC (Q35 + ICH9, 2009)",
+        smbios_set_defaults("QEMU", mc->desc,
                             mc->name, pcmc->smbios_legacy_mode,
                             pcmc->smbios_uuid_encoded,
                             pcms->smbios_entry_point_type);
-- 
2.39.1


