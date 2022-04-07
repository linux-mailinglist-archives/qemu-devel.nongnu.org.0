Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6F04F7585
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 07:54:44 +0200 (CEST)
Received: from localhost ([::1]:39116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncL6R-0006C2-99
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 01:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ncKzD-0004Xe-KX
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 01:47:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ncKz9-0007Rk-Nd
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 01:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649310429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bva+sZYaeHE8QDdag83KAzC14h7bOk4vVP4+7HimmV4=;
 b=IBCD375Dq9sKksczIEs7gruQ5dUhI3MlRyp2eizLMtBZVD74/Gy/1kXiXNI6F1IJnFOfdc
 fpBQETM8B+uC4sX9xnvsgo7CVfIHxHNlwNMCN9x0sJhG1ZNOzM0eyCwWN1lTwEpDDCmNWC
 LlJQUGWlFwib5yqLY+dlRsMcVWXKinQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-9BUNUoa1O9uYCdSt7LsmPA-1; Thu, 07 Apr 2022 01:46:26 -0400
X-MC-Unique: 9BUNUoa1O9uYCdSt7LsmPA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52A9D185A7A4;
 Thu,  7 Apr 2022 05:46:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2791540B40D7;
 Thu,  7 Apr 2022 05:46:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B85FB21E6A21; Thu,  7 Apr 2022 07:46:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 12/32] qga: replace deprecated g_get_current_time()
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-13-marcandre.lureau@redhat.com>
Date: Thu, 07 Apr 2022 07:46:24 +0200
In-Reply-To: <20220323155743.1585078-13-marcandre.lureau@redhat.com>
 (marcandre lureau's message of "Wed, 23 Mar 2022 19:57:23 +0400")
Message-ID: <878rshla33.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> According to GLib API:
> g_get_current_time has been deprecated since version 2.62 and should not
> be used in newly-written code. GTimeVal is not year-2038-safe. Use
> g_get_real_time() instead.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qga/main.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/qga/main.c b/qga/main.c
> index b9dd19918e47..1deb0ee2fbfe 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -314,7 +314,6 @@ static void ga_log(const gchar *domain, GLogLevelFlag=
s level,
>                     const gchar *msg, gpointer opaque)
>  {
>      GAState *s =3D opaque;
> -    GTimeVal time;
>      const char *level_str =3D ga_log_level_str(level);
> =20
>      if (!ga_logging_enabled(s)) {
> @@ -329,9 +328,11 @@ static void ga_log(const gchar *domain, GLogLevelFla=
gs level,
>  #else
>      if (level & s->log_level) {
>  #endif
> -        g_get_current_time(&time);
> +        gint64 t =3D g_get_real_time();
>          fprintf(s->log_file,
> -                "%lu.%lu: %s: %s\n", time.tv_sec, time.tv_usec, level_st=
r, msg);

The old code is kind of wrong.  Say it's 1649309843.000001 seconds past
the epoch.  Prints "1649309843.1".  9us later, it prints
"1649309843.10".  Should really use %06lu for the microseconds part.

Whether you want to fix this in this patch, or just note it for later in
the commit message, or ignore it alltogether is up to you.

> +                "%" G_GINT64_FORMAT ".%" G_GINT64_FORMAT

This gives me flashbacks to the 90s.  Please use PRId64 like we do
everywhere else.

I'd ditch gint64_t for int64_t, too.

> +                ": %s: %s\n", t / G_USEC_PER_SEC, t % G_USEC_PER_SEC,
> +                level_str, msg);
>          fflush(s->log_file);
>      }
>  }


