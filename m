Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EBE2B7F93
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 15:45:25 +0100 (CET)
Received: from localhost ([::1]:49850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfOi4-0005qR-B9
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 09:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kfOgP-0005Ga-HO
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:43:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kfOgN-0004O5-CT
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605710614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vKEFKArwFgGvB5wtvRfeZrIuWUs5WJJjV5FZfXuXhUk=;
 b=DuHL3mJ1GasB0Hz5MVIqOnUIPASkWyfaOHvrmdWMMqMEgksW3xCQ2csvtHtm2+QPPCEggX
 OfhR6aunFsCsdhFavThd59c9U6jqN2bEHghxZlP88+m3A1tPdek1yJ5N8nFwchGL3bqFfQ
 V+ef4EexxbQR7aTaSRWwhHRuravyyXQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-aFywHoxuOAai3lyA-1-4Gw-1; Wed, 18 Nov 2020 09:43:32 -0500
X-MC-Unique: aFywHoxuOAai3lyA-1-4Gw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 664BC18B613D
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 14:43:31 +0000 (UTC)
Received: from localhost (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67DEB1E5;
 Wed, 18 Nov 2020 14:43:30 +0000 (UTC)
Date: Wed, 18 Nov 2020 15:43:28 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 12/29] vl: create "-net nic -net user" default earlier
Message-ID: <20201118154328.5efc9f00@redhat.com>
In-Reply-To: <20201027182144.3315885-13-pbonzini@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-13-pbonzini@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, 27 Oct 2020 14:21:27 -0400
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Create it together with other default backends, even though the processing is
> done later.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  softmmu/vl.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 6749109b29..f643333f7e 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -4254,6 +4254,14 @@ void qemu_init(int argc, char **argv, char **envp)
>              monitor_parse("vc:80Cx24C", "readline", false);
>      }
>  
> +    if (default_net) {
> +        QemuOptsList *net = qemu_find_opts("net");
> +        qemu_opts_set(net, NULL, "type", "nic", &error_abort);
> +#ifdef CONFIG_SLIRP
> +        qemu_opts_set(net, NULL, "type", "user", &error_abort);
> +#endif
> +    }
> +
>  #if defined(CONFIG_VNC)
>      if (!QTAILQ_EMPTY(&(qemu_find_opts("vnc")->head))) {
>          display_remote++;
> @@ -4389,14 +4397,6 @@ void qemu_init(int argc, char **argv, char **envp)
>          semihosting_arg_fallback(kernel_filename, kernel_cmdline);
>      }
>  
> -    if (default_net) {
> -        QemuOptsList *net = qemu_find_opts("net");
> -        qemu_opts_set(net, NULL, "type", "nic", &error_abort);
> -#ifdef CONFIG_SLIRP
> -        qemu_opts_set(net, NULL, "type", "user", &error_abort);
> -#endif
> -    }
> -
>      if (net_init_clients(&err) < 0) {
>          error_report_err(err);
>          exit(1);


