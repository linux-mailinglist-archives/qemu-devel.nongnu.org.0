Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FCD4DAFD3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 13:38:15 +0100 (CET)
Received: from localhost ([::1]:36720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUSus-0004MO-Ix
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 08:38:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUSo2-0007fB-73
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:31:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUSnw-0002IL-5L
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647433862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gO/OkmDh4Kem0ue7Gg3eE2LlYumXsTvx0QnlYDtAICU=;
 b=GZ/iAQCv73/wXd6xcp6vtAVSzli6HjwvH0/F3tKMeT3dT4dVO+m6f92dwYQEDoke4gRtNa
 kF2SJL2JngS0wVGrcQ71wBypXfPH0ppsWeLIjMC1kKETkSvM1MN99JJHq/7+VFHfym/wgm
 h2Mz1U7AJWnJgr2FXwMNaVYHwRmo2tA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-rAS5D717NeyJh1jpOJAm-A-1; Wed, 16 Mar 2022 08:31:01 -0400
X-MC-Unique: rAS5D717NeyJh1jpOJAm-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74D6029AB45B
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 12:31:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB74E2156A5A;
 Wed, 16 Mar 2022 12:30:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9899F21E66CE; Wed, 16 Mar 2022 13:30:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 25/27] include/qapi: add g_autoptr support for qobject
 types
References: <20220316095454.2613871-1-marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 13:30:55 +0100
In-Reply-To: <20220316095454.2613871-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 16 Mar 2022 13:54:54 +0400")
Message-ID: <87bky65bb4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Add small inline wrappers for qobject_unref() calls, which is a macro.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qapi/qmp/qbool.h   | 6 ++++++
>  include/qapi/qmp/qdict.h   | 6 ++++++
>  include/qapi/qmp/qlist.h   | 8 +++++++-
>  include/qapi/qmp/qnull.h   | 6 ++++++
>  include/qapi/qmp/qnum.h    | 6 ++++++
>  include/qapi/qmp/qstring.h | 6 ++++++
>  6 files changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/include/qapi/qmp/qbool.h b/include/qapi/qmp/qbool.h
> index 2f888d10573f..52b1c5c15280 100644
> --- a/include/qapi/qmp/qbool.h
> +++ b/include/qapi/qmp/qbool.h
> @@ -21,6 +21,12 @@ struct QBool {
>      bool value;
>  };
> =20
> +static inline void qbool_unref(QBool *q) {
> +    qobject_unref(q);
> +}
> +
> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(QBool, qbool_unref)
> +

You need the wrapper function around the wrapper macro qobject_unref(),
because

   G_DEFINE_AUTOPTR_CLEANUP_FUNC(QBool, qobject_unref_impl)

dies with "passing argument 1 of =E2=80=98qobject_unref_impl=E2=80=99 from =
incompatible
pointer type [-Wincompatible-pointer-types]".  Okay.

Style nitpick: a function's opening brace goes on its own line:

   static inline void qbool_unref(QBool *q)
   {
       qobject_unref(q);
   }

Moreover, I prefer to put code in headers only when there's a real need.
I don't see one here.  Most existing uses of
G_DEFINE_AUTOPTR_CLEANUP_FUNC() use a plain extern function.

>  QBool *qbool_from_bool(bool value);
>  bool qbool_get_bool(const QBool *qb);
> =20
> diff --git a/include/qapi/qmp/qdict.h b/include/qapi/qmp/qdict.h
> index d5b5430e21a9..9f0a6a6708b5 100644
> --- a/include/qapi/qmp/qdict.h
> +++ b/include/qapi/qmp/qdict.h
> @@ -30,6 +30,12 @@ struct QDict {
>      QLIST_HEAD(,QDictEntry) table[QDICT_BUCKET_MAX];
>  };
> =20
> +static inline void qdict_unref(QDict *q) {
> +    qobject_unref(q);
> +}
> +
> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(QDict, qdict_unref)
> +
>  /* Object API */
>  QDict *qdict_new(void);
>  const char *qdict_entry_key(const QDictEntry *entry);
> diff --git a/include/qapi/qmp/qlist.h b/include/qapi/qmp/qlist.h
> index 06e98ad5f498..06c267dfb898 100644
> --- a/include/qapi/qmp/qlist.h
> +++ b/include/qapi/qmp/qlist.h
> @@ -26,7 +26,13 @@ struct QList {
>      QTAILQ_HEAD(,QListEntry) head;
>  };
> =20
> -#define qlist_append(qlist, obj) \
> +static inline void qlist_unref(QList *q) {
> +    qobject_unref(q);
> +}
> +
> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(QList, qlist_unref)
> +
> +#define qlist_append(qlist, obj)                \

The whitespace change looks accidental.

>          qlist_append_obj(qlist, QOBJECT(obj))
> =20
>  void qlist_append_bool(QList *qlist, bool value);
> diff --git a/include/qapi/qmp/qnull.h b/include/qapi/qmp/qnull.h
> index e84ecceedbcb..8c45e08b1c47 100644
> --- a/include/qapi/qmp/qnull.h
> +++ b/include/qapi/qmp/qnull.h
> @@ -26,4 +26,10 @@ static inline QNull *qnull(void)
>      return qobject_ref(&qnull_);
>  }
> =20
> +static inline void qnull_unref(QNull *q) {
> +    qobject_unref(q);
> +}
> +
> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(QNull, qnull_unref)
> +
>  #endif /* QNULL_H */
> diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h
> index 7f84e20bfb2c..ebbf9cd5abe8 100644
> --- a/include/qapi/qmp/qnum.h
> +++ b/include/qapi/qmp/qnum.h
> @@ -54,6 +54,12 @@ struct QNum {
>      } u;
>  };
> =20
> +static inline void qnum_unref(QNum *q) {
> +    qobject_unref(q);
> +}
> +
> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(QNum, qnum_unref)
> +
>  QNum *qnum_from_int(int64_t value);
>  QNum *qnum_from_uint(uint64_t value);
>  QNum *qnum_from_double(double value);
> diff --git a/include/qapi/qmp/qstring.h b/include/qapi/qmp/qstring.h
> index 1d8ba469368f..a38d2925d757 100644
> --- a/include/qapi/qmp/qstring.h
> +++ b/include/qapi/qmp/qstring.h
> @@ -20,6 +20,12 @@ struct QString {
>      const char *string;
>  };
> =20
> +static inline void qstring_unref(QString *q) {
> +    qobject_unref(q);
> +}
> +
> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(QString, qstring_unref)
> +
>  QString *qstring_new(void);
>  QString *qstring_from_str(const char *str);
>  QString *qstring_from_substr(const char *str, size_t start, size_t end);


