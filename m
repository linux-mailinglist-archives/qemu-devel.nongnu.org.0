Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385E12C4F03
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 07:58:20 +0100 (CET)
Received: from localhost ([::1]:46394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiBEQ-0007RD-Sb
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 01:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1kiBCz-0006s9-0b; Thu, 26 Nov 2020 01:56:49 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1kiBCv-000476-GN; Thu, 26 Nov 2020 01:56:48 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ChT726335zLtvp;
 Thu, 26 Nov 2020 14:55:58 +0800 (CST)
Received: from [10.174.187.74] (10.174.187.74) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Thu, 26 Nov 2020 14:56:17 +0800
Subject: Re: [PATCH RFC] vfio: Move the saving of the config space to the
 right place in VFIO migration
To: Alex Williamson <alex.williamson@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Neo Jia <cjia@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20201114091731.157-1-lushenming@huawei.com>
 <860bd707-8862-2584-6e12-67c86f092dba@nvidia.com>
 <20201119104127.5e243efa@w520.home>
 <a7be9306-f800-0323-293e-217e2e9f6015@huawei.com>
 <20201120150146.5e5693e9@w520.home>
 <09549a98-85a0-fe4e-59fc-fdb636a4a5cd@huawei.com>
 <20201123193336.GA32690@nvidia.com> <20201123144622.75a18812@w520.home>
From: Shenming Lu <lushenming@huawei.com>
Message-ID: <ed6c0920-8a26-fafe-01a6-3021c5a92adb@huawei.com>
Date: Thu, 26 Nov 2020 14:56:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20201123144622.75a18812@w520.home>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.74]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=lushenming@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

After reading everyone's opinions, we have a rough idea for this issue.

One key point is whether it is necessary to setup the config space before
the device can accept further migration data. I think it is decided by
the vendor driver, so we can simply ask the vendor driver about it in
.save_setup, which could avoid a lot of unnecessary copies and settings.
Once we have known the need, we can iterate the config space (before)
along with the device migration data in .save_live_iterate and
.save_live_complete_precopy, and if not needed, we can only migrate the
config space in .save_state.

Another key point is that the interrupt enabling should be after the
restoring of the interrupt controller (might not only interrupts).
My solution is to add a subflag at the beginning of the config data
(right after VFIO_MIG_FLAG_DEV_CONFIG_STATE) to indicate the triggered
actions on the dst (such as whether to enable interrupts).

Below is it's workflow.

On the save path:
	In vfio_save_setup():
	Ask the vendor driver if it needs the config space setup before it
	can accept further migration data.
		|
	In vfio_save_iterate() (pre-copy):
	If *needed*, save the config space which would be setup on the dst
	before the migration data, but send with a subflag to instruct not
	to (such as) enable interrupts.
		|
	In vfio_save_complete_precopy() (stop-and-copy, iterable process):
	The same as that in vfio_save_iterate().
		|
	In .save_state (stop-and-copy, non-iterable process):
	If *needed*, only send a subflag to instruct to enable interrupts.
	If *not needed*, save the config space and setup everything on the dst.

Besides the above idea, we might be able to choose to let the vendor driver do
more: qemu just sends and writes the config data (before) along with the device
migration data every time, and it's up to the vendor driver to filter out/buffer
the received data or reorder the settings...

Thanks,
Shenming


