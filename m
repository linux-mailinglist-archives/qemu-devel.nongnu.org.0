Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87D85E6986
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:21:26 +0200 (CEST)
Received: from localhost ([::1]:55200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPt7-0001Dd-N7
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1obOMP-0003Vd-Fa
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:43:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1obOMN-0002BM-6i
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663861410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v5GAtNRjWobwGwne/JBz92LvrItu0xF4HNFiS/yv9ao=;
 b=jMxACCEfWb8Ph75renJjs/6kBft+RvbpNdCsZzqgMLWSj6eZFdPqYpz9m7MCTQc/z5m2BG
 MMqzOSZMEsroQmlHUp4qexof3yQxcSzZTTCFJRer4YE717IHAk/qwe9xsGlREbpcQWjwvo
 2rZB5FQpPAdmboydlmxaOWZsl12XlWg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-100-RrB7SAufNIarf4Nd1-95Kw-1; Thu, 22 Sep 2022 11:43:29 -0400
X-MC-Unique: RrB7SAufNIarf4Nd1-95Kw-1
Received: by mail-wr1-f69.google.com with SMTP id
 d30-20020adfa41e000000b00228c0e80c49so3409515wra.21
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 08:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=v5GAtNRjWobwGwne/JBz92LvrItu0xF4HNFiS/yv9ao=;
 b=1oYKwVUVUYaYCaRUYP7eHR/gIQbL0R6uj8MaWZxMBPcEtaEru7m7xKKH9AAqy8DMdd
 S9lpS7Qm1l9NlxsUgLQ4D9YjTGMtNcSPG227ZaXixsZwTGMRGAYSNYIpWlImPjjVui/9
 JbffcVnWRM5pcUlanwf2+H11AeIpuHk81b1yo2mQgpzNGZ15GjIvitOl0sbEzMAP4Nky
 XiQB6S/6/nAS2rRhCaV6H2OIE21S7sG3gn19u0VLbXUaHlJjUcC6KtLb4l4SqoCoHLto
 H2/rKwoEFNhGg8n9nOY78T9n5SSyyuEUlsiv3VIKY9GlxfLHSZUnKchNDB2cKBNvezme
 5XhA==
X-Gm-Message-State: ACrzQf1vGO9t4ZIVuk0Rz7dOF9hX0AJgPogjlb8utv9Mp988HqKyb282
 jQnuRvy3BYQRxPURrtokb4o1b3UYdn0cjXABe+3Dda2ewO71nf00zYCmLssB0moKTyeMz1HloWh
 cnnq/k9F0o7Ox3c4=
X-Received: by 2002:a05:6000:61d:b0:22a:f5c6:696d with SMTP id
 bn29-20020a056000061d00b0022af5c6696dmr2572802wrb.214.1663861406682; 
 Thu, 22 Sep 2022 08:43:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7mqTnhaVJPF+BngVlMOe22PwPYFl6m4KOced//fosBrrDa79Zt/XF7SVrHynYLsLexP4RH3A==
X-Received: by 2002:a05:6000:61d:b0:22a:f5c6:696d with SMTP id
 bn29-20020a056000061d00b0022af5c6696dmr2572784wrb.214.1663861406361; 
 Thu, 22 Sep 2022 08:43:26 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h3-20020a1ccc03000000b003a5bd5ea215sm6143559wmb.37.2022.09.22.08.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 08:43:25 -0700 (PDT)
Date: Thu, 22 Sep 2022 16:43:23 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 2/5] migration: Fix race on qemu_file_shutdown()
Message-ID: <YyyCm4rpTPZA4ykp@work-vm>
References: <20220920223800.47467-1-peterx@redhat.com>
 <20220920223800.47467-3-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920223800.47467-3-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Peter Xu (peterx@redhat.com) wrote:
> In qemu_file_shutdown(), there's a possible race if with current order of
> operation.  There're two major things to do:
> 
>   (1) Do real shutdown() (e.g. shutdown() syscall on socket)
>   (2) Update qemufile's last_error
> 
> We must do (2) before (1) otherwise there can be a race condition like:
> 
>       page receiver                     other thread
>       -------------                     ------------
>       qemu_get_buffer()
>                                         do shutdown()
>         returns 0 (buffer all zero)
>         (meanwhile we didn't check this retcode)
>       try to detect IO error
>         last_error==NULL, IO okay
>       install ALL-ZERO page
>                                         set last_error
>       --> guest crash!
> 
> To fix this, we can also check retval of qemu_get_buffer(), but not all
> APIs can be properly checked and ultimately we still need to go back to
> qemu_file_get_error().  E.g. qemu_get_byte() doesn't return error.
> 
> Maybe some day a rework of qemufile API is really needed, but for now keep
> using qemu_file_get_error() and fix it by not allowing that race condition
> to happen.  Here shutdown() is indeed special because the last_error was
> emulated.  For real -EIO errors it'll always be set when e.g. sendmsg()
> error triggers so we won't miss those ones, only shutdown() is a bit tricky
> here.
> 
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Oh that's kind of fun,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/qemu-file.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 4f400c2e52..2d5f74ffc2 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -79,6 +79,30 @@ int qemu_file_shutdown(QEMUFile *f)
>      int ret = 0;
>  
>      f->shutdown = true;
> +
> +    /*
> +     * We must set qemufile error before the real shutdown(), otherwise
> +     * there can be a race window where we thought IO all went though
> +     * (because last_error==NULL) but actually IO has already stopped.
> +     *
> +     * If without correct ordering, the race can happen like this:
> +     *
> +     *      page receiver                     other thread
> +     *      -------------                     ------------
> +     *      qemu_get_buffer()
> +     *                                        do shutdown()
> +     *        returns 0 (buffer all zero)
> +     *        (we didn't check this retcode)
> +     *      try to detect IO error
> +     *        last_error==NULL, IO okay
> +     *      install ALL-ZERO page
> +     *                                        set last_error
> +     *      --> guest crash!
> +     */
> +    if (!f->last_error) {
> +        qemu_file_set_error(f, -EIO);
> +    }
> +
>      if (!qio_channel_has_feature(f->ioc,
>                                   QIO_CHANNEL_FEATURE_SHUTDOWN)) {
>          return -ENOSYS;
> @@ -88,9 +112,6 @@ int qemu_file_shutdown(QEMUFile *f)
>          ret = -EIO;
>      }
>  
> -    if (!f->last_error) {
> -        qemu_file_set_error(f, -EIO);
> -    }
>      return ret;
>  }
>  
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


