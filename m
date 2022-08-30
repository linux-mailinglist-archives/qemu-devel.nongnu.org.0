Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7ED5A6164
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 13:12:33 +0200 (CEST)
Received: from localhost ([::1]:43188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSzAW-0003Jw-Is
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 07:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSz86-0000y7-JA
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 07:10:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSz84-0003xk-Ed
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 07:10:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661857799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ksp7HHjuykbyqtCDiHFL8GIYb4Qy00Ch5KA2psyKRl8=;
 b=VBOtbi1a73ai/7c/OxAIksip7MV6e6L4dv6Nm43VYqZequECSB0Ue0MQ13z0WszeLqs4Zx
 0caZuC+/lgHO0/S4SU0botVrWL1ObfdjjJgen9et1yEH3guQmhhul8wwM8wdiVWDjaqwkn
 U6v6XzrXorlYxPN4Y/Y7/uqSgWcmB1g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-FALGdcnmPIeg7Y6kcfZoBQ-1; Tue, 30 Aug 2022 07:09:54 -0400
X-MC-Unique: FALGdcnmPIeg7Y6kcfZoBQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94C1B85A585;
 Tue, 30 Aug 2022 11:09:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AF8D1121314;
 Tue, 30 Aug 2022 11:09:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6BABE21E6900; Tue, 30 Aug 2022 13:09:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: qemu-devel@nongnu.org,  joe.jin@oracle.com,
 richard.henderson@linaro.org,  alex.bennee@linaro.org,  f4bug@amsat.org
Subject: Re: [PATCH 2/2] util/log: add timestamp to logs via qemu_log()
References: <20220829100622.1554-1-dongli.zhang@oracle.com>
 <20220829100622.1554-2-dongli.zhang@oracle.com>
Date: Tue, 30 Aug 2022 13:09:51 +0200
In-Reply-To: <20220829100622.1554-2-dongli.zhang@oracle.com> (Dongli Zhang's
 message of "Mon, 29 Aug 2022 03:06:22 -0700")
Message-ID: <87czcihts0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Dongli Zhang <dongli.zhang@oracle.com> writes:

> The qemu_log is very helpful for diagnostic. Add the timestamp to the log
> when it is enabled (e.g., "-msg timestamp=on").
>
> While there are many other places that may print to log file, this patch is
> only for qemu_log(), e.g., the developer may add qemu_log/qemu_log_mask to
> selected locations to diagnose QEMU issue.

Opinions on the new feature, anyone?

> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
> Please let me know if we should use 'error_with_guestname' as well.
>
>  util/log.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/util/log.c b/util/log.c
> index d6eb037..f0a081a 100644
> --- a/util/log.c
> +++ b/util/log.c
> @@ -129,8 +129,15 @@ void qemu_log(const char *fmt, ...)
>  {
>      FILE *f = qemu_log_trylock();
>      if (f) {
> +        gchar *timestr;
>          va_list ap;
>  
> +        if (message_with_timestamp) {
> +            timestr = real_time_iso8601();
> +            fprintf(f, "%s ", timestr);
> +            g_free(timestr);
> +        }
> +
>          va_start(ap, fmt);
>          vfprintf(f, fmt, ap);
>          va_end(ap);

This extends -msg timestamp=on to apply to log messages without
documenting it in -help or anywhere else.  Needs fixing.


