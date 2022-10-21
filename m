Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF07860739A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:12:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo4z-0002Ug-Ck
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:12:37 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnt3-0006aq-LL
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:00:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyingliang@huawei.com>)
 id 1olnss-0006GL-Jv
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:00:06 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyingliang@huawei.com>)
 id 1olnso-00062J-Lt
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:00:06 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mtz1T2m19zHvFM;
 Fri, 21 Oct 2022 16:59:41 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 16:59:48 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 16:59:47 +0800
Subject: Re: [PATCH 00/11] fix memory leak while kset_register() fails
To: Greg KH <gregkh@linuxfoundation.org>
CC: Luben Tuikov <luben.tuikov@amd.com>, <linux-kernel@vger.kernel.org>,
 <qemu-devel@nongnu.org>, <linux-f2fs-devel@lists.sourceforge.net>,
 <linux-erofs@lists.ozlabs.org>, <ocfs2-devel@oss.oracle.com>,
 <linux-mtd@lists.infradead.org>, <amd-gfx@lists.freedesktop.org>,
 <rafael@kernel.org>, <somlo@cmu.edu>, <mst@redhat.com>, <jaegeuk@kernel.org>, 
 <chao@kernel.org>, <hsiangkao@linux.alibaba.com>, <huangjianan@oppo.com>,
 <mark@fasheh.com>, <jlbec@evilplan.org>, <joseph.qi@linux.alibaba.com>,
 <akpm@linux-foundation.org>, <alexander.deucher@amd.com>, <richard@nod.at>,
 <liushixin2@huawei.com>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com> <Y1IwLOUGayjT9p6d@kroah.com>
 <0591e66f-731a-5f81-fc9d-3a6d80516c65@huawei.com>
 <Y1JZ9IUPL6jZIQ8E@kroah.com>
Message-ID: <f1210e20-d167-26c4-7aba-490d8fb7241e@huawei.com>
Date: Fri, 21 Oct 2022 16:59:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Y1JZ9IUPL6jZIQ8E@kroah.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=yangyingliang@huawei.com; helo=szxga02-in.huawei.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Yang Yingliang <yangyingliang@huawei.com>
From:  Yang Yingliang via <qemu-devel@nongnu.org>


On 2022/10/21 16:36, Greg KH wrote:
> On Fri, Oct 21, 2022 at 04:24:23PM +0800, Yang Yingliang wrote:
>> On 2022/10/21 13:37, Greg KH wrote:
>>> On Fri, Oct 21, 2022 at 01:29:31AM -0400, Luben Tuikov wrote:
>>>> On 2022-10-20 22:20, Yang Yingliang wrote:
>>>>> The previous discussion link:
>>>>> https://lore.kernel.org/lkml/0db486eb-6927-927e-3629-958f8f211194@huawei.com/T/
>>>> The very first discussion on this was here:
>>>>
>>>> https://www.spinics.net/lists/dri-devel/msg368077.html
>>>>
>>>> Please use this link, and not the that one up there you which quoted above,
>>>> and whose commit description is taken verbatim from the this link.
>>>>
>>>>> kset_register() is currently used in some places without calling
>>>>> kset_put() in error path, because the callers think it should be
>>>>> kset internal thing to do, but the driver core can not know what
>>>>> caller doing with that memory at times. The memory could be freed
>>>>> both in kset_put() and error path of caller, if it is called in
>>>>> kset_register().
>>>> As I explained in the link above, the reason there's
>>>> a memory leak is that one cannot call kset_register() without
>>>> the kset->kobj.name being set--kobj_add_internal() returns -EINVAL,
>>>> in this case, i.e. kset_register() fails with -EINVAL.
>>>>
>>>> Thus, the most common usage is something like this:
>>>>
>>>> 	kobj_set_name(&kset->kobj, format, ...);
>>>> 	kset->kobj.kset = parent_kset;
>>>> 	kset->kobj.ktype = ktype;
>>>> 	res = kset_register(kset);
>>>>
>>>> So, what is being leaked, is the memory allocated in kobj_set_name(),
>>>> by the common idiom shown above. This needs to be mentioned in
>>>> the documentation, at least, in case, in the future this is absolved
>>>> in kset_register() redesign, etc.
>>> Based on this, can kset_register() just clean up from itself when an
>>> error happens?  Ideally that would be the case, as the odds of a kset
>>> being embedded in a larger structure is probably slim, but we would have
>>> to search the tree to make sure.
>> I have search the whole tree, the kset used in bus_register() - patch #3,
>> kset_create_and_add() - patch #4
>> __class_register() - patch #5,  fw_cfg_build_symlink() - patch #6 and
>> amdgpu_discovery.c - patch #10
>> is embedded in a larger structure. In these cases, we can not call
>> kset_put() in error path in kset_register()
> Yes you can as the kobject in the kset should NOT be controling the
> lifespan of those larger objects.
>
> If it is, please point out the call chain here as I don't think that
> should be possible.
>
> Note all of this is a mess because the kobject name stuff was added much
> later, after the driver model had been created and running for a while.
> We missed this error path when adding the dynamic kobject name logic,
> thank for looking into this.
>
> If you could test the patch posted with your error injection systems,
> that could make this all much simpler to solve.

The patch posted by Luben will cause double free in some cases.


 From 71e0a22801c0699f67ea40ed96e0a7d7d9e0f318 Mon Sep 17 00:00:00 2001
From: Luben Tuikov <luben.tuikov@amd.com>
Date: Fri, 21 Oct 2022 03:34:21 -0400
Subject: [PATCH] kobject: Add kset_put() if kset_register() fails
X-check-string-leak: v1.0

If kset_register() fails, we call kset_put() before returning the
error. This makes sure that we free memory allocated by kobj_set_name()
for the kset, since kset_register() cannot be called unless the kset has
a name, usually gotten via kobj_set_name(&kset->kobj, format, ...);

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Yang Yingliang <yangyingliang@huawei.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
  lib/kobject.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/kobject.c b/lib/kobject.c
index a0b2dbfcfa2334..c122b979f2b75e 100644
--- a/lib/kobject.c
+++ b/lib/kobject.c
@@ -844,8 +844,10 @@ int kset_register(struct kset *k)

      kset_init(k);
      err = kobject_add_internal(&k->kobj);
-    if (err)
+    if (err) {
+        kset_put(k);
          return err;
+    }
      kobject_uevent(&k->kobj, KOBJ_ADD);
      return 0;
  }
-- 
2.38.0-rc2

>
> thanks,
>
> greg k-h
> .

