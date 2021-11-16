Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5548B4536FB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:10:12 +0100 (CET)
Received: from localhost ([::1]:53250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn12B-0002Yd-Fk
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:10:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mn10L-000136-HY
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:08:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mn10H-0001oe-E1
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637078892;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=C0QM5YlFfhpIFw/d6Jkecpvt3rqqi4pgj0ETmdzmMiY=;
 b=Pv1uH9lcRBJ5ZxRBxfTnlzygunJGxMzbTZAAvfsAKEyjJILYMMUv6JZ0uDME23krAxGljn
 7DeKf8mFeewyX7V7mtjBZS5e9iSEh+287H4jqjhkJkRYaH2Omthp0jCxnaTGAIxQVGZ4uN
 7BM03SPv7RDMpK65tgKjiRoTnYUwVps=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-j6jHHsYaPPGcRZbZ1RxRnQ-1; Tue, 16 Nov 2021 11:08:11 -0500
X-MC-Unique: j6jHHsYaPPGcRZbZ1RxRnQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so1667149wmq.9
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 08:08:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=C0QM5YlFfhpIFw/d6Jkecpvt3rqqi4pgj0ETmdzmMiY=;
 b=BzcwE8AIU1E2SIXLnWqrQYFE04ReAyI3wn8d4791aE2Wy/rQHT8f9z4EEiJnGr3YEQ
 yoDNnyPv7e5QoQCn3mq2g+U9O8Ee61FU9qCC7LWj7/jPrs12yy0sL6pLhZD+V6AJ2LQ9
 42JAaarFu461zUWn05gJu89WwzC0cOay1tFK7fwHBvFWfh0OwhnFq3X7BqAV+/8i478l
 E4cYd344epbHzBf8nsDb7zauVJWdeNUm8y9JuCL21K4QaC4pc06g8n+CoVlD38iLzl1H
 nVCm4iMowRXGdcfw/mMm9XUdBAIsp2kyBjQrUAa12m1eDlftSVuPNZOMOzdQCNHgGYke
 9yFg==
X-Gm-Message-State: AOAM530aLTE4xZYeLRxnqw/n3QswAgykIeXJNAheHLgeTtH7VexgFl3/
 NlCtj6lk/xC7jkZ8gtYT+DwnU0gPXp+QP0ucRk5Ai4ktDe3qirqSrGLni+sM59CnIJwMDCmlu1e
 +KBuxcDrnbX21gdc=
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr42568387wmc.62.1637078888537; 
 Tue, 16 Nov 2021 08:08:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxa3ggeZ7IGk6FyFIgENxZ2GCr8/9vcKE6hGiDAVPJX4Bn3nUB242I5QR3h10tGoX4CGdBu0w==
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr42568349wmc.62.1637078888261; 
 Tue, 16 Nov 2021 08:08:08 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id d7sm17467204wrw.87.2021.11.16.08.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 08:08:07 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v5 6/6] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
In-Reply-To: <20211112051040.923746-7-leobras@redhat.com> (Leonardo Bras's
 message of "Fri, 12 Nov 2021 02:10:41 -0300")
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-7-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 16 Nov 2021 17:08:06 +0100
Message-ID: <87pmr0ulqx.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Bras <leobras@redhat.com> wrote:
> Implement zerocopy on nocomp_send_write(), by making use of QIOChannel
> zerocopy interface.
>
> Change multifd_send_sync_main() so it can distinguish each iteration sync from
> the setup and the completion, so a flush_zerocopy() can be called
> at the after each iteration in order to make sure all dirty pages are sent
> before a new iteration is started.
>
> Also make it return -1 if flush_zerocopy() fails, in order to cancel
> the migration process, and avoid resuming the guest in the target host
> without receiving all current RAM.
>
> This will work fine on RAM migration because the RAM pages are not usually freed,
> and there is no problem on changing the pages content between async_send() and
> the actual sending of the buffer, because this change will dirty the page and
> cause it to be re-sent on a next iteration anyway.
>
> Given a lot of locked memory may be needed in order to use multid migration
> with zerocopy enabled, make it optional by creating a new migration parameter
> "zerocopy" on qapi, so low-privileged users can still perform multifd
> migrations.

How much memory can a non-root program use by default?


>  static void *multifd_send_thread(void *opaque)
> @@ -853,6 +875,10 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
>          goto cleanup;
>      }
>  
> +    if (migrate_use_zerocopy()) {
> +        p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZEROCOPY;
> +    }

This belongs


>      p->c = QIO_CHANNEL(sioc);
>      qio_channel_set_delay(p->c, false);
>      p->running = true;
> @@ -918,6 +944,7 @@ int multifd_save_setup(Error **errp)
>          p->packet->version = cpu_to_be32(MULTIFD_VERSION);
>          p->name = g_strdup_printf("multifdsend_%d", i);
>          p->tls_hostname = g_strdup(s->hostname);
> +        p->write_flags = 0;

here?

>          socket_send_channel_create(multifd_new_send_channel_async, p);
>      }
> diff --git a/migration/socket.c b/migration/socket.c
> index e26e94aa0c..8e40e0a3fd 100644
> --- a/migration/socket.c
> +++ b/migration/socket.c
> @@ -78,8 +78,13 @@ static void socket_outgoing_migration(QIOTask *task,
>          trace_migration_socket_outgoing_connected(data->hostname);
>      }
>  
> -    if (migrate_use_zerocopy()) {
> -        error_setg(&err, "Zerocopy not available in migration");
> +    if (migrate_use_zerocopy() &&
> +        (!migrate_use_multifd() ||
> +         !qio_channel_has_feature(sioc, QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY) ||
> +          migrate_multifd_compression() != MULTIFD_COMPRESSION_NONE ||
> +          migrate_use_tls())) {
> +        error_setg(&err,
> +                   "Zerocopy only available for non-compressed non-TLS multifd migration");
>      }
>  
>      migration_channel_connect(data->s, sioc, data->hostname, err);

Do we really want to do this check here?  I think this is really too
late.

You are not patching migrate_params_check().

I think that the proper way of doing this is something like:

    if (params->zerocopy &&
        (params->parameters.multifd_compression != MULTIFD_COMPRESSION_NONE ||
         migrate_use_tls())) {
           error_setg(&err,
                     "Zerocopy only available for non-compressed non-TLS multifd migration");
        return false;
    }

You have to do the equivalent of multifd_compression and tls enablement,
to see that zerocopy is not enabled, of course.

I would prefer to check for QIO_CHANNEL_FEATUR_WRITE_ZEROCPY there, but
I can't see a way of doing that without a qio.

Later, Juan.


