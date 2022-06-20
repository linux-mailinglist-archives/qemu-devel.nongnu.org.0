Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA6155143E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 11:25:54 +0200 (CEST)
Received: from localhost ([::1]:53204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3DfM-0003qT-MW
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 05:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3Dda-00032D-CX
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 05:24:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3DdX-0006Ht-3q
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 05:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655717037;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=X5Fzb+0lj7Ix6xIS6hN+x2TQPizJMGF842sHIhRYCvY=;
 b=cT/+JZ02j4v0jcJwH4O0IM1WEk95XJiuOKedF610VLnL/A24VQjrrMCJw6X0ZCrYMNrEx2
 FrqvQ3NVqqK+QdO+3G2FKCc24hLtQPdDjE/QkZwPAWGSg7TqHaV7NQCZDbpn7LYj+dJ8hf
 2yIwwZ2tyj0LoYFRpUwtoaXYfS8Fc18=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-QaxiTd-_NiW0_aTmoV9a3w-1; Mon, 20 Jun 2022 05:23:56 -0400
X-MC-Unique: QaxiTd-_NiW0_aTmoV9a3w-1
Received: by mail-wr1-f69.google.com with SMTP id
 l9-20020adfa389000000b0021b8b489336so951520wrb.13
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 02:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=X5Fzb+0lj7Ix6xIS6hN+x2TQPizJMGF842sHIhRYCvY=;
 b=n4JZVKIwRJgj04T0l31/GDU8CCacabOEyTMyhPYCTySLiuQ550NTnT7fcflio+/jfD
 zvmVkP5uNYMQqFKbQCGFsy2Kws07fh4+J/qObt9QMYQxo9BaARHnifKvm5UDLJSGMKZA
 QJLzfU0LorFYw0U3dxtj4KjT7YV93yXIHcXenBnHiz8Emf9oFaqSNc03kslmU8AeXIk7
 u05k9EfAVDfFXBzME6Ogg+RIL6+xGP3tanmAkZo5ILalFe7q34uHRLqWI2CrxhpDzV7j
 A8NuGY+x1UZqRHTR9WiJYW+XaZv3LrY4ChBz3b5LXXSfgcyB6dX+N0fcy3GKxmlEB5ZY
 gLQQ==
X-Gm-Message-State: AJIora8naMKYPpz4xt1Rsl86Hc4bp5vuF7/W4b4bdKq5/olC+MmASent
 U1GKIGLFa8zR+y16QmxRSwkWdivfwH8V1DX+c/aPB18upOd2pQWZtoHjlyVp+ArhGAMxGcXNG3v
 Pl6SfmEOHpsBVEZ4=
X-Received: by 2002:adf:df81:0:b0:21b:8b8e:4997 with SMTP id
 z1-20020adfdf81000000b0021b8b8e4997mr6694142wrl.118.1655717034800; 
 Mon, 20 Jun 2022 02:23:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tc1/s+EnT2cV6CjxZuJ+e2S/e0KMXT3Y2FTPz6lPk2zA0SIwblO1jFr9VIsdEjB7+IJYSHgg==
X-Received: by 2002:adf:df81:0:b0:21b:8b8e:4997 with SMTP id
 z1-20020adfdf81000000b0021b8b8e4997mr6694115wrl.118.1655717034526; 
 Mon, 20 Jun 2022 02:23:54 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c4e8800b003974b95d897sm20363417wmq.37.2022.06.20.02.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 02:23:54 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  "Dr. David
 Alan Gilbert"
 <dgilbert@redhat.com>,  Eric Blake <eblake@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  Peter Xu <peterx@redhat.com>,  =?utf-8?B?5b6Q6Zev?=
 <xuchuangxclwt@bytedance.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v4 3/4] migration: zero-copy flush only at the end of
 bitmap scanning
In-Reply-To: <20220620053944.257547-4-leobras@redhat.com> (Leonardo Bras's
 message of "Mon, 20 Jun 2022 02:39:44 -0300")
References: <20220620053944.257547-1-leobras@redhat.com>
 <20220620053944.257547-4-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 11:23:53 +0200
Message-ID: <87wndb4riu.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Bras <leobras@redhat.com> wrote:
> When sending memory pages with MSG_ZEROCOPY, it's necessary to flush
> to make sure all dirty pages are sent before a future version of them
> happens to be sent.
>
> Currently, the flush happens every time at the end of ram_save_iterate(),
> which usually happens around 20x per second, due to a timeout.
>
> Change so it flushes only after a whole scanning of the dirty bimap,
> so it never sends a newer version of a page before an older one, while
> avoiding unnecessary overhead.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

I agree that previous one is too many flushes, but this one changes to too
much memory to be uncommitted, and that is important because otherwise we
have unlimited amount of dirty memory.

> +/*
> + * Set zero_copy_flush = true for every multifd channel
> + *
> + * When using zero-copy, it's necessary to flush the pages before any of
> + * the pages can be sent again, so we'll make sure the new version of the
> + * pages will always arrive _later_ than the old pages.
> + *
> + * Should be called only after we finished one whole scanning of
> + * all the dirty bitmaps.
> + */
> +int multifd_zero_copy_flush(void)
> +{
> +    int i;
> +    Error *local_err = NULL;
> +
> +    if (!migrate_use_multifd()) {
> +        return 0;
> +    }
> +
> +    for (i = 0; i < migrate_multifd_channels(); i++) {
> +        MultiFDSendParams *p = &multifd_send_state->params[i];
> +        int ret;
> +
> +        ret = qio_channel_flush(p->c, &local_err);
> +        if (ret < 0) {
> +            error_report_err(local_err);
> +            return ret;
> +        }
> +    }
> +
> +    return 0;
> +}


Here you flush every channel, Only at the end of a range you want to do this.


>  int multifd_send_sync_main(QEMUFile *f)
>  {
>      int i;
> -    bool flush_zero_copy;
>  
>      if (!migrate_use_multifd()) {
>          return 0;
> @@ -581,19 +613,6 @@ int multifd_send_sync_main(QEMUFile *f)
>          }
>      }
>  
> -    /*
> -     * When using zero-copy, it's necessary to flush the pages before any of
> -     * the pages can be sent again, so we'll make sure the new version of the
> -     * pages will always arrive _later_ than the old pages.
> -     *
> -     * Currently we achieve this by flushing the zero-page requested writes
> -     * per ram iteration, but in the future we could potentially optimize it
> -     * to be less frequent, e.g. only after we finished one whole scanning of
> -     * all the dirty bitmaps.
> -     */
> -
> -    flush_zero_copy = migrate_use_zero_copy_send();
> -
>      for (i = 0; i < migrate_multifd_channels(); i++) {
>          MultiFDSendParams *p = &multifd_send_state->params[i];
>  
> @@ -615,17 +634,6 @@ int multifd_send_sync_main(QEMUFile *f)
>          ram_counters.transferred += p->packet_len;
>          qemu_mutex_unlock(&p->mutex);
>          qemu_sem_post(&p->sem);
> -
> -        if (flush_zero_copy && p->c) {
> -            int ret;
> -            Error *err = NULL;
> -
> -            ret = qio_channel_flush(p->c, &err);
> -            if (ret < 0) {
> -                error_report_err(err);
> -                return -1;
> -            }
> -        }

This synchronization already happens once every iteration through all
ram.

</me checks how>

And low and behold, it doesn't.

The problem here is that we are calling multifd_send_sync_main() in the
wrong place, i.e. we are being too conservative.

We need to call multifd_send_sync_main() just before doing
migration_bitmap_sync().  The reason that we need to call that function
is exactly the same that we need to flush for zero_copy.

So, what we need to change is remove the call to
multifd_send_sync_main(), not how it handles zero_copy.

>      }
>      for (i = 0; i < migrate_multifd_channels(); i++) {
>          MultiFDSendParams *p = &multifd_send_state->params[i];
> diff --git a/migration/ram.c b/migration/ram.c
> index 5f5e37f64d..514584e44f 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2288,6 +2288,13 @@ static int ram_find_and_save_block(RAMState *rs)
>      rs->last_seen_block = pss.block;
>      rs->last_page = pss.page;
>  
> +    if (pss.complete_round && migrate_use_zero_copy_send()) {
> +        int ret = multifd_zero_copy_flush();
> +        if (ret < 0) {
> +            return ret;
> +        }
> +    }
> +

This place is not right either, because we can have a sync in the middle
for other reasons.

We call migration_bitmap_sync() in save_live_pending(), and that is not
when we finish the complete_round.

Once discussed this, what I asked in the past is that you are having too
much dirty memory on zero_copy.  When you have a Multiterabyte guest, in
a single round you have a "potentially" dirty memory on each channel of:

   total_amount_memory / number of channels.

In a Multiterabyte guest, this is going to be more that probably in the
dozens of gigabytes.  As far as I know there is no card/driver that will
benefit for so many pages in zero_copy, and kernel will move to
synchronous copy at some point.  (In older threads, daniel showed how to
test for this case).

What I proposed is that you check in the migration_send_thread() how
much memory you have written since last synchronization.  Once that it
is big enough (I don't know the limits for card, in the docs that you
showed suggested the size is a few megabytes), you just sync at that
point and continue.

You still need to synchronize all threads at bitmap sync, but as said,
that is handled by multifd_send_sync_main(), and we should fix that
instead of changing where zero_copy flushes.

/* Removed not relevant bits of the function */

static void *multifd_send_thread(void *opaque)
{
    size_t zero_copy_bytes_sent = 0;

    ...

    while (true) {

            ....

            trace_multifd_send(p->id, packet_num, p->normal_num, p->zero_num,
                               p->flags, p->next_packet_size);

            if (use_zero_copy_send) {
                /* Send header first, without zerocopy */
                ret = qio_channel_write_all(p->c, (void *)p->packet,
                                            p->packet_len, &local_err);
                if (ret != 0) {
                    break;
                }

****** Note aside

Did you answered my question here of what happens when you do:

write_with_zero_copy(1MB); write_without_zero_copy(4KB); write_with_zero_copy(1MB); write_without_zero_copy(4KB);

My guess is that write_without_zero_copy(4KB) will just flush the
socket.  I can't think how it can work without doing that.
If so, we are not getting what we want.

            } else {
                /* Send header using the same writev call */
                p->iov[0].iov_len = p->packet_len;
                p->iov[0].iov_base = p->packet;
            }

            ret = qio_channel_writev_full_all(p->c, p->iov, p->iovs_num, NULL,
                                              0, p->write_flags, &local_err);
            if (ret != 0) {
                break;
            }

            qemu_mutex_lock(&p->mutex);
            p->num_packets++;
            p->total_normal_pages += p->normal_num;
            p->total_zero_pages += p->zero_num;
            p->pages->num = 0;
            p->pages->block = NULL;
            p->sent_bytes += p->packet_len;;
            p->sent_bytes += p->next_packet_size;

**** Addition
            zero_copy_bytes_sent += p->packet_len + p->next_packet_size;

            p->pending_job--;
            qemu_mutex_unlock(&p->mutex);
***** Addition
            if (zero_copy_bytes_sent > Threshold) // 2MB/4MB?  I don't know
                    ret = qio_channel_flush(p->c, &local_err);
                    // Handle error somehow
                    //  If you want to be a pro, just change the
                    // Threshold depending on what the kernel answers.
                    // If it has to revert to synchronous sent, just
                    // decrease the threshold, otherwise increase it.

            if (p->flags & MULTIFD_FLAG_SYNC) {
                qemu_sem_post(&p->sem_sync);
            }
            qemu_sem_post(&multifd_send_state->channels_ready);
        } else if (p->quit) {
            qemu_mutex_unlock(&p->mutex);
            break;
        } else {
            qemu_mutex_unlock(&p->mutex);
            /* sometimes there are spurious wakeups */
        }
    }
    .............
}

What do you think?

Later, Juan.


