Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E594ACEDF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 03:24:26 +0100 (CET)
Received: from localhost ([::1]:44680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHGB6-00064b-Qb
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 21:24:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHG9W-000545-Fp
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 21:22:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHG9E-0007JE-SQ
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 21:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644286948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sGMRfFGdfagrKv5zM0JeUHBNzA0I3tKdV/yoZ7/gaGk=;
 b=ZH9x/fJP/ECsvNykhlX9/F1hcaApPbNCKYSXgbMB50G+KxTQ9MGf0RrXO+S92t7GOtcq18
 IwqlA7e3j+GfnCFjxtiewnK+GyJvoeOTgnu2aYM+5fx50AZRMnxMLaUnl+4lunvKdcFzSu
 4ZgxEi4PAb3LDVuq3QXKrhowvLZXQdI=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-YJw4_qWuMeyzvrPjhgc1lg-1; Mon, 07 Feb 2022 21:22:26 -0500
X-MC-Unique: YJw4_qWuMeyzvrPjhgc1lg-1
Received: by mail-pl1-f198.google.com with SMTP id
 p5-20020a170902bd0500b00148cb2d29ecso6493105pls.4
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 18:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sGMRfFGdfagrKv5zM0JeUHBNzA0I3tKdV/yoZ7/gaGk=;
 b=ifWZepghYOVeoVtbLkA68YwiJvTvLsvn0vvgKS0pImxMW4LXdCYf9CDhQHMpS8KRvL
 STGM1GzwLnZzBVbGUh5X5NBR6cVTwAs6aLSBaP6CmIdafPCfEg4OjLaiwe3kfG8Tenfd
 birgy/KbZL+nCUxdB7CblT8OPHslUC0iLQJEa//L9PriwOZCIBaomQR5wOox9cSiD2GF
 J0bw6RTlgXBSpH1bdSNFUdV6h7pVTmYQP3tUwjcuNhKbJcXlG9rugaWZiR8QJffhmK8+
 QOhfuURMf8k+npttezA/O0YGPj6CcWOFyhzw5N2rKvxhmo8EDSeE+feWGAwhHqIeAj9C
 xHzw==
X-Gm-Message-State: AOAM531zg7Ow7EUOikHpTXfYqxUOsAIYv2Sgm/656Pz7gpUDco2tKP8O
 XHzTjpBKMxMm8EAER11ztoSY8DJOEsvTSsW+nfhxMSQXEdAHxeY6Kno5kxmm830PZuyqNEgWnes
 oGIMAVRsw6Tdxgpw=
X-Received: by 2002:a63:c156:: with SMTP id p22mr1784416pgi.215.1644286945653; 
 Mon, 07 Feb 2022 18:22:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTHBIYt6KFpqkCDLj+BL8GMLyxMhBCEV4XMUueRej7cFgvrAGrAH9enm7ugbf3O8nhEhXNGg==
X-Received: by 2002:a63:c156:: with SMTP id p22mr1784395pgi.215.1644286945287; 
 Mon, 07 Feb 2022 18:22:25 -0800 (PST)
Received: from xz-m1.local ([94.177.118.121])
 by smtp.gmail.com with ESMTPSA id kb18sm686265pjb.30.2022.02.07.18.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 18:22:24 -0800 (PST)
Date: Tue, 8 Feb 2022 10:22:16 +0800
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v8 5/5] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
Message-ID: <YgHT2AzvnHYun6j4@xz-m1.local>
References: <20220201062901.428838-1-leobras@redhat.com>
 <20220201062901.428838-6-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220201062901.428838-6-leobras@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 01, 2022 at 03:29:03AM -0300, Leonardo Bras wrote:
> -void multifd_send_sync_main(QEMUFile *f)
> +int multifd_send_sync_main(QEMUFile *f)
>  {
>      int i;
> +    bool flush_zero_copy;
>  
>      if (!migrate_use_multifd()) {
> -        return;
> +        return 0;
>      }
>      if (multifd_send_state->pages->num) {
>          if (multifd_send_pages(f) < 0) {
>              error_report("%s: multifd_send_pages fail", __func__);
> -            return;
> +            return 0;

I've not checked how it used to do if multifd_send_pages() failed, but.. should
it returns -1 rather than 0 when there will be a return code?

>          }
>      }
> +
> +    /*
> +     * When using zero-copy, it's necessary to flush after each iteration to
> +     * make sure pages from earlier iterations don't end up replacing newer
> +     * pages.
> +     */
> +    flush_zero_copy = migrate_use_zero_copy_send();
> +
>      for (i = 0; i < migrate_multifd_channels(); i++) {
>          MultiFDSendParams *p = &multifd_send_state->params[i];
>  
> @@ -591,7 +600,7 @@ void multifd_send_sync_main(QEMUFile *f)
>          if (p->quit) {
>              error_report("%s: channel %d has already quit", __func__, i);
>              qemu_mutex_unlock(&p->mutex);
> -            return;
> +            return 0;

Same question here.

>          }

The rest looks good.  Thanks,

-- 
Peter Xu


