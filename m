Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12802F4FB6
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 17:19:37 +0100 (CET)
Received: from localhost ([::1]:59726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzirw-0003Lc-Ui
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 11:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzilk-0005lX-4S
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:13:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzild-0001yw-Kd
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610554383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zyf2U7QrUBDlvgZqyBf+eEwaObFTz0a1AK68Q4VrhIE=;
 b=UhXvcvOWt2sV+96ddtLbOQzRVkziYvqi897dB3j4xiDuDcqQjfMMJ55mYs5snixrmhVR6i
 e/iap7Ha7k3/c/4DKQf1Bg/ayxPkq9NYqESLmlzoaz3j7UUCwlJEISTPhLqhQdnCE5b5yw
 XfiL82sWTrPNvwZSMJoxQZi/YZTNeH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-oYK4fRhPMKWotgbiToYtpQ-1; Wed, 13 Jan 2021 11:12:58 -0500
X-MC-Unique: oYK4fRhPMKWotgbiToYtpQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 896DF8066E1;
 Wed, 13 Jan 2021 16:12:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04FD01002393;
 Wed, 13 Jan 2021 16:12:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8E82C11386A7; Wed, 13 Jan 2021 17:12:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 07/12] qapi/schema: make QAPISourceInfo mandatory
References: <20201217015927.197287-1-jsnow@redhat.com>
 <20201217015927.197287-8-jsnow@redhat.com>
Date: Wed, 13 Jan 2021 17:12:52 +0100
In-Reply-To: <20201217015927.197287-8-jsnow@redhat.com> (John Snow's message
 of "Wed, 16 Dec 2020 20:59:22 -0500")
Message-ID: <87ft34x1bv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> The event_enum_members change might become irrelevant after a
> forthcoming (?) patch by Markus, but didn't have it in-hand at time of
> publishing.

It's in my "[PATCH 00/11] Drop support for QAPIGen without a file name",
which includes parts of your v1.  The parts that are new should be
injected into your series so they replace your "[PATCH v2 09/12]
qapi/gen: move write method to QAPIGenC, make fname a str".  Holler if
you need help.

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/events.py |  2 +-
>  scripts/qapi/schema.py | 25 ++++++++++++++-----------
>  scripts/qapi/types.py  |  9 +++++----
>  scripts/qapi/visit.py  |  6 +++---
>  4 files changed, 23 insertions(+), 19 deletions(-)
>
> diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
> index 9851653b9d1..9ba4f109028 100644
> --- a/scripts/qapi/events.py
> +++ b/scripts/qapi/events.py
> @@ -225,7 +225,7 @@ def visit_event(self,
>                                            self._event_emit_name))
>          # Note: we generate the enum member regardless of @ifcond, to
>          # keep the enumeration usable in target-independent code.
> -        self._event_enum_members.append(QAPISchemaEnumMember(name, None))
> +        self._event_enum_members.append(QAPISchemaEnumMember(name, info))

This "enum" is not supposed to be erroneous.  If it is, it's a bug.

Your patch changes how the code behaves should such a bug bite here.
Before, we crash.  Afterwards, we report the bug using @info, which I'd
expect to produce utterly confusing error messages.

My comments on PATCH 06 apply: how the code should behave here is a
design issue that should be kept out of this patch series.

If you need to pass a value other than None to help with static typing,
then pass a suitable poison info that will crash right where None
crashes now.

>  def gen_events(schema: QAPISchema,
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 720449feee4..0449771dfe5 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -23,6 +23,7 @@
>  from .error import QAPIError, QAPISemError
>  from .expr import check_exprs
>  from .parser import QAPISchemaParser
> +from .source import QAPISourceInfo
>  
>  
>  class QAPISchemaEntity:
> @@ -36,10 +37,10 @@ def __init__(self, name, info, doc, ifcond=None, features=None):
>          self.name = name
>          self._module = None
>          # For explicitly defined entities, info points to the (explicit)
> -        # definition.  For builtins (and their arrays), info is None.
> -        # For implicitly defined entities, info points to a place that
> -        # triggered the implicit definition (there may be more than one
> -        # such place).
> +        # definition. For built-in types (and their arrays), info is a
> +        # special object that evaluates to False. For implicitly defined
> +        # entities, info points to a place that triggered the implicit
> +        # definition (there may be more than one such place).
>          self.info = info
>          self.doc = doc
>          self._ifcond = ifcond or []
> @@ -68,7 +69,7 @@ def check_doc(self):
>  
>      def _set_module(self, schema, info):
>          assert self._checked
> -        self._module = schema.module_by_fname(info and info.fname)
> +        self._module = schema.module_by_fname(info.fname if info else None)

Looks unrelated.

>          self._module.add_entity(self)
>  
>      def set_module(self, schema):
[...]


