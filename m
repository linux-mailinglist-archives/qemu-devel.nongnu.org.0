Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B89230412
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 09:27:13 +0200 (CEST)
Received: from localhost ([::1]:55812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0K12-000894-Do
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 03:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1k0K0A-0007bk-1j
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 03:26:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40409
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1k0K08-0001S0-Dk
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 03:26:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595921175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2QsXihKapXiQQ5rbKZwXsdyE49ycyb3Cw3o87/w3AfM=;
 b=iEksaWYoLWb4QkbLTNoaItlBdL0iG2E1q6XvrkqLzyOuZsBkTDbUKKd4yRFwZQdY6TFrwf
 /Vmp/gb1fUHRpY4OH7S3hahvE+JTg3iCOL+o34x00W7zHvPVRSwHwSCgYPKYdpjn9AcF6q
 N+OzrCDodr2/D1YAFx9Ac4YPfy/lHYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-ljFxoyvgOk-cQhHAfCztkw-1; Tue, 28 Jul 2020 03:26:12 -0400
X-MC-Unique: ljFxoyvgOk-cQhHAfCztkw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D096C1923761;
 Tue, 28 Jul 2020 07:26:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6727D5DA72;
 Tue, 28 Jul 2020 07:26:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D1C391132FD2; Tue, 28 Jul 2020 09:26:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v4 for-5.2 1/2] spapr: Use error_append_hint() in
 spapr_caps.c
References: <159491945918.188975.4358645698778061430.stgit@bahia.lan>
 <159491947184.188975.5055299566400098290.stgit@bahia.lan>
 <87mu3uciq4.fsf@dusky.pond.sub.org>
 <20200727150425.2c7562ed@bahia.lan>
Date: Tue, 28 Jul 2020 09:26:08 +0200
In-Reply-To: <20200727150425.2c7562ed@bahia.lan> (Greg Kurz's message of "Mon, 
 27 Jul 2020 15:04:25 +0200")
Message-ID: <87h7tsf6cv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 23:55:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Greg Kurz <groug@kaod.org> writes:

> On Mon, 20 Jul 2020 17:24:35 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> Greg Kurz <groug@kaod.org> writes:
>> 
>> > We have a dedicated error API for hints. Use it instead of embedding
>> > the hint in the error message, as recommanded in the "qapi/error.h"
>> > header file.
>> >
>> > Since spapr_caps_apply() passes &error_fatal, all functions must
>> > also call the ERRP_GUARD() macro for error_append_hint() to be
>> > functional.
>> 
>> This isn't a request for change in this patch, just an attempt to squash
>> possible misunderstandings.
>> 
>> It's true that error_append_hint() without ERRP_GUARD() works as long as
>> the caller doesn't pass certain errp arguments.  But the callee should
>> work for all possible @errp arguments, not just the ones that get passed
>> today.  That's why error.h wants you to guard *all* uses of
>> error_append_hint(errp):
>> 
>>  * = Why, when and how to use ERRP_GUARD() =
>>  *
>>  * Without ERRP_GUARD(), use of the @errp parameter is restricted:
>>  * - It must not be dereferenced, because it may be null.
>>  * - It should not be passed to error_prepend() or
>>  *   error_append_hint(), because that doesn't work with &error_fatal.
>>  * ERRP_GUARD() lifts these restrictions.
>> 
>
> Yeah, I just wanted to emphasize that we were precisely in the case
> where we _really_ need to lift the restriction, but I'm perfectly fine
> with dropping this sentence if you consider it useless.

I lean towards dropping it.

> BTW, should we have a way for CI to ensure that a patch that adds
> error_prepend(errp, ...) or error_append_hint(errp, ...) also adds
> ERRP_GUARD() ? Not sure that people read error.h that often...

I don't know.  Wait and see whether it's worth automating?  We didn't
automate checking other Error API rules, like "no newlines in error
messages".  That one can't crash, though.

The check would have to look beyond the patch, which checkpatch.pl
doesn't do.

>> No need to make an argument involving the possible arguments (pardon the
>> pun).
>> 
>
> :)
>
>> [...]
>> 


