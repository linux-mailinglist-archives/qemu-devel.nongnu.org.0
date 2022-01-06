Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5A34862C8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:17:51 +0100 (CET)
Received: from localhost ([::1]:59996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5PqA-0008Ut-BA
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:17:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1n5PfA-0007Dw-EQ
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:06:30 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:40316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1n5Pf8-0002zM-Qe
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:06:28 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A09E01F37C;
 Thu,  6 Jan 2022 10:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641463583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uriTlj0ky0/lU66A7bVnSaxYiGRTZud98jHo+S2n0tM=;
 b=q6vQIwuzALfXnZNCbfeNHMC7TFvD3kgtZ3O4ef87QKAo8YZGWebx1poROiap+fig1oIMTx
 2QXte8+DbcKk0VpFq8sqTSPQjHZcrs8ARHIWn5XzmXD44p7iZQeT6YrCv3zcJNZEGa7ko8
 8cPyh/8lHXP5j03l0jPC1Ku1SLPxqDs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641463583;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uriTlj0ky0/lU66A7bVnSaxYiGRTZud98jHo+S2n0tM=;
 b=0BI6PPYD6mSB/8hhoOMvBK01N2YnS3XEEneWEc0MCDo/jAb4JjoPpV+Z3l3wzTfZbQygiv
 45KaYC96BsO0jVDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 76E7B13BE4;
 Thu,  6 Jan 2022 10:06:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KmYoGx+/1mEZeAAAMHmgww
 (envelope-from <lizhang@suse.de>); Thu, 06 Jan 2022 10:06:23 +0000
From: Li Zhang <lizhang@suse.de>
Subject: Re: [PATCH v2 1/1] multifd: Remove some redundant code
To: quintela@redhat.com, dgilbert@redhat.com, cfontana@suse.de,
 qemu-devel@nongnu.org
References: <20211217101228.9512-1-lizhang@suse.de>
Message-ID: <fc33b1bd-044f-346b-7443-e3abd6fb0561@suse.de>
Date: Thu, 6 Jan 2022 11:06:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211217101228.9512-1-lizhang@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=lizhang@suse.de;
 helo=smtp-out2.suse.de
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

Any comments?

Thanks
Li

On 12/17/21 11:12 AM, Li Zhang wrote:
> Clean up some unnecessary code
> 
> Signed-off-by: Li Zhang <lizhang@suse.de>
> ---
>   migration/multifd.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 3242f688e5..212be1ed04 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -854,19 +854,16 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
>       Error *local_err = NULL;
>   
>       trace_multifd_new_send_channel_async(p->id);
> -    if (qio_task_propagate_error(task, &local_err)) {
> -        goto cleanup;
> -    } else {
> +    if (!qio_task_propagate_error(task, &local_err)) {
>           p->c = QIO_CHANNEL(sioc);
>           qio_channel_set_delay(p->c, false);
>           p->running = true;
>           if (!multifd_channel_connect(p, sioc, local_err)) {
> -            goto cleanup;
> +            multifd_new_send_channel_cleanup(p, sioc, local_err);
>           }
>           return;
>       }
>   
> -cleanup:
>       multifd_new_send_channel_cleanup(p, sioc, local_err);
>   }
>   
> @@ -1078,10 +1075,7 @@ static void *multifd_recv_thread(void *opaque)
>   
>           ret = qio_channel_read_all_eof(p->c, (void *)p->packet,
>                                          p->packet_len, &local_err);
> -        if (ret == 0) {   /* EOF */
> -            break;
> -        }
> -        if (ret == -1) {   /* Error */
> +        if (ret == 0 || ret == -1) {   /* 0: EOF  -1: Error */
>               break;
>           }
>   
> 


