Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F86260B232
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:43:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omz5v-0005UV-Qx; Mon, 24 Oct 2022 11:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyingliang@huawei.com>)
 id 1omz5r-0005U4-H8
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:10:23 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyingliang@huawei.com>)
 id 1omz5n-0005bn-CH
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:10:22 -0400
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mwyzq5YM5z15M0P;
 Mon, 24 Oct 2022 23:05:11 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 23:10:02 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 23:10:01 +0800
Subject: Re: [PATCH v2] kset: fix memory leak when kset_register() returns
 error
To: Greg KH <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-erofs@lists.ozlabs.org>,
 <ocfs2-devel@oss.oracle.com>, <linux-mtd@lists.infradead.org>,
 <amd-gfx@lists.freedesktop.org>, <rafael@kernel.org>, <somlo@cmu.edu>,
 <mst@redhat.com>, <jaegeuk@kernel.org>, <chao@kernel.org>,
 <hsiangkao@linux.alibaba.com>, <huangjianan@oppo.com>, <mark@fasheh.com>,
 <jlbec@evilplan.org>, <joseph.qi@linux.alibaba.com>,
 <akpm@linux-foundation.org>, <alexander.deucher@amd.com>,
 <luben.tuikov@amd.com>, <richard@nod.at>, <liushixin2@huawei.com>,
 <yangyingliang@huawei.com>
References: <20221024121910.1169801-1-yangyingliang@huawei.com>
 <Y1aYuLmlXBRvMP1Z@kroah.com>
 <8281fc72-948a-162d-6e5f-a9fe29d8ee46@huawei.com>
 <Y1am4mjS+obAbUTJ@kroah.com>
Message-ID: <87e4e75b-a26e-6b4b-4799-c56c0b8891c0@huawei.com>
Date: Mon, 24 Oct 2022 23:10:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Y1am4mjS+obAbUTJ@kroah.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=yangyingliang@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Yang Yingliang <yangyingliang@huawei.com>
From:  Yang Yingliang via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 2022/10/24 22:53, Greg KH wrote:
> On Mon, Oct 24, 2022 at 10:39:44PM +0800, Yang Yingliang wrote:
>> On 2022/10/24 21:52, Greg KH wrote:
>>> On Mon, Oct 24, 2022 at 08:19:10PM +0800, Yang Yingliang wrote:
>>>> Inject fault while loading module, kset_register() may fail.
>>>> If it fails, the name allocated by kobject_set_name() which
>>>> is called before kset_register() is leaked, because refcount
>>>> of kobject is hold in kset_init().
>>>>
>>>> As a kset may be embedded in a larger structure which needs
>>>> be freed in release() function or error path in callers, we
>>>> can not call kset_put() in kset_register(), or it will cause
>>>> double free, so just call kfree_const() to free the name and
>>>> set it to NULL.
>>>>
>>>> With this fix, the callers don't need to care about the name
>>>> freeing and call an extra kset_put() if kset_register() fails.
>>>>
>>>> Suggested-by: Luben Tuikov <luben.tuikov@amd.com>
>>>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>>>> ---
>>>> v1 -> v2:
>>>>     Free name inside of kset_register() instead of calling kset_put()
>>>>     in drivers.
>>>> ---
>>>>    lib/kobject.c | 8 +++++++-
>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/lib/kobject.c b/lib/kobject.c
>>>> index a0b2dbfcfa23..3409a89c81e5 100644
>>>> --- a/lib/kobject.c
>>>> +++ b/lib/kobject.c
>>>> @@ -834,6 +834,9 @@ EXPORT_SYMBOL_GPL(kobj_sysfs_ops);
>>>>    /**
>>>>     * kset_register() - Initialize and add a kset.
>>>>     * @k: kset.
>>>> + *
>>>> + * NOTE: On error, the kset.kobj.name allocated by() kobj_set_name()
>>>> + * which is called before kset_register() in caller need be freed.
>>> This comment doesn't make any sense anymore.  No caller needs to worry
>>> about this, right?
>> With this fix, the name is freed inside of kset_register(), it can not be
>> accessed,
> Agreed.
>
>> if it allocated dynamically, but callers don't know this if no comment here,
>> they may use it in error path (something like to print error message with
>> it),
>> so how about comment like this to tell callers not to use the name:
>>
>> NOTE: On error, the kset.kobj.name allocated by() kobj_set_name()
>> is freed, it can not be used any more.
> Sure, that's a better way to word it.
>
>>>>     */
>>>>    int kset_register(struct kset *k)
>>>>    {
>>>> @@ -844,8 +847,11 @@ int kset_register(struct kset *k)
>>>>    	kset_init(k);
>>>>    	err = kobject_add_internal(&k->kobj);
>>>> -	if (err)
>>>> +	if (err) {
>>>> +		kfree_const(k->kobj.name);
>>>> +		k->kobj.name = NULL;
>>> Why are you setting the name here to NULL?
>> I set it to NULL to avoid accessing bad pointer in callers,
>> if callers use it in error path, current callers won't use this
>> name pointer in error path, so we can remove this assignment?
> Ah, I didn't think about using it on error paths.  Ideally that would
> never happen, but that's good to set just to make it obvious.  How about
> adding a small comment here saying why you are setting it so we all
> remember it in 5 years when we look at the code again.
OK, I can add it in v3.

Thanks,
Yang
>
> thanks,
>
> greg k-h
> .

