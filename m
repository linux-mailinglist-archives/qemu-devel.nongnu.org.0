Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ED0523CCC
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 20:47:03 +0200 (CEST)
Received: from localhost ([::1]:33218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1norMS-0006UJ-Ct
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 14:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1norKK-0005n2-DC
 for qemu-devel@nongnu.org; Wed, 11 May 2022 14:44:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1norKH-0003XL-Di
 for qemu-devel@nongnu.org; Wed, 11 May 2022 14:44:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652294684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MiewAeoM+OtX5iRLFDD2cgzeFYjTuEg0fpSV7cUdC7M=;
 b=f8Kj9hSs4S0VMLmLMksu7EVZa5Epy6tgZLNcCsUMYak/HomrbV1wJBCzu42dAnmiLP6+/m
 WS65OV7liwuVqyMBWh2OEO0HzYaKVlSa9oJR0o8frxTKwwsMxNxtqWX8QuOBuPfhx+m+aP
 RtAmf83Xwv7uHJTKfygWZRVZIET8u/c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-BvHT-2VyOj6WDFK4Tpag0g-1; Wed, 11 May 2022 14:44:42 -0400
X-MC-Unique: BvHT-2VyOj6WDFK4Tpag0g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D1E82999B4D
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 18:44:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B596400DFA2;
 Wed, 11 May 2022 18:44:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B7AF621E6880; Wed, 11 May 2022 20:44:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] qapi: make machine type deprecation a warning
References: <20220511175043.27327-1-pbonzini@redhat.com>
Date: Wed, 11 May 2022 20:44:40 +0200
In-Reply-To: <20220511175043.27327-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Wed, 11 May 2022 13:50:43 -0400")
Message-ID: <871qwzdi3r.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  softmmu/vl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index c2919579fd..fbef0f5c5f 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3723,7 +3723,7 @@ void qemu_init(int argc, char **argv, char **envp)
>  
>      machine_class = MACHINE_GET_CLASS(current_machine);
>      if (!qtest_enabled() && machine_class->deprecation_reason) {
> -        error_report("Machine type '%s' is deprecated: %s",
> +        warn_report("Machine type '%s' is deprecated: %s",
>                       machine_class->name, machine_class->deprecation_reason);
>      }

Anti-pattern: error_report() not followed by "fail function".

The commit only changes the message printed to stderr.  The commit
message made me expect it would change an actual (fatal?) error into a
mere warning.  It's too late in my day to come up with a clearer
phrasing, so

Reviewed-by: Markus Armbruster <armbru@redhat.com>


