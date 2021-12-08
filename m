Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B19746CE2B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 08:14:28 +0100 (CET)
Received: from localhost ([::1]:47886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mur9n-0004QC-7v
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 02:14:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mur2q-0002XN-Cx
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:07:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mur2n-0006Qh-5P
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:07:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638947230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=izpuqML1zhuakRbQIRxcSBpbLwCVc8oVVRbNpZBRGZI=;
 b=IAahpkv2hplvQaqSnmycCeaSTSYW38qx4U4ls08+7dLRy2JYHV4b9YZmR8Ae/2gewwG10A
 0hHN5nES4sfuO6glRvmWinFvjKlZlNg9Ye9/UgmfFIqZsEmI3UbTptou6xWH9alRyFG4Ti
 rk5fjsuDfcP7Zb8IeZb37JLoknVO/As=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-JgB82TuWMjqa0xtDimi5Gw-1; Wed, 08 Dec 2021 02:07:07 -0500
X-MC-Unique: JgB82TuWMjqa0xtDimi5Gw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 324EC81EE61;
 Wed,  8 Dec 2021 07:07:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C9FB19C59;
 Wed,  8 Dec 2021 07:07:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DE2C3113865F; Wed,  8 Dec 2021 08:07:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH RFC 00/11] vl: Explore redesign of startup
References: <20211202070450.264743-1-armbru@redhat.com>
 <8e032cf7-8aa4-73f9-b978-f2b0d616fff2@greensocs.com>
Date: Wed, 08 Dec 2021 08:07:03 +0100
In-Reply-To: <8e032cf7-8aa4-73f9-b978-f2b0d616fff2@greensocs.com> (Damien
 Hedde's message of "Tue, 7 Dec 2021 17:52:26 +0100")
Message-ID: <87k0gfvalk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, edgar.iglesias@gmail.com, mark.burton@greensocs.com,
 qemu-devel@nongnu.org, mirela.grujic@greensocs.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Damien Hedde <damien.hedde@greensocs.com> writes:

> Hi Markus,
>
> It looks promising. I did not think we could so "easily" have a new
> working startup.

Look at this big axe I got!  ;)

>                  But I'm not so sure that I understand how we should 
> progress from here.

I neglected to explain this my cover letter.  My apologies...

> I see 3 main parts in this:
> A. introducing new binary (meson, ...)
> B. startup api: phase related stuff (maybe more)
> C. cli to qmp parser

Makes sense to me at a high level.

> I think if we want to add a new binary (instead of replace it), there
> will be some common api and every startup will have to
> support/implement it. Probably some part of vl.c will have to go in
> some common code.
> In practice, we probably should introduce/extract this before
> introducing the new binary.

I think there are two practical ways to structure such patches:

* Refactor existing code to make parts available for new code, then
  introduce new code that uses them.

* Copy, cut unwanted parts, refactor to deduplicate.

I think either way can work as patches.  The second way is how I'd start
the work myself.

> One central part of this api is the phase mechanism (even if legacy
> startup can only support it partially or not-at-all).
>
> I think we have 2 choices:
> + we have to use until_phase explicitly
> + we make qmp commands implicitly advances phases when needed.

Yes.

> I think it's better to go the implicit way as much as possible: it
> means we focus on commands and not on some artificial phases we set up
> because of legacy.

An explicit phase control command looked like the fast & easy path to
phase control to me, so that's what I picked for the RFC.

Instead of a single "advance to arbitrary phase" command, we can have
multiple "do X, which requires phase Y and advances to phase Y+1"
commands.  E.g. "create machine" goes from @no-machine to
@machine-created.

We may want additional, automatic phase advances for convenience, but I
feel it's best to get the essential stuff roughly right before talking
about convenience features.

> Either way, we probably should put the phase info in qapi so that we
> don't have to hardcode that in every command in order to have common 
> error handling. One thing we could do is replace "allow-preconfig" in
> qapi by some phase requirement entry(entries?) and make qmp call 
> qemu_until_phase() or some qemu_phase_check() function.

I'd also like some phase support from QAPI.  Manual phase checking code
in commands would be tedious and error prone.  Better to declare
required phase(s) in the schema.

One small step further: declare phase transitions in the schema, too.
Then the phase state machine definition is all *data*.  Data is easier
to reason about than code.  Extracting the complete state machine from
the schema is straightforward.  Extracting it from C code is anything
but.

> We also maybe need to sort out if we want to merge the phases into the
> runstate.

Yes.

> Thanks for making the effort to do this rfc,

Thanks for your feedback!


