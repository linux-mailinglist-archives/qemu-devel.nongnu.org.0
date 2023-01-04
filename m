Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA1C65DD16
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 20:48:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD9jy-0001En-83; Wed, 04 Jan 2023 14:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pD9jJ-0001C2-Mb
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 14:47:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pD9jE-0003l6-KQ
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 14:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672861622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6QXOEovurLwLNIz+FnppUbIJfgyjk9M5XlA8eSDuCrU=;
 b=bOROpirOTfEFQ8A/CrJV8F3pKLGf5WqadCoNUxFnvqrUYL98MmHJ3MG7pXEKXLQrrLa1QZ
 sC1pFDF4/6YN2NARc3v5UV8RDyMTZpYgrL2NUdu0RmjUqHgr7e3VD0LuQDcH35k9CCMvcY
 ouGY7RmP5/1Kxir3k1JkMhE2KkJ+8ug=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-AkZppJktOYuNDcijdWmFtA-1; Wed, 04 Jan 2023 14:47:01 -0500
X-MC-Unique: AkZppJktOYuNDcijdWmFtA-1
Received: by mail-wm1-f71.google.com with SMTP id
 q19-20020a1cf313000000b003d96c95e2f9so6966366wmq.2
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 11:47:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6QXOEovurLwLNIz+FnppUbIJfgyjk9M5XlA8eSDuCrU=;
 b=oVfP9uhLAaFVysjT6aPpihAvVKIJxya8IpoONUckIyxG3RhmDDSLGR6xnTtfJObC6t
 EJeQyySbb1ab/ciqOitYZny1vpm+IVsHu3dHKsCiUrJfUsnOZkkBTY5IOfGS+FM79DUc
 IJXlk7QwDglbId8LG5lxOi6q1l69fjep5xqL6M1ocp9AQktrcDlvAH08iWvVUFrWPxwx
 XUVj4X6EXeFd95ooqBGOYPbJSJvxdwSAiNSqR26KHEhe655qIHnHbUOwFzV4e3EQeoAl
 neR/tuXOZd5r3e5orQXHp3oJIR6JHY/v9WKII00vQFTS41oo9x9e9EibZ7GNlomr6QVt
 WJ5Q==
X-Gm-Message-State: AFqh2kpsgi3zJjRrwV5Jl6dsAk9ix/M5qFowSC8Lt0sX28AVwolLIFx1
 uWDpwfVdK59fUfWS9eX7jcdevhYw2E2r5Caxb/3Zea4hMFlFuF/NAKesQzacvOCI5SJIDxn8MLc
 URs3IVXkluMXbKU4=
X-Received: by 2002:a05:600c:4191:b0:3d1:fcca:ce24 with SMTP id
 p17-20020a05600c419100b003d1fccace24mr33592859wmh.32.1672861620145; 
 Wed, 04 Jan 2023 11:47:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt2IDKCOAndi+PoVcK0qTiAwfAqGYMJPzp7glXtRb4nxvriYq01FutSchTWhSgLZ0xQbbf1Wg==
X-Received: by 2002:a05:600c:4191:b0:3d1:fcca:ce24 with SMTP id
 p17-20020a05600c419100b003d1fccace24mr33592836wmh.32.1672861619972; 
 Wed, 04 Jan 2023 11:46:59 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a1c5453000000b003d2157627a8sm50343697wmi.47.2023.01.04.11.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 11:46:59 -0800 (PST)
Date: Wed, 4 Jan 2023 19:46:56 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 virtio-fs@redhat.com, Michael Roth <michael.roth@amd.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/6] tools/virtiofsd: add G_GNUC_PRINTF for logging
 functions
Message-ID: <Y7XXsHEqgTG9Ani6@work-vm>
References: <20221219130205.687815-1-berrange@redhat.com>
 <20221219130205.687815-4-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221219130205.687815-4-berrange@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Yes, although I'm a little surprised this hasn't thrown up any warnings.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/fuse_log.c       | 1 +
>  tools/virtiofsd/fuse_log.h       | 6 ++++--
>  tools/virtiofsd/passthrough_ll.c | 1 +
>  3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_log.c b/tools/virtiofsd/fuse_log.c
> index 745d88cd2a..2de3f48ee7 100644
> --- a/tools/virtiofsd/fuse_log.c
> +++ b/tools/virtiofsd/fuse_log.c
> @@ -12,6 +12,7 @@
>  #include "fuse_log.h"
>  
>  
> +G_GNUC_PRINTF(2, 0)
>  static void default_log_func(__attribute__((unused)) enum fuse_log_level level,
>                               const char *fmt, va_list ap)
>  {
> diff --git a/tools/virtiofsd/fuse_log.h b/tools/virtiofsd/fuse_log.h
> index 8d7091bd4d..e5c2967ab9 100644
> --- a/tools/virtiofsd/fuse_log.h
> +++ b/tools/virtiofsd/fuse_log.h
> @@ -45,7 +45,8 @@ enum fuse_log_level {
>   * @param ap format string arguments
>   */
>  typedef void (*fuse_log_func_t)(enum fuse_log_level level, const char *fmt,
> -                                va_list ap);
> +                                va_list ap)
> +    G_GNUC_PRINTF(2, 0);
>  
>  /**
>   * Install a custom log handler function.
> @@ -68,6 +69,7 @@ void fuse_set_log_func(fuse_log_func_t func);
>   * @param level severity level (FUSE_LOG_ERR, FUSE_LOG_DEBUG, etc)
>   * @param fmt sprintf-style format string including newline
>   */
> -void fuse_log(enum fuse_log_level level, const char *fmt, ...);
> +void fuse_log(enum fuse_log_level level, const char *fmt, ...)
> +    G_GNUC_PRINTF(2, 3);
>  
>  #endif /* FUSE_LOG_H_ */
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 20f0f41f99..40ea2ed27f 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -4182,6 +4182,7 @@ static void setup_nofile_rlimit(unsigned long rlimit_nofile)
>      }
>  }
>  
> +G_GNUC_PRINTF(2, 0)
>  static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
>  {
>      g_autofree char *localfmt = NULL;
> -- 
> 2.38.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


