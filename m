Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35724B8B08
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 15:07:43 +0100 (CET)
Received: from localhost ([::1]:56058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKKy6-0000x4-DU
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 09:07:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nKKmi-00022y-H8
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 08:56:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nKKme-0007HZ-M3
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 08:55:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645019746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wQBqCYauaIZhsNxi3XKzidiby00j2CXqXyeNC58zX1Y=;
 b=YwxJQ0+bbSrK+TfJNe8OoVyKtpE/0wL3m2Mqx9TQzVTPhLfkb6tNYnMH8pBKe0V/27sGFi
 xuPcWZy8bLd8Uorz223sx3qaGUnw4nVB0APhzLQfM22HGoU1RZ+pKgBTgHmiPI+MYn9Cfj
 vbnBIHHwlbacy1LqNS4dEbSfCBZIf+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-dNXJCgJeNuOwZngE_hO_SQ-1; Wed, 16 Feb 2022 08:55:43 -0500
X-MC-Unique: dNXJCgJeNuOwZngE_hO_SQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAEA61006AA9;
 Wed, 16 Feb 2022 13:55:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70DB173177;
 Wed, 16 Feb 2022 13:55:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E84AF21608DA; Wed, 16 Feb 2022 14:55:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Rohit Kumar <rohit.kumar3@nutanix.com>
Subject: Re: [PATCH v3] Check and report for incomplete 'global' option format
References: <20220216071508.412974-1-rohit.kumar3@nutanix.com>
Date: Wed, 16 Feb 2022 14:55:39 +0100
In-Reply-To: <20220216071508.412974-1-rohit.kumar3@nutanix.com> (Rohit Kumar's
 message of "Tue, 15 Feb 2022 23:15:08 -0800")
Message-ID: <87r182zzj8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: eduardo@habkost.net, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, qemu-devel@nongnu.org, prachatos.mitra@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rohit Kumar <rohit.kumar3@nutanix.com> writes:

> Qemu might crash when provided incomplete '-global' option.
> For example:
>      qemu-system-x86_64 -global driver=isa-fdc
>      qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
>      string_input_visitor_new: Assertion `str' failed.
>      Aborted (core dumped)
>
> Fixes: 3751d7c43f795b ("vl: allow full-blown QemuOpts syntax for -global")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604
> Signed-off-by: Rohit Kumar <rohit.kumar3@nutanix.com>
> ---
>  diff to v2:
>   - Avoided double reporting of error.
>   - Added the "Fixes" line in the commit message.
>
>  softmmu/qdev-monitor.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 01f3834db5..e918ab8bf3 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -1034,6 +1034,13 @@ int qemu_global_option(const char *str)
>      if (!opts) {
>          return -1;
>      }
> +    if (!qemu_opt_get(opts, "driver")
> +        || !qemu_opt_get(opts, "property")
> +        || !qemu_opt_get(opts, "value")) {
> +        error_report("options 'driver', 'property', and 'value'"
> +                     " are required");
> +        return -1;
> +    }
>  
>      return 0;
>  }

Reviewed-by: Markus Armbruster <armbru@redhat.com>


