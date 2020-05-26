Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C80D1E1AA7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 07:18:16 +0200 (CEST)
Received: from localhost ([::1]:54000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdRyh-0003UH-5I
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 01:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jdRxk-00033v-ST
 for qemu-devel@nongnu.org; Tue, 26 May 2020 01:17:16 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49314
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jdRxj-0008A5-VG
 for qemu-devel@nongnu.org; Tue, 26 May 2020 01:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590470234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=gpLfGgbcXomh/COJ9fE//4qHvSZmpzo7PMDHTIX0Gbk=;
 b=Yp5KuObOD9K7NRV/6cOMHPmK3mhshGacfv2c2Zy9PAAv7/fSN6uNdzjjDxeM4a5BVYcOx8
 Vka2xvzm06Sw6PdZ+uFcgQp1hWEmEEorRP5iG3Z6MTte+bHSd4NL0CODlk34alVpLDJY0P
 PoslVcIuQBXI/FsPjFOtBJ7pSScaufc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-rRvsZXhoONCStTXQsJ4P6A-1; Tue, 26 May 2020 01:17:12 -0400
X-MC-Unique: rRvsZXhoONCStTXQsJ4P6A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1F04107ACCD;
 Tue, 26 May 2020 05:17:11 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-138.ams2.redhat.com [10.36.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B5275C1BE;
 Tue, 26 May 2020 05:17:09 +0000 (UTC)
Subject: Re: -nic model=rocker causes qemu to abort
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <eafa7c11-b3af-2247-ddb3-538891ad0732@msgid.tls.msk.ru>
 <1f540f9c-45f3-d02e-a087-d1059d7a8977@redhat.com>
 <a06c7d1b-5d69-0ce0-1cf1-ea9d39cac02c@msgid.tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <fa5e22b0-60e6-e943-2922-89ea8acd183c@redhat.com>
Date: Tue, 26 May 2020 07:17:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a06c7d1b-5d69-0ce0-1cf1-ea9d39cac02c@msgid.tls.msk.ru>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 01:14:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/05/2020 21.46, Michael Tokarev wrote:
> 25.05.2020 21:45, Thomas Huth wrote:
>> On 29/04/2020 18.43, Michael Tokarev wrote:
>>> Hi!
>>>
>>> Just a fun case of (invalid) usage of qemu-system command line.
>>> Someone tried -nic model=rocker, and qemu does this:
>>>
>>>  Unexpected error in object_property_find() at /build/qemu/git/qom/object.c:1029:
>>>  qemu-system-x86_64: Property '.mac' not found
>>>  Aborted
>>>
>>> This happens after this commit:
>>>
>>> commit 52310c3fa7dc854dd2376ae8a518141abcdb78f3
>>> Author: Paolo Bonzini <pbonzini@redhat.com>
>>> Date:   Fri Mar 2 10:30:50 2018 +0100
>>>
>>>     net: allow using any PCI NICs in -net or -nic
>>>
>>> Previously rocker rightly wasn't usable as a nic model,
>>> and after this commit it is now possible.
>>>
>>> While I agree this is invalid usage, perhaps qemu should not
>>> abort like this?  Maybe it should check the required property
>>> too, before allowing this device to be a nic model?
>>
>> QEMU theoretically should never abort() - abort() means there is
>> something wrong in the code ... so we should definitely fix this by
>> other means. Some questions:
>>
>> 1) How is that rocker device normally used? Similar to a normal network
>> card? Or completely different?
> 
> Nope, this is not a network card, it is a network SWITCH, used as a
> regular PCI device, not network-specific. Hence the problem at hand, -
> before the patch this device weren't "nic-able", so to say, because
> while it is network-related PCI device, it is not a NIC.
> 
> I guess while building a list of "nic-able" cards, we should skip some
> "nic-alike" devices and use some more specific criteria. Not everything
> which is network-related is a regular NIC.

Ok, thanks for the explanation! So looking at the properties of the
rocker and real NIC devices again, I think the solution might be simple:
For -nic/-net, we should only consider devices that have a "netdev"
property. I'll try to write a patch when I've got some spare minutes...

 Thomas


