Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417B234676B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:19:06 +0100 (CET)
Received: from localhost ([::1]:35170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlcP-0006BC-8b
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOkXO-0003zc-Gm
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:09:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOkXM-00038e-CL
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616519387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJhkmDDDt8JUFoUO80ZeRKr+scoQdarKzVdVWt3GV3Y=;
 b=cdeke4/HHhub1sJ9moK8ttzxVvWXVb7RSR06C/OJT2vWg2pKGcCgE0OoBiy4bBrSncQIg4
 E2xtGKvc4mMgHWsBUY8dDIC428BqJ2OUBRDoU9keKn+qp1utJl4qPhpzqe6PsSuCbKqhqw
 eJtMf65fBABFwnEC2q95gND5t1sJ/kI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-HKWTTgrmP7Wc4dXU_ALMxQ-1; Tue, 23 Mar 2021 13:09:45 -0400
X-MC-Unique: HKWTTgrmP7Wc4dXU_ALMxQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29E1E107ACCA;
 Tue, 23 Mar 2021 17:09:44 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7132610F3;
 Tue, 23 Mar 2021 17:09:40 +0000 (UTC)
Subject: Re: [PATCH 06/28] tests/qapi-schema: Tweak to demonstrate buggy
 member name check
To: Markus Armbruster <armbru@redhat.com>
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-7-armbru@redhat.com>
 <f72dbb52-059e-f773-63ad-385b9c9d9e6c@redhat.com>
 <87im5hq3hs.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <0b0ace70-cd33-0c3b-c099-2377ca48559f@redhat.com>
Date: Tue, 23 Mar 2021 13:09:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87im5hq3hs.fsf@dusky.pond.sub.org>
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
Cc: michael.roth@amd.com, qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 11:44 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 3/23/21 5:40 AM, Markus Armbruster wrote:
>>> Member name 'u' and names starting with 'has-' or 'has_' are reserved
>>> for the generator.  check_type() enforces this, covered by tests
>>> reserved-member-u and reserved-member-has.
>>> These tests neglect to cover optional members, where the name starts
>>> with '*'.  Tweak reserved-member-u to fix that.
>>> This demonstrates the reserved member name check is broken for
>>> optional members.  The next commit will fix it.
>>>
>>
>> The test without an optional member goes away. Do we lose coverage?
>> (Do we care?)
> 
> Up to a point :)  We do try to cover all failure modes, just not in all
> contexts.
> 
> The test is about this error:
> 
>           if c_name(key, False) == 'u' or c_name(key, False).startswith('has_'):
>               raise QAPISemError(info, "%s uses reserved name" % key_source)
> 
> Full matrix: (is "u", starts with "has_") x (optional, not optional).
> 
> Instead of covering all four cases, we cover two: non-optional "u"
> (reserved-member-u) and non-optional "has-" (reserved-member-has).
> 
> The patch flips the former to optional.  The latter still covers
> non-optional.
> 
> Good enough, I think.
> 

Relies a tiny bit on knowing these two reserved name checks are 
implemented in the same place. Doubt it'll matter practically. Coverage 
has increased overall.

> Do you feel I should point to reserved-member-has in the commit message?
> 

It'd be for my benefit, but you also already just explained it to me.

Reviewed-by: John Snow <jsnow@redhat.com>


