Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6682E2D73C5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 11:18:12 +0100 (CET)
Received: from localhost ([::1]:37044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knfV5-0007pz-Ez
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 05:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1knfTn-00071E-BK; Fri, 11 Dec 2020 05:16:53 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1knfTi-0002yY-AX; Fri, 11 Dec 2020 05:16:51 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Csmrq3T2RzkpS0;
 Fri, 11 Dec 2020 18:15:55 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Fri, 11 Dec 2020 18:16:32 +0800
Message-ID: <5FD34700.3090001@huawei.com>
Date: Fri, 11 Dec 2020 18:16:32 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] virtiofsd: Fix potential NULL pointer dereference in
 virtio_send_msg()
References: <20201210151426.89244-1-alex.chen@huawei.com>
 <20201210180010.GG3629@work-vm>
In-Reply-To: <20201210180010.GG3629@work-vm>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Dave,

On 2020/12/11 2:00, Dr. David Alan Gilbert wrote:
> * Alex Chen (alex.chen@huawei.com) wrote:
>> The 'ch' will be NULL in the following stack:
>> send_notify_iov()->fuse_send_msg()->virtio_send_msg(),
>> so we should check 'ch' is valid before dereferencing it
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> 
> Please check, but I don't think we can currently hit this because
> we never call send_notify_iov - it's currently called by
> fuse_lowlevel_notify_inval_entry, inval_inode, and
> fuse_lowlevel_notify_poll -
> but I don't think those are called anywhere.
>

Thanks for your review.
The send_notify_iov() is really not being called.

> In that case, probably the best fix is to remove those until we
> put notify back in.
> 

OK, I will remove those temporarily useless code and send patch v2 to fix this problem.

Thanks,
Alex

> Dave
> 
>> ---
>>  tools/virtiofsd/fuse_virtio.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
>> index 623812c432..31b2187a15 100644
>> --- a/tools/virtiofsd/fuse_virtio.c
>> +++ b/tools/virtiofsd/fuse_virtio.c
>> @@ -205,6 +205,8 @@ static void copy_iov(struct iovec *src_iov, int src_count,
>>  int virtio_send_msg(struct fuse_session *se, struct fuse_chan *ch,
>>                      struct iovec *iov, int count)
>>  {
>> +    assert(ch);
>> +
>>      FVRequest *req = container_of(ch, FVRequest, ch);
>>      struct fv_QueueInfo *qi = ch->qi;
>>      VuDev *dev = &se->virtio_dev->dev;
>> -- 
>> 2.19.1
>>


