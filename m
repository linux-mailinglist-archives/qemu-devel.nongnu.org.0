Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7276470664
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 17:51:51 +0100 (CET)
Received: from localhost ([::1]:52658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvj7e-0003K0-HQ
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 11:51:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvj6l-0002aZ-CA
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 11:50:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvj6g-0002Cq-QU
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 11:50:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639155049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YzNuz9TAhHQ6KfVG/klih6F+FqloR6NtTYNJNwrKeWM=;
 b=ile/7/M0fnj3LZOUPwrQTGffSDc1HL2X7OWZe61sA2s2+1KXa/tdblSOCJ9HvAiDK9fRHy
 GJ5ZyEeQ/bADpwm5hENjvL6IDffFVNOB3MoTaTCtvxmQzdlqrBCNN3cyRDYUGVVgxfBTl7
 jl8lqDjxlAOtPXf2f+HilOZMX4aCNSI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-wQR7aDHYPl2fD93pQBHaWw-1; Fri, 10 Dec 2021 11:50:48 -0500
X-MC-Unique: wQR7aDHYPl2fD93pQBHaWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F003801AAB
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 16:50:47 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E390C7A220;
 Fri, 10 Dec 2021 16:50:45 +0000 (UTC)
Date: Fri, 10 Dec 2021 17:50:44 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH 10/12] qapi: Generate QOM config marshalling code
Message-ID: <YbOFZOPjGm9JGOj9@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
 <20211103173002.209906-11-kwolf@redhat.com>
 <87h7c3554i.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87h7c3554i.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Am 23.11.2021 um 15:16 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  backends/rng-random.c | 17 ++------
> >  backends/rng.c        | 17 ++------
> >  scripts/qapi/main.py  |  2 +
> >  scripts/qapi/qom.py   | 91 +++++++++++++++++++++++++++++++++++++++++++
> >  qapi/meson.build      |  3 ++
> >  5 files changed, 104 insertions(+), 26 deletions(-)
> >  create mode 100644 scripts/qapi/qom.py
> >
> > diff --git a/backends/rng-random.c b/backends/rng-random.c
> > index b221308091..35738df3c6 100644
> > --- a/backends/rng-random.c
> > +++ b/backends/rng-random.c
> > @@ -14,6 +14,7 @@
> >  #include "sysemu/rng-random.h"
> >  #include "sysemu/rng.h"
> >  #include "qapi/error.h"
> > +#include "qapi/qapi-qom-qom.h"
> >  #include "qapi/visitor.h"
> >  #include "qapi/qmp/qerror.h"
> >  #include "qemu/main-loop.h"
> > @@ -90,7 +91,8 @@ static char *rng_random_get_filename(Object *obj, Error **errp)
> >      return g_strdup(s->filename);
> >  }
> >  
> > -static bool rng_random_config(Object *obj, const char *filename, Error **errp)
> > +bool qom_rng_random_config(Object *obj, bool has_filename,
> > +                           const char *filename, Error **errp)
> >  {
> >      RngRandom *s = RNG_RANDOM(obj);
> >  
> > @@ -100,17 +102,6 @@ static bool rng_random_config(Object *obj, const char *filename, Error **errp)
> >      return true;
> >  }
> >  
> > -static bool rng_random_marshal_config(Object *obj, Visitor *v, Error **errp)
> > -{
> > -    g_autofree char *filename = NULL;
> > -
> > -    if (!visit_type_str(v, "filename", &filename, errp)) {
> > -        return false;
> > -    }
> > -
> > -    return rng_random_config(obj, filename, errp);
> > -}
> > -
> 
> Generated replacement:
> 
>    bool qom_rng_random_marshal_config(Object *obj, Visitor *v, Error **errp)
>    {
>        q_obj_rng_random_config config = {0};
> 
>        if (!visit_type_q_obj_rng_random_config_members(v, &config, errp)) {
>            return false;
>        }
> 
>        return qom_rng_random_config(obj, config.has_filename, config.filename, errp);
>    }
> 
> where visit_type_q_obj_rng_random_config_members() is
> 
>     bool visit_type_q_obj_rng_random_config_members(Visitor *v, q_obj_rng_random_config *obj, Error **errp)
>     {
>         if (visit_optional(v, "filename", &obj->has_filename)) {
>             if (!visit_type_str(v, "filename", &obj->filename, errp)) {
>                 return false;
>             }
>         }
>         return true;
>     }
> 
> The handwritten version lacks a visit_optional(), I think.

Yes, this looks like a bug in the handwritten version from patch 5.

The generated version seems to have a bug, too: It doesn't free the
members of @config after calling qom_rng_random_config().

Kevin


