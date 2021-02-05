Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56941310C77
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:08:39 +0100 (CET)
Received: from localhost ([::1]:40930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l81mo-0007bx-9a
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:08:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l81lm-000762-34
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:07:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l81lk-0002rj-6p
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:07:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612534050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8osqUjNLad5Li8K/E9Elc/gsq4TtN4e1Pvyf+o0K8b4=;
 b=hUAN0FH2j4T2q9ssmy/+xo4SnoaQZCD01PUj6ntaGRPLynqvNEyJ1cghB1RfBa8lJfvEN/
 lCO6SaZc9La4FFj1an9jbsBL+gg4511FQbRP9c9EEBe2z+f4OdC6vnxrPV1xc+lKrxPUfm
 Pj4fYE0lF4KzyaLZ4cv559mmYeFB1pI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-gKuy0bqpOT-5KQmBl1TXGA-1; Fri, 05 Feb 2021 09:07:28 -0500
X-MC-Unique: gKuy0bqpOT-5KQmBl1TXGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8699C10866AE;
 Fri,  5 Feb 2021 14:06:55 +0000 (UTC)
Received: from [10.3.112.253] (ovpn-112-253.phx2.redhat.com [10.3.112.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7D0C63623;
 Fri,  5 Feb 2021 14:06:53 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-2-eblake@redhat.com>
 <a141ad8f-113e-b769-931a-767e0807a1f9@redhat.com>
 <21fcd50e-b5c2-d35c-0555-7d26014370ee@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 1/3] utils: Improve qemu_strtosz() to have 64 bits of
 precision
Message-ID: <f2463f98-90a9-380d-06dd-9e410c32cfe3@redhat.com>
Date: Fri, 5 Feb 2021 08:06:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <21fcd50e-b5c2-d35c-0555-7d26014370ee@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, berrange@redhat.com, qemu-block@nongnu.org,
 tao3.xu@intel.com, armbru@redhat.com, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 4:06 AM, Vladimir Sementsov-Ogievskiy wrote:

>>> -    /*
>>> -     * Values near UINT64_MAX overflow to 2**64 when converting to
>>> double
>>> -     * precision.  Compare against the maximum representable double
>>> precision
>>> -     * value below 2**64, computed as "the next value after 2**64
>>> (0x1p64) in
>>> -     * the direction of 0".
>>> -     */
>>> -    if ((val * mul > nextafter(0x1p64, 0)) || val < 0) {
>>> +    if (val > UINT64_MAX / mul) {
>>
>> Hmm, do we care about:
>> 15.9999999999999999999999999999E
>> where the fractional portion becomes large enough to actually bump our
>> sum below to 16E which indeed overflows?  Then again, we rejected a
>> fraction of 1.0 above, and 0.9999999999999999999999999999 parses to 1.0
>> due to rounding.
>> Maybe it's just worth a good comment why the overflow check here works
>> without consulting fraction.
> 
> worth a good comment, because I don't follow :)
> 
> If mul is big enough and fraction=0.5, why val*mul + fraction*mul will
> not overflow?

When mul is a power of 2, we know that fraction*mul does not change the
number of significant bits, but merely moves the exponent, so starting
with fraction < 1.0, we know fraction*mul < mul.  But when @unit is
1000, there is indeed a rare possibility that the multiplication will
cause an inexact answer that will trigger rounding, so we could end up
with fraction*mul == mul.  So I'm not yet 100% confident that there is
no possible combination where we can't cause an overflow to result in
val*mul + (uint64_t)(fraction*mul) resulting in 0 instead of UINT64_MAX,
and I think I will have to tighten this code up for v2.


> 
> Also, if we find '.' in the number, why not just reparse the whole
> number with qemu_strtod_finite? And don't care about 1.0?

Reparsing the whole number loses precision. Since we already have a
64-bit precise integer, why throw it away?

> 
>>
>>>           retval = -ERANGE;
>>>           goto out;
>>>       }
>>> -    *result = val * mul;
>>> +    *result = val * mul + (uint64_t) (fraction * mul);
>>>       retval = 0;
>>>
>>>   out:
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


