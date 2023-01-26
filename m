Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1D67C93B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 11:54:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKzoq-0005ut-Lv; Thu, 26 Jan 2023 05:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKzo6-0004cj-1K
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:48:42 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKzo4-0005iW-Hx
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:48:37 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 k10-20020a17090a590a00b0022ba875a1a4so4874004pji.3
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 02:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHOPmxTcrXEL/dD6E3rURwQlKT0zRB74xfOULXZtt+A=;
 b=a/J0QDHiQz9ILq8iq5XBn/RQPUp+6LXYZlucK3jZNFHULI6kFNnULvkjN72IiR24vc
 QXDl12LV63fTrP3+TfhtcZhYWUK3p9nqnSG7J3oQ9pYZiO11YHvoCY9kUPjPKWIuUzjN
 zwMT87KjyO87SrP7evSD0qnUcAuw/mJEGG3HMZfPi8x5QlqCAUZJW288nOrAS5l3SDTe
 mb7lYEQvj+a6TqXY5Q/TL5XBueBtaSt5luupGZLA7tEaSKwe8fnSJUv09bxMZFdpAtV6
 4JQ1Fa0GJKeFSzV790lXKMwTYkxNW1D8tIYrXNqVbyiMPJr0iNvkAr077HVV3S1l9R5b
 72QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hHOPmxTcrXEL/dD6E3rURwQlKT0zRB74xfOULXZtt+A=;
 b=hd040mPKHTlk8iJwSi9Rv5/5rJ3Rnp2ROHebXQGAGumtpoRFO1ZWO4WFsSNQBMvj4r
 kEQdkUYYjyXHaOEN1X2l07bbnW+idJzDLhGkbZFf0U60UM6FQr+kc6RdlIaTonAQo4VV
 49LJKWtT+qMutYHEFH8zeSqUSGqLuzwXnkDUZPqzzNU9/7Q5X1zEBsDBlyc4mj6RXvVm
 uTMKWbAGCqGQUTuVKVR8BbwBY3joy9PmoHUSp6Dbu9Bvrm8d1Fd7h4CyiQnE4+7Xf0nP
 fc/PK5k6tHtQI7NzGrkn8L+lbz1DweP3twDII0mcWWbK9lxD6x0BZ/YmQcacb9Jorlzk
 y1Jw==
X-Gm-Message-State: AFqh2kpByXEIkEme5JhU8HkrzqSPuSpx+KzfIsIQsVRFKIatYs+EzbRs
 n1ZipxkbVHspBEqYcf9sR9GeEQ==
X-Google-Smtp-Source: AMrXdXuRRseqhi06XIWE4tjkOVzwHHwIEGNOyLX6x7WV4Y76z24o/BmXDKlx75EzobR+c98//ia33w==
X-Received: by 2002:a05:6a20:bf15:b0:b8:8ad6:ee34 with SMTP id
 gc21-20020a056a20bf1500b000b88ad6ee34mr35821906pzb.51.1674730115228; 
 Thu, 26 Jan 2023 02:48:35 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a63af48000000b0046b1dabf9a8sm496789pgo.70.2023.01.26.02.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 02:48:34 -0800 (PST)
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 25/26] MAINTAINERS: Add Akihiko Odaki as a e1000e reviewer
Date: Thu, 26 Jan 2023 19:47:04 +0900
Message-Id: <20230126104705.35023-26-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126104705.35023-1-akihiko.odaki@daynix.com>
References: <20230126104705.35023-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
2.39.0


