Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A1F327BAC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 11:15:07 +0100 (CET)
Received: from localhost ([::1]:60086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGfZy-0006ZE-So
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 05:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGfZ5-0006A8-PV
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:14:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGfZ4-0005pW-4t
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:14:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614593649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qzaBJHB0IAOEYABzaoRYmlqmCfVlmvkGa9E/5EE0f9c=;
 b=Yye8UiF202Qy+XHAzYeuxl9AQ2cBfvJ4lmLhWYDdHSby5CnoLZdoxOoHOtUksVZZ9lKVDA
 8Bmy6+ZrloJIYo/vwLG3bTgkQsQg8MAWdHCDvJhtp8bN4pinOY7udSIW9TTX9Rhfq0/pxH
 nH810MHD9jHBmdAKcKgsiVZuWclNsC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-R-8iHnNPOieSOqi8xDEM2g-1; Mon, 01 Mar 2021 05:14:08 -0500
X-MC-Unique: R-8iHnNPOieSOqi8xDEM2g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BEC7100CC85
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 10:14:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B0723828;
 Mon,  1 Mar 2021 10:14:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 909DB113860F; Mon,  1 Mar 2021 11:14:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 08/25] hmp: replace "O" parser with keyval
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-9-pbonzini@redhat.com>
 <87zh0xo0fw.fsf@dusky.pond.sub.org>
 <5473a3ec-8c9a-07f2-f822-87a0a0f25351@redhat.com>
Date: Mon, 01 Mar 2021 11:14:01 +0100
In-Reply-To: <5473a3ec-8c9a-07f2-f822-87a0a0f25351@redhat.com> (Paolo
 Bonzini's message of "Fri, 26 Feb 2021 12:25:47 +0100")
Message-ID: <87wnurji52.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 25/01/21 10:00, Markus Armbruster wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>> 
>>> HMP is using QemuOpts to parse free-form commands device_add,
>>> netdev_add and object_add.  However, none of these need QemuOpts
>>> for validation (these three QemuOptsLists are all of the catch-all
>>> kind), and keyval is already able to parse into QDict.  So use
>>> keyval directly, avoiding the detour from
>>> string to QemuOpts to QDict.
>>>
>>> The args_type now stores the implied key.  This arguably makes more
>>> sense than storing the QemuOptsList name; at least, it _is_ a key
>>> that might end up in the arguments QDict.
>>>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> 
>> Switching from QemuOpts to keyval changes the accepted language.  We may
>> change it, because HMP is not a stable interface.  The commit message
>> should point out the change, though.  Maybe even release notes, not
>> sure.
>> 
>> Let's recap the differences briefly:
>> 
>> * Boolean sugar: deprecated in QemuOpts, nonexistent in keyval
>> 
>> * QemuOpts accepts a number of more or less crazy corner cases keyval
>>    rejects: invalid key, long key (silently truncated), first rather than
>>    last id= wins (unlike other keys), implied key with empty value.
>> 
>> * QemuOpts rejects anti-social ID such as id=666, keyval leaves this to
>>    the caller, because key "id" is not special in keyval.
>> 
>>    Are these still rejected with your patch?
>
> Back here... No, and that's a feature.  There's no reason to reject 
> those ids.  However, this shows that Kevin's series to move --object to 
> keyval propagates a bug from qemu-storage-daemon to QEMU:
>
> $ storage-daemon/qemu-storage-daemon --object 
> authz-simple,id=123/546,identity=abc --chardev stdio,id=foo --monitor 
> chardev=foo
>  > {'execute':'qmp_capabilities'}
>  > {'execute':'qom-list', 'arguments': {'path':'/objects'}}
> < {"return": [{"name": "type", "type": "string"}, {"name": "123/546", 
> "type": "child<authz-simple>"}]}
>
> Good luck using that object anywhere. :)

There is no reason to reject those IDs other than spoiling the fun we're
having with setting traps for our users.

Since QOM is treating '/' specially in paths, and uses IDs as path
components, it should reject '/' in IDs.  Same reasoning as for file
names.

We already restrict IDs to "letters, digits, '-', '.', '_', starting
with a letter" in several places, including QemuOpts.  We should do that
more, not less.

Permitting arbitrary IDs buys us nothing but trouble.

>> * device_add help,e1000
>> 
>>      {
>>          "e1000": "on",
>>          "driver": "help"
>>      }
>> 
>>    Afterwards:
>>    upstream-qemu: ../util/error.c:59: error_setv: Assertion `*errp == NULL' failed.
>
> I cannot reproduce it:
>
> $ ./qemu-system-x86_64 -M none -monitor stdio -display none
> QEMU 5.2.50 monitor - type 'help' for more information
> (qemu) device_add help,e1000
> Error: Parameter 'driver' is missing

I'll double-check and report back.


