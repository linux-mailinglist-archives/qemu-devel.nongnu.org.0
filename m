Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8921F4D6E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 08:03:02 +0200 (CEST)
Received: from localhost ([::1]:44886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jitpF-0005OL-2C
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 02:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jith0-0004CF-E9
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 01:54:30 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20395
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jitgy-0007rT-J6
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 01:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591768467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uegmMcuk4pFLcQ1UN2sVC8vVe/47eSxBzL/QCXVnwVY=;
 b=CxDshkf2zpRc3W0ggLLymQXMgwpeRhKmKFmIxlpL+nuaxIR+d/pV3IrLF46jCCwfko53yT
 EihiNe4dccde8qN0DzHzrSkbE3Dsf5NaG5yNUHm/JXSryFHjVZPkiVSNco6908GIPIgP6s
 /CFGo93zYbbdaL/fQLyY49y0EIWDd8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-QU02jJvONtqUxxrZbioLNQ-1; Wed, 10 Jun 2020 01:54:23 -0400
X-MC-Unique: QU02jJvONtqUxxrZbioLNQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54674BFC0;
 Wed, 10 Jun 2020 05:54:22 +0000 (UTC)
Received: from [10.72.13.194] (ovpn-13-194.pek2.redhat.com [10.72.13.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E4CA891CE;
 Wed, 10 Jun 2020 05:53:59 +0000 (UTC)
Subject: Re: [PATCH v2 4/7] vhost: involve device backends in feature
 negotiation
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200609170218.246468-1-stefanha@redhat.com>
 <20200609170218.246468-5-stefanha@redhat.com>
 <20200609135007-mutt-send-email-mst@kernel.org>
 <37ac3fbb-9a9b-9290-abee-a8603c81925c@redhat.com>
 <20200610001156-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1e503661-0652-b0dc-f900-8cd9aca2ccb8@redhat.com>
Date: Wed, 10 Jun 2020 13:53:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610001156-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 23:51:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>, cohuck@redhat.com,
 qemu-devel@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/6/10 下午12:15, Michael S. Tsirkin wrote:
> On Wed, Jun 10, 2020 at 11:21:50AM +0800, Jason Wang wrote:
>> On 2020/6/10 上午2:07, Michael S. Tsirkin wrote:
>>>> +/*
>>>> + * Default vhost_get_features() feature bits for existing device types that do
>>>> + * not define their own.
>>>> + *
>>>> + * This is a workaround for existing device types, do not use this in new vhost
>>>> + * device types. Explicitly define a list of feature bits instead.
>>>> + *
>>>> + * The following feature bits are excluded because libvhost-user device
>>>> + * backends did not advertise them for a long time. Therefore we cannot detect
>>>> + * their presence. Instead we assume they are always supported by the device
>>>> + * backend:
>>>> + * VIRTIO_F_NOTIFY_ON_EMPTY
>>>> + * VIRTIO_F_ANY_LAYOUT
>>>> + * VIRTIO_F_VERSION_1
>>>> + * VIRTIO_RING_F_INDIRECT_DESC
>>>> + * VIRTIO_RING_F_EVENT_IDX
>>> Weird. I remember that it's common for vhost-user not to set
>>> VIRTIO_RING_F_INDIRECT_DESC - they have huge queues so
>>> don't need it and inline descriptors give them better
>>> performance.
>>>
>>> So what's going on here?
>>
>> I guess one reason is to support live migration between vhost-user and
>> vhost-net.
>>
>> Thanks
>>
> But how can we force-enable features backend doesn't want to enable?


We can't and the code just forces qemu to validate 
VIRTIO_RING_F_INDIRECT_DESC for each vhost backends instead of assuming 
the support silently.

Thanks


> This may or may not break backends ...
> I would rather just be strict and ask backends to fix their feature
> bits. See user_feature_bits in hw/net/vhost-net.c which supports
> all these features.
>


