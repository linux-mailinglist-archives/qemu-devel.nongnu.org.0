Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642EC685E10
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:41:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3w1-0000jh-DG; Tue, 31 Jan 2023 22:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vu-0008Us-SE
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:37:16 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vt-0000d7-5d
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:37:14 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 nm12-20020a17090b19cc00b0022c2155cc0bso685530pjb.4
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 19:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohMf18caqqQPgi91C0B3lsVIHsHFjokkBE5D4OLJEvE=;
 b=tfB3smQzM9Vpw0rLtYqk84SycPqOJOnTaFuUvCzFuv8Uz1w3OCYs7oWElzWpvBGrfK
 gRQ7txZPx0NCS+DokpJt2UoNmUfdp22wbE4r1frpBHE0jKjheBCzLIc/Nmw6FsYWLpMs
 ug5j58lqin/4yCI5NqlpI509sEB3bNMX4f5Hi2rPeMcfWd11kD5zcVmCTawjU5oxnQrV
 T1xMjR0+LEvqXYTGMK5OqVAVD1lf1hNToxXCFiirBJ0B0vql5vwmw/PfnbxTn5dwuNVF
 79vCg5lD2jHfVPP+hNDWmrsgl8VY+aiYUFCrdfV7AlomVtaU7Mqx4+vlniO2e/9yKHYc
 dpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohMf18caqqQPgi91C0B3lsVIHsHFjokkBE5D4OLJEvE=;
 b=MYHMsMdQcgRDE6bu09QJMg94/K35g98zCGSCVhseLiU2ndOJ8B+UWrFlufn4bVkzae
 5oZWpBK9bYJl9O7vqdiaZyKqJWe8aOQzgtpyC6JY/mBMLKqC+BRPSUorFS9fFddzVTHC
 Z5IPVqzkyFGBc/RKwovX7dcbMwq5Dcolz8YI5HXrF/mz7Ow5erNEd9lWwaE1rDAYxXS4
 xHqpeEq/vN2iaAVTG/mJDgLqtYZ/OzlPK4JySW8Hh4ykEsDvjKnvJS43nyArUmhWczth
 07dZ+D7xHXROkdCaiVqF7Jlkc2mjfgwh9iqUox3MOjd6TGtCmjWBaXJMJ8MRN486O/GD
 8O9A==
X-Gm-Message-State: AO0yUKUeJ2PBAfUuPlsrMhYxmJrzzOFdt5+H8Cp1rF29H49ygdjoTysa
 vt8DeChWyKauFE3GTUmSi6HWcg==
X-Google-Smtp-Source: AK7set/aXNholJjc0GQpXBCrAX4vTejpmZKgiHSNH9csu9knPlcJ8QmTryFBH9LY1XQVVnDn3XMw2g==
X-Received: by 2002:a17:903:1c8:b0:198:adc4:2299 with SMTP id
 e8-20020a17090301c800b00198adc42299mr441633plh.20.1675222632538; 
 Tue, 31 Jan 2023 19:37:12 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b001968b529c98sm4185557plg.128.2023.01.31.19.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 19:37:12 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v5 27/29] MAINTAINERS: Add Akihiko Odaki as a e1000e reviewer
Date: Wed,  1 Feb 2023 12:35:37 +0900
Message-Id: <20230201033539.30049-28-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201033539.30049-1-akihiko.odaki@daynix.com>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102b.google.com
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

I want to know to be notified when there is a new change for e1000e
as e1000e is similar to igb and such a change may also be applicable for
igb.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 08ad1e5341..958915f227 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2208,11 +2208,13 @@ F: docs/specs/rocker.txt
 
 e1000x
 M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
+R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
 F: hw/net/e1000x*
 
 e1000e
 M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
+R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
 F: hw/net/e1000e*
 F: tests/qtest/fuzz-e1000e-test.c
-- 
2.39.1


