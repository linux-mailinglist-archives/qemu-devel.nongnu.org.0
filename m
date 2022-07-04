Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE76056544F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 14:07:08 +0200 (CEST)
Received: from localhost ([::1]:51494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Kr5-0005r0-Gz
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 08:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o8Kp6-0004LQ-Hl
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:05:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o8Kop-0005aZ-9C
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:05:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656936286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=idSr6dw4yRLQXaxU5k8jjz6d+spG3QK0xjsXOmwVGBc=;
 b=ZCwgHZeFtInSKGCjGQxTPZfvlZCQodkpWJ6llPcSI3A6eo4nBgEMPOgTXBmKrduATygSEd
 yfJPIsvC9tjLBzfFMv8PvXIVu0UXMzFSvHkcknBrQAsRGcnHmDyharYNxLFoAGKioMeMxv
 AG93dbCpYtvxTud5SLzMvGSPDEILrkU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-YTDlv_5HMTaamwmmxKXkGQ-1; Mon, 04 Jul 2022 08:04:44 -0400
X-MC-Unique: YTDlv_5HMTaamwmmxKXkGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A76185A582
 for <qemu-devel@nongnu.org>; Mon,  4 Jul 2022 12:04:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 183FA2026D64;
 Mon,  4 Jul 2022 12:04:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C4A0821E690D; Mon,  4 Jul 2022 14:04:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Leonardo Bras
 <leobras@redhat.com>,  Juan Quintela <quintela@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Peter Xu <peterx@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/3] Add zero-copy-copied migration stat
References: <20220701155935.482503-1-leobras@redhat.com>
 <20220701155935.482503-3-leobras@redhat.com>
 <877d4tz9gx.fsf@pond.sub.org> <YsKtm2O8+d5d0p/N@redhat.com>
 <YsLRmYjFpdGw0AjK@work-vm>
Date: Mon, 04 Jul 2022 14:04:41 +0200
In-Reply-To: <YsLRmYjFpdGw0AjK@work-vm> (David Alan Gilbert's message of "Mon, 
 4 Jul 2022 12:40:09 +0100")
Message-ID: <87k08tw0bq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
>> On Mon, Jul 04, 2022 at 08:18:54AM +0200, Markus Armbruster wrote:
>> > Leonardo Bras <leobras@redhat.com> writes:
>> >=20
>> > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
>> > > ---
>> > >  qapi/migration.json   | 5 ++++-
>> > >  migration/migration.c | 1 +
>> > >  monitor/hmp-cmds.c    | 4 ++++
>> > >  3 files changed, 9 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/qapi/migration.json b/qapi/migration.json
>> > > index 7102e474a6..925f009868 100644
>> > > --- a/qapi/migration.json
>> > > +++ b/qapi/migration.json
>> > > @@ -55,6 +55,9 @@
>> > >  # @postcopy-bytes: The number of bytes sent during the post-copy ph=
ase
>> > >  #                  (since 7.0).
>> > >  #
>> > > +# @zero-copy-copied: The number of zero-copy flushes that reported =
data sent
>> > > +#                    using zero-copy that ended up being copied. (s=
ince 7.2)

since 7.1, unless you're planning for really tortuous review :)

>> >=20
>> > The description feels awkward.  What's a "zero-copy flush", and why
>> > should the user care?  I figure what users care about is the number of
>> > all-zero pages we had to "copy", i.e. send the bulky way.  Is this what
>> > @zero-copy-copied reports?
>>=20
>> MigrationCapability field @zero-copy-send instructs QEMU to try to
>> avoid copying data between userspace and kernel space when transmitting
>> RAM region.
>>=20
>> Even if the kernel supports zero copy, it is not guaranteed to happen,
>> it is merely a request to try.
>>=20
>> QEMU periodically (once per migration iteration) flushes outstanding
>> zero-copy requests and gets an indication back of whether any copies
>> took place or not.
>>=20
>> So this counter is a reflection of how many iterations resulted  in
>> zero-copy not being fully honoured.
>>=20
>> IOW, ideally this counter will always be zero. If it is non-zero,
>> then the magnitude gives a very very very rough guide to what's
>> going on. If it is '1' then it was just a transient limitation.
>> If it matches the number of migration iterations, then it is a
>> more systemic limitation.
>>=20
>> Incidentally, do we report the migration iteration count ? I
>> thought we did, but i'm not finding it now that I look.
>
> Yes we do; it's dirty-sync-count

Please rephrase the documentation of @zero-copy-copied in terms of
@dirty-sync-count.  Here's my attempt.

# @zero-copy-copied: Number of times dirty RAM synchronization could not
#                    avoid copying zero pages.  This is between 0 and
#                    @dirty-sync-count.  (since 7.1)


