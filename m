Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984D12CD8B3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 15:13:47 +0100 (CET)
Received: from localhost ([::1]:60812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkpMg-0003DB-JT
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 09:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1kkpLk-0002aG-8V
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 09:12:48 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1kkpLg-0001az-MC
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 09:12:48 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CmySw6GMnz786l;
 Thu,  3 Dec 2020 22:12:00 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Thu, 3 Dec 2020 22:12:19 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
Subject: [RFC] vfio/migration: The way we start dirty tracking for the VFIO
 container?
To: <qemu-devel@nongnu.org>
Message-ID: <9ccefa79-72d3-1612-1627-3bfdf5e32f9e@huawei.com>
Date: Thu, 3 Dec 2020 22:12:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=yuzenghui@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: wanghaibin.wang@huawei.com, Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi folks,

I'm looking at the way we start dirty tracking for the vfio container
(we start it at the save_setup stage of a device) and have a few
questions about it.  Please fix me up if I had missed something obvious.


- We may end up with the situation where we try to get dirty bitmap of
   the vfio container whilst the dirty tracking hasn't yet been enabled.

     ram_save_setup
         ram_init_bitmaps
             migration_bitmap_sync_precopy (i.e., vfio_listener_log_sync)
     vfio_save_setup
         vfio_migration_set_state += _SAVING
         vfio_set_dirty_page_tracking(true)

   Practically there is no problem since in vfio_listener_log_sync(), we
   will check that if all devices are having the _SAVING state *before*
   actually syncing dirty bitmap.  As we add _SAVING to the device state
   exactly before starting dirty tracking, we'll actually do nothing in
   the first run of vfio_listener_log_sync().

   But I'm wondering what prevents us from starting dirty tracking via
   the "standard" log_start() callback of the vfio container.


- Before start dirty tracking, we will check and ensure that the device
   is at _SAVING state and return error otherwise.  But the question is
   that what is the rationale?  Why does the VFIO_IOMMU_DIRTY_PAGES ioctl
   have something to do with the device state?

   VFIO_IOMMU_DIRTY_PAGES is clearly designed as a API for type1 VFIO
   IOMMU.  Is it possible that the *device* itself becomes the actual
   dirty bitmap provider of this ioctl (e.g., the device is smart enough
   to track its own dirty pages during migration)?  This is the only case
   I can think out where we may have to set the device to pre-copy state
   before starting dirty tracking, so that device can report dirty pages
   properly in response to the GET_BITMAP ioctl.  But afaict it isn't
   covered by the existing documentation [1][2]...

   Btw, it isn't clear that what possible dirty bitmap providers will be
   (IOMMU, devices, etc) behind the back of the VFIO_IOMMU_DIRTY_PAGES
   ioctl.  Although userspace can be unaware of any of this, it'd be
   appreciated if someone can clarify it.


- If there is indeed some dependency between the device state and the
   VFIO_IOMMU_DIRTY_PAGES_FLAG_START operation, shouldn't we check that
   *all* devices are now having the _SAVING state before START, rather
   than just checking the *given* device in its (per-device) save_setup
   stage?

[1] https://git.kernel.org/torvalds/c/a8a24f3f6e38
[2] https://git.kernel.org/torvalds/c/b704fd14a06f


Thanks,
Zenghui

