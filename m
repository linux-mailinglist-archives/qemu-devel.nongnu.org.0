Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4400C226D93
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 19:52:28 +0200 (CEST)
Received: from localhost ([::1]:51154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxZxj-0000Ha-Ay
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 13:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1jxZwZ-0007dG-OF
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 13:51:15 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1jxZwX-0007gV-U5
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 13:51:15 -0400
Received: by mail-pl1-x641.google.com with SMTP id m16so9003527pls.5
 for <qemu-devel@nongnu.org>; Mon, 20 Jul 2020 10:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=wmSo95gDYDHbCyshpWv6Pt4/3lkcD2xSeRwgMuRKBQs=;
 b=dnsoRkpF4mVc8Xw9kbJVScMe0PZoh9MZpHLguCWPgZsx/zFc+HeS5wIB3t7CfDRkU4
 vK79wbNstcEQOKn71ESEaopIrB3HfLn71vmgx5qrDRPYdf0WLa88p+1hztgcoql+hu8M
 IloA85r9FHk3nG9PwRiGCP820bUTH9NvbOUlFm0WakFtqzgv9x7+OvVJoNuyeOxSTTqr
 sWcxtCnWdnNQh7PECEBP8yygJ45xtVdt1c67WLEHrawRJWDE0YfaFfVaDtsh/HFJex2E
 5yoQgM5CWHf4aP17n6Ol9CwXoUgspKWHpKZlVXidfnXuXJdjRM/r7xDYRxBXlVTASIV+
 HJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=wmSo95gDYDHbCyshpWv6Pt4/3lkcD2xSeRwgMuRKBQs=;
 b=IT9Av5Kvz1YQIDFDjLPFjSMPQVCwi5sXHyOB1aelRjmw/jhaG8w//jLSDRe5YEdoo+
 2st2CHwiPhQw1FfiksW1+GpBBcFJti6csZ+X9mBHjCJ5kGjrY0t2lRYxaqK+ITy2vwG7
 QlmOcUOhZhd6YrWcF1yb2NvyCu1jgxF5Bv7bN+9d+z1HyKDmdq+YDulYwE81nTyGN1eR
 axmUNPGu4sXcJ4fZlPBGBnHYHmJu/6BBSUPXzhpeRIQDDdqcs8v/IiFTa4jJbateDOT3
 /vjnSyyFN88EkHxXqm4YvE9yCj6gbFngy4FHpM1ber3wju2jMIPPbw3iTsgZcg22d7Ri
 ne3w==
X-Gm-Message-State: AOAM531URbuXTSYr3pkDrAR71KQv989w6/t40f51wO8r4zI7I5/RWpaV
 rHNij6lv1xehH+PpTl+zReM=
X-Google-Smtp-Source: ABdhPJxBsOmpm++WpotvGEiwZ38FZ5n5Q3lrD0M2cu6xjowhqwJSdWUBxPXyyCBwS3c8828cuobD2g==
X-Received: by 2002:a17:902:7284:: with SMTP id
 d4mr17795215pll.164.1595267470802; 
 Mon, 20 Jul 2020 10:51:10 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:b:9c3:9e5c:8eff:fe4f:f2d0])
 by smtp.gmail.com with ESMTPSA id g5sm207020pjl.31.2020.07.20.10.51.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Jul 2020 10:51:10 -0700 (PDT)
Subject: [PATCH v3 QEMU 0/3] virtio-balloon: Free page hinting clean-ups
From: Alexander Duyck <alexander.duyck@gmail.com>
To: david@redhat.com, mst@redhat.com
Date: Mon, 20 Jul 2020 10:51:09 -0700
Message-ID: <20200720175030.21935.80052.stgit@localhost.localdomain>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=alexander.duyck@gmail.com; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series contains a couple minor cleanups related to free page hinting.

The first patch addresses what I believe is a possible issue in which the
driver could potentially force the device out of the stop state and back
into the running state if it were to replay an earlier virtqueue element
containing the same ID it had submitted earlier.

The second patch takes care of a possible race due to a mutex lock not being
used when starting the hinting from the device-side.

The final patch takes care of renaming various hinting objects that were
using "reporting" in the name to try and clarify which objects are for free
page reporting and which are for free page hinting.

Changes from v1:
Split first patch into two patches as each addresses a separate issue.
Added acked-by for first patch.

Changes from v2:
Added Acked-by for patch 2
Added comment to patch 2 about it fixing Coverity issue
Rebased on latest pull of QEMU

---

Alexander Duyck (3):
      virtio-balloon: Prevent guest from starting a report when we didn't request one
      virtio-balloon: Add locking to prevent possible race when starting hinting
      virtio-balloon: Replace free page hinting references to 'report' with 'hint'


 hw/virtio/virtio-balloon.c         |   79 +++++++++++++++++++-----------------
 include/hw/virtio/virtio-balloon.h |   20 +++++----
 2 files changed, 52 insertions(+), 47 deletions(-)

--

