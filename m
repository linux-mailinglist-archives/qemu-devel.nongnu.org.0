Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164CC339CBB
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 09:02:55 +0100 (CET)
Received: from localhost ([::1]:39794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKzEb-0006XD-U1
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 03:02:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKzDJ-00066t-UH
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 03:01:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKzDE-0002dh-QD
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 03:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615622461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8BZQShy0niU3IOXD+Fe5FnVVrswFkTcKLHKu8q+dkxA=;
 b=NwtBQj7TnQSa8aDovKlbIndXNRxI0VIYL6XNZbBdMxO54XVIjB7tDLJIXyCjeqqNFecLZu
 QHSPbepmX7N/XLAri+rKdRFz73PgrVQlhNLwUYcoQz3oHoT2Co1IfLjmv5QnVQ0xU6IN6I
 dLBjThdJYsY6Y1GghRWEHkVSJFpnfSI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-RmQvXJs-Nw6hs1iGX5L34A-1; Sat, 13 Mar 2021 03:00:59 -0500
X-MC-Unique: RmQvXJs-Nw6hs1iGX5L34A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58E0E81744F
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:00:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2383219704;
 Sat, 13 Mar 2021 08:00:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8AA101132C12; Sat, 13 Mar 2021 09:00:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] qom: Support JSON in user_creatable_parse_str()
References: <20210312131921.421023-1-kwolf@redhat.com>
Date: Sat, 13 Mar 2021 09:00:56 +0100
In-Reply-To: <20210312131921.421023-1-kwolf@redhat.com> (Kevin Wolf's message
 of "Fri, 12 Mar 2021 14:19:21 +0100")
Message-ID: <87blbnxz2f.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, pkrempa@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recommend

    qom: Support JSON in HMP object_add and tools --object

to put the most interesting bit right in "git-log --oneline".

Kevin Wolf <kwolf@redhat.com> writes:

> Support JSON for --object in all tools and in HMP object_add in the same
> way as it is supported in qobject_input_visitor_new_str().
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
> Based-on: <20210311144811.313451-1-kwolf@redhat.com>
>
>  qom/object_interfaces.c | 32 +++++++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 11 deletions(-)
>
> diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
> index 62d7db7629..f5ea84b6c4 100644
> --- a/qom/object_interfaces.c
> +++ b/qom/object_interfaces.c
> @@ -295,25 +295,35 @@ static void user_creatable_print_help_from_qdict(QDict *args)
>  ObjectOptions *user_creatable_parse_str(const char *optarg, Error **errp)
>  {
>      ERRP_GUARD();
> -    QDict *args;
> +    QObject *obj;
>      bool help;
>      Visitor *v;
>      ObjectOptions *options;
>  
> -    args = keyval_parse(optarg, "qom-type", &help, errp);
> -    if (*errp) {
> -        return NULL;
> -    }
> -    if (help) {
> -        user_creatable_print_help_from_qdict(args);
> -        qobject_unref(args);
> -        return NULL;
> +    if (optarg[0] == '{') {
> +        obj = qobject_from_json(optarg, errp);
> +        if (!obj) {
> +            return NULL;
> +        }
> +        v = qobject_input_visitor_new(obj);
> +    } else {
> +        QDict *args = keyval_parse(optarg, "qom-type", &help, errp);
> +        if (*errp) {
> +            return NULL;
> +        }
> +        if (help) {
> +            user_creatable_print_help_from_qdict(args);
> +            qobject_unref(args);
> +            return NULL;
> +        }
> +
> +        obj = QOBJECT(args);
> +        v = qobject_input_visitor_new_keyval(obj);
>      }
>  
> -    v = qobject_input_visitor_new_keyval(QOBJECT(args));
>      visit_type_ObjectOptions(v, NULL, &options, errp);
>      visit_free(v);
> -    qobject_unref(args);
> +    qobject_unref(obj);
>  
>      return options;
>  }

Best viewed with whitespace change ignored:

   diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
   index 2e50698075..93b8878127 100644
   --- a/qom/object_interfaces.c
   +++ b/qom/object_interfaces.c
   @@ -242,12 +242,19 @@ static void user_creatable_print_help_from_qdict(QDict *args)
    ObjectOptions *user_creatable_parse_str(const char *optarg, Error **errp)
    {
        ERRP_GUARD();
   -    QDict *args;
   +    QObject *obj;
        bool help;
        Visitor *v;
        ObjectOptions *options;

   -    args = keyval_parse(optarg, "qom-type", &help, errp);
   +    if (optarg[0] == '{') {
   +        obj = qobject_from_json(optarg, errp);
   +        if (!obj) {
   +            return NULL;
   +        }
   +        v = qobject_input_visitor_new(obj);
   +    } else {
   +        QDict *args = keyval_parse(optarg, "qom-type", &help, errp);
            if (*errp) {
                return NULL;
            }
   @@ -257,10 +264,13 @@ ObjectOptions *user_creatable_parse_str(const char *optarg, Error **errp)
                return NULL;
            }

   -    v = qobject_input_visitor_new_keyval(QOBJECT(args));
   +        obj = QOBJECT(args);
   +        v = qobject_input_visitor_new_keyval(obj);
   +    }
   +
        visit_type_ObjectOptions(v, NULL, &options, errp);
        visit_free(v);
   -    qobject_unref(args);
   +    qobject_unref(obj);

        return options;
    }

Reviewed-by: Markus Armbruster <armbru@redhat.com>


