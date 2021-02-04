Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B609930EE97
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 09:40:48 +0100 (CET)
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7aBz-00022a-KW
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 03:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7a9U-0000iu-4f
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:38:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7a9O-0005fx-Ca
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:38:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612427882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JnrOoKXQgrzcUvp2lxbO9WoBSjwwEbq7mZSdWjGeToM=;
 b=KkeYiQdwNbP01TW8mtA0xfaGYFJ0+GiQ6HAzU7X1SdwdSgR6aTT/g9i86fM6zCn43hmmbz
 YAgYpsZ0z8kB34u1pA3CXHkgu7HgtR+8s0cQoQuPixs9/952md27lFmtet99eXXzA42xy1
 FX7DRHdJdwrc47YNcEF/btmHPLKB3xI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-G-Mk2pKuN7y29l1fm7eLiw-1; Thu, 04 Feb 2021 03:37:24 -0500
X-MC-Unique: G-Mk2pKuN7y29l1fm7eLiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58FCD107ACE4;
 Thu,  4 Feb 2021 08:37:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27CFB71C9B;
 Thu,  4 Feb 2021 08:37:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A7F26113865F; Thu,  4 Feb 2021 09:37:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 06/14] qapi/introspect.py: replace 'extra' dict with
 'comment' argument
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-7-jsnow@redhat.com>
 <87tuqtteks.fsf@dusky.pond.sub.org>
 <fac0a218-2d43-bc70-dadf-1f5da4c5b03f@redhat.com>
Date: Thu, 04 Feb 2021 09:37:21 +0100
In-Reply-To: <fac0a218-2d43-bc70-dadf-1f5da4c5b03f@redhat.com> (John Snow's
 message of "Wed, 3 Feb 2021 16:21:38 -0500")
Message-ID: <87lfc4kz3y.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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

> On 2/3/21 9:23 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> This is only used to pass in a dictionary with a comment already set, so
>>> skip the runaround and just accept the comment.
>>>
>>> This works because _tree_to_qlit() treats 'if': None; 'comment': None
>>> exactly like absent 'if'; 'comment'.
>> Confusing, because the two paragraphs talk about two different
>> things:
>> 1. Actual arguments for @extra are either None or {'comment':
>> comment}.
>>     Simplify: replace parameter @extra by parameter @comment.
>> 2. Dumb down the return value to always be of the form
>>      (obj {'if': ifcond, 'comment': comment})
>> 
>
> I think you are drawing attention to the fact that 'if' and 'comment'
> are now always present in this dict instead of conditionally present.

Correct.

> (else, I have misread you. (I think you are missing a comma.))

I am!  I meant to write

    (obj, {'if': ifcond, 'comment': comment})

>> I suspect splitting the patch is easier than crafting a clear commit
>> message for the combined one.
>> 
>
> I wouldn't have considered to break out such a small change into two
> even smaller changes, but as you are in charge here ... Okey Dokey.
>
> (meta-tangent: [1])
[...]
> [1] As a matter of process, I sometimes find it cumbersome to
> intentionally engineer an intermediary state when I jumped straight
> from A->C in my actual editing.

Yes, the extra work can be cumbersome.  But then writing a neat commit
message for a commit that does two things can also be cumbersome.
"Split and write two straightforward commit messages" has proven easier
for me many times.

> I will usually keep such intermediary forms when they come about
> naturally in the course of development, but rarely seek to add them 
> artificially -- it feels like a major bummer to engineer, test, and
> scrutinize code that's only bound to be deleted immediately after. 
> Sometimes, it feels like a waste of reviewer effort, too.

It depends.  Sometimes "don't split and write a complicated commit
message" is easier.

Which way you get to "commit message(s) don't confuse Markus" in this
particular case is up to you :)

> It's been years and I still don't think I have any real intuitive
> sense for this, which is ...unfortunate.

It's been years, and my intuition still evolves.


