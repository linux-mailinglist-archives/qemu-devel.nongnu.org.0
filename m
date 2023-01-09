Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AC866230C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 11:21:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEpGd-0002HU-Ad; Mon, 09 Jan 2023 05:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pEpGa-0002Ft-Ik
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:20:32 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pEpGX-0007gy-O7
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:20:32 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.214])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3FB2F152087A0;
 Mon,  9 Jan 2023 11:20:25 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 9 Jan
 2023 11:20:24 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0024b974a15-f87f-4584-a147-4b6d7b66e8c4,
 1F76CF3ACB56F17C32A409AA235EFAF7B7A61927) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <27a868cc-d816-76f1-1ce1-60b6552d791f@kaod.org>
Date: Mon, 9 Jan 2023 11:20:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 10/14] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, Juan
 Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
 <20221229110345.12480-11-avihaih@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221229110345.12480-11-avihaih@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 56a0d325-f576-4185-bad3-697c1d10ce13
X-Ovh-Tracer-Id: 16891031881525725992
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeigddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghvihhhrghihhesnhhvihguihgrrdgtohhmpdhkfigrnhhkhhgvuggvsehnvhhiughirgdrtghomhdpmhgrohhrghesnhhvihguihgrrdgtohhmpdhjghhgsehnvhhiughirgdrtghomhdphihishhhrghihhesnhhvihguihgrrdgtohhmpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqshefledtgiesnhhonhhgnhhurdhorhhgpdhjshhnohifsehrvgguhhgrthdrtghomhdpvhhsvghmvghnthhsohhvseihrghnuggvgidqthgvrghmrdhruhdpvggslhgrkh
 gvsehrvgguhhgrthdrtghomhdpfhgrmhesvghuphhhohhnrdhnvghtpdhsthgvfhgrnhhhrgesrhgvughhrghtrdgtohhmpdhpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdgtohhhuhgtkhesrhgvughhrghtrdgtohhmpdhmshhtsehrvgguhhgrthdrtghomhdpughgihhlsggvrhhtsehrvgguhhgrthdrtghomhdpqhhuihhnthgvlhgrsehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhiihhisehlihhnuhigrdhisghmrdgtohhmpdgurghvihgusehrvgguhhgrthdrtghomhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhfrghrmhgrnheslhhinhhugidrihgsmhdrtghomhdpsghorhhnthhrrggvghgvrheslhhinhhugidrihgsmhdrtghomhdpphgrshhitgeslhhinhhugidrihgsmhdrtghomhdprghlvgigrdifihhllhhirghmshhonhesrhgvughhrghtrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhtrghrghhuphhtrgesnhhvihguihgrrdgtohhmpdhjohgrohdrmhdrmhgrrhhtihhnshesohhrrggtlhgvrdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello Avihai,


On 12/29/22 12:03, Avihai Horon wrote:
>   
> +static int vfio_save_setup(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    VFIOMigration *migration = vbasedev->migration;
> +    uint64_t stop_copy_size;
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
> +
> +    if (vfio_query_stop_copy_size(vbasedev, &stop_copy_size)) {
> +        stop_copy_size = VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE;
> +    }
> +    migration->data_buffer_size = MIN(VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE,
> +                                      stop_copy_size);
> +    migration->data_buffer = g_try_malloc0(migration->data_buffer_size);
> +    if (!migration->data_buffer) {
> +        error_report("%s: Failed to allocate migration data buffer",
> +                     vbasedev->name);
> +        return -ENOMEM;
> +    }
> +
> +    trace_vfio_save_setup(vbasedev->name, migration->data_buffer_size);
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> +
> +    return qemu_file_get_error(f);
> +}
> +

This fails to compile with :

   gcc version 12.2.1 20221121 (Red Hat 12.2.1-4) (GCC) complains with :


   ../include/qemu/osdep.h:315:22: error: ‘stop_copy_size’ may be used uninitialized [-Werror=maybe-uninitialized]
     315 |         _a < _b ? _a : _b;                              \
         |                      ^
   ../hw/vfio/migration.c:262:14: note: ‘stop_copy_size’ was declared here
     262 |     uint64_t stop_copy_size;
         |              ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors

May be rework the code slightly to avoid the breakage :

+++ qemu.git/hw/vfio/migration.c
@@ -259,13 +259,11 @@ static int vfio_save_setup(QEMUFile *f,
  {
      VFIODevice *vbasedev = opaque;
      VFIOMigration *migration = vbasedev->migration;
-    uint64_t stop_copy_size;
+    uint64_t stop_copy_size = VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE;
  
      qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
  
-    if (vfio_query_stop_copy_size(vbasedev, &stop_copy_size)) {
-        stop_copy_size = VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE;
-    }
+    vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
      migration->data_buffer_size = MIN(VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE,
                                        stop_copy_size);
      migration->data_buffer = g_try_malloc0(migration->data_buffer_size);


and report the error in vfio_query_stop_copy_size()

Thanks,

C.

