Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3C04741D2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:50:42 +0100 (CET)
Received: from localhost ([::1]:53842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx6KN-00024o-I4
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:50:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mx6Il-0001Eq-8i
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:48:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mx6Ii-0004ux-6m
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:48:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639482534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xk0YvNc29+cVCw6CRpip5jNM3+6zO4cq5gcCjElRB1c=;
 b=Hw03ODGE6BTxSHfYUVJx0IVdh8/6pUWfg5bSW4cTxEnEyoHxr5XDOfeRRVjZXOPZ5YX2+z
 n1PLi4ESaCC3DRFjwSUbLyUFEjuRThqNVrY3RJlTLnKTRxXvYuFGer5u1D4/cnBTJsm2qU
 ZV9xLfyf8fA7EW8fRV/kNIGvMCnqMR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-xvOiQbScMiiKIP3sejz68A-1; Tue, 14 Dec 2021 06:48:51 -0500
X-MC-Unique: xvOiQbScMiiKIP3sejz68A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3542181EE64;
 Tue, 14 Dec 2021 11:48:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFEAA45D89;
 Tue, 14 Dec 2021 11:48:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0F443113865F; Tue, 14 Dec 2021 12:48:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Redesign of QEMU startup & initial configuration
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
 <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
Date: Tue, 14 Dec 2021 12:48:36 +0100
In-Reply-To: <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com> (Paolo
 Bonzini's message of "Mon, 13 Dec 2021 18:37:44 +0100")
Message-ID: <877dc7tnjf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. =?utf-8?Q?Berran?= =?utf-8?Q?g=C3=A9?=" <berrange@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 Mirela Grujic <mirela.grujic@greensocs.com>, "Edgar
 E. Iglesias" <edgar.iglesias@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 12/13/21 16:28, Markus Armbruster wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>> 
>>> On 12/10/21 14:54, Markus Armbruster wrote:
>>>> I want an open path to a single binary.  Taking years to get there is
>>>> fine.
>>>
>>> The single binary is a distraction in my opinion.  Imagine
>>> instead of vl.c you have this in your second binary:

[...]

>>> This is the ultimate QEMU startup code.  If we can get this code to
>>> actually build a machine, you've reached the point where you don't care
>>> about what is in the command line parser; and consequently you don't care
>>> if there is one binary or two.
>> 
>> Define "you".  Also explain why it should include me, because I think it
>> doesn't :)
>
> Impersonal you. :)

Unfortunate choice of a word.

>> By when can we have this second binary in master?  Opinion, please, not
>> promise.
>
> Define "have":
>
> - a binary that builds
>
> - a binary that builds a bootable guest
>
> - a binary that builds any guest that the current well-maintained
>   targets can build, using a given (but roughly full-featured) subset
>  of options
>
> Estimates for the first are easy (it's in my tree), estimates for the
> second depends on somebody helping (upstreaming -M smp took months 
> between me being busy, reviewers being busy, and releases freezing
> development), estimates for the third are hard.

Thanks.

>> Would you object to me expanding the CLI here to the point where I think
>> we can deprecate the old binary?
>> 
>> If yes, why?
>
> Yes, for two reasons.
>
> First, because there will be usually differences between the command
> lines as mentioned elsewhere in the thread.  qemu-system-* is a good 
> name, but one that is already taken by 15 years of docs using the
> existing command line.

A new CLI is pointless unless there are differences to the old one.

It is unadvisable unless we can eventually retire the old one.

While they coexist, the old binary name should use the old CLI, to
reduce confusion.

> Second, because a command line is really hard to get right as
> complexity increases.  QMP is the way to go to get as clean as
> possible a configuration mechanism.  There *will* be a second set of
> warts layered on top of the above code, and I don't want that.

We do not have consensus.  We may have misunderstandings.

Let's start with where we (hopefully) agree:

* We need a single, cohesive, low-level interface suitable for
  management applications.

* The existing interface is specified in QAPI.  Its concrete transport
  is QMP.

* The existing interface is not complete: certain things can only be
  done with the CLI.

* The existing transport is not available early enough to permit
  completing the interface.

* Fixing that involves a rework of startup.

* Reworking the existing startup and managing incompatible changes is
  impractical, and likely to make the mess we have on our hands worse.

* A new binary sidesteps the need to manage incompatible change.

Any objections so far?

Now let me make a few more points:

* Single, cohesive interface does not require single transport.  In
  fact, we already have two: QMP and the (internal) C interface.

* QMP encodes the abstract interface in JSON, and offers the result on a
  Unix domain socket[1].

* The (internal) C interface encodes the abstract interface as a set of
  C data types and functions.

* Consider a configuration file transport that encodes the abstract
  interface in JSON.  The only wart this adds is syntax that is
  arguiably ill-suited to the purpose.  More suitable syntax exists.

* Similar for CLI.

* To get a "a second set of warts layered on top", we actually have to
  layer something on top that isn't utterly trivial.  Like a
  higher-level interface.  The "second set of warts" objection does not
  apply to (sane) transports.

* We already layer an interface on top: HMP[2].  It has its warts.

* The old CLI is partly layered on QMP, partly on HMP, and partly on
  internal C interfaces.  It's full of warts.

* Management applications are not the only users that matter.  Humans
  matter.  Simple programs like ad hoc scripts matter.

Objections to these?

[...]


[1] Actually a QEMU character device now, but let's ignore that.

[2] Except where we choose to bypass QMP, but that's unimportant here.


