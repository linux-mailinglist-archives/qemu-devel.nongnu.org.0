Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1762C2223
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 10:54:37 +0100 (CET)
Received: from localhost ([::1]:59414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khV1w-000432-N6
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 04:54:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1khUzC-0001d9-10
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 04:51:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1khUz9-00078s-DW
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 04:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606211501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UgaWPaa1glq1x2bnbYxaLyY+m1avSf2EVIOsB+42L0Y=;
 b=O7VePA+jctsEB9g1Jzv8vt6roIJm1W0ZGeXKk0DB6+zC+ksw8Od5/82ZIHl6uHtsjaD+em
 3iFYZ0mXl2DFILiKvrIZ/YzWCeopXwhfuzkRf13okD8KbaieajQ3uOOhJ2jpSTcXcASUxW
 7+6PDbuBPQYvTqOcSZT9QYTOgBx6Cw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-W-v7KcXANWqB9gWbRM7EUw-1; Tue, 24 Nov 2020 04:51:39 -0500
X-MC-Unique: W-v7KcXANWqB9gWbRM7EUw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7449521D
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 09:51:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8EB060864;
 Tue, 24 Nov 2020 09:51:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 582BC113864E; Tue, 24 Nov 2020 10:51:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v3 08/19] qlit: Move qlit_equal_qobject() reference
 values to array
References: <20201123194818.2773508-1-ehabkost@redhat.com>
 <20201123194818.2773508-9-ehabkost@redhat.com>
Date: Tue, 24 Nov 2020 10:51:34 +0100
In-Reply-To: <20201123194818.2773508-9-ehabkost@redhat.com> (Eduardo Habkost's
 message of "Mon, 23 Nov 2020 14:48:07 -0500")
Message-ID: <87360zozfd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr?= =?utf-8?Q?=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> Add an array of values to qlit_equal_qobject_test(), so we can
> extend the test case to compare multiple literals, not just the
> ones at the existing `qlit` and `qlit_foo` variables.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> This is a new patch added in v3 of this series.
> ---
>  tests/check-qlit.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/tests/check-qlit.c b/tests/check-qlit.c
> index 24ac21395c..b1cfbddb17 100644
> --- a/tests/check-qlit.c
> +++ b/tests/check-qlit.c
> @@ -29,11 +29,6 @@ static QLitObject qlit = QLIT_QDICT(((QLitDictEntry[]) {
>      { },
>  }));
>  
> -static QLitObject qlit_foo = QLIT_QDICT(((QLitDictEntry[]) {
> -    { "foo", QLIT_QNUM_INT(42) },
> -    { },
> -}));
> -
>  static QObject *make_qobject(void)
>  {
>      QDict *qdict = qdict_new();
> @@ -53,16 +48,33 @@ static QObject *make_qobject(void)
>  
>  static void qlit_equal_qobject_test(void)
>  {
> +    /* Each entry in the values[] array should be different from the others */
> +    QLitObject values[] = {
> +        qlit,
> +        QLIT_QDICT(((QLitDictEntry[]) {
> +            { "foo", QLIT_QNUM_INT(42) },
> +            { },
> +        })),
> +    };
> +    int i;
>      QObject *qobj = make_qobject();
>  
>      g_assert(qlit_equal_qobject(&qlit, qobj));
>  
> -    g_assert(!qlit_equal_qobject(&qlit_foo, qobj));
> -
>      qdict_put(qobject_to(QDict, qobj), "bee", qlist_new());
>      g_assert(!qlit_equal_qobject(&qlit, qobj));
>  
>      qobject_unref(qobj);
> +
> +    for (i = 0; i < ARRAY_SIZE(values); i++) {
> +        int j;

I'd prefer to declare this one together with @i.

> +        QObject *o = qobject_from_qlit(&values[i]);

Blank line, if you don't mind.

> +        for (j = 0; j < ARRAY_SIZE(values); j++) {
> +            g_assert(qlit_equal_qobject(&values[j], o) == (i == j));
> +        }
> +        qobject_unref(o);
> +    }
> +
>  }
>  
>  static void qlit_equal_large_qnum_test(void)


