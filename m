Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A169758D6B5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 11:48:01 +0200 (CEST)
Received: from localhost ([::1]:44442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLLqC-0001Jy-Gl
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 05:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oLLnH-0008Bz-5H
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 05:44:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oLLnE-0002vK-Qb
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 05:44:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660038295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q135YyKgLDPbKUiR4TbF5xxJtc5egwllZa75VtW7qUg=;
 b=UNtYgazpQ4T5SQZkl+fnHQ1i/GPaGBHJt9gwiIZ2OwN5Yu3qUQ2VqkrhMWiTYhmxOqG43y
 VahWh/fIDMCE791iBg6sAKcMRdHWO1pK2on55hLIWyD5Tc8F3KjiQk0X4M9rUCyldM/T10
 BkO93OGN1ohn14XH99wXaj4VVhlCf+0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-6EC1McP8NOqy8NwQAngz9w-1; Tue, 09 Aug 2022 05:44:54 -0400
X-MC-Unique: 6EC1McP8NOqy8NwQAngz9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D457B85A587;
 Tue,  9 Aug 2022 09:44:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC01A1121314;
 Tue,  9 Aug 2022 09:44:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8B42B21E693E; Tue,  9 Aug 2022 11:44:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  QEMU Developers <qemu-devel@nongnu.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: how long do we need to retain gitlab CI job stdout logs?
References: <CAFEAcA_Y=ugD=Oh=fJhi=9GE73zpWnp0YC9dOoJazHg1PgXu=w@mail.gmail.com>
 <536c6605-fd29-dbca-8633-944656e6dc8e@redhat.com>
 <YvIfzm+GWSEY28mO@redhat.com>
Date: Tue, 09 Aug 2022 11:44:52 +0200
In-Reply-To: <YvIfzm+GWSEY28mO@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 9 Aug 2022 09:50:22 +0100")
Message-ID: <87v8r1iwdn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Aug 08, 2022 at 08:42:28PM +0200, Thomas Huth wrote:
>> On 08/08/2022 19.47, Peter Maydell wrote:
>> > Hi; I just reduced QEMU's storage usage on gitlab by 130GB (no typo!)
>> > using https://gitlab.com/eskultety/gitlab_cleaner, which Dan helpfully
>> > pointed me at. This script removes old pipelines, which take up a
>> > lot of storage space for QEMU because they include the stdout logs
>> > for all the CI jobs in the pipeline. (Gitlab doesn't expire these,
>> > either by default or configurably -- you have to either manually delete
>> > the pipeline in the UI or else use the API, as this script does.)
>> >=20
>> > I somewhat conservatively only blew away pipelines from before the
>> > 1st January 2022. I feel like we don't really even need 6 months worth
>> > of CI job logs, though -- any views on whether we should be pruning
>> > them more aggressively ?
>>=20
>> I'd say we should at least keep the logs of the last 4 to 5 months, i.e.=
 the
>> logs for one release cycle, so we can check these logs in case we introd=
uced
>> a new bug in the current release cycle.
>
> Have we ever actually done this in practice ?  I don't think I've ever
> looked at a pipeline older than 1-2 weeks in any project I've worked
> with on gitlab.
>
> Note that we currently use 165 GB, over an 8 month period (not sure on
> the split between container registry and pipeline). I'd guess 4-5 months
> might knock another 30-40 GB off our usage, still leaving it huge.

100GiB is a lot even in 2022.

> Personally I would suggest 1 month is sufficent for 99% of our needs.

Makes sense to me.

If we really need more, maybe look into storing suitable deltas?


