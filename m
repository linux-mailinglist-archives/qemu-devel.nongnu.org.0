Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE5D3265DA
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 17:50:00 +0100 (CET)
Received: from localhost ([::1]:39918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFgJT-0000h4-7c
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 11:49:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lFg3Y-0004t6-IG; Fri, 26 Feb 2021 11:33:33 -0500
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:44039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lFg3T-0007kI-SD; Fri, 26 Feb 2021 11:33:32 -0500
Received: by mail-qv1-xf2a.google.com with SMTP id cw15so3982415qvb.11;
 Fri, 26 Feb 2021 08:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BCak+5bL0bc2PXTFFFEg+FnORCbpmgqZxUJWBfO7Wmc=;
 b=SD5SkEc11gFzAHOZI2kcFx6m6CPOBNzzlM1s7UiJi6RTL9WfnxaWBpaiTSaZkyDIhR
 0zPm40yVukNvZUQf6SQmX75mMAcBXXTtgmjMcV37ownmtGSFN90zpw7W3saPlerdwKy3
 xfKah526YanYuLPgDN8kGV+zyvUJwoQ0eAMfMmqfrer+tRvCTjsZnWzBf4Y9QxiuRbGq
 AZQR3K6IaUBL30gYXclH1JbXdo70O6MD6iK34xOKV3VN2s4AKm+sW7msVAYBQK0vSkMT
 yzeNOPqod3xbhzGPWqOOpVqw1sZ5mnARRUnZkw5W/dkdKlVs7tGV99JTIz/cnvgAQMpb
 mjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BCak+5bL0bc2PXTFFFEg+FnORCbpmgqZxUJWBfO7Wmc=;
 b=lYixqZiXgduPgcLlA0wpSPUIa0VofBMmpv2yuhiDYMwJM2XB5gBl5s5dPUMrwu1CzY
 eTvubg8Tf2BtH2WVf8vtaIgROEDNNx1Dy9koSMQVInN1mzNw1E6TjrExYtfrUZgs2w/Y
 NW1NxBKU/AXRScCi7ct9oSnGOhNnT6H1OZ++kx4Rjs34Hbw62J9lZnGtBDfWXACHkwTh
 MfdwbAIukyYq2LZmWhOjhBMA5IgzM35ej/nt0hvHeTBzXLCKimqz8kkoB74bANCRkGNd
 tw7gRm2d8V52oLVl7x5IRY+bI/ju7lKTNQgzXln5NN20dwC55ZYcxk1jZOY5o+30Dd6D
 0QHQ==
X-Gm-Message-State: AOAM531IfhG4JQLSUnANnf0mBAZdIh38DNqEUR+I/Kob+0v2wRN4twXj
 +T4Uq321ky1gktsLOf+UpjToYKFjGbgcUA==
X-Google-Smtp-Source: ABdhPJw7pbsS21/Rz4gRESB5wAbTsYnJGGixw9vbf3aG4GR11JBlK6lx0kxcF+x1aEJD+/B/hVNdBw==
X-Received: by 2002:a05:6214:4b2:: with SMTP id
 w18mr3365129qvz.5.1614357204974; 
 Fri, 26 Feb 2021 08:33:24 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:cd1c:d722:e26f:4e76:c5c1])
 by smtp.gmail.com with ESMTPSA id t33sm731116qtd.13.2021.02.26.08.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:33:24 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] spapr_pci.c: add 'unplug already in progress' message for
 PCI unplug
Date: Fri, 26 Feb 2021 13:33:00 -0300
Message-Id: <20210226163301.419727-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226163301.419727-1-danielhb413@gmail.com>
References: <20210226163301.419727-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hotunplug for all other devices are warning the user when the hotunplug
is already in progress. Do the same for PCI devices in
spapr_pci_unplug_request().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index b00e9609ae..feba18cb12 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1743,6 +1743,10 @@ static void spapr_pci_unplug_request(HotplugHandler *plug_handler,
                 }
             }
         }
+    } else {
+        error_setg(errp,
+                   "PCI device unplug already in progress for device %s",
+                   drc->dev->id);
     }
 }
 
-- 
2.29.2


