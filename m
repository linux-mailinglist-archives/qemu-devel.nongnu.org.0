Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654EE47883F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 10:55:34 +0100 (CET)
Received: from localhost ([::1]:59914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my9xd-0003UH-Hq
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 04:55:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1my9w9-0002oh-9B
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 04:54:01 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:55620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1my9w7-0007IK-Py
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 04:54:01 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8CE281F389;
 Fri, 17 Dec 2021 09:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639734838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oMpHLFnAOlHU9gzC7TjjwaMdWTqq3NepEk77ZJXazSM=;
 b=NS8ODXiRW6qCJooy4DBA4N9adrJ/G5frie9zQGocITUKqr4dR/RlTqWdZxU+wmSqBZXJPK
 Io1/5GXY84ih3HWhzykB9qkUHU/HuL/4PbrgOj3V1Onu1pMFmBHt2EmEBXg735QQXic6Pe
 i1CgVSUcM/O6TrexumamtGTRgG+Lz1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639734838;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oMpHLFnAOlHU9gzC7TjjwaMdWTqq3NepEk77ZJXazSM=;
 b=LFkT2hiR+nhWMPeCbnCZ90aKZyU9Fyga69Ml965qq46P6DQvkE087AD1mKDDkMAbprAPbv
 xTFHH9NmdHfERfCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 675F913F31;
 Fri, 17 Dec 2021 09:53:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FzXJFzZevGHqHAAAMHmgww
 (envelope-from <lizhang@suse.de>); Fri, 17 Dec 2021 09:53:58 +0000
Subject: Re: [PATCH 1/1] multifd: Remove some redundant code
To: Claudio Fontana <cfontana@suse.de>, quintela@redhat.com,
 dgilbert@redhat.com, qemu-devel@nongnu.org
References: <20211217093318.6260-1-lizhang@suse.de>
 <5ff179bb-cea8-35d9-f062-9cbfd3f7cb9e@suse.de>
From: Li Zhang <lizhang@suse.de>
Message-ID: <e108a7f6-8b1f-e003-0dfb-9cf364b2e5ad@suse.de>
Date: Fri, 17 Dec 2021 10:53:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5ff179bb-cea8-35d9-f062-9cbfd3f7cb9e@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=lizhang@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 12/17/21 10:39 AM, Claudio Fontana wrote:
> Hi Li,
> 
> the full function for context:
> 
> static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
> {
>      MultiFDSendParams *p = opaque;
>      QIOChannel *sioc = QIO_CHANNEL(qio_task_get_source(task));
>      Error *local_err = NULL;
> 
>      trace_multifd_new_send_channel_async(p->id);
>      if (qio_task_propagate_error(task, &local_err)) {
>          goto cleanup;
>      } else {
>          p->c = QIO_CHANNEL(sioc);
>          qio_channel_set_delay(p->c, false);
>          p->running = true;
>          if (!multifd_channel_connect(p, sioc, local_err)) {
>              goto cleanup;
>          }
>          return;
>      }
> 
> cleanup:
>      multifd_new_send_channel_cleanup(p, sioc, local_err);
> }
> 
> 
> 
> On 12/17/21 10:33 AM, Li Zhang wrote:
>> Clean up some unnecessary code
>>
>> Signed-off-by: Li Zhang <lizhang@suse.de>
>> ---
>>   migration/multifd.c | 9 ++-------
>>   1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index 3242f688e5..1405cf95b8 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -854,9 +854,7 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
>>       Error *local_err = NULL;
>>   
>>       trace_multifd_new_send_channel_async(p->id);
>> -    if (qio_task_propagate_error(task, &local_err)) {
>> -        goto cleanup;
> 
> I see you are removing this goto, but keeping there the other one.. is this a bit inconsistent?

Ah, you are right. The other one is not necessary anymore.

> 
> Should the second check be inverted too, to remove the other goto as well?
I would like to remove the goto and call the function directly.

> 
> Ciao,
> 
> Claudio
> 
>> -    } else {
>> +    if (!qio_task_propagate_error(task, &local_err)) {
>>           p->c = QIO_CHANNEL(sioc);
>>           qio_channel_set_delay(p->c, false);
>>           p->running = true;
>> @@ -1078,10 +1076,7 @@ static void *multifd_recv_thread(void *opaque)
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
>>   
>>
> 


