Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C645678F57
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:37:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKAzh-0003uE-Gd; Mon, 23 Jan 2023 23:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAzf-0003sw-FD
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:33:11 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAzd-0002SO-Tf
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:33:11 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso772893pjj.1
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHOPmxTcrXEL/dD6E3rURwQlKT0zRB74xfOULXZtt+A=;
 b=FqxRknscxPCfDIn2nK09MhJM16RdroiiSTxdEQcJw6q0LGyH0vUQeyDwGj3MhV5DmL
 utssMqOKFA1StLRCi1olMiodqviVnu1B7+RpD6upV63o3ByXxIdblo7n9t8Pzjpy32J5
 jq4yiIPCcF0MhpgYQwf0HYjRTZbig5liKUHJCoGEXs8xaFdDz4TYCbKN6Htt9v8q5kcH
 RjG/a0ONIvOOuZSS0OBPjbwCjEDliRmZJVm2OrNzb8XhPlYGK65C/R+3/zNtxO2yzo1L
 /6MvtYqxsuSt8FOCfw5BPc7I8tDD8+NA5Ptg4BgSatVHbykDZMNtKOCNbtsgf0ZlNe2O
 JI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hHOPmxTcrXEL/dD6E3rURwQlKT0zRB74xfOULXZtt+A=;
 b=ogdONfN7fdwEK02hpYM5sUrFJ4ip1spD7pyXUw67Ycyuqau1ahb9oetRRC+hpWIdGg
 y3nE9Ki+f2ztFHmPFOndnXN8Uhxn9gJej8ZeYF4AD06868EbA5AYtUQTZ+ilT1HuKiQK
 MU2jBksCsi4fO+XUvdqmoVcUdNpFqBNpMhox6I7U/2/GhrjPuqOgpdV1q3QyGb/DeiQh
 qt8AhXlQAS/oZ5TNaYtw/yzgz+ApzmRb/uQRJwUAbR2SLan0pJi82CTvLAf6bCalBx5x
 0j06NinPwtPuv4dAJtUfZvtMY1JzRE9wJBaawXdjyjfJeAh/iaPcUPjS6xEFCPeI7ROv
 Vlpw==
X-Gm-Message-State: AFqh2kqd2oe7MmaRleDJZcTVVFYMFeuUHQxhnGz5Evnkvo5JPUZUFDw3
 ErP9Msykz3ghPdorpwKAzzNe3w==
X-Google-Smtp-Source: AMrXdXskoD6OSXesldfedjPRinaGig4T9PbAdXajd7Lt5aZUPpzgGpr+qicNxxzTrSCjISTVYdimRg==
X-Received: by 2002:a17:902:b598:b0:194:645a:fa9a with SMTP id
 a24-20020a170902b59800b00194645afa9amr26470633pls.8.1674534788951; 
 Mon, 23 Jan 2023 20:33:08 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a170902708500b00196030312ccsm548033plk.78.2023.01.23.20.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 20:33:08 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 25/26] MAINTAINERS: Add Akihiko Odaki as a e1000e reviewer
Date: Tue, 24 Jan 2023 13:31:42 +0900
Message-Id: <20230124043143.5515-26-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124043143.5515-1-akihiko.odaki@daynix.com>
References: <20230124043143.5515-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
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


