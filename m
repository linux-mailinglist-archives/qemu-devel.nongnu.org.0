Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BCC1EE133
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 11:24:42 +0200 (CEST)
Received: from localhost ([::1]:52846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgm77-0000j0-Gz
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 05:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jianjay.zhou@huawei.com>)
 id 1jgm6Q-0000Hr-Qc
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 05:23:58 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:56260 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jianjay.zhou@huawei.com>)
 id 1jgm6P-0007yM-KC
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 05:23:58 -0400
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.57])
 by Forcepoint Email with ESMTP id 76B69B36DD390EA3113D;
 Thu,  4 Jun 2020 17:23:47 +0800 (CST)
Received: from DGGEMM528-MBX.china.huawei.com ([169.254.8.13]) by
 DGGEMM404-HUB.china.huawei.com ([10.3.20.212]) with mapi id 14.03.0487.000;
 Thu, 4 Jun 2020 17:23:38 +0800
From: "Zhoujian (jay)" <jianjay.zhou@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Question about vhost-user-gpu on Arm64
Thread-Topic: Question about vhost-user-gpu on Arm64
Thread-Index: AdY6UGJjuko3uLUgQD+BbQvmBeKUTQ==
Date: Thu, 4 Jun 2020 09:23:37 +0000
Message-ID: <B2D15215269B544CADD246097EACE7474BCFF53A@DGGEMM528-MBX.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.149.93]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=jianjay.zhou@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 05:23:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "Huangweidong \(C\)" <weidong.huang@huawei.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "Zhoujian \(jay\)" <jianjay.zhou@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I want to test vhost-user-gpu on arm64 recently and follow the steps listed=
 in
section "vhost-user virtio gpu"[1].
So I compiled the qemu with CONFIG_VIRTIO_VGA=3Dy and
CONFIG_VHOST_USER_VGA=3Dy forcely, the vhost-user-gpu gpu emulation
process and qemu process started successfully, but the qemu reported repeat=
ly:

    "qemu-system-aarch64: console doesn't support GL!"
	"qemu-system-aarch64: console doesn't support dmabuf!"

Something seems wrong. Reading the qemu source code, the parent of
TYPE_VHOST_USER_VGA is TYPE_VIRTIO_VGA_BASE, which seems not to be
supported by arm("On arm systems display devices with a pci memory bar
do not work", also documented in [1]).

I maybe missed something, may I ask that does vhost-user-gpu supported
on arm64? Thanks,

Jay Zhou

[1] https://www.kraxel.org/blog/2019/09/display-devices-in-qemu/

