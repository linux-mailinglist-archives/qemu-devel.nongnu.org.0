Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C765369EF
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 03:56:18 +0200 (CEST)
Received: from localhost ([::1]:47126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nulge-0003Vg-Rk
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 21:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1nulZt-0002W3-VB
 for qemu-devel@nongnu.org; Fri, 27 May 2022 21:49:17 -0400
Received: from smtp232.sjtu.edu.cn ([202.120.2.232]:51458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1nulZr-0006pg-Gz
 for qemu-devel@nongnu.org; Fri, 27 May 2022 21:49:17 -0400
Received: from mta91.sjtu.edu.cn (unknown [10.118.0.91])
 by smtp232.sjtu.edu.cn (Postfix) with ESMTPS id 7135E1008CBC0;
 Sat, 28 May 2022 09:49:01 +0800 (CST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mta91.sjtu.edu.cn (Postfix) with ESMTP id 29FFB37C83B;
 Sat, 28 May 2022 09:49:01 +0800 (CST)
X-Virus-Scanned: amavisd-new at 
Received: from mta91.sjtu.edu.cn ([127.0.0.1])
 by localhost (mta91.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id uCpkb3v1nRrn; Sat, 28 May 2022 09:49:01 +0800 (CST)
Received: from mstore105.sjtu.edu.cn (mstore101.sjtu.edu.cn [10.118.0.105])
 by mta91.sjtu.edu.cn (Postfix) with ESMTP id 1084137C83A;
 Sat, 28 May 2022 09:49:01 +0800 (CST)
Date: Sat, 28 May 2022 09:49:00 +0800 (CST)
From: Guo Zhi <qtxuning1999@sjtu.edu.cn>
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: stefanha <stefanha@gmail.com>, eperezma <eperezma@redhat.com>
Message-ID: <1516273527.564528.1653702540989.JavaMail.zimbra@sjtu.edu.cn>
Subject: GSoC project: VIRTIO_F_IN_ORDER support for virtio devices
MIME-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
X-Originating-IP: [202.120.40.82]
X-Mailer: Zimbra 8.8.15_GA_4272 (ZimbraWebClient - GC101 (Mac)/8.8.15_GA_3928)
Thread-Index: PucJ0Vpo1cY6TcRAOthr8V3bvzpirQ==
Thread-Topic: GSoC project: VIRTIO_F_IN_ORDER support for virtio devices
Received-SPF: pass client-ip=202.120.2.232;
 envelope-from=qtxuning1999@sjtu.edu.cn; helo=smtp232.sjtu.edu.cn
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi everyone,
I'm Zhi Guo, a student from GSoC 2022.
My project is VIRTIO_F_IN_ORDER support for virtio devices. 

VIRTIO_F_IN_ORDER is a new feature presented in VIRTIO 1.1. As mentioned on the project description page(https://wiki.qemu.org/Google_Summer_of_Code_2022#VIRTIO_F_IN_ORDER_support_for_virtio_devices), VIRTIO_F_IN_ORDER is a feature that devices and drivers can negotiate when the device uses descriptors in the same order in which they were made available by the driver. This feature can help devices and drivers batch buffers and improve performance. Currently the devices and drivers available in Linux and QEMU do not support the VIRTIO_F_IN_ORDER feature. The only implementation is available in DPDK for the virtio-net driver. I will spend this summer to implement VIRTIO_F_IN_ORDER feature in both Linux and QEMU, and in both split and packed virtqueue layouts. Patches will be sent as soon as possible.

Best regards,

Zhi

