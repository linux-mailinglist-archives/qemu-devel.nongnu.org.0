Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B15346AE6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 22:17:26 +0100 (CET)
Received: from localhost ([::1]:35488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOoOy-0000nl-Vz
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 17:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOoMW-0007Xv-PD
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:14:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOoMT-0000tg-L2
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616534088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XU3DgzcJNZaDIHr2ih2EOsccVyy+ZAfq4Kj31xfl2Ac=;
 b=JSgTfHC8lq+FqsqFacd5p8Pfdv3Hi9vKPZXb6tRyHIbJ5qESNQgGGaEYNzOzXpTc/2G3dK
 62h1wx38wAn9RFwR9ilI7gF/vUTZLdixIf1NNsI4lkGigDI5rwYZUtRX6ck3J1Vd7F8fbb
 Qc+0nWbuxLi5f3Y414t827Uu11OfvdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-SWpuVySxMQ2ObUibzWb8SQ-1; Tue, 23 Mar 2021 17:14:46 -0400
X-MC-Unique: SWpuVySxMQ2ObUibzWb8SQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2139107ACCD;
 Tue, 23 Mar 2021 21:14:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 808865C1C5;
 Tue, 23 Mar 2021 21:14:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 140CC11327E1; Tue, 23 Mar 2021 22:14:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 10/28] qapi: Rework name checking in preparation of
 stricter checking
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-11-armbru@redhat.com>
 <ed036808-1666-8efd-14d4-dfe0863dfa4a@redhat.com>
 <87tup1on0z.fsf@dusky.pond.sub.org>
Date: Tue, 23 Mar 2021 22:14:41 +0100
In-Reply-To: <87tup1on0z.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Tue, 23 Mar 2021 17:25:16 +0100")
Message-ID: <87tup1lghq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: jsnow@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Eric Blake <eblake@redhat.com> writes:
>
>> On 3/23/21 4:40 AM, Markus Armbruster wrote:
>>> Naming rules differ for the various kinds of names.  To prepare
>>> enforcing them, define functions to check them: check_name_upper(),
>>> check_name_lower(), and check_name_camel().  For now, these merely
>>> wrap around check_name_str(), but that will change shortly.  Replace
>>> the other uses of check_name_str() by appropriate uses of the
>>> wrappers.  No change in behavior just yet.
>>> 
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>  scripts/qapi/expr.py | 51 +++++++++++++++++++++++++++++++-------------
>>>  1 file changed, 36 insertions(+), 15 deletions(-)
>>> 
>>
>>> +++ b/scripts/qapi/expr.py
>>> @@ -21,11 +21,12 @@
>>>  from .error import QAPISemError
>>>  
>>>  
>>> -# Names must be letters, numbers, -, and _.  They must start with letter,
>>> -# except for downstream extensions which must start with __RFQDN_.
>>> -# Dots are only valid in the downstream extension prefix.
>>> -valid_name = re.compile(r'^(__[a-zA-Z0-9.-]+_)?'
>>> -                        '[a-zA-Z][a-zA-Z0-9_-]*$')
>>
>> I'm assuming python concatenates r'' with '' in the obvious manner...
>>
>>> +# Names consist of letters, digits, -, and _, starting with a letter.
>>> +# An experimental name is prefixed with x-.  A name of a downstream
>>> +# extension is prefixed with __RFQDN_.  The latter prefix goes first.
>>> +valid_name = re.compile(r'(__[a-z0-9.-]+_)?'
>>> +                        r'(x-)?'
>>> +                        r'([a-z][a-z0-9_-]*)$', re.IGNORECASE)
>>
>> ...but like your explicit use of r'' r''.
>>
>> Splitting out special handling of r'(x-)?' does not change behavior, but
>> is not otherwise mentioned in your commit message.  I suspect you did it
>> to make it easier to permit x-EVENT_NAME in later patches where upper is
>> handled differently from lower or camel,
>
> Yes.
>
>>                                          so I won't withhold R-b, but it
>> may be worth a tweak to the commit message.
>
> Probably.  I'm failing at coming up with a concise text that isn't
> confusing.

Adding this paragraph:

    check_name_str() now returns the name without downstream and x-
    prefix, for use by the wrappers in later patches.  Requires tweaking
    regexp @valid_name.  It accepts the same strings as before.


