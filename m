Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2104446E2C
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 14:44:09 +0100 (CET)
Received: from localhost ([::1]:53312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjLzM-00060E-GU
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 09:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjLxN-0004bK-5P
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 09:42:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjLxJ-0004k0-R6
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 09:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636206120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Yywpyvz2X/USLG4dt39zgpjZsXoWAwouYLFVCmqRaOg=;
 b=Z1mDKKxWMZOrU7ky1kdy4mCmWfZCFpPQ6oXaPSR0wxJa1Ofn+B/9EDkqjVgyq5zQrl+cfS
 IB2biY2pOGdotVk0wtkPOeth3H28Mugk7EQN9fN+eLbYQPRF9VMCV6nvsNMdeCF7yZrqki
 9nD31oMluq5+VI3Yivrogvb9Jaujh4c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-7jQuZuHgOE-7a54LzokPFg-1; Sat, 06 Nov 2021 09:41:59 -0400
X-MC-Unique: 7jQuZuHgOE-7a54LzokPFg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n16-20020a05600c3b9000b003331973fdbbso1146906wms.0
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 06:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=99lWek98dpsNHuRvJiny6DmRtJF9SLO8oYY9F6fI8qk=;
 b=D73D4cjVfe2qHeXgVVFPB+ROa6kDRMgDL+XlnEN3JyYpOnxDRsonnTgPulCkmP9i3b
 zVD1TUI8APDKxTrMOLSih0hBI8LHn1iTmrOmEYe5g6iBuPJNb9DjFFQrDwo10d8crw/K
 O9Q0WQhkF3uVuNOT/sLhwmX0s4rqfosoDOhf9rtskD1lBznSeU4+HGpTrqPgN8jpfzOy
 g29+hpqBKCDk3MhmI4at2BRM36COr9K8VME3SqVSbE7Jdulbc3JRQ3md6MySMScPFasj
 HwT6Xas+Yb5jtZvCLR9CIiZN9aAYRJIVe6a8b3K9q2h8y2sUMPmanESoJ/hXRfxQPfmx
 5DnA==
X-Gm-Message-State: AOAM532IbiM8nEX4zxWxDdEb3ReZFmggCD0t7MHLG1TE3ta7klbYKdlV
 uTT++Q3z+QDKs+yv9ZZPmQnRzF5MthiVaj4ybOjO6LdWMDX/Q4Y2wht4AmlTDW6KLoKpjEVdino
 ccRGJPxSevwhG+/kz/JA31ZuMay77iffHTERerMKZhgJhECzEkzURVvyva4ceRQea
X-Received: by 2002:a05:600c:1d28:: with SMTP id
 l40mr10891307wms.192.1636206118163; 
 Sat, 06 Nov 2021 06:41:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUCeeTOPmQD4Re1tfDruJCBCRgOfSzPmq77mLB2TnFndqRzi0S7sMaa3T3oQwKiIEwx/+q/w==
X-Received: by 2002:a05:600c:1d28:: with SMTP id
 l40mr10891259wms.192.1636206117796; 
 Sat, 06 Nov 2021 06:41:57 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h1sm10428005wmb.7.2021.11.06.06.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 06:41:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/1] hw/hyperv/vmbus: Is it maintained?
Date: Sat,  6 Nov 2021 14:41:54 +0100
Message-Id: <20211106134155.582312-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jon Doron <arilou@gmail.com>, qemu-trivial@nongnu.org,
 Roman Kagan <rkagan@virtuozzo.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the 4th time I send this patch. Is the VMBus infrastructure=0D
used / maintained? Should we deprecate & remove?=0D
=0D
  $ ./scripts/get_maintainer.pl -f hw/hyperv/vmbus.c -f include/hw/hyperv/v=
mbus.h=0D
  get_maintainer.pl: No maintainers found=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  hw/hyperv/vmbus: Remove unused vmbus_load/save_req()=0D
=0D
 include/hw/hyperv/vmbus.h |  3 --=0D
 hw/hyperv/vmbus.c         | 59 ---------------------------------------=0D
 2 files changed, 62 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


