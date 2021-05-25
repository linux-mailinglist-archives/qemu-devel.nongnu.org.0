Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D867F3901FE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:19:19 +0200 (CEST)
Received: from localhost ([::1]:44186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llWxq-0007Jb-K7
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llWv4-0004wk-RZ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:16:26 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:39830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llWv3-0004eQ-8E
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:16:26 -0400
Received: by mail-qk1-x72c.google.com with SMTP id j184so8241994qkd.6
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fusJN9yX/5p/1BzxMk+j1QtkuY6pQEtDelyTJilmUlE=;
 b=eHaHvZLfnIMgNNp8VNoyo7QjydI/m8bIwmG4pbeRU1PKPmEahcZ2YOwHCW8jAvgr9G
 +BUra8mDJqXOkP7LgnrDqGnUiaz6TBVH6fUfAnVnto18EE/GjAY566jWR5ASfyYDzuzz
 lDJV9na4DfmZuD/EZfsRonpmLvt39KHBwTWP8VtGHOs0ux7CKqs4CLB4O0Vlv+q47QCK
 saeAjGzNg2FFDAN7tKunn2/On1xfkcSIPmVfyAh1OMa1xiwbLhKo4vX01FQD7nN1CDL6
 gGQGMToZS39C7KElphg4ordylpDqY+91MOpaTmlRbcX4FPs/a0pnWY7sxJL94vCkoOWm
 6+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fusJN9yX/5p/1BzxMk+j1QtkuY6pQEtDelyTJilmUlE=;
 b=g8lr+9tnDTfaixQ12CzWYuYxH1cHh7mgPNK4RXTQK1LPPbXMVtt3H32gT1cC88ze9n
 Dgfjs7+nzO1wvT9IGCNKayKvwxLjxkNJaDmTC4wGO1YKBYMdbxtNmWbtMiuMrYKG6IYs
 0ztV0LamzkNDffcAIbJJ/11XSybf79dTQlia7jBT404DgDLX+bREwi/xbGZ8EsIxEWfp
 t87mUhVzJ2D4GOvIjMw7WgTyoRz13GfRTwXaTyzP3kG8zdfPob6axzPAI6FhhRhPy1Kw
 sEJ0+O/vC+eVGHOzviLAtDrHYHtfkCwiUbDccZV949VlZTF4PbP7bbau/lgrE/BeMpQQ
 17LQ==
X-Gm-Message-State: AOAM530oULikQINR8kbt2zW0cw3kpxtTOYy4vn+zjyKkOrGvNLgGK39k
 wImc5tQ6f26YWvpejnCYjDccpK7Fj3s=
X-Google-Smtp-Source: ABdhPJyr7XSt1FfL0xx1sRXclaJwqax7knSnhEScceluEoBPJbT9e9m5PeFty7xqv0+I0ciEsiRfLw==
X-Received: by 2002:a05:620a:2486:: with SMTP id
 i6mr36026894qkn.207.1621948583902; 
 Tue, 25 May 2021 06:16:23 -0700 (PDT)
Received: from nishikirei.com.com ([104.131.0.80])
 by smtp.gmail.com with ESMTPSA id p14sm13213596qki.27.2021.05.25.06.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:16:23 -0700 (PDT)
From: Kit Westneat <kit.westneat@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] testing block device blocksizes
Date: Tue, 25 May 2021 13:15:42 +0000
Message-Id: <20210525131545.529451-1-kit.westneat@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=kit.westneat@gmail.com; helo=mail-qk1-x72c.google.com
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
Cc: pbonzini@redhat.com, Kit Westneat <kit.westneat@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches add a few parameters to blkdebug to allow modification of
the block device block sizes, both logical and physical. It also adds a
test that uses the parameter to verify correct UNMAP behavior in devices
with 4k blocks.

v2: fixes style issues

Kit Westneat (3):
  block/blkdebug: add blocksize parameter
  tests/qtest/virtio-scsi-test: add unmap large LBA with 4k blocks test
  block/blkdebug: add log-blocksize and phys-blocksize parameters

 block/blkdebug.c               | 56 ++++++++++++++++++++++++++++++++++
 tests/qtest/virtio-scsi-test.c | 50 ++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

-- 
2.26.3


