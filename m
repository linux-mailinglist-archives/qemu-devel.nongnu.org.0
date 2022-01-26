Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A15149C41F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 08:19:11 +0100 (CET)
Received: from localhost ([::1]:57220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCcaD-00082M-RX
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 02:19:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCcAA-0006AW-3g
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 01:52:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCcA2-0003yU-12
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 01:52:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643179924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HyU26M99VVwGaIRECwE+xSeFtJKCE5my82vqqCNBjOs=;
 b=EL+yrne9xmbEv0g+2Saye6b6VeRvIGAGBhn/A7jRQePpDtl7exYDgqxAedI6aWPWBOAFqU
 7PQ8yDWS/CNx+uYDRPCgpV6bWCyuoOYRd14nBm0q4Pivo8DBXvf+7kCw+dTTFrSvGV68Rj
 c/PR7tEVQKEq/lbAGFqno/kRLHuIhTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-7u-SEzW0OwCLJlOiCH18Fw-1; Wed, 26 Jan 2022 01:52:01 -0500
X-MC-Unique: 7u-SEzW0OwCLJlOiCH18Fw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D4CB1083F60;
 Wed, 26 Jan 2022 06:52:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-10.ams2.redhat.com
 [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4902312E3F;
 Wed, 26 Jan 2022 06:51:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D0105113864A; Wed, 26 Jan 2022 07:51:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 1/3] scripts/qapi/gen.py: add FOO.trace-events output
 module
References: <20220121162234.2707906-1-vsementsov@virtuozzo.com>
 <20220121162234.2707906-2-vsementsov@virtuozzo.com>
 <87sftc420m.fsf@dusky.pond.sub.org>
 <9c585037-ded9-6a0c-9b4a-8f5b5cfdfa64@virtuozzo.com>
Date: Wed, 26 Jan 2022 07:51:53 +0100
In-Reply-To: <9c585037-ded9-6a0c-9b4a-8f5b5cfdfa64@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 25 Jan 2022 12:50:39 +0300")
Message-ID: <87mtjjvvjq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 hreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 25.01.2022 12:07, Markus Armbruster wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>> 
>>> We are going to generate trace events for qmp commands. We should
>> 
>> QMP
>> 
>>> generate both trace_*() function calls and trace-events files listing
>>> events for trace generator.
>>>
>>> So, add an output module FOO.trace-events for each FOO schema module.
>>>
>>> Still, we'll need these .trace-events files only for
>>> QAPISchemaGenCommandVisitor successor of QAPISchemaModularCVisitor.
>>> So, make this possibility optional, to avoid generating extra empty
>>> files for all other successors of QAPISchemaModularCVisitor.
>> 
>> Suggest to make this slightly less technical for easier reading:
>> 
>>    Since we're going to add trace events only to command marshallers,
>>    make the trace-events output optional, so we don't generate so many
>>    useless empty files.
>
> Sounds good
>
>> 
>>> We can't simply add the new feature directly to
>>> QAPISchemaGenCommandVisitor: this means we'll have to reimplement
>>> a kind of ._module / .write() functionality of parent class in the
>>> successor, which seems worse than extending base class functionality.
>> 
>> Do you mean something like
>> 
>>    The alternative would be adding the the new feature directly to
>>    QAPISchemaGenCommandVisitor, but then we'd have to reimplement the
>>    ._module / .write() functionality of its parent class
>>    QAPISchemaModularCVisitor, which seems worse than extending the parent
>>    class.
>> 
>> ?
>
> Yes.
>
>> 
>> If yes: I'm not sure about "worse". 
>
> Hmm. *shrug* ) I'm new to this code, that's why it seems unobvious to me, and that's why I'm afraid of deeper refactoring)
>
>> But keeping it in the parent class
>> feels right to me anyway, as trace events could be useful in other child
>> classes, too.
>
> If it is OK, we can simply drop this paragraph.

Works for me.

Keeping it would work, too.  "Seems worse" is an opinion, not wrong.

>>> Currently nobody set add_trace_events to True, so new functionality is
>>> formally disabled. It will be enabled for QAPISchemaGenCommandVisitor
>> 
>> Drop "formally".
>> 
>>> in further commit.
>> 
>> "in a further commit", or "in the next commit".
>> 
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

[...]

>> I wonder whether we really need a new __init__() parameter.  Could we
>> have ._gent() create the module on demand?  This is *not* a demand.
>> 
>
> My first attempt to drop extra empty generated .trace-events files was to teach QAPIGenTrace() not to generate file when it is empty. But in this case some empty .trace-events for commands are not generated, and "include" line fails to compile. And at time when include line is generated, I don't know will corresponding .trace-events be empty or not. So I decided to make a new parameter for __init__()

Okay.  We can always improve on top if we care.


