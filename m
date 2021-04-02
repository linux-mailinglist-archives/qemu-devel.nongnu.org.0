Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FEB35265E
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 07:06:36 +0200 (CEST)
Received: from localhost ([::1]:33680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSC0x-00071W-11
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 01:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lSBzt-0006aq-GP
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 01:05:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lSBzp-0001BF-Hm
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 01:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617339923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+vDFOVXELt5FPqU2eIBoJhRC27AD7c/qDE8JANf2lg=;
 b=gYc8iHLApDk21p+lw7eulZKOqK2gFMTiRKrc6WJx6qvqcWM1ERoXZ8tmZ2DsMoM5Hy/yCb
 DHyaV71+omEYXKOJlT1hWiqPIet2h2UjNlSuwXcg9ZzHr3qq4vIkK63YbLtk2EYhuQigzW
 nNwXyCdB5B0pTVYEhn8O8wMzIDU3Mrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-U5MznYnSNzy9g6omb_P44Q-1; Fri, 02 Apr 2021 01:05:21 -0400
X-MC-Unique: U5MznYnSNzy9g6omb_P44Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B83E1005D5A;
 Fri,  2 Apr 2021 05:05:20 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-24.pek2.redhat.com
 [10.72.12.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E92C5F9C5;
 Fri,  2 Apr 2021 05:05:11 +0000 (UTC)
Subject: Re: [RFC PATCH v2 0/3] virtio-net: graceful drop of vhost for TAP
From: Jason Wang <jasowang@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20210322122452.369750-1-yuri.benditovich@daynix.com>
 <aa33a355-5980-5ff5-7264-02d6fc7f5f9d@redhat.com>
 <CAOEp5Od+jPYdmFdD3z3hVjs5t6QXgmEoOTPHO5cLVyifjmjgRQ@mail.gmail.com>
 <e3971d80-6b7c-2e47-9ee9-41f08d0a9df9@redhat.com>
 <CAOEp5OfBpq_DjD4k_enGCuDkV9d738wyW9ye6Uk9vsnD+jS7eA@mail.gmail.com>
 <a7088e13-559b-560e-67e1-a2b8a3fed19e@redhat.com>
Message-ID: <b05de350-dd4c-bd4b-ea95-dade90b0a44c@redhat.com>
Date: Fri, 2 Apr 2021 13:05:10 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <a7088e13-559b-560e-67e1-a2b8a3fed19e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Yan Vugenfirer <yan@daynix.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/3/26 下午5:18, Jason Wang 写道:
>>> ?
>> I assume that  both src and dest started with vhost=on.
>>
>> As driver B supports both packed and split, you can switch from driver
>> A to driver B after migration
>> and driver B will work with split. Exactly as it does today.
>>
>> The key question is what is more important - vhost or features that
>> vhost does not support?
>> current code says: vhost is more important always
>> v1 patch says: features are more important always.
>> v2 patch says: vhost is more important at init time, features are more
>> important at migration time.
>> Because we are able to drop vhost but we can't drop features when we
>> have a running driver.
>> Do you agree?
>
>
> I think what came from cli is the most important. So if I understand 
> correclty:
>
> - vhost=on means "turn on vhost when possible" it implies that 
> fallback is allowed (we had already had fallback codes)
> - vhostforce=on means "turn on vhost unconditonally" it implies that 
> we can't do fallback
>
> So my understanding is that:
>
> - "vhost=on, packed=on", we can fallback to userspace but must keep 
> packed virtqueue works
> - "vhost=on,vhostforce=on,packed=on", we can't fallback and must keep 
> both vhost and packed virtqueue work, if we can't we need to fail
>
> Thanks


Daniel and Michael, am I right here?

We need some inputs to move forward to fix the migration compatibility 
issue.

Thanks



