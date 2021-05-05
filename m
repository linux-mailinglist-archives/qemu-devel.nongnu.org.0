Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F173734FB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 08:32:00 +0200 (CEST)
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leB4h-0002EL-3q
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 02:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1leB1y-0001fr-Eq
 for qemu-devel@nongnu.org; Wed, 05 May 2021 02:29:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1leB1v-0004eV-IT
 for qemu-devel@nongnu.org; Wed, 05 May 2021 02:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620196146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F6s9Fnwh7ZoJB9Jp6TdZf+DmAGnJ06lSs+seswsIk7Y=;
 b=RroYNBhej9EKnUl6AZ2secloeXTwQzWeM59QhLSnB9zbzDHXtjLdKimcoPSyEh8TBG4M77
 vhrBoIpmiSS2FamnoB3vkCvJhTF70ZMm/DdaR2ZEmxOvndLWQnBy5YChfyWCON7TRUuLUG
 z0FAeYY1DR71iMGEF+rF2fFOGNJ0HXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-V6FQkxdWOC-wF9e6KPiQZw-1; Wed, 05 May 2021 02:29:04 -0400
X-MC-Unique: V6FQkxdWOC-wF9e6KPiQZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33D31107ACCA;
 Wed,  5 May 2021 06:29:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF7DF614FC;
 Wed,  5 May 2021 06:29:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 525361138529; Wed,  5 May 2021 08:29:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 10/22] qapi/parser: Fix typing of token membership tests
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-11-jsnow@redhat.com>
 <87v98a7q23.fsf@dusky.pond.sub.org>
 <78cf87ce-ce02-d9d6-0922-84a328b6b9da@redhat.com>
 <87k0oo6wkp.fsf@dusky.pond.sub.org>
 <3b8af56e-4322-4729-05c9-27e62f7e86a6@redhat.com>
Date: Wed, 05 May 2021 08:29:01 +0200
In-Reply-To: <3b8af56e-4322-4729-05c9-27e62f7e86a6@redhat.com> (John Snow's
 message of "Mon, 3 May 2021 21:01:36 -0400")
Message-ID: <878s4twv6a.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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

> On 4/27/21 3:00 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> On 4/25/21 3:59 AM, Markus Armbruster wrote:

[...]

>> Please add test cases.  I recommend adding them in a separate patch, so
>> this one's diff shows clearly what's being fixed.
>> 
>
> Can't, again: because it's a crash, the test runner explodes.
>
> Two choices, because I won't finish respinning this tonight:
>
> (1) Amend the test runner to print generic exceptions using str(err), 
> without the stack trace -- so we can check for crashes using the diffs 
> -- again in its own commit.
>
> (2) Just squish the tests and error messages into this commit like I did 
> for the other crash fix I checked in.
>
> I'd normally leap for #1, but you seem to have some affinity for 
> allowing unpredictable things to explode very violently, so I am not sure.

I love violent explosions.  Don't we all, as long as they're just bits?

(2) is fine.

If you'd like to provide for committing tests that currently explode:
the issue preventing it is insufficiently normalized output of
test-qapi.py.  test-qapi.py normalizes error messages (see except
QAPIError in test_and_diff()), but not tracebacks.

Omitting the tracebacks is an obvious and easy way to normalize.  But it
makes getting at the traceback harder: I need to know / remember how to
run the test by hand, without the normalization.  The cure seems worse
than the disease here.

To avoid the drawback, we'd need a simple and obvious way to run the
test so it shows the traceback.

Again, (2) is fine.


