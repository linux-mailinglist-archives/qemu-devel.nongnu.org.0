Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE4F2C2229
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 10:57:22 +0100 (CET)
Received: from localhost ([::1]:38292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khV4b-00071I-MM
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 04:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1khV2r-0005rW-71
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 04:55:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1khV2p-0008Pm-FV
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 04:55:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606211730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qtIAPB3ibATioxV1ofmczLzi8zB6TvdAHeMHf7qW710=;
 b=ZmTZX9po3SywJFbiP2VrkZfSp464t7GXpXdBLB7LoXrp9iDIjjIYIcxUp1qt8RfbGLRDEj
 i6EJHr0FeytoHv+yifA6c8MnT1JDMw36/h0R4LPbFHFXfeHFb2vVIOGp7tLH35vVN4lEzO
 TYJgvkTT9+gqbwct910+CAe0MzwPl+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-rtFSNkcJPSCKQnJEApkoRg-1; Tue, 24 Nov 2020 04:55:28 -0500
X-MC-Unique: rtFSNkcJPSCKQnJEApkoRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7261418C43D0
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 09:55:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A06175D9CA;
 Tue, 24 Nov 2020 09:55:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 40BC3113864E; Tue, 24 Nov 2020 10:55:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v3 10/19] qlit: Support all types of QNums
References: <20201123194818.2773508-1-ehabkost@redhat.com>
 <20201123194818.2773508-11-ehabkost@redhat.com>
Date: Tue, 24 Nov 2020 10:55:22 +0100
In-Reply-To: <20201123194818.2773508-11-ehabkost@redhat.com> (Eduardo
 Habkost's message of "Mon, 23 Nov 2020 14:48:09 -0500")
Message-ID: <87y2irnkol.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

> Add two new macros to support other types of QNums:
> QLIT_QNUM_UINT, and QLIT_QNUM_DOUBLE, and include them
> in the qlit_equal_qobject_test() test case.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v2 -> v3:
> * QLIT_QNUM macro doesn't exist anymore
> * Addition of the QNumValue field to QLitObject is
>   now in a separate patch ("qlit: Use QNumValue to represent QNums")
> * check-qjson test case changes dropped.
>   Instead, I'm only extending the qlit_equal_qobject_test() test
>   case.
>
> Changes v1 -> v2:
> * Coding style fix at qlit_equal_qobject()
> ---
>  include/qapi/qmp/qlit.h | 4 ++++
>  tests/check-qlit.c      | 5 +++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/include/qapi/qmp/qlit.h b/include/qapi/qmp/qlit.h
> index a240cdd299..a2881b7f42 100644
> --- a/include/qapi/qmp/qlit.h
> +++ b/include/qapi/qmp/qlit.h
> @@ -42,6 +42,10 @@ struct QLitDictEntry {
>      { .type = QTYPE_QBOOL, .value.qbool = (val) }
>  #define QLIT_QNUM_INT(val) \
>      { .type = QTYPE_QNUM, .value.qnum = QNUM_VAL_INT(val) }
> +#define QLIT_QNUM_UINT(val) \
> +    { .type = QTYPE_QNUM, .value.qnum = QNUM_VAL_UINT(val) }
> +#define QLIT_QNUM_DOUBLE(val) \
> +    { .type = QTYPE_QNUM, .value.qnum = QNUM_VAL_DOUBLE(val) }
>  #define QLIT_QSTR(val) \
>      { .type = QTYPE_QSTRING, .value.qstr = (val) }
>  #define QLIT_QDICT(val) \
> diff --git a/tests/check-qlit.c b/tests/check-qlit.c
> index 5a9260b93f..31e90f8965 100644
> --- a/tests/check-qlit.c
> +++ b/tests/check-qlit.c
> @@ -58,6 +58,11 @@ static void qlit_equal_qobject_test(void)
>          QLIT_QNUM_INT(1),
>          QLIT_QNUM_INT(INT64_MIN),
>          QLIT_QNUM_INT(INT64_MAX),
> +        QLIT_QNUM_UINT(UINT64_MAX),
> +        /* Larger than UINT64_MAX: */
> +        QLIT_QNUM_DOUBLE(18446744073709552e3),
> +        /* Smaller than INT64_MIN: */
> +        QLIT_QNUM_DOUBLE(-92233720368547758e2),

Why "larger than UINT64_MAX" and "smaller than INT64_MIN"?

>          QLIT_QSTR(""),
>          QLIT_QSTR("foo"),
>          qlit,


