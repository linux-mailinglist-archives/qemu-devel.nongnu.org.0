Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEA132EEDC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:31:58 +0100 (CET)
Received: from localhost ([::1]:52220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICQn-0002lU-4X
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:31:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lICEq-0001Bl-FD
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:19:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lICEo-0003pp-Qt
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614957574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7UP25bSgyiSQgMjxWP+wDUBY9RGJCfpVBxbSjLgvojQ=;
 b=EcZT78KCny4yVsqsJLxvwS70sB4j9m9mEjI/kxidNAzSwFxrItEBR6GbBemN5zvteOoCNI
 uXTuVSnJ+cs0AVw5GUWNnmA/Q4hHKlIz01yc1oBGwB+09cuMN4/419HQ/Z4y/rGGiBAJ8t
 +CgNBXW3rGS3Gc0u6LfvRiF2LUmxSUQ=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-EafV5t4WNGCtXTfWAL58yw-1; Fri, 05 Mar 2021 10:19:32 -0500
X-MC-Unique: EafV5t4WNGCtXTfWAL58yw-1
Received: by mail-oo1-f71.google.com with SMTP id q23so1345671oot.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 07:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7UP25bSgyiSQgMjxWP+wDUBY9RGJCfpVBxbSjLgvojQ=;
 b=ih0PWo7o9It9ypsed0ZKtgvpKjckZS3uIEqOpeMQdAqZDV1GxeVppu+JMkTUXfHFKv
 hEhAWGtALfqnUvaFj6MHj9/1hHj64c/G6ZAhIw6IDkz6RUN7GDZiEBbmpe+ltdXc9kUn
 vM6RVM15KeYK1G2AYOXQnxmQjGg9Kjz72izeG4shsZCr/UYAcyB3+5YqeV1gNChgXXZR
 6+qtI/PvK8Se52xY0IGdhnSVfuMykPdw22WfFsj3xV1rn9OY6J3fckA7OdM+3yOUiiF+
 S6rJSSrse2Gxh8ZRrXhqoyowLYCGmN9JKLjKp9bBLrARmiamBXBHNybI2bVKRhDaEX3m
 FeDw==
X-Gm-Message-State: AOAM530M4osb5+JF3ZiJwqYw8UmVDJ2X3qRM9HjtTYjHiQBR2fx7tEdD
 MhZZI85baq9E3dJIMqWzd4/b1Ob12NqQwCv5FZ4iM+RsZ0w4lu3pPEVguvg9NXGeZuT+Lw4DuGU
 71IjcdrCxZSVnlgs=
X-Received: by 2002:aca:3d85:: with SMTP id k127mr3135117oia.134.1614957571715; 
 Fri, 05 Mar 2021 07:19:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySomzMbZojUP5sXtdcnUuCorcJAigaPeWLwYRKO2LgZwSHy1yYdOHtWpesXBGzXr0EimsOHA==
X-Received: by 2002:aca:3d85:: with SMTP id k127mr3135104oia.134.1614957571561; 
 Fri, 05 Mar 2021 07:19:31 -0800 (PST)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id y34sm651085ota.12.2021.03.05.07.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:19:31 -0800 (PST)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/2] Clarify error messages pertaining to 'node-name'
Date: Fri,  5 Mar 2021 09:19:27 -0600
Message-Id: <20210305151929.1947331-1-ckuehl@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
  - Moved summary into patch #1
  - Updated test cases that were missed in v1 from running 'make check'.
    This time I used 'make check-block SPEED=thorough' and some more
    grepping to make sure I didn't miss any.
  - Rebased

Connor Kuehl (2):
  block: Clarify error messages pertaining to 'node-name'
  blockdev: Clarify error messages pertaining to 'node-name'

 block.c                       |  8 ++++----
 blockdev.c                    | 13 +++++++------
 tests/qemu-iotests/030        |  4 ++--
 tests/qemu-iotests/040        |  4 ++--
 tests/qemu-iotests/051.pc.out |  6 +++---
 tests/qemu-iotests/081.out    |  2 +-
 tests/qemu-iotests/085.out    |  6 +++---
 tests/qemu-iotests/087.out    |  2 +-
 tests/qemu-iotests/206.out    |  2 +-
 tests/qemu-iotests/210.out    |  2 +-
 tests/qemu-iotests/211.out    |  2 +-
 tests/qemu-iotests/212.out    |  2 +-
 tests/qemu-iotests/213.out    |  2 +-
 tests/qemu-iotests/223.out    |  4 ++--
 tests/qemu-iotests/237.out    |  2 +-
 tests/qemu-iotests/245        | 10 +++++-----
 tests/qemu-iotests/249.out    |  2 +-
 tests/qemu-iotests/300        |  4 ++--
 18 files changed, 39 insertions(+), 38 deletions(-)

-- 
2.29.2


