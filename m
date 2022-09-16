Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3EF5BA684
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 07:49:42 +0200 (CEST)
Received: from localhost ([::1]:54190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ4EP-0002mk-Ek
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 01:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oZ4CI-00017s-8l
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 01:47:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oZ4CF-0000uH-Bg
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 01:47:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663307246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kWopYI5BgoR7DKCQH8BmlD1knDtszVecZ79s3JXgHsA=;
 b=MaIGGKX6LcZLFuSTcAagsfVJxYD/FhvTACi5vLE7snHIX4Szb9MtULBcm8XkFRU0jRUAh/
 49zqMVyDakFupsa3UDurJtTsWSY1X8aJCfoGekpxgGoa1Op61hIlfPgMaCWA75biJ5ZRzm
 8PnG4HlMB3wpIlFIX88Nm56cLC43AHY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-b2VhLNQ9MbmvVX7pWduYhw-1; Fri, 16 Sep 2022 01:47:23 -0400
X-MC-Unique: b2VhLNQ9MbmvVX7pWduYhw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A24D3101A528
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 05:47:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D51A140EBF5;
 Fri, 16 Sep 2022 05:47:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2608E21E6900; Fri, 16 Sep 2022 07:47:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] keyval: Print types on merge inconsistency
References: <20220913100811.99746-1-dgilbert@redhat.com>
Date: Fri, 16 Sep 2022 07:47:21 +0200
In-Reply-To: <20220913100811.99746-1-dgilbert@redhat.com> (David Alan
 Gilbert's message of "Tue, 13 Sep 2022 11:08:11 +0100")
Message-ID: <87o7vfg9au.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> writes:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> When 'keyval_do_merge' checks consistency of types, if they mismatch
> print the types so we get a hint of what's going on.
>
> e.g.
> qemu-system-x86_64: Parameter 'memory' used inconsistently (qstring/qdict)
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  util/keyval.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/util/keyval.c b/util/keyval.c
> index 66a5b4740f..9757adf31f 100644
> --- a/util/keyval.c
> +++ b/util/keyval.c
> @@ -329,8 +329,10 @@ static void keyval_do_merge(QDict *dest, const QDict *merged, GString *str, Erro
>          old_value = qdict_get(dest, ent->key);
>          if (old_value) {
>              if (qobject_type(old_value) != qobject_type(ent->value)) {
> -                error_setg(errp, "Parameter '%s%s' used inconsistently",
> -                           str->str, ent->key);
> +                error_setg(errp, "Parameter '%s%s' used inconsistently (%s/%s)",
> +                           str->str, ent->key,
> +                           QType_str(qobject_type(old_value)),
> +                           QType_str(qobject_type(ent->value)));

Two more, one in keyval_parse_put(), and one in keyval_listify().

The error message talks in developer terms.  Can we talk in user terms
instead?  Could showing the conflicting key suffice?

>                  return;
>              } else if (qobject_type(ent->value) == QTYPE_QDICT) {
>                  /* Merge sub-dictionaries.  */


