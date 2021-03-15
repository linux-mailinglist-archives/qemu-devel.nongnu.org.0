Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C9733B206
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 13:04:58 +0100 (CET)
Received: from localhost ([::1]:51448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlxx-0002cS-Tu
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 08:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lLlt0-0000tc-Ib
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:59:52 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lLlsz-0005Rd-0G
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:59:50 -0400
Received: by mail-wr1-x434.google.com with SMTP id t9so5542947wrn.11
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 04:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=zzoERBRNOpNLUz1biX7e5mBCVNbheji2+YdLxm6dZpU=;
 b=FOba6Mjd65b0bFC43Lmpo7WwRgoynPaC5pL6GMyqXzIPT/0lLhyc+2okE53D17fPaN
 zh3m3QAFzB+p2AFM3vyyOjRuZz9YJC1qbOqc8f+lFk/DvmKzrpGi/LYaUr2aGPaUvMTN
 JqnqVzwIZt1JRrZw7Gw0CFEKvrnLk7j6sAxJh7dKya7zS98z5hEx52j2rMpvzSW7hTD1
 msf8iQKSLEchjMTodTGpYDomx6yT4OLp/qhF4HBq1UnbQObfJhEwTSfJewqkYNOWwYw5
 jxrtUkTNtCYA9Cz/1QRsTB6ZVf/F/5VIZinDHbHOomQtsXrp4adTa1WRYEGOugTin+FN
 FQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zzoERBRNOpNLUz1biX7e5mBCVNbheji2+YdLxm6dZpU=;
 b=lpZSeoJon0xwFPM1le6z20vWMn6MREpT8MfKVLRjkA/U/3YFADXA4KPFkpJXDcFEP6
 c2hOpQd+S7obQPaW9UfsASXMMWOJ0icnYgWM1UniVHR9+XaU6wXW8Y1BMUC7a8sAh54j
 x+gVr4v3tZDl6TFDJ8hqe3oq/D0TjVlKI0Tum5Jzq4kCxSUR7/xJPrvcPtNtmAVJYimu
 HyBgEgBUDjgPBYQHB2KZ8R8pRc+e+7N0iap+7HAs6WdnF9LsLAcOMyCsWi3ZfHgEdCwA
 zz0DqVtmZIgGPCM0i/iJb1nhJYgrkqAG6rHmAoEsiIXua+BUUqhd4N/OO1XnuuLqUD1P
 UDUw==
X-Gm-Message-State: AOAM533JMTPNRgGtkY48ESYAwDPFC/kOEeECBz1okGTvizdpsKVlq49X
 3qBxA6IKuUyp6H7sj/zUwkwngkUwvl6G+w==
X-Google-Smtp-Source: ABdhPJwvQZPpRC6bgDlySAGznUChEFsiy+vCoQQ27VMah8h+sZAZGN3BIYOzoueSOJw9sogaC8C2Cw==
X-Received: by 2002:a5d:4341:: with SMTP id u1mr27052149wrr.88.1615809585130; 
 Mon, 15 Mar 2021 04:59:45 -0700 (PDT)
Received: from f2.redhat.com (bzq-79-176-30-57.red.bezeqint.net.
 [79.176.30.57])
 by smtp.gmail.com with ESMTPSA id a6sm14060010wmm.0.2021.03.15.04.59.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Mar 2021 04:59:44 -0700 (PDT)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com
Subject: [PATCH v2 0/2] virtio-pci: add check for vdev in virtio_pci_isr_read
Date: Mon, 15 Mar 2021 13:59:35 +0200
Message-Id: <20210315115937.14286-1-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=2a00:1450:4864:20::434;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-wr1-x434.google.com
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

This commit completes the solution of segfault in hot unplug flow
(by commit ccec7e9603f446fe75c6c563ba335c00cfda6a06).
Added missing check for vdev in virtio_pci_isr_read.

v1->v2:
Added crash stack
Updated commit comment
Cosmetic change in additional procedure in this file per request
of Philippe Mathieu-Daude

Yuri Benditovich (2):
  virtio-pci: add check for vdev in virtio_pci_isr_read
  virtio-pci: remove explicit initialization of val

 hw/virtio/virtio-pci.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

-- 
2.17.1


