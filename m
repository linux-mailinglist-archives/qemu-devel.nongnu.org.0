Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9039A4148F7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 14:33:54 +0200 (CEST)
Received: from localhost ([::1]:53748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT1Rg-00061U-RP
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 08:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mT1N4-0003SA-Vs; Wed, 22 Sep 2021 08:29:07 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:46937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mT1N3-0006AP-EY; Wed, 22 Sep 2021 08:29:06 -0400
Received: by mail-qk1-x72f.google.com with SMTP id b65so8557239qkc.13;
 Wed, 22 Sep 2021 05:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6hJPhVCQX/+qcSURo5hFfHwiU5S65PGbN/vrPqjDgRQ=;
 b=Yq/3yzlInxbVuGunGglBGRkk9ybP98qYUWcHJJvs3T2+3MyUesNb+LtkaI/WDQQfQu
 6AxwObjRUtseFlYoUvvc1Yg1wnVTIhpvwt8KI1j6LdQUvP8fkiZ0JMrJDNTbHgluwvYg
 sve56TAJhTPUWg35mbmpwjKt0xWuUPL02LBIb7v0xfqvVhi5U6RQVZ+xqrYfWzVt252O
 NZSXxnFyRezmiIY4yrd5sZG3zKQ5MRA+Mea/aKsufnopImhRcYy/w4i9zrVLFViqMFcn
 I52P3wWABhGRT6OAdBPt6GM9ce+2y+8zp9Qw41Jm/dNfnHgQIphwp94FdwLLejcBOhGH
 d8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6hJPhVCQX/+qcSURo5hFfHwiU5S65PGbN/vrPqjDgRQ=;
 b=D7BKsq/dLr81esOvnE34VWhxIf6awfrW1Ys796QTzqs8plvOaU1OWKDV6ZSNZ+E3pA
 +NHSGg3Wzyj4PTuwO+/UK0ueBxASHhVBf5CkzeL+oyxJjtYgXKQhV075EDpQoGeFUjx2
 0V4OUtYuojpgGKznTLBfeHPLrnL+a90XiDwU9z81OxfBaMy508kQBN3LMB1Vaoc9hEt7
 TFKbZ1k2dCNT1K0tkH1tqoBEuIwUcvPQWxT4IfJIqSBW4TX/Mfv+G2mQuh7wnr9UkLwx
 MQ+DPS4qUGmPUqNokleXklNgehkW1QCNEx6AvryxLd7JH0XE0J3Id3N1jbqACsEe+ll+
 T9NQ==
X-Gm-Message-State: AOAM533rjwDasriNVRgKPHdA/n7fQq0nrJ7zUHec+EqCSpWFC2kimpVC
 5DkcvP9YbdkGuD7oulxisaNdDht02GM=
X-Google-Smtp-Source: ABdhPJznxZQHxWJK6ejx7+7phpxMp3hbm8hbgXRm7PUSiJ4YSFuSGgClBopmq62IfmBy1fj+5czPsg==
X-Received: by 2002:a37:a241:: with SMTP id l62mr8833941qke.386.1632313743763; 
 Wed, 22 Sep 2021 05:29:03 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id bm27sm1631186qkb.6.2021.09.22.05.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 05:29:03 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] fixes in spapr_numa_FORM2_write_rtas_tables()
Date: Wed, 22 Sep 2021 09:28:51 -0300
Message-Id: <20210922122852.130054-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, groug@kaod.org,
 qemu-ppc@nongnu.org, philmd@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This new version contains suggestions from Greg, Phillipe and Zoltan
that were made in the v1.

Changes from v1:
- keep the heap allocation of both arrays;
- use stl_be_p();
- use sizeof(uint32_t) instead of hardcoding '4' when skipping the
length;
- use the existing NUMA_DISTANCE_MIN macro.
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg05464.html


Daniel Henrique Barboza (1):
  spapr_numa.c: fixes in spapr_numa_FORM2_write_rtas_tables()

 hw/ppc/spapr_numa.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

-- 
2.31.1


