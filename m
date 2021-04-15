Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748D53603D2
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 10:05:03 +0200 (CEST)
Received: from localhost ([::1]:48276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWwzm-0003Nz-2c
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 04:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWwy7-0002x3-04
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 04:03:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWwy3-0008FX-PB
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 04:03:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618473793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=69XIKET434mMwAl3GVOCY35oVp6FvUu/Rq7HaOkwu/I=;
 b=ZQZZm2nFno1+N1Hh4TAOs7h4I/gTA4IgrAB/jD+X+vPVkVH/IA9Y7MW0CJ2MZGVKLBFGt9
 WNp70YlmebWFhnKyFHhE7PDLvYQeFbmkcoIDIpSsTnNfcP3025tTMuZn6FIuvpL8x7DPPB
 a3I7Aq3mrCQX6wgXqogd7d5zVkrNBw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-CJhN3jU2P1Web8uMRrQ3qA-1; Thu, 15 Apr 2021 04:03:10 -0400
X-MC-Unique: CJhN3jU2P1Web8uMRrQ3qA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FBC91008062;
 Thu, 15 Apr 2021 08:03:08 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-39.ams2.redhat.com [10.36.112.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 913642B3C2;
 Thu, 15 Apr 2021 08:03:02 +0000 (UTC)
Subject: Re: [PATCH for-6.1 3/4] qapi/qom.json: Do not use
 CONFIG_VIRTIO_CRYPTO in common code
To: Markus Armbruster <armbru@redhat.com>
References: <20210414112004.943383-1-thuth@redhat.com>
 <20210414112004.943383-4-thuth@redhat.com>
 <87tuo9j7hw.fsf@dusky.pond.sub.org>
 <b5a3e83d-ec62-d5ce-b03c-d33f7419a5e9@redhat.com>
 <875z0of0vk.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d5a7d5e9-2e72-feb5-3386-63f3d7430f2f@redhat.com>
Date: Thu, 15 Apr 2021 10:03:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <875z0of0vk.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/04/2021 09.44, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 14/04/2021 15.55, Markus Armbruster wrote:
>>> Thomas Huth <thuth@redhat.com> writes:
>>>
>>>> The ObjectType enum and ObjectOptions are included from qapi-types-qom.h
>>>> into common code. We should not use target-specific config switches like
>>>> CONFIG_VIRTIO_CRYPTO here, since this is not defined in common code and
>>>> thus the enum will look differently between common and target specific
>>>> code. For this case, it's hopefully enough to check for CONFIG_VHOST_CRYPTO
>>>> only (which is a host specific config switch, i.e. it's the same on all
>>>> targets).
>>>
>>> Drawback: introspection now claims cryptodev-vhost-user is among the
>>> values of qom-type, which is a lie when !defined(CONFIG_VIRTIO_CRYPTO).
>>>
>>> Is this the first lie about QOM object types?
>>>
>>> Do we care?
>>
>> I don't think we really care, since there are other entries in the list
>> which are obviously only available on certain targets or configurations, but
>> not fenced with "if"s, e.g. s390-pv-guest, input-linux or rng-random.
> 
> So introspection already flawed, and adding another instance doesn't
> really make it worse.
> 
>> Or do you see a special problem with cryptodev-vhost-user here?
> 
> No, only the general problem that query-qmp-schema can't reliably tell
> us what QOM types are available.
> 
> I see no need to revert the patch.
> 
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    qapi/qom.json | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/qapi/qom.json b/qapi/qom.json
>>>> index db5ac419b1..cd0e76d564 100644
>>>> --- a/qapi/qom.json
>>>> +++ b/qapi/qom.json
>>>> @@ -752,7 +752,7 @@
>>>>        'cryptodev-backend',
>>>>        'cryptodev-backend-builtin',
>>>>        { 'name': 'cryptodev-vhost-user',
>>>> -      'if': 'defined(CONFIG_VIRTIO_CRYPTO) && defined(CONFIG_VHOST_CRYPTO)' },
>>>> +      'if': 'defined(CONFIG_VHOST_CRYPTO)' },
>>>>        'dbus-vmstate',
>>>>        'filter-buffer',
>>>>        'filter-dump',
>>>> @@ -809,7 +809,7 @@
>>>>          'cryptodev-backend':          'CryptodevBackendProperties',
>>>>          'cryptodev-backend-builtin':  'CryptodevBackendProperties',
>>>>          'cryptodev-vhost-user':       { 'type': 'CryptodevVhostUserProperties',
>>>> -                                      'if': 'defined(CONFIG_VIRTIO_CRYPTO) && defined(CONFIG_VHOST_CRYPTO)' },
>>>> +                                      'if': 'defined(CONFIG_VHOST_CRYPTO)' },
>>>>          'dbus-vmstate':               'DBusVMStateProperties',
>>>>          'filter-buffer':              'FilterBufferProperties',
>>>>          'filter-dump':                'FilterDumpProperties',
>>>
>>> Could CryptodevVhostUserProperties be conditional, too?
>>
>> That's certainly a question for the QOM experts here...
> 
> Here's the expert's method to find out: slap on the conditional,
> compile with all targets enabled, see whether any of them explode.
> 
> Mind to try?

Yes. I've currently got plenty of other stuff to do. So I'd prefer if you 
could give it a try instead.

  Thomas


