Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A888169C7A3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:28:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2SB-0008S9-Bg; Mon, 20 Feb 2023 04:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pU2Rl-0007us-Qb
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:27:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pU2RU-0006xB-0D
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:26:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676885198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CanRg0ZW6gu6U+e9V9tC0zvzPEMT773qgaOMPgjTngE=;
 b=W9QKe7FpSTQ9T5wAoot8dhFGZKTnlKiNnjwVm/M0dVogvVohH0OpEmEAhW114MJD5kYnGE
 +TL0t1huxLBXSyIHR2r7HbOe1zj6/qQBjIKfK8xsiQE6JzEDcdgWJqXr0xDmKtiFY6xpql
 HrT6YoxvNoHBBjO5m0mfz9SloiqGqIo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-Kad9QRd0NRqh_xFf2QUGtA-1; Mon, 20 Feb 2023 04:26:34 -0500
X-MC-Unique: Kad9QRd0NRqh_xFf2QUGtA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45F1E1C02CA9;
 Mon, 20 Feb 2023 09:26:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2580D140EBF6;
 Mon, 20 Feb 2023 09:26:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1324121E6A1F; Mon, 20 Feb 2023 10:26:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  qemu-devel <qemu-devel@nongnu.org>,  John Snow
 <jsnow@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  Claudio Fontana
 <cfontana@suse.de>
Subject: Re: [RFC PATCH] docs/about/build-platforms: Refine the distro
 support policy
References: <20230217132631.403112-1-thuth@redhat.com>
 <87sff470lj.fsf@pond.sub.org> <Y++ka8oPpHrNyonT@redhat.com>
 <fe0de452-86df-ca43-8294-eac3938f72df@redhat.com>
 <CABgObfYetmCBVQcVv4vwJKjPmum5ZFJ0dr2HkN9yRtR_8NHSuw@mail.gmail.com>
Date: Mon, 20 Feb 2023 10:26:33 +0100
In-Reply-To: <CABgObfYetmCBVQcVv4vwJKjPmum5ZFJ0dr2HkN9yRtR_8NHSuw@mail.gmail.com>
 (Paolo Bonzini's message of "Fri, 17 Feb 2023 21:17:21 +0100")
Message-ID: <87cz64znzq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> Il ven 17 feb 2023, 19:47 Thomas Huth <thuth@redhat.com> ha scritto:
>
>> On 17/02/2023 16.59, Daniel P. Berrang=C3=A9 wrote:
>> > On Fri, Feb 17, 2023 at 04:55:49PM +0100, Markus Armbruster wrote:
>> ....
>> > The cost/benefit tradeoff of dropping the platforms entirely
>> > is not obviously favourable when we don't have clear demand
>> > to bump the min versions of native packages, and the cost to
>> > users stuck on these platforms to build their own toolchain
>> > or libraries is very high.
>>
>> There's another urgent point which I completely forget to mention in my
>> patch description (not sure how I managed that, since it's bugging me
>> quite
>> badly in the past weeks): We're struggling heavily with CI minutes.
>
>
> The only viable solution for CI minutes is going to be private runners,
> it's not easy to cut 30% of the jobs.
>
> We're using less than half of our Azure sponsorship budget, and could also
> find other sources; either Azure Kubernetes or AWS Fargate are pretty che=
ap
> for running CI because unlike VM instances you pay for just the time that
> CI is running (at least with Azure you still have VMs but they scale out
> dynamically).

To anyone arguing for support of yet another host architecture / target
architecture / configuration / whatever: sponsoring its CI would
demonstrate seriousness :)

> The complicated part is setting up the kubernetes executor for
> gitlab-runner, but we'll find someone. :)


