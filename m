Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A482934930E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 14:29:36 +0100 (CET)
Received: from localhost ([::1]:43086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPQ3L-0006Es-P3
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 09:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPQ2P-0005nz-EA
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 09:28:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPQ2N-0008E2-Hw
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 09:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616678914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=puL1ImAfKoO5/rwWF9w2PQEcRVOc6fQQ0+t9Q5e+gHM=;
 b=eVdc2GHjybrKny3FNBUyWQcSm+zgMHBgeQsdVMjZC/Se4n9pZX6R+nc/hagBHjYQYAJ0Ck
 I1D226AwepSLJJf1l/Rxm/oHo4Mto6LC6tBfWtuIGs338s8z3MZ4pd0U4TDFwv40dyKptJ
 i5YZVHoBEZxIdbHR3g/Oeh7FH6WmVsQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-lI_PYFgmNnuVQdaNJHsY0g-1; Thu, 25 Mar 2021 09:28:32 -0400
X-MC-Unique: lI_PYFgmNnuVQdaNJHsY0g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1548110059C1;
 Thu, 25 Mar 2021 13:28:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D94E95C5E1;
 Thu, 25 Mar 2021 13:28:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6B03911327E1; Thu, 25 Mar 2021 14:28:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 15/16] qapi/expr.py: move related checks inside
 check_xxx functions
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-16-jsnow@redhat.com>
 <87r1l488vx.fsf@dusky.pond.sub.org>
 <9cbaa0fe-d926-84d1-c0e2-f0bffc9cba3b@redhat.com>
Date: Thu, 25 Mar 2021 14:28:29 +0100
In-Reply-To: <9cbaa0fe-d926-84d1-c0e2-f0bffc9cba3b@redhat.com> (John Snow's
 message of "Thu, 25 Mar 2021 01:17:38 -0400")
Message-ID: <87a6qrtlaa.fsf@dusky.pond.sub.org>
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 2/25/21 10:28 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> There's not a big obvious difference between the types of checks that
>>> happen in the main function versus the kind that happen in the
>>> functions. Now they're in one place for each of the main types.
>>>
>>> As part of the move, spell out the required and optional keywords so
>>> they're obvious at a glance. Use tuples instead of lists for immutable
>>> data, too.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>> 
>> No objection to changing read-only lists to tuples (applies to previous
>> patch, too).
>> 
>> No objection to turning positional into keyword arguments where that
>> improves clarity.
>> 
>> I have doubts on the code motion.  Yes, the checks for each type are now
>> together.  On the other hand, the check_keys() are now separate.  I can
>> no longer see all the keys at a glance.
>> 
>
> I guess it depends on where you wanted to see them; I thought it was 
> strange that in check_foobar I couldn't see what foobar's valid keys 
> were without scrolling back to the bottom of the file.
>
> Needing to see all the keys for the disparate forms together was not a 
> case I ran into, but you can always drop this patch for now if you'd 
> like.

Let's shelve it for now.

>       I had some more adventurous patches that keeps pushing in this 
> direction, but I don't know if it's really important.

When I work on a something, I tend to accumulate semi-related cleanups.
Including them is rarely a problem for reviewers when the result is two
dozen patches or so.  When this isn't the case, I can:

* Pick them into a separate cleanup series to go before the real work.
  Risks delaying the real work.

* Funnel them onto a cleanup branch to flushed later.  Risks lonely
  death in a rotting branch.

* Force myself to abstain from improving things that could really use
  improvement.  I call this "sitting on my hands".

This patch is in part three of at least six.  Almost 90 patches up to
part three, with many more to come.  I'm *desperate* to limit scope to
not get overwhelmed.  Please consider the remedies above.  This is a cry
for help, not a demand.

>                                                       My appetite in 
> this area has waned since November.

I understand.


