Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E9D42BBCD
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:39:38 +0200 (CEST)
Received: from localhost ([::1]:46852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maajZ-0006ux-1w
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaF3-0002cb-5n
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:08:06 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:37558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEw-00061T-Jx
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:08:03 -0400
Received: by mail-ed1-x531.google.com with SMTP id y12so7311428eda.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MJWSAS/jciDvzJRMQ0t1rHf+V8crwNUmrK8Gn4OaQNM=;
 b=JsMq/xb9KtoFerauoxOUnrskHcjqWbifKI/WZK2MKp8yCA7Yy6KfRbgm/aEeE/F5Oq
 r2SkqCqOdgkesHq2wCYElevBHwl7JVG7s4tRqPXL2W/mAiNZvOlTlv2y6l1dduFQYEsX
 7pa1m1loxmE3xP1KZPgBvaJ0H9pGgsN/v9zNlI+BQx2nz5I7vHWRn4u49um6uiRmCdEV
 lIldqSpsoFiTxA6KnXdvIA93bjxUPxT0LJOzDVHpjIz0MQinZN/V+zPDa74ec7KhOrPS
 iElx2g+KaHHO2t+xBFYeFZdZUcpx4bWguXT84Mc+J9AJKtfh7+6w5VMtBGnmyqB/xqeZ
 L1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MJWSAS/jciDvzJRMQ0t1rHf+V8crwNUmrK8Gn4OaQNM=;
 b=eTEkZ0Os1k8U7/nkwuJauP9eKXUET6jca/+GvrC7SkqGM7RMMWXvo+E8d+/Xhvz1rG
 8LZQkrQol9KtS4cTZdtw056eH7d8pa6NknTFRp8q/YzTb8rGTlqNY3ZAbVpLi9j7zjg8
 3lySnA17AFm60/M525Zg9DZ+uXpSuM/vb6VY2xJBOc7rS5V3wxvdN6gLf6Qpx+QGkXjM
 U4GGpFLvbi2m4W5eHFafcXLAJW9kIm5IZ9Px7c5RtQThpBw1zqyK+Qsmf87DCp4sH7cJ
 SbA4wfJrMh8+Z5LYgJDp2hH4QJX5Crqw9k5cMi5w5LggXqGXVJy9og7I3UZ6hNTie4ts
 dw7w==
X-Gm-Message-State: AOAM530YIeD0ecjx5jYTvdhiF+3xh+AgVZkQVb/stWnzTt8Pj1VcGjl9
 MnMkyaT3v8u2lo5ijT/tvJrd/mnnx44=
X-Google-Smtp-Source: ABdhPJxk00ryMgVUL6KChEKLa/ADQ35AGblJyk3CxUc0Jv8L3b6NZUlEdimpr8qpQ145kYVLQ247eg==
X-Received: by 2002:a05:6402:11d4:: with SMTP id
 j20mr7705701edw.267.1634116077326; 
 Wed, 13 Oct 2021 02:07:57 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 40/40] ebpf: really include it only in system emulators
Date: Wed, 13 Oct 2021 11:07:28 +0200
Message-Id: <20211013090728.309365-41-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

eBPF libraries are being included in user emulators, which is useless and
also breaks --static compilation if a shared library for libbpf is
present in the system.

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meson.build b/meson.build
index 2d373a61a6..c1314baace 100644
--- a/meson.build
+++ b/meson.build
@@ -2300,8 +2300,6 @@ subdir('bsd-user')
 subdir('linux-user')
 subdir('ebpf')
 
-common_ss.add(libbpf)
-
 bsd_user_ss.add(files('gdbstub.c'))
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
 
-- 
2.31.1


