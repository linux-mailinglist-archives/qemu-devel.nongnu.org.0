Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9BA4862BC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:13:04 +0100 (CET)
Received: from localhost ([::1]:45944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5PlX-0006sF-U9
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:13:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1n5PgL-0000Ll-1K
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:07:41 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:36096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1n5PgJ-0003A8-Bu
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:07:40 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 532222113A
 for <qemu-devel@nongnu.org>; Thu,  6 Jan 2022 10:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641463658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wMJvaIz4CpdzVdvMuGKMjld8PKqmpbdAbc3goBrdGG4=;
 b=pUB5Bsmar8rnv1ltosCdGk7j85Np5KdYjyY+qNX+o/iw7KYo0SWsYsOAOIfyikrDH1MNzN
 hy1NREfmlXjFo8oALMINqwJsuR1PG4LGrzKELMDkooI6zEek379m9cbmzjHfvAO0Zul8Xs
 bko16n+taFovAO1aaMNvRG9rkgAR9zY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641463658;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wMJvaIz4CpdzVdvMuGKMjld8PKqmpbdAbc3goBrdGG4=;
 b=J5RZRAoudJP/R0yT7tLQK+OxzcxWESxw+5AECQ7MJAJNxXE987UgmxLUoT+EGTozOp0SNr
 zBmYQ7ol8ZuRtAAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F0D613C1E
 for <qemu-devel@nongnu.org>; Thu,  6 Jan 2022 10:07:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TWymDWq/1mGFeAAAMHmgww
 (envelope-from <lizhang@suse.de>)
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 10:07:38 +0000
Subject: Re: [PATCH 2/2] multifd: cleanup the function multifd_send_thread
To: qemu-devel@nongnu.org
References: <20211222113049.9326-1-lizhang@suse.de>
 <20211222113049.9326-3-lizhang@suse.de>
From: Li Zhang <lizhang@suse.de>
Message-ID: <9385c878-bd71-fc99-a4ab-f66e5ac3f724@suse.de>
Date: Thu, 6 Jan 2022 11:07:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211222113049.9326-3-lizhang@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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


ping

On 12/22/21 12:30 PM, Li Zhang wrote:
> Cleanup multifd_send_thread
> 
> Signed-off-by: Li Zhang <lizhang@suse.de>
> ---
>   migration/multifd.c | 82 ++++++++++++++++++++++-----------------------
>   1 file changed, 41 insertions(+), 41 deletions(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 4ec40739e0..7888d71bfe 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -649,58 +649,58 @@ static void *multifd_send_thread(void *opaque)
>               break;
>           }
>           qemu_mutex_lock(&p->mutex);
> -
> -        if (p->pending_job) {
> -            uint32_t used = p->pages->num;
> -            uint64_t packet_num = p->packet_num;
> -            uint32_t flags = p->flags;
> -
> -            if (used) {
> -                ret = multifd_send_state->ops->send_prepare(p, &local_err);
> -                if (ret != 0) {
> -                    qemu_mutex_unlock(&p->mutex);
> -                    break;
> -                }
> -            }
> -            multifd_send_fill_packet(p);
> -            p->flags = 0;
> -            p->num_packets++;
> -            p->num_pages += used;
> -            p->pages->num = 0;
> -            p->pages->block = NULL;
> +        if (!p->quit && !p->pending_job) {
> +            /* sometimes there are spurious wakeups */
> +            qemu_mutex_unlock(&p->mutex);
> +            continue;
> +        } else if (!p->pending_job) {
>               qemu_mutex_unlock(&p->mutex);
> +            break;
> +        }
>   
> -            trace_multifd_send(p->id, packet_num, used, flags,
> -                               p->next_packet_size);
> +        uint32_t used = p->pages->num;
> +        uint64_t packet_num = p->packet_num;
> +        uint32_t flags = p->flags;
>   
> -            ret = qio_channel_write_all(p->c, (void *)p->packet,
> -                                        p->packet_len, &local_err);
> +        if (used) {
> +            ret = multifd_send_state->ops->send_prepare(p, &local_err);
>               if (ret != 0) {
> +                qemu_mutex_unlock(&p->mutex);
>                   break;
>               }
> +        }
> +        multifd_send_fill_packet(p);
> +        p->flags = 0;
> +        p->num_packets++;
> +        p->num_pages += used;
> +        p->pages->num = 0;
> +        p->pages->block = NULL;
> +        qemu_mutex_unlock(&p->mutex);
>   
> -            if (used) {
> -                ret = multifd_send_state->ops->send_write(p, used, &local_err);
> -                if (ret != 0) {
> -                    break;
> -                }
> -            }
> +        trace_multifd_send(p->id, packet_num, used, flags,
> +                           p->next_packet_size);
>   
> -            qemu_mutex_lock(&p->mutex);
> -            p->pending_job--;
> -            qemu_mutex_unlock(&p->mutex);
> +        ret = qio_channel_write_all(p->c, (void *)p->packet,
> +                                    p->packet_len, &local_err);
> +        if (ret != 0) {
> +            break;
> +        }
>   
> -            if (flags & MULTIFD_FLAG_SYNC) {
> -                qemu_sem_post(&p->sem_sync);
> +        if (used) {
> +            ret = multifd_send_state->ops->send_write(p, used, &local_err);
> +            if (ret != 0) {
> +                break;
>               }
> -            qemu_sem_post(&multifd_send_state->channels_ready);
> -        } else if (p->quit) {
> -            qemu_mutex_unlock(&p->mutex);
> -            break;
> -        } else {
> -            qemu_mutex_unlock(&p->mutex);
> -            /* sometimes there are spurious wakeups */
>           }
> +
> +        qemu_mutex_lock(&p->mutex);
> +        p->pending_job--;
> +        qemu_mutex_unlock(&p->mutex);
> +
> +        if (flags & MULTIFD_FLAG_SYNC) {
> +            qemu_sem_post(&p->sem_sync);
> +        }
> +        qemu_sem_post(&multifd_send_state->channels_ready);
>       }
>   
>   out:
> 


