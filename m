Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE844B67A8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:33:08 +0100 (CET)
Received: from localhost ([::1]:57534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuCp-0003ZL-DE
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:33:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nJuAP-0002XT-3s
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:30:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nJuAM-00089s-CJ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644917433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/dBixpvMzL5LyYr+MqNH8nyvBEtkZnEK2fOClxHz8vc=;
 b=bn/8l/SVUf0vZpVOCcsTz5OYjzTKC4rWhHYLrDEDYoAP5vKtNTktRcx6N/BA9ReeqBdNfw
 CITFqDB/8UA5uZQVrCCJxmtSrDkuPWg1HraKFLCiM8YyVmCjsC+TNWoFB5IdGA5IIQjLvi
 +Nyh/spC5DcqLlb7D3loVNOAylG+H6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-oJRBmbOgPh2qKHIbu3niTA-1; Tue, 15 Feb 2022 04:30:31 -0500
X-MC-Unique: oJRBmbOgPh2qKHIbu3niTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82CA41091DA1;
 Tue, 15 Feb 2022 09:30:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E85785E4A7;
 Tue, 15 Feb 2022 09:30:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5E14F21E66FF; Tue, 15 Feb 2022 10:30:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Rohit Kumar <rohit.kumar3@nutanix.com>
Subject: Re: [PATCH v2] Check and report for incomplete 'global' option format
References: <20220215055138.267904-1-rohit.kumar3@nutanix.com>
Date: Tue, 15 Feb 2022 10:30:18 +0100
In-Reply-To: <20220215055138.267904-1-rohit.kumar3@nutanix.com> (Rohit Kumar's
 message of "Mon, 14 Feb 2022 21:51:38 -0800")
Message-ID: <87sfskeatx.fsf@pond.sub.org>
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
>         qemu-system-x86_64 -global driver=isa-fdc
>         qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
>         string_input_visitor_new: Assertion `str' failed.
>         Aborted (core dumped)
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604

The original qemu_global_option() only ever created QemuOpts with all
three options present.  Code consuming these QemuOpts relies on this
invariant.  Commit 3751d7c43f "vl: allow full-blown QemuOpts syntax for
-global" (v2.4.0) wrecked it.

Let's point to the root cause:

  Fixes: 3751d7c43f795b45ffdb9429cfb09c6beea55c68

> Signed-off-by: Rohit Kumar <rohit.kumar3@nutanix.com>
> ---
>  diff to v1:
>   - Removed '\n' from error log message.
>
>  softmmu/qdev-monitor.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 01f3834db5..51b33caeca 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -1020,6 +1020,7 @@ int qemu_global_option(const char *str)
>      char driver[64], property[64];
>      QemuOpts *opts;
>      int rc, offset;
> +    Error *err = NULL;
>  
>      rc = sscanf(str, "%63[^.=].%63[^=]%n", driver, property, &offset);
>      if (rc == 2 && str[offset] == '=') {
> @@ -1031,7 +1032,12 @@ int qemu_global_option(const char *str)
>      }
>  
>      opts = qemu_opts_parse_noisily(&qemu_global_opts, str, false);
> -    if (!opts) {
> +    if (!opts || !qemu_opt_get(opts, "driver") || !qemu_opt_get(opts,"property") ||
> +    !qemu_opt_get(opts, "value")) {
> +        error_setg(&err, "Invalid 'global' option format! "
> +        "Use -global <driver>.<property>=<value> or "
> +        "-global driver=driver,property=property,value=value");
> +        error_report_err(err);
>          return -1;
>      }

This fix isn't quite right.

When qemu_opts_parse_noisily() fails, it reports an error and returns
null.  Your patch reports a second error then.  Reproducer:

    $ qemu-system-x86_64 -global =
    qemu-system-x86_64: -global =: Invalid parameter ''
    qemu-system-x86_64: -global =: Invalid 'global' option format! Use -global <driver>.<property>=<value> or -global driver=driver,property=property,value=value

You should do something like

    opts = qemu_opts_parse_noisily(&qemu_global_opts, str, false);
    if (!opts) {
        return -1;
    }
    if (!qemu_opt_get(opts, "driver")
        || !qemu_opt_get(opts, "property")
        || !qemu_opt_get(opts, "value")) {
        error_report("options 'driver', 'property', and 'value'"
                     " are required');
        return -1;
    }


