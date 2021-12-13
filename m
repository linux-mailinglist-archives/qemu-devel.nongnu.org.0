Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7D1473052
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:21:12 +0100 (CET)
Received: from localhost ([::1]:44038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwn8Z-0000MZ-G1
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:21:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mwn7H-0007Po-QV
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:19:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mwn7F-00077q-M0
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:19:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639408788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u7mdQN/S7afORy2zFOcdEKJqmgiGvTd+WtD39r+G+xA=;
 b=XCxATv5+8xqxl3zGXTzt88Yb7Bm6QSxjWz5XYpZHe4cfZFdCGqh2UhgEFK/AYyP18uNAiA
 f2Xpzwu/CClG3ySPFzjIqDiEYHvVBQTMIbkmps8q7TiR4IaUelQIm8V07WyIgASGNoENKX
 HN/icjbmWNV6DPSQzo51eY3KDWB7aQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-kOmyYNAdNju9rZws8qKUXg-1; Mon, 13 Dec 2021 10:19:47 -0500
X-MC-Unique: kOmyYNAdNju9rZws8qKUXg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DE0E100D021;
 Mon, 13 Dec 2021 15:19:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F98074EAD;
 Mon, 13 Dec 2021 15:19:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 15D02113865F; Mon, 13 Dec 2021 16:19:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: Redesign of QEMU startup & initial configuration
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <fb7e946e-6881-0ea3-d824-99693f938165@redhat.com>
 <87czm47a77.fsf@dusky.pond.sub.org> <YbN0zLsDVr3B/s3+@redhat.com>
Date: Mon, 13 Dec 2021 16:19:37 +0100
In-Reply-To: <YbN0zLsDVr3B/s3+@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 10 Dec 2021 15:39:56 +0000")
Message-ID: <87ilvszg52.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
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
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Dec 10, 2021 at 04:26:20PM +0100, Markus Armbruster wrote:
>>=20
>> The existing binary provides bad CLI and limited QMP.
>>=20
>> Going from limited to good QMP involves reworking the startup code.  I
>> believe that's easier in a new binary.
>>=20
>> Going from bad CLI to good CLI involves incompatible change.
>> Impractical as long as the CLI is a stable interface.  I believe the
>> sane way out is a new binary.
>>=20
>> However, I can't see why we'd want to put a good CLI in the old binary
>> then.  We could just as well put it in the new binary, or in a wrapper
>> program around the new binary.
>
> Having good CLI in a completely new binary is likely to be easier
> for users to understand too. The typical pitfall with our existing
> binaries is that they provide 4 ways to do the same thing, from
> the different points in QEMU's life. This constantly trips up
> unsuspecting users and also makes our docs task way more complicated
> to think about.

I think it's more often just three: the long one that can do everything,
the short one that can do simple things (and doesn't tell you anything
about the long one), and the bad one you shouldn't use.

> If we're going to have a good CLI, it would ideally only have
> one way to do each given task.

Ideally, the long one plus good defaults suffices.

When we must also have a short one, it should macro-expand into long
one(s), and the user should be able to see the expansion.

> No matter what we do we're fighting against a mass of docs
> all over the internet talking about 15 years of old QEMU
> syntax. If we do a good CLI in a newly named binary, at
> least when reading docs, it'll be pretty clear whether
> it is talking about the old QEMU or new QEMU binaries,
> reducing liklihood of mixing things up.

An advantage that truly matters.


