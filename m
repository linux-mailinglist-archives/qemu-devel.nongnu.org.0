Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ADD315F98
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:39:58 +0100 (CET)
Received: from localhost ([::1]:33874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9jAK-00086V-Tv
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l9irW-0005Tm-PG
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 01:20:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l9irO-0001ja-E9
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 01:20:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612938018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxoJfqDwevnyafq9qyP3nT2TjeO1BooYOaVHz34vWxw=;
 b=Y1EW3wi11/kq92FbM3bWURjYTdQQ0KBhMnVUeDSUvmTBYcCEwGZJbV4eMNCOrnw1lTrcb3
 5zu0UztkhMfPNL2/7lAm2z4D/lG50le5WqJ3JohUG9lXqPan38yyhYGgwOFLKmwPlEBQqq
 tuOwCEGhH3DmT++erCKlsZrqrXIUGp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-LxfQ2iDfP7q7Vv1i2sTo2A-1; Wed, 10 Feb 2021 01:20:08 -0500
X-MC-Unique: LxfQ2iDfP7q7Vv1i2sTo2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B48E2192AB78;
 Wed, 10 Feb 2021 06:20:07 +0000 (UTC)
Received: from [10.72.12.223] (ovpn-12-223.pek2.redhat.com [10.72.12.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F38819C66;
 Wed, 10 Feb 2021 06:20:00 +0000 (UTC)
Subject: Re: [PATCH 0/3] virtio-net: graceful drop of vhost for TAP
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
 <20210209093201-mutt-send-email-mst@kernel.org>
 <20210209145105.GP1166421@redhat.com>
 <20210209095553-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0890bb17-9677-ff1d-bd08-c9be791e1c81@redhat.com>
Date: Wed, 10 Feb 2021 14:19:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210209095553-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: yan@daynix.com, Yuri Benditovich <yuri.benditovich@daynix.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/9 下午11:04, Michael S. Tsirkin wrote:
> On Tue, Feb 09, 2021 at 02:51:05PM +0000, Daniel P. Berrangé wrote:
>> On Tue, Feb 09, 2021 at 09:34:20AM -0500, Michael S. Tsirkin wrote:
>>> On Thu, Feb 04, 2021 at 10:29:12PM +0200, Yuri Benditovich wrote:
>>>> This set of patches introduces graceful switch from tap-vhost to
>>>> tap-no-vhost depending on guest features. Before that the features
>>>> that vhost does not support were silently cleared in get_features.
>>>> This creates potential problem of migration from the machine where
>>>> some of virtio-net features are supported by the vhost kernel to the
>>>> machine where they are not supported (packed ring as an example).
>>> I still worry that adding new features will silently disable vhost for people.
>>> Can we limit the change to when a VM is migrated in?
>> Some management applications expect bi-directional live migration to
>> work, so taking specific actions on incoming migration only feels
>> dangerous.
> Could you be more specific?
>
> Bi-directional migration is currently broken
> when migrating new kernel->old kernel.
>
> This seems to be the motivation for this patch, though I wish
> it was spelled out more explicitly.
>
> People don't complain much, but I'm fine with fixing that
> with a userspace fallback.
>
>
> I'd rather not force the fallback on others though: vhost is generally
> specified explicitly by user while features are generally set
> automatically, so this patch will make us override what user specified,
> not nice.
>
>
>> IMHO if the features we're adding cannot be expected to exist in
>> host kernels in general, then the feature should defualt to off
>> and require explicit user config to enable.
>> Downstream distros which can guarantee newer kernels can flip the
>> default in their custom machine types if they desire.
>>
>> Regards,
>> Daniel
> Unfortunately that will basically mean we are stuck with no new features
> for years. We did what this patch is trying to change for years now, in
> particular KVM also seems to happily disable CPU features not supported
> by kernel so I wonder why we can't keep doing it, with tweaks for some
> corner cases.


It's probably not the corner case.

So my understanding is when a feature is turned on via command line, it 
should not be cleared silently otherwise we may break migration for sure.

E.g when packed=on is specified, we should disable vhost instead of 
clear it from the device.

Thanks


>
> userspace and kernel not being in 100% sync wrt features is not
> a corner case though, and switching backends seems like too big
> a hammer.
>
>> -- 
>> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
>> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
>> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
>


