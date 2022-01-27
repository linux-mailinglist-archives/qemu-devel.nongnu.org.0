Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3866A49DF3F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 11:23:41 +0100 (CET)
Received: from localhost ([::1]:43110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1wK-0001NY-CU
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 05:23:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD1So-0002FJ-VS
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:53:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD1Sn-0002Zh-3P
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:53:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643277188;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=K/N51a+rok1SADvR8mmT+gcGQmZq8FW4UXjKfa1DIls=;
 b=LElLMCgS76NMZ2zuhOknDtTyAF41mn1jdCtTlmH62u1dtEwn1KKKFKdmzlgiW1xLAdvIfO
 EeUpiNxvfuv6ilvNekU+9M0Je//q32fOw532NjKkT2O6chFtMmSOya6u47aSZTt35UcSdm
 2EwGHCwadsk2tzcZOiQvZ9Tn867W3/o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-GXZwRiiXPuG-fdRMCWdFGg-1; Thu, 27 Jan 2022 04:53:06 -0500
X-MC-Unique: GXZwRiiXPuG-fdRMCWdFGg-1
Received: by mail-wm1-f70.google.com with SMTP id
 d140-20020a1c1d92000000b0034edefd55caso3932948wmd.4
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 01:53:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=K/N51a+rok1SADvR8mmT+gcGQmZq8FW4UXjKfa1DIls=;
 b=oqHPip63HL89J86gK6Gvsk7QsX8LDIXvNWybwDJvz9+O4bnL8HnnvWRWCWZ51Fydl4
 1O9U0Dk7r6849yKCo1dXZRQXH20wrqgv83OT274flBBrgJTru9kmoP1hEDaYvd8+ZqJy
 W2rcjpqeRbbPTBi7+JHmTu9Jp6Nhc6yI2j9JPQgfr0MYTgTYG6RJGTjV3vIxcS4cthP0
 rInGMmw0678l/iXyiGT3qJpjazx1DFI/x9mn/GbW3KPLIyJWnFfXoWkMyqOkGnUgolAJ
 h+10yFXkeh3mNhn0/+wFOIZ6I/eU5PObDo65dvUsbs+PaEzhAJjSMkvEkSkyhfJ9sEph
 TTMg==
X-Gm-Message-State: AOAM532HzhjKsOTgJpiAlTaByPGcZDVP0y61f5HaQDmOdaxxklNHFZj8
 fQCkUMG7ZQJ4rqFJ/HOmEpuEjDKK3468EJNiz9CXVcHvUxHBqauwlynr8fV8u1RYy949eZo9+qy
 sK5lb3TNdDXnrbt8=
X-Received: by 2002:adf:dfcd:: with SMTP id q13mr2356841wrn.648.1643277185757; 
 Thu, 27 Jan 2022 01:53:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJza3c2mBFG6L2+3xBA3lowz4OGEjdOmi8aVS7kDMUVNXky1w2MLHQUS+SWTpZ74DtVGV7w2UQ==
X-Received: by 2002:adf:dfcd:: with SMTP id q13mr2356826wrn.648.1643277185545; 
 Thu, 27 Jan 2022 01:53:05 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id l40sm1691251wms.0.2022.01.27.01.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 01:53:05 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Li Zhang <lizhang@suse.de>
Subject: Re: [PATCH v2 1/1] multifd: Remove some redundant code
In-Reply-To: <20211217101228.9512-1-lizhang@suse.de> (Li Zhang's message of
 "Fri, 17 Dec 2021 11:12:28 +0100")
References: <20211217101228.9512-1-lizhang@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 27 Jan 2022 10:53:04 +0100
Message-ID: <87bkzxld33.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Li Zhang <lizhang@suse.de> wrote:
> Clean up some unnecessary code
>
> Signed-off-by: Li Zhang <lizhang@suse.de>

Hi

> ---
>  migration/multifd.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 3242f688e5..212be1ed04 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -854,19 +854,16 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
>      Error *local_err = NULL;
>  
>      trace_multifd_new_send_channel_async(p->id);
> -    if (qio_task_propagate_error(task, &local_err)) {
> -        goto cleanup;
> -    } else {
> +    if (!qio_task_propagate_error(task, &local_err)) {
>          p->c = QIO_CHANNEL(sioc);
>          qio_channel_set_delay(p->c, false);
>          p->running = true;
>          if (!multifd_channel_connect(p, sioc, local_err)) {
> -            goto cleanup;
> +            multifd_new_send_channel_cleanup(p, sioc, local_err);
>          }
>          return;
>      }
>  
> -cleanup:
>      multifd_new_send_channel_cleanup(p, sioc, local_err);
>  }
>  

Once there, why are we duplicating the call to
multifd_new_send_channel_cleanup()

What about:

static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
{
    MultiFDSendParams *p = opaque;
    QIOChannel *sioc = QIO_CHANNEL(qio_task_get_source(task));
    Error *local_err = NULL;

    trace_multifd_new_send_channel_async(p->id);
    if (!qio_task_propagate_error(task, &local_err)) {
        p->c = QIO_CHANNEL(sioc);
        qio_channel_set_delay(p->c, false);
        p->running = true;
        if (multifd_channel_connect(p, sioc, local_err)) {
            return;
        }
    }
    multifd_new_send_channel_cleanup(p, sioc, local_err);
}

What do you think?

Later, Juan.


> @@ -1078,10 +1075,7 @@ static void *multifd_recv_thread(void *opaque)
>  
>          ret = qio_channel_read_all_eof(p->c, (void *)p->packet,
>                                         p->packet_len, &local_err);
> -        if (ret == 0) {   /* EOF */
> -            break;
> -        }
> -        if (ret == -1) {   /* Error */
> +        if (ret == 0 || ret == -1) {   /* 0: EOF  -1: Error */
>              break;
>          }

This bit is ok.


