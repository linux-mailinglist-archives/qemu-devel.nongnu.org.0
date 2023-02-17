Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3107B69ADCF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 15:20:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT1Zs-0004sk-8v; Fri, 17 Feb 2023 09:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT1ZU-0004a1-Vt
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 09:18:46 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT1ZS-0005Us-AL
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 09:18:44 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 m21-20020a05600c3b1500b003e1f5f2a29cso1085610wms.4
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 06:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AmdraG6wSunb7ZlzZqyn0FBRFU3it2FPZJFh0CF4PdM=;
 b=xwfHSGzJNDhMKANmdgxutSeNW6nER18v9Kq4VVOVjXfogo878eiPUKNmJb7y/BU6Bq
 k669jq4sWZo1QXeM5hzkg9tK2yxvZulQeN7RkFf4CRpE1cjXFOgUT3HxEKPt8L8Xcsqf
 P+EKN5C8BljcTZZI3aEsEV2jXQn66sCtOmmMkA++Ac9SiSoA1c/zEiRFuW5xM5ZQYNLH
 R6NIR63JpdoPfzO4leifcCP/AUz9zUd7rIZ4YBhXw/+2unZwGLYVum7z13162T9o/c2u
 uksKF5NRAoPDGncZ6+z2oLRHqep+nzy0D5mWyWT1/EfYDdzgwv7zXVS8SpDTVwWATI4o
 kXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AmdraG6wSunb7ZlzZqyn0FBRFU3it2FPZJFh0CF4PdM=;
 b=EORhlu0MOLikCWfiQ+j579D+dDmFXaBA6NFRas6GcJNcKrsB4fyzknykiFnOh8WKPN
 qrnu5saS8Yp6wztq/BAz/ee9yn9X+8eaae0ymXksL99B5vK6l0CBP7Pzf5bKUsSufTH2
 IQPOfkH7uLtodQ6dw7w+lM4L8dbK03LJN+3Nn/VcFvfWUgYEi7SCOhbQtrfLWQYNkMXM
 YPXTx+ahKd+fumhbaa2dTjrUUsQ9NwHf28KPxR25ho1me87wF0oStG5srEtDtMeUa7xp
 Ep3a6Wo1SGucLg29n33p6A2wDdbZd9FGDk6qjWwOn+53xm88I+CouZBxZYAEwMyVNJ6C
 myxg==
X-Gm-Message-State: AO0yUKW+NpSdaLNv8iCiYtwmCmxK7P1ZbSzUt7fw428DuhOP6Ze7snHo
 dziWYmYMSXd/XvXAGdj/hC9uBNoBRWP5O3mW
X-Google-Smtp-Source: AK7set9jgEuQnQrYdKxmGqgjWvYVvllpx9DnuZA0sbQ3ZDgkZz6rBn5NWphjHR0yYHGIlGphADYh+A==
X-Received: by 2002:a05:600c:181a:b0:3e1:f8b3:6333 with SMTP id
 n26-20020a05600c181a00b003e1f8b36333mr616746wmp.27.1676643519998; 
 Fri, 17 Feb 2023 06:18:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a7bce11000000b003e209b45f6bsm5682410wmc.29.2023.02.17.06.18.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Feb 2023 06:18:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] qemu/typedefs: Sort in case-insensitive alphabetical
 order (again)
Date: Fri, 17 Feb 2023 15:18:31 +0100
Message-Id: <20230217141832.24777-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230217141832.24777-1-philmd@linaro.org>
References: <20230217141832.24777-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Following the recommendation added in commit a98c370c46
("typedefs: (Re-)sort entries alphabetically"), and similarly
to commit 64baadc272 ("Sort include/qemu/typedefs.h"), sort
again the type definitions (in case-insensitive alphabetical
order, using 'sort --ignore-case').

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/typedefs.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index c7c8a85315..df4b55ac65 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -49,6 +49,7 @@ typedef struct DeviceState DeviceState;
 typedef struct DirtyBitmapSnapshot DirtyBitmapSnapshot;
 typedef struct DisplayChangeListener DisplayChangeListener;
 typedef struct DriveInfo DriveInfo;
+typedef struct DumpState DumpState;
 typedef struct Error Error;
 typedef struct EventNotifier EventNotifier;
 typedef struct FlatView FlatView;
@@ -56,6 +57,7 @@ typedef struct FWCfgEntry FWCfgEntry;
 typedef struct FWCfgIoState FWCfgIoState;
 typedef struct FWCfgMemState FWCfgMemState;
 typedef struct FWCfgState FWCfgState;
+typedef struct GraphicHwOps GraphicHwOps;
 typedef struct HostMemoryBackend HostMemoryBackend;
 typedef struct I2CBus I2CBus;
 typedef struct I2SCodec I2SCodec;
@@ -90,10 +92,10 @@ typedef struct PCIDevice PCIDevice;
 typedef struct PCIEAERErr PCIEAERErr;
 typedef struct PCIEAERLog PCIEAERLog;
 typedef struct PCIEAERMsg PCIEAERMsg;
-typedef struct PCIESriovPF PCIESriovPF;
-typedef struct PCIESriovVF PCIESriovVF;
 typedef struct PCIEPort PCIEPort;
 typedef struct PCIESlot PCIESlot;
+typedef struct PCIESriovPF PCIESriovPF;
+typedef struct PCIESriovVF PCIESriovVF;
 typedef struct PCIExpressDevice PCIExpressDevice;
 typedef struct PCIExpressHost PCIExpressHost;
 typedef struct PCIHostDeviceAddress PCIHostDeviceAddress;
@@ -106,6 +108,7 @@ typedef struct QBool QBool;
 typedef struct QDict QDict;
 typedef struct QEMUBH QEMUBH;
 typedef struct QemuConsole QemuConsole;
+typedef struct QEMUCursor QEMUCursor;
 typedef struct QEMUFile QEMUFile;
 typedef struct QemuLockable QemuLockable;
 typedef struct QemuMutex QemuMutex;
@@ -132,9 +135,6 @@ typedef struct VirtIODevice VirtIODevice;
 typedef struct Visitor Visitor;
 typedef struct VMChangeStateEntry VMChangeStateEntry;
 typedef struct VMStateDescription VMStateDescription;
-typedef struct DumpState DumpState;
-typedef struct GraphicHwOps GraphicHwOps;
-typedef struct QEMUCursor QEMUCursor;
 
 /*
  * Pointer types
-- 
2.38.1


