Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE392167F8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 10:04:24 +0200 (CEST)
Received: from localhost ([::1]:41406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsiaV-0002aw-Eo
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 04:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jsiZi-0002Bp-T6
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 04:03:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26069
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jsiZh-0004JK-2O
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 04:03:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594109012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sxruZ6VIDO1N3VFJPfyVeomLC0U3JicjpBExE5taBBM=;
 b=ZMcfCYFWLViYHL4/X8Cobf7jIvaWNnhj1PPTyGtz0ueAjsomlg9MQixWL7me/nNbV/lH7i
 IWIZgGhBAwqowrsWDQ6Y+oQbFgUaPTZ2SHx6rBRwOQHINjcP61hdGS29Z7pI0LpX45zZiw
 S6P4MVAfyvpXDBkaPLtiK95Cbucqtuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-HrKx5Dw3NGOFzDRiZJslkA-1; Tue, 07 Jul 2020 04:03:28 -0400
X-MC-Unique: HrKx5Dw3NGOFzDRiZJslkA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 630421005510;
 Tue,  7 Jul 2020 08:03:27 +0000 (UTC)
Received: from [10.72.13.254] (ovpn-13-254.pek2.redhat.com [10.72.13.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81F51275E3E;
 Tue,  7 Jul 2020 08:03:12 +0000 (UTC)
Subject: Re: [RFC v2 1/1] memory: Delete assertion in
 memory_region_unregister_iommu_notifier
To: Peter Xu <peterx@redhat.com>
References: <8cf25190-53e6-8cbb-372b-e3d4ec714dc5@redhat.com>
 <20200628144746.GA239443@xz-x1>
 <54d2cdfd-97b8-9e1d-a607-d7a5e96be3a1@redhat.com>
 <20200629133403.GA266532@xz-x1>
 <2589d0e9-cc5b-a4df-8790-189b49f1a40e@redhat.com>
 <20200630153911.GD3138@xz-x1>
 <69f6d6e7-a0b1-abae-894e-4e81b7e0cc90@redhat.com>
 <ff9e7af0-18c4-57e8-fc94-904fdce1123a@redhat.com>
 <20200702154540.GI40675@xz-x1>
 <34fe0e55-c0ae-8e56-462b-6281b6cca4f5@redhat.com>
 <20200703130338.GD6677@xz-x1>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c985b804-126c-94a1-b05e-430075f9e390@redhat.com>
Date: Tue, 7 Jul 2020 16:03:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200703130338.GD6677@xz-x1>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:46:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>,
 Juan Quintela <quintela@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/7/3 下午9:03, Peter Xu wrote:
> On Fri, Jul 03, 2020 at 03:24:19PM +0800, Jason Wang wrote:
>> On 2020/7/2 下午11:45, Peter Xu wrote:
>>> On Thu, Jul 02, 2020 at 11:01:54AM +0800, Jason Wang wrote:
>>>> So I think we agree that a new notifier is needed?
>>> Good to me, or a new flag should be easier (IOMMU_NOTIFIER_DEV_IOTLB)?
>>
>> That should work but I wonder something as following is better.
>>
>> Instead of introducing new flags, how about carry the type of event in the
>> notifier then the device (vhost) can choose the message it want to process
>> like:
>>
>> static vhost_iommu_event(IOMMUNotifier *n, IOMMUTLBEvent *event)
>>
>> {
>>
>> switch (event->type) {
>>
>> case IOMMU_MAP:
>> case IOMMU_UNMAP:
>> case IOMMU_DEV_IOTLB_UNMAP:
>> ...
>>
>> }
> Looks ok to me, though imo we should still keep the registration information,
> so VT-d knows which notifiers is interested in which events.  E.g., we can
> still do something like vtd_as_has_map_notifier().


Is this for a better performance?

I wonder whether it's worth since we can't not have both vhost and vtd 
to be registered into the same as.

So it should be functional equivalent to vtd_as_has_notifier().

Thanks


>
> So these are probably two different things: the new IOMMU_NOTIFIER_DEV_IOTLB
> flag is one as discussed; the other one is whether we would like to introduce
> IOMMUTLBEvent to include the type, so that we can avoid introduce two notifiers
> for one device majorly to identify dev-iotlb from unmaps.
>
> Thanks,
>


