Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E00492634
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:56:41 +0100 (CET)
Received: from localhost ([::1]:58498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9o2S-00013T-Er
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:56:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nES-0006Cd-K3; Tue, 18 Jan 2022 07:05:03 -0500
Received: from [2a00:1450:4864:20::331] (port=53878
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEN-0005uN-CE; Tue, 18 Jan 2022 07:04:57 -0500
Received: by mail-wm1-x331.google.com with SMTP id n8so424925wmk.3;
 Tue, 18 Jan 2022 04:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=irXA5UGU6jp/uyMnLyEWDdOrhtz9iUme+ohFp2+tm1Y=;
 b=S6okk6sEbIcGREeOVGfH8LpbHzlkG5kRix0qSC4aG+ltLqKQKFFKeDD60HXsqFBd7C
 JXYeLbe9YLFEdc2iXFkApW/TB55XSW29macrR57La9t8XdphbtqDAAtBvjg5uuq39aNW
 JlKl6eUhKFSGNtiIF4VsqJgbLPNLkKyCLYHspFm9cpV4KG/p8uNMpB8XgkZcHsjbNUhH
 Kg6sDOlOD5hVYTVVEguOMolFPZUY1zqk543AeeBn5J1SOiQRx9ZOPp/UTSXTdbrz4TdJ
 DMcqMSn1mWvEBdr/SwpFzamfekURCKNEBP7UWgrW1pODGe5ZD5pgDUAPcAxc/mpTE8mh
 nJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=irXA5UGU6jp/uyMnLyEWDdOrhtz9iUme+ohFp2+tm1Y=;
 b=L0e7sqXzctO8LylmO4lsj2Jrcn68yOnOvA+a/sXjBLZGxnb8T2SDMiiBwWmGqJmwJG
 ZktBvti3qVordh+50HbqUkRoeKKNkaZyD7QtU8Sn0U8MEWW4ZJC2pXteUM55YMkLQTH8
 dKSpDJL1HudVKjONYUJb16xE5eA3sgi+IEEw0Ej4ZTd71MHyE2ZYrPcTpRxW3MQXYPkN
 Ao6zONtTSbrexrQWnfC27jWxC4deeuWa3xWTWQu+syZKvQniIrZJ+h8i4Hmhly4Ad4Ak
 2Q5ok8J5wMP44I1JRr6js7GNo2+StRrPpUK0D5GtnPDpoIeM2YXNYhDyFOZ2sVVh8DMK
 uZAQ==
X-Gm-Message-State: AOAM5304W+cvNva/MGE4HJUAf9FXEMs5MxAOyt6MYbM/B8tx0Wbxu41e
 xGWtDyYkJU6tX9yPwYB1U5L8frdC2O8=
X-Google-Smtp-Source: ABdhPJziyvXZ0wZ9gMs8ctRzfPJyzOGkZfTEPckmVrYiiulj0cTIo+ZLoruxdZ3mgTuTmI4teQ+A6A==
X-Received: by 2002:a05:6000:144c:: with SMTP id
 v12mr24125044wrx.218.1642507442869; 
 Tue, 18 Jan 2022 04:04:02 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 x24sm1728901wmi.17.2022.01.18.04.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:04:02 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 19/19] docs/devel: add some clarifying text for aliases
Date: Tue, 18 Jan 2022 13:02:29 +0100
Message-Id: <20220118120229.196337-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
References: <20220118120229.196337-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

We do mention the limitation of single parenthood for
memory_region_add_subregion but lets also make it clear how aliases
help solve that conundrum.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220110175104.2908956-7-alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/devel/memory.rst | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
index 5dc8a126829..69c5e3f914a 100644
--- a/docs/devel/memory.rst
+++ b/docs/devel/memory.rst
@@ -67,11 +67,15 @@ MemoryRegion):
 
   You initialize a pure container with memory_region_init().
 
-- alias: a subsection of another region.  Aliases allow a region to be
-  split apart into discontiguous regions.  Examples of uses are memory banks
-  used when the guest address space is smaller than the amount of RAM
-  addressed, or a memory controller that splits main memory to expose a "PCI
-  hole".  Aliases may point to any type of region, including other aliases,
+- alias: a subsection of another region. Aliases allow a region to be
+  split apart into discontiguous regions. Examples of uses are memory
+  banks used when the guest address space is smaller than the amount
+  of RAM addressed, or a memory controller that splits main memory to
+  expose a "PCI hole". You can also create aliases to avoid trying to
+  add the original region to multiple parents via
+  `memory_region_add_subregion`.
+
+  Aliases may point to any type of region, including other aliases,
   but an alias may not point back to itself, directly or indirectly.
   You initialize these with memory_region_init_alias().
 
-- 
2.34.1


