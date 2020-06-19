Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 479A6201D56
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 23:54:40 +0200 (CEST)
Received: from localhost ([::1]:47742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmOy6-0000dF-SK
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 17:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1jmOwe-0006x1-Bc
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 17:53:08 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1jmOwc-00029a-V4
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 17:53:08 -0400
Received: by mail-pl1-x633.google.com with SMTP id 35so4478206ple.0
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 14:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=d+EgG7gNxCoetfLV/BNd+vkK4DSWQczsbkkcDJB0OtM=;
 b=XrsuIV5DZT+J6d56czt29vdkHa7kHJoLK3PrrfG4NLeWwhas7ywA5J5OSan+axT7bT
 b0X1MMlLKVUzJi+pWLmnRfdJECNJTUj5U4EjzYqk9dHHT2hQNU0rW3rQzheHP4j3VNyD
 1i8Ir1bEkeb9LcTchwof6LCCA2LpOahT4xeu3e+5AahH1RRdrZjE2Og7Ra8v0QUzIiQs
 JY6Dx4lHGG5SZo1qU0M5zJ91WhtHMhMVSBNz+jz1Baz6+p9EybRg2XaH/bGpvHlpLvmh
 BNuB8ZnixlpC4uzxV1MP5H48TI/xLZJL/xtlqR5eUdn0U7VITaf0H1lsuvWdiJhY/fbj
 aT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=d+EgG7gNxCoetfLV/BNd+vkK4DSWQczsbkkcDJB0OtM=;
 b=qTHNDh6BAnznuUWAB302QeqADFfELaOWGAKGnLQlma4ugG8aZCTsxCl+VbeOR6tOL+
 Y6HULW6hJN1EV1iiQF81Cg3QVWy9WTzhG8PvyZAiSrx3vZpKw6ohqxU1QCv5oABV12G7
 PQZfo40XnWvNgvDe7JKpDmutyvgPCYZgya1Kf5jSysKM5Ep4Hh73aaWBbAQDGwV/Jxc1
 dtNjE0TjpsKO7DTxqctGUSTyZYXRyAyut7PD/6HSsVt3hsp4ceq+pvvWsSXcoBHbRoWB
 dId2S2+ouhsOPpKpf18wqFNqJEM5Mn0P5f5F6qdC8Uyn48m1wzLzXvtyujccr/DpclS5
 PSUw==
X-Gm-Message-State: AOAM530wmpXBTHKJk2YViNS9DrwvCMuxGmCagAwr3hrJBPloC2rQJrPk
 8LLVrHSS/ABNHbDadain/3I=
X-Google-Smtp-Source: ABdhPJxNJKc05yULHHdYH8ZWbCFUqC4Bp5OZjjeGv0QF8zEQOmTF+kDX3QFauKH76LS2jhWflw8fPw==
X-Received: by 2002:a17:902:be06:: with SMTP id
 r6mr3917984pls.310.1592603584765; 
 Fri, 19 Jun 2020 14:53:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:b:9c3:9e5c:8eff:fe4f:f2d0])
 by smtp.gmail.com with ESMTPSA id h9sm5733200pjs.50.2020.06.19.14.53.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jun 2020 14:53:04 -0700 (PDT)
Subject: [PATCH 0/2] virtio-balloon: Free page hinting clean-ups
From: Alexander Duyck <alexander.duyck@gmail.com>
To: david@redhat.com, mst@redhat.com
Date: Fri, 19 Jun 2020 14:53:03 -0700
Message-ID: <20200619214912.25598.8400.stgit@localhost.localdomain>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=alexander.duyck@gmail.com; helo=mail-pl1-x633.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series contains a couple minor cleanups related to free page hinting.

The first patch addresses what I believe is a possible issue in which the
driver could potentially force the device out of the stop state and back
into the running state if it were to replay an earlier virtqueue element
containing the same ID it had submitted earlier.

The second patch takes care of renaming various hinting objects that were
using "reporting" in the name to try and clarify which objects are for free
page reporting and which are for free page hinting.

---

Alexander Duyck (2):
      virtio-balloon: Prevent guest from starting a report when we didn't request one
      virtio-balloon: Replace free page hinting references to 'report' with 'hint'


 hw/virtio/virtio-balloon.c         |   77 +++++++++++++++++++-----------------
 include/hw/virtio/virtio-balloon.h |   20 +++++----
 2 files changed, 50 insertions(+), 47 deletions(-)

--

