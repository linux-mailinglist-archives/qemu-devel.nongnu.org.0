Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB78333BC2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:49:03 +0100 (CET)
Received: from localhost ([::1]:33856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJxKo-00046Q-Qh
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJxFa-0007Ml-I3
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:43:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJxFY-0003Fd-Vb
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615376616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xmU97g3yCSvowNV3dVLIyMyV2ifLrSyLIAewZEA5cDo=;
 b=NCIJUWMXXHTF+LV6PTZttjpdlW6p+yYPM0l/Lukc9AWo4vunQ2aS/Tnq0tbnUNKtW+yd2M
 EL8KTgmNv15wReB9ha6nyQjTLVjLAgzK6LrmdfuLQAkyBOeH3ON33Vc9yP8TTyFMLMRjif
 sEfSyt9ARCjSQfA4+3Ts/2bd3ZZhfgA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-lDatZwbiMki45oXordqDbw-1; Wed, 10 Mar 2021 06:43:34 -0500
X-MC-Unique: lDatZwbiMki45oXordqDbw-1
Received: by mail-ed1-f70.google.com with SMTP id n20so8265613edr.8
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 03:43:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xmU97g3yCSvowNV3dVLIyMyV2ifLrSyLIAewZEA5cDo=;
 b=miMkZXm4pBQVcZBWPlzo1Kg1rxE3h3zCfZqUKpB8MIHsD4116nXH2OpTgUOEN9/ZTd
 na5PNtV5OpQWFRpYDcuUUBhRtLsr6YQ1vYDcR9jCFtNApyhnFtiqlTq+3IazWVQ2VtXf
 r3/DA9iplBKMDQPTmrIIEZuR+u14MF7d4Qh71Q+rDZHBmUPnZNpU+OgSA+HMpcWOeRz8
 3BVuElRYXIIiGD3efH4ru1TzcdVyIwEteeeFvT9FrWvcG6p8S1h55KOOfLuBUGwH5Qol
 RsJcOHwzLLCn3NsOiYjHy7xqBZNJDQI6wObR4EGEbJ8MQ97Ryzkr+nk+HyShozptL/sW
 F+zA==
X-Gm-Message-State: AOAM532BNwBT6vBelqP2j31cufqLapfQvN/mbQJKPqqV2D5ecTw78/Ht
 C3cIgMSm689Yn+zinAnqAoMPv5fortc1MKXsbjubGmwHPsyL0Ojk9THGNzQOt9YF2FdSXyXjcl8
 rOFdp3o70GkOfO6hK2Dq9O1qw0SwJqMXaZsX10pxAawlrAZkF58S48udKsN99dyk0
X-Received: by 2002:a17:906:29c3:: with SMTP id
 y3mr3070657eje.430.1615376613039; 
 Wed, 10 Mar 2021 03:43:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIakCl/er47hJdGlBH5tYMCMBi3Kecazf8CS4Z+rX+TsCtQD1HN9tmsIfqxlL0902RNzHT0w==
X-Received: by 2002:a17:906:29c3:: with SMTP id
 y3mr3070642eje.430.1615376612904; 
 Wed, 10 Mar 2021 03:43:32 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t15sm11296255edc.34.2021.03.10.03.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 03:43:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] docs/secure-coding-practices: Describe null-co/zeroes-co
 block drivers
Date: Wed, 10 Mar 2021 12:43:14 +0100
Message-Id: <20210310114314.1068957-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310114314.1068957-1-philmd@redhat.com>
References: <20210310114314.1068957-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Bandan Das <bsd@redhat.com>, Prasad J Pandit <ppandit@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document that security reports must not use the 'null-co' block
driver, as it leaves memory uninitialized on purposed (this is
a performance feature).
Reports must be send using the 'zeroes-co' driver.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/secure-coding-practices.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/devel/secure-coding-practices.rst b/docs/devel/secure-coding-practices.rst
index cbfc8af67e6..64d61085804 100644
--- a/docs/devel/secure-coding-practices.rst
+++ b/docs/devel/secure-coding-practices.rst
@@ -104,3 +104,10 @@ structures and only process the local copy.  This prevents
 time-of-check-to-time-of-use (TOCTOU) race conditions that could cause QEMU to
 crash when a vCPU thread modifies guest RAM while device emulation is
 processing it.
+
+Use of null-co / zeroes-co block drivers
+----------------------------------------
+
+When reporting security issues, the null-co block driver must not be used,
+as it is designed for performance and its read accesses are not initialized.
+The zeroes-co block driver must be used instead.
-- 
2.26.2


