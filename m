Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6367645A682
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 16:27:15 +0100 (CET)
Received: from localhost ([::1]:41660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpXhR-00064L-W1
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 10:27:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpXfB-0005BE-BN
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 10:24:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpXf8-0001wA-Qk
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 10:24:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637681086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vs6LaVjjrAAgpBKWWiYCRctDMNAuCZrYcc1R/34HoSw=;
 b=fUWuzSrwQAc0WnXuXvn5mvHCiw9nVLa/CGwLod5dexXaajYwwqzzU81u0SJtErjuaUE/Lu
 phheGQrkN+CDP0Xn9Yn/Cwv1ykpnZQKN1hK88WGQrumOZRAnBVdhMgM245kITQ98aKb2fD
 8HNX/kV51xG90uPq27N+a/fJKCwr5ZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-BFDH5w7SPjuNbezNXLy00g-1; Tue, 23 Nov 2021 10:24:22 -0500
X-MC-Unique: BFDH5w7SPjuNbezNXLy00g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28B7ABBF02
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 15:24:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F4C95D6CF;
 Tue, 23 Nov 2021 15:24:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A52A611380A7; Tue, 23 Nov 2021 16:23:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH 02/12] qom: Create object_configure()
References: <20211103173002.209906-1-kwolf@redhat.com>
 <20211103173002.209906-3-kwolf@redhat.com>
Date: Tue, 23 Nov 2021 16:23:59 +0100
In-Reply-To: <20211103173002.209906-3-kwolf@redhat.com> (Kevin Wolf's message
 of "Wed, 3 Nov 2021 18:29:52 +0100")
Message-ID: <8735nm6gkw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 eblake@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> This renames object_set_properties_from_qdict() to object_configure()
> and removes the QDict parameter from it: With visit_next_struct_member()
> it can set all properties without looking at the keys of the QDict.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qom/object_interfaces.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
> index 3b61c195c5..f9f5608194 100644
> --- a/qom/object_interfaces.c
> +++ b/qom/object_interfaces.c
> @@ -42,16 +42,15 @@ bool user_creatable_can_be_deleted(UserCreatable *uc)
>      }
>  }
>  
> -static void object_set_properties_from_qdict(Object *obj, const QDict *qdict,
> -                                             Visitor *v, Error **errp)
> +static void object_configure(Object *obj, Visitor *v, Error **errp)
>  {
> -    const QDictEntry *e;
> +    const char *key;
>  
>      if (!visit_start_struct(v, NULL, NULL, 0, errp)) {
>          return;
>      }
> -    for (e = qdict_first(qdict); e; e = qdict_next(qdict, e)) {
> -        if (!object_property_set(obj, e->key, v, errp)) {
> +    while ((key = visit_next_struct_member(v))) {
> +        if (!object_property_set(obj, key, v, errp)) {
>              goto out;
>          }
>      }
> @@ -69,7 +68,7 @@ void object_set_properties_from_keyval(Object *obj, const QDict *qdict,
>      } else {
>          v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
>      }
> -    object_set_properties_from_qdict(obj, qdict, v, errp);
> +    object_configure(obj, v, errp);
>      visit_free(v);
>  }
>  
> @@ -108,7 +107,7 @@ Object *user_creatable_add_type(const char *type, const char *id,
>  
>      assert(qdict);

This is the only remaining use of parameter @qdict.  Let's drop it.

>      obj = object_new(type);
> -    object_set_properties_from_qdict(obj, qdict, v, &local_err);
> +    object_configure(obj, v, &local_err);
>      if (local_err) {
>          goto out;
>      }

Brief recap how configuration data flows trough QMP object-add to QOM:

* QMP object-add is fully typed: union ObjectOptions.  QMP core parses
  input via QDict to ObjectOptions (JSON parser + QObject input
  visitor), and passes that to qmp_object_add().

* qmp_object_add() passes it on to user_creatable_add_qapi().

  Aside: getting rid of the wrapper would be as easy as renaming
  user_creatable_add_qapi() to qmp_object_add().

* user_creatable_add_qapi() converts right back to QDict (QObject output
  visitor).  It extracts the non-properties "qom-type" and "id", and
  passes the properties (wrapped in a QObject input visitor) to
  user_creatable_add_type().

* user_creatable_add_type() feeds the properties to object_configure(),
  formerly object_set_properties_from_qdict().

Your patch simplifies one detail of the last step.  Small
simplifications are welcome, too.

The visitor ping-pong remains: input -> output -> input.

We play visitor ping-pong because we reduce the problem "for each member
of ObjectOptions: set property" to the solved problem "set properties
for an input visitor".

Straight solution of the problem: a QOM property output visitor.

Observation, not demand.


