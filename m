Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA57206F81
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 10:54:43 +0200 (CEST)
Received: from localhost ([::1]:44734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo1B4-000638-HC
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 04:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jo0x4-0006jx-O9
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 04:40:14 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27849
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jo0x2-0003ww-OV
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 04:40:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592988012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3mYIOGDGyhp9DNBnyz/oxJkDPp/nfQzRlG5pgjiksbE=;
 b=B0j1liTcx0vq/I4qd6jLvjgjHMo5dowx902Z3fNcj6NJ4Sr8LtD5wZFW+becGXuNyV3cM9
 aA0985rUoRc3sU7wVMvu/mlK9fg5QjOYWFEGkHnVvgoKxolytYutPA45b/q8FYuqEWgV6q
 uC1ifembjR3MkRd7J8U9XKD2D08d9NU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-9D8fBpFRNZO590KeCAPOVw-1; Wed, 24 Jun 2020 04:40:10 -0400
X-MC-Unique: 9D8fBpFRNZO590KeCAPOVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43859800C64;
 Wed, 24 Jun 2020 08:40:09 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D96FC2B47C;
 Wed, 24 Jun 2020 08:40:07 +0000 (UTC)
Subject: Re: [PATCH] qom: Allow object_property_add_child() to fail
To: Markus Armbruster <armbru@redhat.com>
References: <20200623155452.30954-1-eric.auger@redhat.com>
 <87eeq4dgax.fsf@dusky.pond.sub.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <7a6cffc5-bab3-7ff5-64e9-960bd6b24292@redhat.com>
Date: Wed, 24 Jun 2020 10:40:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <87eeq4dgax.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 01:59:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Markus,

On 6/24/20 10:22 AM, Markus Armbruster wrote:
> Eric Auger <eric.auger@redhat.com> writes:
> 
>> object_property_add() does not allow object_property_try_add()
>> to gracefully fail as &error_abort is passed as an error handle.
>>
>> However such failure can easily be triggered from the QMP shell when,
>> for instance, one attempts to create an object with an id that already
>> exists:
>>
>> For instance, call twice:
>> object-add qom-type=memory-backend-ram id=mem1 props.size=1073741824
>> and QEMU aborts.
>>
>> This behavior is undesired as a user/management application mistake
>> in reusing a property ID shouldn't result in loss of the VM and live
>> data within.
>>
>> This patch introduces two new functions, object_property_add_err() and
>> object_property_add_child_err() whose prototype features an error handle.
>> object_property_add_child_err() now gets called from user_creatable_add_type.
>> This solution was chosen instead of changing the prototype of existing
>> functions because the number of existing callers is huge.
>>
>> The error now is returned gracefully to the QMP client.
>>
>> (QEMU) object-add qom-type=memory-backend-ram id=mem2  props.size=4294967296
>> {"return": {}}
>> (QEMU) object-add qom-type=memory-backend-ram id=mem2  props.size=4294967296
>> {"error": {"class": "GenericError", "desc": "attempt to add duplicate property
>> 'mem2' to object (type 'container')"}}
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> Recent regression, my fault.  Please point that out, and add
> 
>   Fixes: d2623129a7dec1d3041ad1221dda1ca49c667532
Thanks you for the reference. I will add the tag.

Eric
> 


