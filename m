Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793B3665A24
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 12:31:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFZIe-0005Mt-GA; Wed, 11 Jan 2023 06:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFZIb-0005MX-Qa
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 06:29:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFZIa-0006o6-4V
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 06:29:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673436579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wf0QwS/o0fAgsc0yd/HKp1HEuyhkulkvy/jmSHdcEkQ=;
 b=hvNNn/wN+o2/kuzT3CsqgONMcb4JUnGxtXFnkPO+DH2Qn+DxI7vwYeXL+5GJmMGbYZ65L6
 VbfDFkdkeCJVEh4FsvKLutJGKZKyZ4B3/dWmCgFCNIbAMCp+9LoZ03tZMgSzVvo8+AvmMR
 n1Lvvc3oNmYgBTZEqNgA5kkx1c13lao=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-aW8GVHj9Nxm2zZ7NE6Axgw-1; Wed, 11 Jan 2023 06:29:36 -0500
X-MC-Unique: aW8GVHj9Nxm2zZ7NE6Axgw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9C851C05142;
 Wed, 11 Jan 2023 11:29:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62C53492C14;
 Wed, 11 Jan 2023 11:29:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1A11221E675B; Wed, 11 Jan 2023 12:29:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Kevin Wolf
 <kwolf@redhat.com>,  Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org,  Eduardo Habkost <eduardo@habkost.net>,  Thomas
 Huth <thuth@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Hanna Reitz
 <hreitz@redhat.com>
Subject: Re: [RFC PATCH 0/4] qom: Introduce object_class_property_deprecate()
References: <20230109225419.22621-1-philmd@linaro.org>
 <Y71h8JAqYxeB2hPe@redhat.com>
 <53028cf2-0028-b810-348f-b17df33a8149@linaro.org>
 <Y76IdVNKyIBAZLrl@redhat.com>
 <9a3d8a73-9d41-8cb6-e271-7753347f238d@linaro.org>
 <Y76PlQWd0PCvC7RS@redhat.com>
Date: Wed, 11 Jan 2023 12:29:34 +0100
In-Reply-To: <Y76PlQWd0PCvC7RS@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 11 Jan 2023 10:29:41 +0000")
Message-ID: <871qo1gvhd.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Jan 11, 2023 at 11:08:05AM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> On 11/1/23 10:59, Daniel P. Berrang=C3=A9 wrote:
>> > On Wed, Jan 11, 2023 at 10:55:47AM +0100, Philippe Mathieu-Daud=C3=A9 =
wrote:
>> > > On 10/1/23 14:02, Kevin Wolf wrote:
>> > > > Am 09.01.2023 um 23:54 hat Philippe Mathieu-Daud=C3=A9 geschrieben:
>> > > > > Hi,
>> > > > >=20
>> > > > > There will always be a need to deprecate things. Here I'm
>> > > > > tackling the QOM (class) properties, since they can be set
>> > > > > from some CLI options (-object -device -global ...).
>> > > > >=20
>> > > > > As an experiment, we add object_class_property_deprecate()
>> > > > > to register a class property as deprecated (since some version),
>> > > > > then we deprecate the TYPE_PFLASH_CFI02 'width' property, and
>> > > > > finally as a bonus we emit a warning when the deprecation period
>> > > > > is over, as a reminder. (For that we introduce few 'versions'
>> > > > > helpers).
>> > > >=20
>> > > > The last part means that increasing the version number (i.e. the c=
ommit
>> > > > that opens the development tree for the next release) can change t=
he
>> > > > output, and this is turn can break test cases.
>> > > >=20
>> > > > If we are happy to introduce breakage with a version number change=
 that
>> > > > will require future commits to open the development tree less triv=
ial
>> > > > than they are today because they need to fix the breakage, too, wh=
y not
>> > > > make it a build error instead of a different warning message at ru=
ntime?
>> > >=20
>> > > To avoid build breakages, maybe it is clever is to store the depreca=
tion
>> > > version in ObjectPropertyInfo and let QAPI inspection scripts enumer=
ate
>> > > / report deprecated features?
>> >=20
>> > I don't think we want the version information in the code nor
>> > introspectable at all.
>> >=20
>> > We want applications to only apply logic based off features that are
>> > actually available, not predicted future versions where something may
>> > or may not be removed. This is why we exposed only a plain 'deprecated'
>> > boolean field in QAPI schema for other deprecations.  This is just a
>> > warning to be ready for something to change in future. If an applicati=
on
>> > has not been updated they are fine to carry on using the deprecated
>> > feature. If an application has been updated, they should probe for
>> > existance of the new feature and use that if available, in preference
>> > to the deprecated feature. There's no reason for an application to
>> > consider version numbers.
>>=20
>> Right, but "applications" can also be developer scripts right? Not
>> only user / sysadmin.
>>=20
>> In particular, some HMP commands are only useful for developers, and
>> they are implemented over QMP -> QAPI. So we already expose extra
>> developer information via QAPI.
>
> Sure, but I still don't think we should expose any version info there.
> A deprecated feature isn't gone until it is gone. In the deprecations
> doc we only mention the release where it is first deprecated, don't
> explicitly state when it will be removed. The 2 cycle timeframe is
> a minimum, not an exact removal date, so it would be misleading to
> claim we'll remove things in exactly 2 cycles.

I agree with Daniel.

I understand the motivation for making developers aware of expired grace
periods.

A warning is one way to make aware.  It creates another problem, though:
since the grace period is flexible, we need a way to extend the period,
and we need to decide right at the beginning of the development cycle.

I think the existing process for getting rid of deprecated stuff in a
timely manner is good enough: document all deprecations in
docs/about/deprecated.rst, and check the file periodically.

I'd recommend to follow QAPI's lead and add a "deprecated" flag to QOM.

We may want to follow QAPI some more and add an "unstable" flag, too.
See commit a3c45b3e62 'qapi: New special feature flag "unstable"' for
rationale.


