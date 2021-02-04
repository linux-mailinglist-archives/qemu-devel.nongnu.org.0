Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6045830FE4A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 21:31:57 +0100 (CET)
Received: from localhost ([::1]:54792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7lIB-00008D-54
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 15:31:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l7lFr-0007Fx-Ju
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:29:31 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l7lFo-0002dF-QO
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:29:31 -0500
Received: by mail-wm1-x32b.google.com with SMTP id l12so4256016wmq.2
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 12:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=xQp0/hskx9ez9tD9e1jfAQ6oyZAePdFbGxN49kbEG34=;
 b=WuqsoRtGiWc1kAwOjFX2PTB8cHgWR8OkHjQ7AVK2hs6yO46v1MTGhZD7NDAQERH4Bg
 vtWgPRfwONGtib/8TN3p6TcgEZGW3JWHMgb9/rZ+6HHYykrH40YdgFaqS5Fxf50dnMp4
 Y93nyo6bXGV7Lzb0T9dOOA0gxwLgmKajKAN2NrLMQiKs0ZgEmRVsHhxVqDq2u363v8pp
 OS9iL9h+qKTRSif85IpwQ86hO0xkV1hlbAZBzou4cZuJdK28blmwbv6FwwJP/Zs+Zj5K
 I9j9cVpXrdnTFgsfpvm9g51dcpl8YoRsZH9GmmYzDlt/iUGJ9QEroRXVoa0xzd73jzKp
 cvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xQp0/hskx9ez9tD9e1jfAQ6oyZAePdFbGxN49kbEG34=;
 b=rx/jzm75jlOzvjH4R+3ypv7beybZDxtpw+jCBYOyuMaeJTFU/mRr5bzO9ZtR3GfTp5
 EpfOC8+jpYiDDoznML1wdH//Zd3I1R22uKcCZyWQdXMMvXQew+oTPwMtHnpkqFgcn8b0
 RHIBS9QTjkGztZYeXLoKtymWnkwfEWIg2/tEaYySjqQuQZ7gbAGjl2XK71SjwjdICokk
 MAwK3Y7kVSaNvS4FnGGqoRoYSblrzhBn41f1Wv6Yr2BYHZEY6gXScTNo6XjKg5+pq5sS
 VlI9EjD/DWQWoRPW2KCSIdMl95T8vnCQVloblDnsAIeTXERpRCIxEWaLKXDKVtZUs5k/
 XMgQ==
X-Gm-Message-State: AOAM533HH6AeFj/+py886dOR67j+cHf8vpTV0mqluTZn5Bju2tF4MZWc
 I/VQZ69Pn5jKL3s7ZnMINXWVOg==
X-Google-Smtp-Source: ABdhPJxV1utIToNfWomptOiNYQXlpB0tXMtW4j4YqPnPpwT+hE7BRrHJ0TR31t04vnCFR0MnlHlMmw==
X-Received: by 2002:a7b:ce92:: with SMTP id q18mr734970wmj.113.1612470566911; 
 Thu, 04 Feb 2021 12:29:26 -0800 (PST)
Received: from f2.Home (bzq-109-64-9-177.red.bezeqint.net. [109.64.9.177])
 by smtp.gmail.com with ESMTPSA id f7sm8807834wre.78.2021.02.04.12.29.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Feb 2021 12:29:26 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] virtio-net: graceful drop of vhost for TAP
Date: Thu,  4 Feb 2021 22:29:12 +0200
Message-Id: <20210204202915.15925-1-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=2a00:1450:4864:20::32b;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This set of patches introduces graceful switch from tap-vhost to
tap-no-vhost depending on guest features. Before that the features
that vhost does not support were silently cleared in get_features.
This creates potential problem of migration from the machine where
some of virtio-net features are supported by the vhost kernel to the
machine where they are not supported (packed ring as an example).

Instead of silent masking of the features virtio-net gracefully
disables the vhost at set_features if some features acked by the
guest contradict with kernel vhost capabilities.

This set of patches also makes get_vhost_net() call (that used
everywhere) to always return actual result, i.e. initially it
returns non-NULL value and from the moment the vhost was disabled
the call will return NULL. Such a way we avoid any unexpected
calls to vhost functions.
Yuri Benditovich (3):
  vhost-net: add VIRTIO_NET_F_HASH_REPORT to the list of kernel features
  net: add ability to hide (disable) vhost_net
  virtio-net: graceful fallback to vhost=off for tap netdev

 hw/net/vhost_net.c  |  5 +++-
 hw/net/virtio-net.c | 58 ++++++++++++++++++++++++++++++++++++++-------
 include/net/net.h   |  1 +
 3 files changed, 55 insertions(+), 9 deletions(-)

-- 
2.17.1


