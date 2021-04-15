Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2E83603AA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 09:47:22 +0200 (CEST)
Received: from localhost ([::1]:35906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWwif-00054A-JQ
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 03:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWwfp-000375-Hd
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 03:44:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWwfn-0004zY-PA
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 03:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618472662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CPYZyj3JYehJvrgfPZB466pBG5U1RDr5+pkJtOPvUps=;
 b=ZbzBLPeT34VkRfJBL5vDT3w33y3UlEEu8ZRvssduPalw3WyyWKZP+lsPGxahwbsvit6Nsj
 FaVatfZYiycxkeM6O6FY2DrEKdzIPUifjTXyubqQ9CBCwPWPeMzarQGC4oPaIE4DPl1Nl3
 Iiio3UPb6kiJVKO/+eGa25CGT2c5+3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-5zgyiT_CNqWx4dneBIfPaw-1; Thu, 15 Apr 2021 03:44:18 -0400
X-MC-Unique: 5zgyiT_CNqWx4dneBIfPaw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 990898030C4;
 Thu, 15 Apr 2021 07:44:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BDA010074E1;
 Thu, 15 Apr 2021 07:44:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8B0ED113525D; Thu, 15 Apr 2021 09:44:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-6.1 3/4] qapi/qom.json: Do not use
 CONFIG_VIRTIO_CRYPTO in common code
References: <20210414112004.943383-1-thuth@redhat.com>
 <20210414112004.943383-4-thuth@redhat.com>
 <87tuo9j7hw.fsf@dusky.pond.sub.org>
 <b5a3e83d-ec62-d5ce-b03c-d33f7419a5e9@redhat.com>
Date: Thu, 15 Apr 2021 09:44:15 +0200
In-Reply-To: <b5a3e83d-ec62-d5ce-b03c-d33f7419a5e9@redhat.com> (Thomas Huth's
 message of "Thu, 15 Apr 2021 08:15:55 +0200")
Message-ID: <875z0of0vk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 14/04/2021 15.55, Markus Armbruster wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>> 
>>> The ObjectType enum and ObjectOptions are included from qapi-types-qom.h
>>> into common code. We should not use target-specific config switches like
>>> CONFIG_VIRTIO_CRYPTO here, since this is not defined in common code and
>>> thus the enum will look differently between common and target specific
>>> code. For this case, it's hopefully enough to check for CONFIG_VHOST_CRYPTO
>>> only (which is a host specific config switch, i.e. it's the same on all
>>> targets).
>> 
>> Drawback: introspection now claims cryptodev-vhost-user is among the
>> values of qom-type, which is a lie when !defined(CONFIG_VIRTIO_CRYPTO).
>> 
>> Is this the first lie about QOM object types?
>> 
>> Do we care?
>
> I don't think we really care, since there are other entries in the list 
> which are obviously only available on certain targets or configurations, but 
> not fenced with "if"s, e.g. s390-pv-guest, input-linux or rng-random.

So introspection already flawed, and adding another instance doesn't
really make it worse.

> Or do you see a special problem with cryptodev-vhost-user here?

No, only the general problem that query-qmp-schema can't reliably tell
us what QOM types are available.

I see no need to revert the patch.

>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   qapi/qom.json | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/qapi/qom.json b/qapi/qom.json
>>> index db5ac419b1..cd0e76d564 100644
>>> --- a/qapi/qom.json
>>> +++ b/qapi/qom.json
>>> @@ -752,7 +752,7 @@
>>>       'cryptodev-backend',
>>>       'cryptodev-backend-builtin',
>>>       { 'name': 'cryptodev-vhost-user',
>>> -      'if': 'defined(CONFIG_VIRTIO_CRYPTO) && defined(CONFIG_VHOST_CRYPTO)' },
>>> +      'if': 'defined(CONFIG_VHOST_CRYPTO)' },
>>>       'dbus-vmstate',
>>>       'filter-buffer',
>>>       'filter-dump',
>>> @@ -809,7 +809,7 @@
>>>         'cryptodev-backend':          'CryptodevBackendProperties',
>>>         'cryptodev-backend-builtin':  'CryptodevBackendProperties',
>>>         'cryptodev-vhost-user':       { 'type': 'CryptodevVhostUserProperties',
>>> -                                      'if': 'defined(CONFIG_VIRTIO_CRYPTO) && defined(CONFIG_VHOST_CRYPTO)' },
>>> +                                      'if': 'defined(CONFIG_VHOST_CRYPTO)' },
>>>         'dbus-vmstate':               'DBusVMStateProperties',
>>>         'filter-buffer':              'FilterBufferProperties',
>>>         'filter-dump':                'FilterDumpProperties',
>> 
>> Could CryptodevVhostUserProperties be conditional, too?
>
> That's certainly a question for the QOM experts here...

Here's the expert's method to find out: slap on the conditional,
compile with all targets enabled, see whether any of them explode.

Mind to try?


