Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8692F49DECA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 11:11:15 +0100 (CET)
Received: from localhost ([::1]:60898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1kI-0001M1-M3
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 05:11:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nD1Wf-0006In-Jy
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:57:10 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:40580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nD1WM-0003GW-Ph
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:56:53 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 562881F45F;
 Thu, 27 Jan 2022 09:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643277380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPZT2NpjpVpXplaOfWpHoinNXz1B8H+TpnXxd1XxIRw=;
 b=BIug2ufCnxhYwF5gez1WzTnteUQm6iWShKUviH2MCQvgdgE/+45PO/cFw9kwd2Rqd2PTJx
 Aq2IVJ9cDCA/gFtyQaL2Gd7KlUMyMHGozp4zvzo3V0uxaj2iAwckyKXF8t1sbNm1mdcQ+D
 oIi1IlIksR8y1QjJvlyLxxSaREXwcbQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643277380;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPZT2NpjpVpXplaOfWpHoinNXz1B8H+TpnXxd1XxIRw=;
 b=oiudq6yFmuLxEk7sP7v5/N/WpJlibioMM98ISkZfph5uhIUhX1H6fr5nTPLuRRF17H6pfr
 kXC8rIJCBYQM8UBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0AAD513AAB;
 Thu, 27 Jan 2022 09:56:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RpZKO0Ns8mHhMAAAMHmgww
 (envelope-from <lizhang@suse.de>); Thu, 27 Jan 2022 09:56:19 +0000
Subject: Re: [PATCH v2 1/1] multifd: Remove some redundant code
To: quintela@redhat.com
References: <20211217101228.9512-1-lizhang@suse.de>
 <87bkzxld33.fsf@secure.mitica>
From: Li Zhang <lizhang@suse.de>
Message-ID: <dfc4de74-07d7-e187-cc19-f3f565bf7233@suse.de>
Date: Thu, 27 Jan 2022 10:56:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87bkzxld33.fsf@secure.mitica>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=lizhang@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/22 10:53 AM, Juan Quintela wrote:
> Li Zhang <lizhang@suse.de> wrote:
>> Clean up some unnecessary code
>>
>> Signed-off-by: Li Zhang <lizhang@suse.de>
> 
> Hi
> 
>> ---
>>   migration/multifd.c | 12 +++---------
>>   1 file changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index 3242f688e5..212be1ed04 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -854,19 +854,16 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
>>       Error *local_err = NULL;
>>   
>>       trace_multifd_new_send_channel_async(p->id);
>> -    if (qio_task_propagate_error(task, &local_err)) {
>> -        goto cleanup;
>> -    } else {
>> +    if (!qio_task_propagate_error(task, &local_err)) {
>>           p->c = QIO_CHANNEL(sioc);
>>           qio_channel_set_delay(p->c, false);
>>           p->running = true;
>>           if (!multifd_channel_connect(p, sioc, local_err)) {
>> -            goto cleanup;
>> +            multifd_new_send_channel_cleanup(p, sioc, local_err);
>>           }
>>           return;
>>       }
>>   
>> -cleanup:
>>       multifd_new_send_channel_cleanup(p, sioc, local_err);
>>   }
>>   
> 
> Once there, why are we duplicating the call to
> multifd_new_send_channel_cleanup()
> 
> What about:
> 
> static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
> {
>      MultiFDSendParams *p = opaque;
>      QIOChannel *sioc = QIO_CHANNEL(qio_task_get_source(task));
>      Error *local_err = NULL;
> 
>      trace_multifd_new_send_channel_async(p->id);
>      if (!qio_task_propagate_error(task, &local_err)) {
>          p->c = QIO_CHANNEL(sioc);
>          qio_channel_set_delay(p->c, false);
>          p->running = true;
>          if (multifd_channel_connect(p, sioc, local_err)) {
>              return;
>          }
>      }
>      multifd_new_send_channel_cleanup(p, sioc, local_err);
> }
> 
> What do you think?

Ah, this is better. thanks. :)


> 
> Later, Juan.
> 
> 
>> @@ -1078,10 +1075,7 @@ static void *multifd_recv_thread(void *opaque)
>>   
>>           ret = qio_channel_read_all_eof(p->c, (void *)p->packet,
>>                                          p->packet_len, &local_err);
>> -        if (ret == 0) {   /* EOF */
>> -            break;
>> -        }
>> -        if (ret == -1) {   /* Error */
>> +        if (ret == 0 || ret == -1) {   /* 0: EOF  -1: Error */
>>               break;
>>           }
> 
> This bit is ok.
> 


