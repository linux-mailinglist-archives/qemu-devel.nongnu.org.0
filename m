Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E11633E65
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:05:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTtw-0000Hn-2l; Tue, 22 Nov 2022 09:05:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTtn-00005j-R0
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:05:20 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTth-0006HT-UW
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:05:19 -0500
Received: by mail-pf1-x42e.google.com with SMTP id z26so14465099pff.1
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 06:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+HVZJvWqouMoHUJe7c2mgJ9TYpcYVpH6eT/p7iSAleE=;
 b=0OOrQ2o1JYGVIn5RoRsJN2YHqKLMWAiBy0NQlvLkxnL2sR6ffGxx/ZcQbZ3aXnFVpa
 10BSVSnZ2krkCoQPP3c6LzeQkyZf/mFFrslOYxtTajoS3g1tdhqc37PvccjkdMqVlcxQ
 3MA1/iLbFcxqcw+8yUaprkbAkHCizI9VQmKTZuptB/BYgKTYwjgTJNbsuWXythAdk0lU
 WmwoO46iiGKZXC6OgOkQM5+WbtIugCmPjqlsTPUOMzoXAr5ENk6+zEZHeGZM19u1N1ak
 3sHnRZsfTj93m6nGRonP4hCvYjNNf5LXFTZgQSEDWLpwi8/i6ZByDgnzg927Tvh4S67t
 HJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+HVZJvWqouMoHUJe7c2mgJ9TYpcYVpH6eT/p7iSAleE=;
 b=tqxJ9SNErpnfGhQB5Z5q4fq97/FWQ3bkRVGOG7R+RkFRCRTbk3Svv1lTNZlHLRxwCf
 H0xGmANi6EWeJw5I1ILP5gd0NFLRSssxzeaH0MGktgFuHRGIL1Cis1g1jF1xRc3SeQz1
 5CD1k1uF5i8fEU8tqAKHwkbQtP1sMSkxggKVC/B9KJ7Gms9aetLlP1dknjoYdzEbsZXY
 XsjFxzYc6R9nBFCetuAQ8zTPcY14AWxK0oom/RXIt5Emdc5cNbDuiz2C4CEBTL6wnShN
 CUtlMlo1Drtit9eRarSBnlNCcv6xPJDu7kv/OjrAiDJEHrTpBm+8jnPXz0ZfLefKTDzn
 OJyw==
X-Gm-Message-State: ANoB5pnp05pWuN+BRls39dyih0QmeeJk5rasVR2usB3/60fdIqotYUsX
 8CJqelmgBkPSRA1GbpWF1qxP61kAkbXuYANI
X-Google-Smtp-Source: AA0mqf7fNLfQdDeakB7RaDPiz5MJf7CjoPWeUR+/hPwiMhnAkwr/Pmb2hZ5p2yNZak5USKOpwKfqdg==
X-Received: by 2002:a63:5409:0:b0:476:e3bb:2340 with SMTP id
 i9-20020a635409000000b00476e3bb2340mr3528168pgb.530.1669125912788; 
 Tue, 22 Nov 2022 06:05:12 -0800 (PST)
Received: from always-T480.www.tendawifi.com ([139.177.225.252])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a170902e74100b00186b280a441sm12097410plf.239.2022.11.22.06.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 06:05:12 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com,
 pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [for-8.0 v2 11/11] MAINTAINERS: add myself as the maintainer for
 cryptodev
Date: Tue, 22 Nov 2022 22:07:56 +0800
Message-Id: <20221122140756.686982-12-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221122140756.686982-1-pizhenwei@bytedance.com>
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3f698cb0e9..d1814f87ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2827,6 +2827,7 @@ T: git https://gitlab.com/ehabkost/qemu.git machine-next
 
 Cryptodev Backends
 M: Gonglei <arei.gonglei@huawei.com>
+M: zhenwei pi <pizhenwei@bytedance.com>
 S: Maintained
 F: include/sysemu/cryptodev*.h
 F: backends/cryptodev*.c
-- 
2.20.1


