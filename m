Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F1336EB47
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 15:26:29 +0200 (CEST)
Received: from localhost ([::1]:39722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc6gW-0001OC-BD
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 09:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lc6d3-0007Oh-Cy
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:22:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lc6d0-0008NF-BE
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619702569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VRZrmWExYcixr/7LyEV7VZUbwA1yfY52nD8nN8t99KI=;
 b=VvuAu+RtTAUDYOHeEI+5q+1YkRPg0M5ivDM9a4RWPn1sIEPjlP4wsnkpLfT0NNfCEBGpoo
 OQlmqdUAWrzYL3kHYMEKPItrMz4tqL97ot2YevAUAF8PK+7Pinzuw4ktj43q5Lgen3NjcG
 6yVUMk9pclLTDd33tCfzB7B6PPmh9Ek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-M0Ydudi6OdSk7QrJcvQITw-1; Thu, 29 Apr 2021 09:22:46 -0400
X-MC-Unique: M0Ydudi6OdSk7QrJcvQITw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADC879126B;
 Thu, 29 Apr 2021 13:22:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7232619726;
 Thu, 29 Apr 2021 13:22:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0AB4D113525D; Thu, 29 Apr 2021 15:22:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 10/12] qtest/qmp-cmd-test: Make test
 build-independent from accelerator
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-11-philmd@redhat.com>
 <87lf91ir1m.fsf@dusky.pond.sub.org>
 <1de6b3f8-7d7c-9280-4cd3-633a19dd9b8e@redhat.com>
Date: Thu, 29 Apr 2021 15:22:43 +0200
In-Reply-To: <1de6b3f8-7d7c-9280-4cd3-633a19dd9b8e@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 29 Apr 2021 10:41:34
 +0200")
Message-ID: <874kfprzrw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?Q?P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 4/29/21 7:43 AM, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> Now than we can probe if the TCG accelerator is available
>>> at runtime with a QMP command, do it once at the beginning
>>> and only register the tests we can run.
>>> We can then replace the #ifdef'ry by a runtime check.
>>>
>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>=20
>> Please read the last remark first.  The other ones are detail; feel free
>> to skip them until we're done with the last one.
>>=20
>>> ---
>>>  tests/qtest/qmp-cmd-test.c | 18 ++++++++++++++----
>>>  1 file changed, 14 insertions(+), 4 deletions(-)
>
>>> +    tcg_accel_available =3D qtest_has_accel("tcg");
>>> +
>>=20
>> When does tcg_accel_available differ from defined(CONFIG_TCG)?
>
> qtest_has_accel("tcg") is a runtime check, while defined(CONFIG_TCG)
> is build-time.

Let me rephrase my question: under what conditions can the values of
qtest_has_accel("tcg") and defined(CONFIG_TCG) differ?

> Having tests doing runtime checking allow to:
>
> - have easier reviews, having less #ifdef'ry
> - build them once for all targets
> - build them once for all ./configure options
>   (thinking about CI, the a single job could build the tests, then
>   we run them using the QEMU binaries from other jobs)
> - use the same binaries to test the built binary and the distribution
>   installed one
> - remove the dependencies between tests and binaries
>
>>=20
>>>      g_test_init(&argc, &argv, NULL);
>>> =20
>>>      qmp_schema_init(&schema);
>>=20


