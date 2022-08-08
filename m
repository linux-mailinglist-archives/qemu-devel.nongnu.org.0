Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C9358C2C1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 07:19:13 +0200 (CEST)
Received: from localhost ([::1]:60610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKvAW-00064J-Gb
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 01:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oKv6X-0002hx-RI
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 01:15:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oKv6V-0002WB-3I
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 01:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659935700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AlqaTxFMvphUvoO+wW3rukAoGtVCNas7molMUrQjsgc=;
 b=FIsNtCxrnUV9XVNjTKo+wiDI5w8tq1yCHdCSgAaYS25V/85Qhz7MCSxqlqnQptwwefI9Lo
 XvIYsEDyGggzyt3Q8rsCSmwU3Mjitr7xB1hDGaIPGouxHlgh2EALz1Ywn9RBxV8nRzn1eE
 9uVetWpTKsr4CnYR2z9u2rXcbUK/QwM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-SsGVYwCSMU6UjUuqJ1jlxA-1; Mon, 08 Aug 2022 01:14:58 -0400
X-MC-Unique: SsGVYwCSMU6UjUuqJ1jlxA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FE65801585
 for <qemu-devel@nongnu.org>; Mon,  8 Aug 2022 05:14:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C75C2166B26;
 Mon,  8 Aug 2022 05:14:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2501421E6930; Mon,  8 Aug 2022 07:14:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] vl: remove dead code in parse_memory_options()
References: <20220805172309.553441-1-pbonzini@redhat.com>
Date: Mon, 08 Aug 2022 07:14:57 +0200
In-Reply-To: <20220805172309.553441-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Fri, 5 Aug 2022 19:23:09 +0200")
Message-ID: <8735e7z57y.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> mem_str will never be an empty string, because qemu_opt_get_size() fails
> if it encounters one:
>
>    $ ./qemu-system-x86_64 -m size=
>    qemu-system-x86_64: -m size=: Parameter size expects a non-negative number below 2^64
>    Optional suffix k, M, G, T, P or E means kilo-, mega-, giga-, tera-, peta-
>    and exabytes, respectively.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  softmmu/vl.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 45e919de9f..706bd7cff7 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1960,13 +1960,8 @@ static void parse_memory_options(void)
>      prop = qdict_new();
>  
>      if (qemu_opt_get_size(opts, "size", 0) != 0) {
> -        mem_str = qemu_opt_get(opts, "size");
> -        if (!*mem_str) {
> -            error_report("missing 'size' option value");
> -            exit(EXIT_FAILURE);
> -        }
> -
>          /* Fix up legacy suffix-less format */
> +        mem_str = qemu_opt_get(opts, "size");
>          if (g_ascii_isdigit(mem_str[strlen(mem_str) - 1])) {
>              g_autofree char *mib_str = g_strdup_printf("%sM", mem_str);
>              qdict_put_str(prop, "size", mib_str);

Reviewed-by: Markus Armbruster <armbru@redhat.com>


