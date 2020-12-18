Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 472712DE9B8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 20:25:39 +0100 (CET)
Received: from localhost ([::1]:49390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqLNi-000577-CA
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 14:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kqLLE-0004T5-66
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:23:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kqLLC-0004a7-I0
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:23:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608319381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YFfH5+W7nZRqRI+qlhjgiOtEzkgWa/B+vtrb4FFmJSA=;
 b=PkkZugt0ZzRsu9Hs7oszADNcYc0/gB1IvEyU+vEMdsNYTjZ0uvnvTKkqponxE7pFl5xS2h
 ldhZHa/MQeaY0FY6w4fXkG267j5nd/kckZ0bkqkFQY/Yswx5zNUU+ide8n92HOAz2L4TZw
 ayEFt4hxenw0yNWAvkJnxNfUnuDOGEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-Qm1wsdZCMnmPEsBOHjMM3A-1; Fri, 18 Dec 2020 14:23:00 -0500
X-MC-Unique: Qm1wsdZCMnmPEsBOHjMM3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2981B802B42
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 19:22:59 +0000 (UTC)
Received: from [10.10.112.131] (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF52860C15;
 Fri, 18 Dec 2020 19:22:51 +0000 (UTC)
Subject: Re: [PATCH 06/12] qapi/source: Add builtin null-object sentinel
To: Markus Armbruster <armbru@redhat.com>
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-7-jsnow@redhat.com>
 <87r1nqrtp7.fsf@dusky.pond.sub.org>
 <9f25c91a-774d-fbe3-3780-5415e7a54524@redhat.com>
 <87im90k5mr.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <e47464d8-a41d-c513-97a1-bfc33ff0e023@redhat.com>
Date: Fri, 18 Dec 2020 14:22:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87im90k5mr.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/20 6:56 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 12/16/20 4:22 AM, Markus Armbruster wrote:
>>> 2. On error with "no source info", don't crash.
>>>      I have my doubts on this one.
>>>      Such an error means the QAPI code generator screwed up, at least
>>> in
>>>      theory.  Crashing is only proper.  It gets the screwup fixed.
>>>
>>
>> QAPISemError and friends will also halt the generator and don't
>> produce output and will fail tests. They aren't less visible or more
>> ignorable somehow.
>>
>>>      In practice, errors due to interactions between built-in stuff and
>>>      user-defined stuff could conceivably escape testing.  I can't
>>>      remember such a case offhand.
>>>      Will the "no source info" error be more useful than a crash?
>>>      Possibly.  Will it get the screwup fixed?  Maybe not.
>>
>> I don't understand this; if it's an error -- there's no QAPI, there's
>> no QEMU. It's definitely getting fixed.
>>
>> If QAPISourceInfo is primarily used for printing error information, we
>> are already in a situation where the generator is hosed and has
>> wandered itself into a problem that can't be ignored.
>>
>> There's no additional value in having python crash twice per every
>> crash because we have bad types in our error reporting functions.
> 
> Consider the following scenario.  The average developer knows just
> enough about QAPI to be dangerous.  That's okay; if you had to be a QAPI
> expert to modify the QAPI schema, we would have failed.  Now meet Joe
> Average.  He's a good guy.  Today his job happens to require extending
> the QAPI schema.  In a hurry, as usual.  So Joe brings his well-honed
> voodoo programming skills to bear, and writes something that looks
> plausible to him.  His build fails.  He's not surprised; he's voodoo-
> programming after all.  However, the error message is less clear than
> usual.  Something about a '[builtin]' file.  There is no '[builtin]'
> file.  What to do?  Obvious!  If a bit of voodoo doesn't get you over
> the finish line, use more: twiddle the schema until it works.
> 
> If his build failed with a Python backtrace instead, Joe would
> immediately know that he ran into a bug in our tooling he should report.
> 
> Again, I don't mean to criticize Joe.  I've walked in his shoes myself.
> 
> 

Worse, Joe was going to see an error about the "None" file or an error 
about the "[builtin]" file.

I understand, though: don't suppress crash messages with opaque crap 
that doesn't help spot the error. It's just that I don't think that's 
what is happening here.

See lengthy response in other email.

--js


