Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C1E2AF95F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 21:00:01 +0100 (CET)
Received: from localhost ([::1]:38280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcwHg-000327-9v
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 15:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kcwGP-0002H2-TW
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 14:58:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kcwGI-0008Kw-Mf
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 14:58:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605124712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SBlZUYkBpqyatndzLg0uM9eqCUV6LDl02pcqVZcxHcE=;
 b=axMzxgENhNeQG695eQs7QIHEGTk58QVszjysITVZOQ4Mn0zVvItLo04TS5b5KQK2kOj+Xr
 zx/gCR07C5PuIiHRuAICpL9/k6P5mXSnTmNrdQjsMjlAMP1vbMF8v2gkmR8DY4FJ0yc+jS
 u0at0Pfhxo7dZQu7bpN6+AcT2cgd7ok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-L_Ev95YqPAOvxhQ0-xID6g-1; Wed, 11 Nov 2020 14:58:30 -0500
X-MC-Unique: L_Ev95YqPAOvxhQ0-xID6g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35BA21007487
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 19:58:29 +0000 (UTC)
Received: from localhost (unknown [10.40.208.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F60B5B4DB;
 Wed, 11 Nov 2020 19:58:26 +0000 (UTC)
Date: Wed, 11 Nov 2020 20:58:25 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 10/29] vl: preconfig and loadvm are mutually exclusive
Message-ID: <20201111205825.40456c95@redhat.com>
In-Reply-To: <20201027182144.3315885-11-pbonzini@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-11-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Oct 2020 14:21:25 -0400
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Just like -incoming.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  softmmu/vl.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 3316c5534c..c2a5ee61f9 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -124,6 +124,7 @@ static const char *mem_path;
>  static const char *boot_order;
>  static const char *boot_once;
>  static const char *incoming;
> +static const char *loadvm;
>  enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
>  int display_opengl;
>  const char* keyboard_layout = NULL;
> @@ -2890,6 +2891,11 @@ static void qemu_validate_options(void)
>            }
>      }
>  
> +    if (loadvm && !preconfig_exit_requested) {
> +        error_report("'preconfig' and 'loadvm' options are "
> +                     "mutually exclusive");
> +        exit(EXIT_FAILURE);
> +    }
>      if (incoming && !preconfig_exit_requested) {
>          error_report("'preconfig' and 'incoming' options are "
>                       "mutually exclusive");
> @@ -3175,7 +3181,6 @@ void qemu_init(int argc, char **argv, char **envp)
>      QemuOptsList *olist;
>      int optind;
>      const char *optarg;
> -    const char *loadvm = NULL;
>      MachineClass *machine_class;
>      const char *vga_model = NULL;
>      bool userconfig = true;


