Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D5158D3AB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 08:22:26 +0200 (CEST)
Received: from localhost ([::1]:56208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLIdF-0005hb-BJ
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 02:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oLIZg-0003br-Oy
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 02:18:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oLIZd-0005Tm-NJ
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 02:18:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660025920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZHaCAzz6yp48EoB/R8pXAU4FhnkUoeRBF2dKM3x/YHg=;
 b=RY1u0ho+QQxV/NSP33ZYYMVTj4xmvSRd2SWJfs4wHyiSWFrBuxf39uv5VMqJ2yxXw59C6z
 hT47nqGKfnmZ+4q3HDU86X59ah4YdVHFbjecDi1NvplKUWO+dCQpFa01svUVzAKq9ZjTvJ
 wVIbOaSvljhUG6NrarSsunqAMOnFrpc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-HpzyO7NeMse9PxNasPHEew-1; Tue, 09 Aug 2022 02:18:39 -0400
X-MC-Unique: HpzyO7NeMse9PxNasPHEew-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 049001857F07
 for <qemu-devel@nongnu.org>; Tue,  9 Aug 2022 06:18:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7E05400F36;
 Tue,  9 Aug 2022 06:18:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BCD0021E693E; Tue,  9 Aug 2022 08:18:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,  qemu-devel@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 1/1] tests/qtest: add scenario for -readconfig handling
References: <20220805115529.124544-1-berrange@redhat.com>
 <20220805115529.124544-2-berrange@redhat.com>
 <0d00fbb9-3b47-6041-4afa-63bb618689f0@redhat.com>
 <YvFB/DZ+lYRHbd+U@redhat.com>
Date: Tue, 09 Aug 2022 08:18:35 +0200
In-Reply-To: <YvFB/DZ+lYRHbd+U@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Mon, 8 Aug 2022 18:03:56 +0100")
Message-ID: <87h72mj5xg.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

> On Mon, Aug 08, 2022 at 07:55:50AM +0200, Thomas Huth wrote:
>> On 05/08/2022 13.55, Daniel P. Berrang=C3=A9 wrote:
>> > This test of -readconfig validates the last three regressions we
>> > have fixed with -readconfig:
>> >=20
>> >   * Interpretation of memory size units as MiB not bytes
>> >   * Allow use of [spice]
>> >   * Allow use of [object]
>>=20
>> Good idea!
>>=20
>> > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

[...]

>> > diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-te=
st.c
>> > new file mode 100644
>> > index 0000000000..2e604d7c2d
>> > --- /dev/null
>> > +++ b/tests/qtest/readconfig-test.c

[...]

>> > +#ifdef CONFIG_SPICE
>> > +static void test_spice_resp(QObject *res)
>> > +{
>> > +    Visitor *v;
>> > +    g_autoptr(SpiceInfo) spice =3D NULL;
>> > +
>> > +    g_assert(res);
>> > +    v =3D qobject_input_visitor_new(res);
>> > +    visit_type_SpiceInfo(v, "spcie", &spice, &error_abort);
>>=20
>> That "spcie" looks like a typo?
>
> Yes, but I believe this argument is ignored by the visitor in this
> scenario - it didn't fail for me at least.

include/qapi/visitor.h:

 * The @name parameter of visit_type_FOO() describes the relation
 * between this QAPI value and its parent container.  When visiting
 * the root of a tree, @name is ignored; when visiting a member of an
 * object, @name is the key associated with the value; when visiting a
 * member of a list, @name is NULL; and when visiting the member of an
 * alternate, @name should equal the name used for visiting the
 * alternate.

> Regardless, sHould be fixed of course
>
>
> With regards,
> Daniel


