Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BA12C2A5B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 15:48:55 +0100 (CET)
Received: from localhost ([::1]:47544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khZck-0006hY-Oi
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 09:48:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khZby-0006Ck-LY
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 09:48:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khZbx-0004Mu-3l
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 09:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606229284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JqEvsQuuHlK/diA4QSHr77SXapmTHDYmgf4BFgDrLzU=;
 b=J1aoh5No8JzJDoS4YIEp0NZ8GpFnQj5i79KVRgez+xHIy3/Xz3aDtM7n808VZeFVK3S+7u
 Vc/lyJeBxD/ggXkp5Vrp1crPv2fMRbmacbKPPS16Ot5W5DsS6JJStqmOiZFuc8pvPH4IRm
 1lyy0Vnt8xZj1Wlo5chz5e9In65GgLE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-Q7p42OcoMyqIrtHycs05Xw-1; Tue, 24 Nov 2020 09:48:02 -0500
X-MC-Unique: Q7p42OcoMyqIrtHycs05Xw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B2C281CB0A
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 14:48:01 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CEDF5D9CA;
 Tue, 24 Nov 2020 14:47:57 +0000 (UTC)
Date: Tue, 24 Nov 2020 09:47:56 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 08/19] qlit: Move qlit_equal_qobject() reference
 values to array
Message-ID: <20201124144756.GN2271382@habkost.net>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
 <20201123194818.2773508-9-ehabkost@redhat.com>
 <87360zozfd.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87360zozfd.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 24, 2020 at 10:51:34AM +0100, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > Add an array of values to qlit_equal_qobject_test(), so we can
> > extend the test case to compare multiple literals, not just the
> > ones at the existing `qlit` and `qlit_foo` variables.
> >
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> > This is a new patch added in v3 of this series.
> > ---
> >  tests/check-qlit.c | 26 +++++++++++++++++++-------
> >  1 file changed, 19 insertions(+), 7 deletions(-)
> >
> > diff --git a/tests/check-qlit.c b/tests/check-qlit.c
> > index 24ac21395c..b1cfbddb17 100644
> > --- a/tests/check-qlit.c
> > +++ b/tests/check-qlit.c
> > @@ -29,11 +29,6 @@ static QLitObject qlit = QLIT_QDICT(((QLitDictEntry[]) {
> >      { },
> >  }));
> >  
> > -static QLitObject qlit_foo = QLIT_QDICT(((QLitDictEntry[]) {
> > -    { "foo", QLIT_QNUM_INT(42) },
> > -    { },
> > -}));
> > -
> >  static QObject *make_qobject(void)
> >  {
> >      QDict *qdict = qdict_new();
> > @@ -53,16 +48,33 @@ static QObject *make_qobject(void)
> >  
> >  static void qlit_equal_qobject_test(void)
> >  {
> > +    /* Each entry in the values[] array should be different from the others */
> > +    QLitObject values[] = {
> > +        qlit,
> > +        QLIT_QDICT(((QLitDictEntry[]) {
> > +            { "foo", QLIT_QNUM_INT(42) },
> > +            { },
> > +        })),
> > +    };
> > +    int i;
> >      QObject *qobj = make_qobject();
> >  
> >      g_assert(qlit_equal_qobject(&qlit, qobj));
> >  
> > -    g_assert(!qlit_equal_qobject(&qlit_foo, qobj));
> > -
> >      qdict_put(qobject_to(QDict, qobj), "bee", qlist_new());
> >      g_assert(!qlit_equal_qobject(&qlit, qobj));
> >  
> >      qobject_unref(qobj);
> > +
> > +    for (i = 0; i < ARRAY_SIZE(values); i++) {
> > +        int j;
> 
> I'd prefer to declare this one together with @i.
> 
> > +        QObject *o = qobject_from_qlit(&values[i]);
> 
> Blank line, if you don't mind.

I will surely do it if there's a v4, but I hope you don't make me
submit v4 just to change these.

> 
> > +        for (j = 0; j < ARRAY_SIZE(values); j++) {
> > +            g_assert(qlit_equal_qobject(&values[j], o) == (i == j));
> > +        }
> > +        qobject_unref(o);
> > +    }
> > +
> >  }
> >  
> >  static void qlit_equal_large_qnum_test(void)

-- 
Eduardo


