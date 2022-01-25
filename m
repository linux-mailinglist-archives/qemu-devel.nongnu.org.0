Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A5449B2F5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 12:33:32 +0100 (CET)
Received: from localhost ([::1]:35934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCK4p-00078G-FK
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 06:33:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCK2p-00055s-Hk
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:31:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCK2n-0002Qv-FD
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:31:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643110277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2gsdoXteg5dJdfzMkwUMaQPsXS9PFyIHlEabsR91v3k=;
 b=HB8II3lF74vuwh+cN1MqksdJublmM3jRNO95ngIbD5kxkmU6aGyO/NAZONUmc0FbAtkaPK
 EunzMe9lhxh5fOG8Z29Mw/+Joq8/hpGeQ/QOXkarVPz32fBtn6aYOq4EVuV4MAeEba35Zr
 RK8k0RZGrDnhjiSu+lngjjFgK7LXbGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-uB_fWsmLO8iq6F9gSZgVoQ-1; Tue, 25 Jan 2022 06:31:13 -0500
X-MC-Unique: uB_fWsmLO8iq6F9gSZgVoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6CBE1083F60;
 Tue, 25 Jan 2022 11:31:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-10.ams2.redhat.com
 [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84616752B0;
 Tue, 25 Jan 2022 11:31:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EDADF113864A; Tue, 25 Jan 2022 12:31:10 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 3/3] meson: generate trace events for qmp commands
References: <20220121162234.2707906-1-vsementsov@virtuozzo.com>
 <20220121162234.2707906-4-vsementsov@virtuozzo.com>
 <87ilu82jtk.fsf@dusky.pond.sub.org>
 <fd9a18be-1add-89c2-3da3-fa72c5419d44@virtuozzo.com>
 <87cfc19e-5eaf-4c1b-59c0-29870c063939@virtuozzo.com>
Date: Tue, 25 Jan 2022 12:31:10 +0100
In-Reply-To: <87cfc19e-5eaf-4c1b-59c0-29870c063939@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 25 Jan 2022 14:13:40 +0300")
Message-ID: <87tuds2gsh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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

> 25.01.2022 14:03, Vladimir Sementsov-Ogievskiy wrote:
>> 25.01.2022 13:25, Markus Armbruster wrote:
>>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>>
>>>> 1. Add --no-trace-events to suppress trace events generation in some
>>>> =C2=A0=C2=A0=C2=A0 cases, and make trace events be generated by defaul=
t.
>>>> 2. Add corresponding .trace-events files as outputs in qapi_files
>>>> =C2=A0=C2=A0=C2=A0 custom target
>>>> 3. Define global qapi_trace_events list of .trace-events file targets,
>>>> =C2=A0=C2=A0=C2=A0 to fill in trace/qapi.build and to use in trace/mes=
on.build
>>>> 4. In trace/meson.build use the new array as an additional source of
>>>> =C2=A0=C2=A0=C2=A0 .trace_events files to be processed
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>> =C2=A0 docs/devel/qapi-code-gen.rst | 23 +++++++++++++++++++++--
>>>
>>> The doc update isn't mentioned in the commit message.
>>>
>>>> =C2=A0 meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
>>>> =C2=A0 qapi/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++++++
>>>> =C2=A0 qga/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++++++++++-
>>>> =C2=A0 scripts/qapi/main.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 10 +++++++---
>>>> =C2=A0 tests/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 11 ++++++++++-
>>>> =C2=A0 trace/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 11 ++++++++---
>>>> =C2=A0 7 files changed, 66 insertions(+), 10 deletions(-)
>>>
>>> This commit consists of a small QAPI code generator change, build syste=
m
>>> work to put it to use, and QAPI documentation update for the series'
>>> feature.
>>>
>>> I'd reshuffle as follows:
>>>
>>> * Squash the main.py change into the previous commit.
>>>
>>> * Split off the doc update into its own commit.
>>>
>>> This way, build system experts can provide an R-by in good conscience
>>> without reviewing the doc update, and vice versa.
>>>
>> But I think this way build will fail on previous commit. Or we
>> should still keep trace-generation disabled in previous commit, and
>> enable it only together with meson changes.
>>=20
>
> May be keep positive option --gen-trace-events in previous commit, like i=
n my previous version? This way meson-changing commit becomes self-sufficie=
nt. And then in additional commit change the default and drop --gen-trace-e=
vents option and add --no-trace-events instead.

You choose.  But I'd spell it --gen-trace.


