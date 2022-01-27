Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538D349EB08
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 20:32:57 +0100 (CET)
Received: from localhost ([::1]:34808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDAVs-0006OJ-Eb
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 14:32:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nDABA-0007Dw-PU
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:11:34 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:46586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nDAAv-0006TJ-M8
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:11:21 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9C18021100;
 Thu, 27 Jan 2022 19:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643310611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0yM4smR0IQ5QAGTsLN7bqauM2tLoTI2er3gxFjkLUtY=;
 b=Nx/5YwkeuM+cDwIkMekAAjr0YjaOtXz9WiThPytLifxoVciyBt1/MxJKr4ZuRYL7qUGy/+
 x4hKjrVhinwWD2UMZN+Pt8BIYpdsYarRmvSMs6L3Ff96mRgzZ9ewW5a03I4fswFedgc+f0
 FZCkUnm48iNtKKV7XhenBVngRyOYu+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643310611;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0yM4smR0IQ5QAGTsLN7bqauM2tLoTI2er3gxFjkLUtY=;
 b=piEBDbtoZXTdCI3RExDmYi/ilWu+6re8Ftb9IXDYM5h0zus9NvmpiW8yb1U/tdEevlaGfT
 Cbs33Zh/gGZQjBAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5DBA013480;
 Thu, 27 Jan 2022 19:10:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OrTgFBPu8mEnSQAAMHmgww
 (envelope-from <lizhang@suse.de>); Thu, 27 Jan 2022 19:10:11 +0000
Subject: Re: [PATCH v2 1/1] multifd: Remove some redundant code
From: Li Zhang <lizhang@suse.de>
To: quintela@redhat.com
References: <20211217101228.9512-1-lizhang@suse.de>
 <87bkzxld33.fsf@secure.mitica> <d3563b01-6855-078a-4909-271c7c612dc0@suse.de>
 <fc7232e7-65c2-15d5-cb0c-68079ad119ab@suse.de>
Message-ID: <979a3bc6-a73e-3a23-3baf-f2d0776266a1@suse.de>
Date: Thu, 27 Jan 2022 20:10:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fc7232e7-65c2-15d5-cb0c-68079ad119ab@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
 helo=smtp-out1.suse.de
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
Cc: cfontana@suse.de, qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/22 7:31 PM, Li Zhang wrote:
> On 1/27/22 7:11 PM, Li Zhang wrote:
>> On 1/27/22 10:53 AM, Juan Quintela wrote:
>>> Li Zhang <lizhang@suse.de> wrote:
>>>> Clean up some unnecessary code
>>>>
>>>> Signed-off-by: Li Zhang <lizhang@suse.de>
>>>
>>> Hi
>>>
>>>> ---
>>>>   migration/multifd.c | 12 +++---------
>>>>   1 file changed, 3 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/migration/multifd.c b/migration/multifd.c
>>>> index 3242f688e5..212be1ed04 100644
>>>> --- a/migration/multifd.c
>>>> +++ b/migration/multifd.c
>>>> @@ -854,19 +854,16 @@ static void 
>>>> multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
>>>>       Error *local_err = NULL;
>>>>       trace_multifd_new_send_channel_async(p->id);
>>>> -    if (qio_task_propagate_error(task, &local_err)) {
>>>> -        goto cleanup;
>>>> -    } else {
>>>> +    if (!qio_task_propagate_error(task, &local_err)) {
>>>>           p->c = QIO_CHANNEL(sioc);
>>>>           qio_channel_set_delay(p->c, false);
>>>>           p->running = true;
>>>>           if (!multifd_channel_connect(p, sioc, local_err)) {
>>>> -            goto cleanup;
>>>> +            multifd_new_send_channel_cleanup(p, sioc, local_err);
>>>>           }
>>>>           return;
>>>>       }
>>>> -cleanup:
>>>>       multifd_new_send_channel_cleanup(p, sioc, local_err);
>>>>   }
>>>
>>> Once there, why are we duplicating the call to
>>> multifd_new_send_channel_cleanup()
>>>
>>> What about:
>>>
>>> static void multifd_new_send_channel_async(QIOTask *task, gpointer 
>>> opaque)
>>> {
>>>      MultiFDSendParams *p = opaque;
>>>      QIOChannel *sioc = QIO_CHANNEL(qio_task_get_source(task));
>>>      Error *local_err = NULL;
>>>
>>>      trace_multifd_new_send_channel_async(p->id);
>>>      if (!qio_task_propagate_error(task, &local_err)) {
>>>          p->c = QIO_CHANNEL(sioc);
>>>          qio_channel_set_delay(p->c, false);
>>>          p->running = true;
>>>          if (multifd_channel_connect(p, sioc, local_err)) {
>>>              return;
>>>          }
>>>      }
>>>      multifd_new_send_channel_cleanup(p, sioc, local_err);
>>> }
>>>
>>> What do you think?
>>
>> Hi Juan,
>>
>> Sorry about the code. I check it again, it still needs to cleaup
>> if it fails on multifd_channel_connect(). I just remove the goto
>> and put the cleanup function there.
>>
>> The second cleanup is called if (qio_task_propagate_error(task, 
>> &local_err)) ), otherwise, it won't cleanup and return normally.
>>
>> If removing the first cleanup and move the return, the logic is not 
>> right.  It is that: when no error happens, it still calls the second
>> cleanup.
>>
> 
> I checked source code from the qemu.
> This condition is not right,
> if (!multifd_channel_connect(p, sioc, local_err)) is not right.
> The function multifd_channel_connect return true if no error.
> 
> The mail is right. :)

Please ignore my mail. I made mistakes and I will update it soon.

Thanks
LI
> 
>>
>> Thanks
>> Li
>>>
>>> Later, Juan.
>>>
>>>
>>>> @@ -1078,10 +1075,7 @@ static void *multifd_recv_thread(void *opaque)
>>>>           ret = qio_channel_read_all_eof(p->c, (void *)p->packet,
>>>>                                          p->packet_len, &local_err);
>>>> -        if (ret == 0) {   /* EOF */
>>>> -            break;
>>>> -        }
>>>> -        if (ret == -1) {   /* Error */
>>>> +        if (ret == 0 || ret == -1) {   /* 0: EOF  -1: Error */
>>>>               break;
>>>>           }
>>>
>>> This bit is ok.
>>>
>>
> 
> 


