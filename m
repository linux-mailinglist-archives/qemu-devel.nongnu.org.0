Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6878C344133
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:32:11 +0100 (CET)
Received: from localhost ([::1]:47848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJj8-0004zA-FB
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lOJcF-00085X-TX
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:25:04 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lOJcD-0005YO-FN
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:25:03 -0400
Received: by mail-wm1-x330.google.com with SMTP id d191so9360086wmd.2
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 05:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7YtShg8kMmb+cPucH6O4xqWqREc6F+xiXcatwvp1uRo=;
 b=TPwzctoPVvFgU3A5E2TfwDcsEjC3QNdMKXUPWUmyQyl9qWrqLha8MXVyBD7QgWiEjN
 C9Eau86TOZn6z/LgcUBDXQduZra+zOX8mW4RJ5pWeqWQehncpd1ahIYpMRV+Wrjk7pRT
 cZQUwx8F/MQE793wXwtW2Eo47jPdbtyMRDmdaVCkp0xCjI5sTfDuZ5jU+LNU2ItN7ubL
 2nH/pLyTdVF0BHNy01CfEz5UU4mbzYyjMDg6Kvw0Vs45GMb5kG0CuMXte8iZNh0/F/SH
 hP8TFNjAEMEBHkCiDCsIJl5uclWDFcAgEIViGEakzj/lYo0Cpmi+xOJ7gcHvMvbATKgN
 R59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7YtShg8kMmb+cPucH6O4xqWqREc6F+xiXcatwvp1uRo=;
 b=BCbQMTCGBJmzSOtOHaT5571+he0Qp9BjDRnjmSFjsAMiMQkQ4U6OtXIoiQfoVi3VcC
 gYw9H7TVdUDj2qc22r7GNVRl+cV/ZtIzOisi4qGf7ybZo+ZGTT3OwyMakIRocrTIUxf1
 to9h60UvdBBdkuIK/LO3ZEUOvweb5HCapNUAEP6XF8tzzYBUYps8FSv1IG+utc6oAsM5
 ThWo8UnIJbFBX7ZZ+LBXaHE5kYgQVm8QW9/90f4xVXno5zqYN4GIKdAk5OvfZh1HSIw1
 LXC68qTtnkbBF7n6/f6EA5qPs2IY5ps4/RpBPqZbJaN4RX4EhHeroyNFfgJnPDmXsVHX
 kPcQ==
X-Gm-Message-State: AOAM531tvo37duuOQzI6vd+s/GhnMTr4yEKZPILEt8pPw2Wk/9TG3rvE
 SCn1Bdb2oc+NntHy/qDs9416Cg==
X-Google-Smtp-Source: ABdhPJxavO9YgiIYLCJC3xabaJ6FnTMBYqHrZ2DWgA7q16ZcxNomn91++zm1Y6DmsXdqcwFNTuXGjQ==
X-Received: by 2002:a1c:6543:: with SMTP id z64mr15754756wmb.50.1616415899417; 
 Mon, 22 Mar 2021 05:24:59 -0700 (PDT)
Received: from f1.Home (bzq-79-176-30-57.red.bezeqint.net. [79.176.30.57])
 by smtp.gmail.com with ESMTPSA id w132sm16785325wmg.39.2021.03.22.05.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 05:24:58 -0700 (PDT)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	berrange@redhat.com
Subject: [RFC PATCH v2 0/3] virtio-net: graceful drop of vhost for TAP
Date: Mon, 22 Mar 2021 14:24:49 +0200
Message-Id: <20210322122452.369750-1-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::330;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-wm1-x330.google.com
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
Cc: yan@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow fallback to userspace only upon migration, only for specific features=
=0D
and only if 'vhostforce' is not requested.=0D
=0D
Changes from v1:=0D
Patch 1 dropeed (will be submitted in another series)=0D
Added device callback in case the migration should fail due to missing feat=
ures=0D

Yuri Benditovich (3):
  net: add ability to hide (disable) vhost_net
  virtio: introduce 'missing_features_migrated' device callback
  virtio-net: implement missing_features_migrated callback

 hw/net/vhost_net.c         |  4 ++-
 hw/net/virtio-net.c        | 51 ++++++++++++++++++++++++++++++++++++++
 hw/virtio/virtio.c         |  8 ++++++
 include/hw/virtio/virtio.h |  8 ++++++
 include/net/net.h          |  1 +
 5 files changed, 71 insertions(+), 1 deletion(-)

--=20
2.26.2


