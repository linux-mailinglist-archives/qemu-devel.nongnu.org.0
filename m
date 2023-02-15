Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946B06982E9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:04:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSM99-0002xY-5T; Wed, 15 Feb 2023 13:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSM97-0002xI-4G
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:04:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSM95-0004pD-Dd
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676484282;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=npLmYurWh0DYCpExUmGzk8iSgN0rS0U9c6rrzZl5VoQ=;
 b=QExmAPovjSY5AKUTlwhMy1kvjghS7TQP4aeyABKvSbEE6QWUW/wM70xxy6WTSmhu7l/3sU
 drvuvO0sTe6G8duH8zKaHt3tXGG2u4Kv62OJkFQ2pUwge5LY1cxWTqzU5mDDTPNofghouU
 KcjQL9Qma1yvykqXl27SamvjCSfDKpc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-39-iCoE-spGOIOBiwdsoLntAw-1; Wed, 15 Feb 2023 13:04:37 -0500
X-MC-Unique: iCoE-spGOIOBiwdsoLntAw-1
Received: by mail-wm1-f72.google.com with SMTP id
 j40-20020a05600c1c2800b003e2036a1516so1369205wms.7
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 10:04:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=npLmYurWh0DYCpExUmGzk8iSgN0rS0U9c6rrzZl5VoQ=;
 b=2EV7o/QCalS/W2Knmq6VLQu3UEt6XlDRPr+ZLCUcwSfIOUx0CyAQA1515s7Wg2QrZt
 +nx8YEwGHn9oo2ZUWROJuvcOHYjaaoaGPXl6QhJa+Km814f/gCl06EUKTH7LkBvaJBo7
 ljwSuF6KAk4sjG++eL2WeB+siqIfp/gbmQu09zoEIsvhAcrugyv+ZWwqScSBLH13CXrh
 Y8l26JHiskHsvkAlopXENB6G0Kvy0qeiX1yhqd8qpCQ+tauMbmJvGlfPAhSQKpAWHEDO
 MN/ok9KpSpwGVdiemucsP3TuhMt591IGWNFapvJLWzRlue02EnCFtCRBCf1WcGBPn2lZ
 L0jA==
X-Gm-Message-State: AO0yUKW2KQXOd0RRNyrwUcjCrVCzKmigwj5dMMgLMP9RAdxzeQdV7OUR
 350LL5+Md9Iaho8+Ov19BrL+Wfz1vOM6MV+NN4pyUAJC/zAFM30gjXEiMwf35ISP0CHAI14VdWX
 LzSMFI7GPKM8cW04=
X-Received: by 2002:a05:600c:a293:b0:3dc:5b79:2dbb with SMTP id
 hu19-20020a05600ca29300b003dc5b792dbbmr2749624wmb.25.1676484275889; 
 Wed, 15 Feb 2023 10:04:35 -0800 (PST)
X-Google-Smtp-Source: AK7set/tM6B3I4g86woFY0l8EP3wqxxkp8L27PaJPUfUqo33z8bh1Jw1AIdJ2u8ODKu19i6GsWLUFQ==
X-Received: by 2002:a05:600c:a293:b0:3dc:5b79:2dbb with SMTP id
 hu19-20020a05600ca29300b003dc5b792dbbmr2749590wmb.25.1676484275583; 
 Wed, 15 Feb 2023 10:04:35 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 l19-20020a1ced13000000b003e1f6e18c95sm2816801wmh.21.2023.02.15.10.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 10:04:34 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org,  Alex Williamson <alex.williamson@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Cornelia Huck <cohuck@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,  Yishai
 Hadas <yishaih@nvidia.com>,  Jason Gunthorpe <jgg@nvidia.com>,  Maor
 Gottlieb <maorg@nvidia.com>,  Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>,  Joao Martins
 <joao.m.martins@oracle.com>
Subject: Re: [PATCH v10 03/12] vfio/migration: Allow migration without VFIO
 IOMMU dirty tracking support
In-Reply-To: <2efede77-0b06-0efa-1ea2-86300307c86f@nvidia.com> (Avihai Horon's
 message of "Wed, 15 Feb 2023 19:47:58 +0200")
References: <20230209192043.14885-1-avihaih@nvidia.com>
 <20230209192043.14885-4-avihaih@nvidia.com>
 <8735773xr7.fsf@secure.mitica>
 <2efede77-0b06-0efa-1ea2-86300307c86f@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 15 Feb 2023 19:04:33 +0100
Message-ID: <87sff6ztxq.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Avihai Horon <avihaih@nvidia.com> wrote:
> On 15/02/2023 14:43, Juan Quintela wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> Avihai Horon <avihaih@nvidia.com> wrote:
>>> Currently, if IOMMU of a VFIO container doesn't support dirty page
>>> tracking, migration is blocked. This is because a DMA-able VFIO device
>>> can dirty RAM pages without updating QEMU about it, thus breaking the
>>> migration.
>>>
>>> However, this doesn't mean that migration can't be done at all.
>>> In such case, allow migration and let QEMU VFIO code mark all pages
>>> dirty.
>>>
>>> This guarantees that all pages that might have gotten dirty are reported
>>> back, and thus guarantees a valid migration even without VFIO IOMMU
>>> dirty tracking support.
>>>
>>> The motivation for this patch is the introduction of iommufd [1].
>>> iommufd can directly implement the /dev/vfio/vfio container IOCTLs by
>>> mapping them into its internal ops, allowing the usage of these IOCTLs
>>> over iommufd. However, VFIO IOMMU dirty tracking is not supported by
>>> this VFIO compatibility API.
>>>
>>> This patch will allow migration by hosts that use the VFIO compatibility
>>> API and prevent migration regressions caused by the lack of VFIO IOMMU
>>> dirty tracking support.
>>>
>>> [1]
>>> https://lore.kernel.org/kvm/0-v6-a196d26f289e+11787-iommufd_jgg@nvidia.=
com/
>>>
>>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>>> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>
>> I know why you are doing this.
>>
>> But I think this should print a warning, error, somewhere.
>
> IMHO, I'm not sure it's really necessary.
>
> To enable VFIO migration the user must explicitly set x-enable-migration=
=3Don.
> I guess in this case the user is well aware of the dirty tracking
> capabilities the VFIO device has or doesn't have.
> So I don't think adding this error/warning will help much.

Oops.  I missed that bit.
I retire my objection.

Sorry, Juan.

> Thanks.
>
>>
>> You are just dirtying all pages each time we arrive here.
>>
>> Even calling the featura "experimental" is an understatement.
>>
>> Later, Juan.
>>


