Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301E5662413
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 12:21:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqCX-0006HV-W3; Mon, 09 Jan 2023 06:20:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pEqCR-0006GV-10
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:20:21 -0500
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pEqCP-0000qS-0G
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:20:18 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.148])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3A5422CE82;
 Mon,  9 Jan 2023 11:20:10 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 9 Jan
 2023 12:20:08 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001b8d0f8c0-440c-4672-a459-c3c760f888af,
 1F76CF3ACB56F17C32A409AA235EFAF7B7A61927) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f9d8f641-90cd-9cca-e882-0bb5dcdafa76@kaod.org>
Date: Mon, 9 Jan 2023 12:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 06/14] migration/qemu-file: Add qemu_file_get_to_fd()
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
 <20221229110345.12480-7-avihaih@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221229110345.12480-7-avihaih@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 90aad5df-ab5f-47b5-a914-f9ca0cb050b6
X-Ovh-Tracer-Id: 17899838196712770344
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeigddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghvihhhrghihhesnhhvihguihgrrdgtohhmpdhkfigrnhhkhhgvuggvsehnvhhiughirgdrtghomhdpmhgrohhrghesnhhvihguihgrrdgtohhmpdhjghhgsehnvhhiughirgdrtghomhdphihishhhrghihhesnhhvihguihgrrdgtohhmpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqshefledtgiesnhhonhhgnhhurdhorhhgpdhjshhnohifsehrvgguhhgrthdrtghomhdpvhhsvghmvghnthhsohhvseihrghnuggvgidqthgvrghmrdhruhdpvggslhgrkh
 gvsehrvgguhhgrthdrtghomhdpfhgrmhesvghuphhhohhnrdhnvghtpdhsthgvfhgrnhhhrgesrhgvughhrghtrdgtohhmpdhpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdgtohhhuhgtkhesrhgvughhrghtrdgtohhmpdhmshhtsehrvgguhhgrthdrtghomhdpughgihhlsggvrhhtsehrvgguhhgrthdrtghomhdpqhhuihhnthgvlhgrsehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhiihhisehlihhnuhigrdhisghmrdgtohhmpdgurghvihgusehrvgguhhgrthdrtghomhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhfrghrmhgrnheslhhinhhugidrihgsmhdrtghomhdpsghorhhnthhrrggvghgvrheslhhinhhugidrihgsmhdrtghomhdpphgrshhitgeslhhinhhugidrihgsmhdrtghomhdprghlvgigrdifihhllhhirghmshhonhesrhgvughhrghtrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhtrghrghhuphhtrgesnhhvihguihgrrdgtohhmpdhjohgrohdrmhdrmhgrrhhtihhnshesohhrrggtlhgvrdgtohhmpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/29/22 12:03, Avihai Horon wrote:
> Add new function qemu_file_get_to_fd() that allows reading data from
> QEMUFile and writing it straight into a given fd.
> 
> This will be used later in VFIO migration code.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   migration/qemu-file.h |  1 +
>   migration/qemu-file.c | 34 ++++++++++++++++++++++++++++++++++
>   2 files changed, 35 insertions(+)
> 
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index fa13d04d78..9d0155a2a1 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -148,6 +148,7 @@ int qemu_file_shutdown(QEMUFile *f);
>   QEMUFile *qemu_file_get_return_path(QEMUFile *f);
>   void qemu_fflush(QEMUFile *f);
>   void qemu_file_set_blocking(QEMUFile *f, bool block);
> +int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size);
>   
>   void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
>   void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 2d5f74ffc2..79303c9d34 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -940,3 +940,37 @@ QIOChannel *qemu_file_get_ioc(QEMUFile *file)
>   {
>       return file->ioc;
>   }
> +
> +/*
> + * Read size bytes from QEMUFile f and write them to fd.
> + */
> +int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size)
> +{
> +    while (size) {
> +        size_t pending = f->buf_size - f->buf_index;
> +        ssize_t rc;
> +
> +        if (!pending) {
> +            rc = qemu_fill_buffer(f);
> +            if (rc < 0) {
> +                return rc;
> +            }
> +            if (rc == 0) {
> +                return -1;

Given the call stack, -1 would be interpreted  as EPERM. May be EIO instead ?

C.

> +            }
> +            continue;
> +        }
> +
> +        rc = write(fd, f->buf + f->buf_index, MIN(pending, size));
> +        if (rc < 0) {
> +            return rc;
> +        }
> +        if (rc == 0) {
> +            return -1;
> +        }
> +        f->buf_index += rc;
> +        size -= rc;
> +    }
> +
> +    return 0;
> +}


