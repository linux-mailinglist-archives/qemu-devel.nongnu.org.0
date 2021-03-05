Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6988D32E6DE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 11:57:49 +0100 (CET)
Received: from localhost ([::1]:47924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI89U-0006tc-Gc
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 05:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lI88F-0006M3-6T
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 05:56:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lI88A-00015e-O0
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 05:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614941784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cdni4xwZfZGZpaSLBy8t+YUOQ9VZg1sDBeyBoMfBdDY=;
 b=WvX5p82dhy53boDLAaFQx7LS2xLPkRyzHGQWTLIbBkmnEPqD4E15p9K1I61y7XWbRx68Mi
 yP8Ru50e8pNNtOrT3p62QgFikOPnKxr67w0aBu7OZOCgZR27I/+wJB8wiR4nzSLps5q6sA
 rrnVuhzgdioPjgl2QY1HHGn6u0t6wxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-b2DDNuioPOWiVg42esVP-w-1; Fri, 05 Mar 2021 05:56:23 -0500
X-MC-Unique: b2DDNuioPOWiVg42esVP-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E82357;
 Fri,  5 Mar 2021 10:56:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACE0A7092B;
 Fri,  5 Mar 2021 10:56:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 364781132C12; Fri,  5 Mar 2021 11:56:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 2/3] qapi, audio: respect build time conditions in audio
 schema
References: <20210302175524.1290840-1-berrange@redhat.com>
 <20210302175524.1290840-3-berrange@redhat.com>
 <20210303070059.sx5t3y3d76f2aflo@sirius.home.kraxel.org>
 <YD9g4WVdkTpUGyR8@redhat.com>
Date: Fri, 05 Mar 2021 11:56:13 +0100
In-Reply-To: <YD9g4WVdkTpUGyR8@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 3 Mar 2021 10:11:45 +0000")
Message-ID: <87czwd50oi.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Mar 03, 2021 at 08:00:59AM +0100, Gerd Hoffmann wrote:
>> On Tue, Mar 02, 2021 at 05:55:23PM +0000, Daniel P. Berrang=C3=A9 wrote:
>> > Currently the -audiodev accepts any audiodev type regardless of what i=
s
>> > built in to QEMU. An error only occurs later at runtime when a sound
>> > device tries to use the audio backend.
>> >=20
>> > With this change QEMU will immediately reject -audiodev args that are
>> > not compiled into the binary. The QMP schema will also be introspectab=
le
>> > to identify what is compiled in.
>>=20
>> Note that audio backends are modularized, so "compiled with
>> CONFIG_AUDIO_ALSA" doesn't imply "alsa support is available".
>
> AFAIK, there's no way to handle this with QAPI schema reporting. We
> can only conditionalize based on what's available at compile time,
> not what's installed at runtime.

Correct.  The schema is fixed at compile-time.  query-qmp-schema
reflects what we compiled into the binary or modules we built along with
the binary.  It cannot tell which of the modules the binary can load.

I'd like the commit message to discuss how the patch interacts with
modules, because my own memory of the details is rather uncertain :)

I guess we can configure which audio backends to build, and whether to
build them as modules.

When not building them as modules, the patch compiles out some useless
code.  Correct?

When building them as modules, the patch compiles out code for modules
we don't build.  Correct?

Such code is useless, unless you somehow manage to supply the resulting
binary with working modules from another build.  Which is probably a bad
idea.  Compiling out the code stops this (questionable) usage cold.  No
objection, but the commit message should at least hint at it.

> To get runtime info, we would have to introduce an explicit
> "query-audiodev-types" command where just report the backends
> that have been installed.

TTOCTOU.  Harmless one.  Still, the robust check for "can module M be
loaded?" is to try loading it.


