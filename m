Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1039221A44
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jul 2020 04:45:47 +0200 (CEST)
Received: from localhost ([::1]:49412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvtu6-0001of-Ne
	for lists+qemu-devel@lfdr.de; Wed, 15 Jul 2020 22:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <teawaterz@linux.alibaba.com>)
 id 1jvtrN-0005qU-D1
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 22:42:57 -0400
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:46916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <teawaterz@linux.alibaba.com>)
 id 1jvtrL-00047a-3R
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 22:42:56 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=teawaterz@linux.alibaba.com;
 NM=1; PH=DS; RN=10; SR=0; TI=SMTPD_---0U2rTvAn_1594867352; 
Received: from localhost(mailfrom:teawaterz@linux.alibaba.com
 fp:SMTPD_---0U2rTvAn_1594867352) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 16 Jul 2020 10:42:34 +0800
From: Hui Zhu <teawater@gmail.com>
To: mst@redhat.com, david@redhat.com, jasowang@redhat.com,
 akpm@linux-foundation.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, qemu-devel@nongnu.org,
 virtio-dev@lists.oasis-open.org
Subject: [RFC for qemu v4 0/2] virtio-balloon: Add option cont-pages to set
 VIRTIO_BALLOON_F_CONT_PAGES
Date: Thu, 16 Jul 2020 10:41:53 +0800
Message-Id: <1594867315-8626-4-git-send-email-teawater@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594867315-8626-1-git-send-email-teawater@gmail.com>
References: <1594867315-8626-1-git-send-email-teawater@gmail.com>
Received-SPF: pass client-ip=47.88.44.36;
 envelope-from=teawaterz@linux.alibaba.com; helo=out4436.biz.mail.alibaba.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 22:42:26
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001, URIBL_BLOCKED=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Cc: Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Code of current version for Linux and qemu is available in [1] and [2].
Update of this version:
1. Report continuous pages will increase the speed.  So added deflate
   continuous pages.
2. According to the comments from David in [3], added 2 new vqs icvq and
   dcvq to get continuous pages with format 32 bits pfn and 32 bits size.

Following is the introduction of the function.
Set option cont-pages to on will open flags VIRTIO_BALLOON_F_CONT_PAGES.
qemu will get continuous pages from icvq and dcvq and do madvise
MADV_WILLNEED and MADV_DONTNEED with the pages.
Opening this flag can bring two benefits:
1. Increase the speed of balloon inflate and deflate.
2. Decrease the splitted THPs number in the host.

[1] https://github.com/teawater/linux/tree/balloon_conts
[2] https://github.com/teawater/qemu/tree/balloon_conts
[3] https://lkml.org/lkml/2020/5/13/1211

Hui Zhu (2):
  virtio_balloon: Add cont-pages and icvq
  virtio_balloon: Add dcvq to deflate continuous pages

 hw/virtio/virtio-balloon.c                      |   92 +++++++++++++++---------
 include/hw/virtio/virtio-balloon.h              |    2
 include/standard-headers/linux/virtio_balloon.h |    1
 3 files changed, 63 insertions(+), 32 deletions(-)

