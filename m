Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D37049EA6E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 19:37:19 +0100 (CET)
Received: from localhost ([::1]:43786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD9e1-0003qG-La
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 13:37:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nD9Z4-0007Yr-MO
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 13:32:10 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:44734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nD9Z1-0000k3-T5
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 13:32:10 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A70E0218B0;
 Thu, 27 Jan 2022 18:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643308312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pHiSSpK2TTbgDFMb/E/OKgpcbuZBztJjj0drjDpxd9g=;
 b=cXv5EjlDsqZ3yef4opIUk6a27+icuMNL78Crf8jfVV79r61/ZjRrI+F01qAnBYxOGfXH5s
 16Av6KO6KwydIGSRXCsr2hKsfkJ6z8T4XTMYJ6P0HpNJuq9sTQi+YQjZP9H5UVowimnJKk
 8nt6G6P2fsKDk1OYG1ttpojne7SIwrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643308312;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pHiSSpK2TTbgDFMb/E/OKgpcbuZBztJjj0drjDpxd9g=;
 b=VSnhVwyErpUUrTROLEXNrIENmTYZHFPSFe26G62jkbHlMqSCkvx6LhNkoG/pFOlq267wyv
 +ggwTLNNy9gEJQCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5199B13D4F;
 Thu, 27 Jan 2022 18:31:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id v2A8CBjl8mFPOwAAMHmgww
 (envelope-from <lizhang@suse.de>); Thu, 27 Jan 2022 18:31:52 +0000
Subject: Re: [PATCH v2 1/1] multifd: Remove some redundant code
From: Li Zhang <lizhang@suse.de>
To: quintela@redhat.com
References: <20211217101228.9512-1-lizhang@suse.de>
 <87bkzxld33.fsf@secure.mitica> <d3563b01-6855-078a-4909-271c7c612dc0@suse.de>
Message-ID: <fc7232e7-65c2-15d5-cb0c-68079ad119ab@suse.de>
Date: Thu, 27 Jan 2022 19:31:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d3563b01-6855-078a-4909-271c7c612dc0@suse.de>
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/22 7:11 PM, Li Zhang wrote:
> On 1/27/22 10:53 AM, Juan Quintela wrote:
>> Li Zhang <lizhang@suse.de> wrote:
>>> Clean up some unnecessary code
>>>
>>> Signed-off-by: Li Zhang <lizhang@suse.de>
>>
>> Hi
>>
>>> ---
>>>   migration/multifd.c | 12 +++---------
>>>   1 file changed, 3 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/migration/multifd.c b/migration/multifd.c
>>> index 3242f688e5..212be1ed04 100644
>>> --- a/migration/multifd.c
>>> +++ b/migration/multifd.c
>>> @@ -854,19 +854,16 @@ static void 
>>> multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
>>>       Error *local_err = NULL;
>>>       trace_multifd_new_send_channel_async(p->id);
>>> -    if (qio_task_propagate_error(task, &local_err)) {
>>> -        goto cleanup;
>>> -    } else {
>>> +    if (!qio_task_propagate_error(task, &local_err)) {
>>>           p->c = QIO_CHANNEL(sioc);
>>>           qio_channel_set_delay(p->c, false);
>>>           p->running = true;
>>>           if (!multifd_channel_connect(p, sioc, local_err)) {
>>> -            goto cleanup;
>>> +            multifd_new_send_channel_cleanup(p, sioc, local_err);
>>>           }
>>>           return;
>>>       }
>>> -cleanup:
>>>       multifd_new_send_channel_cleanup(p, sioc, local_err);
>>>   }
>>
>> Once there, why are we duplicating the call to
>> multifd_new_send_channel_cleanup()
>>
>> What about:
>>
>> static void multifd_new_send_channel_async(QIOTask *task, gpointer 
>> opaque)
>> {
>>      MultiFDSendParams *p = opaque;
>>      QIOChannel *sioc = QIO_CHANNEL(qio_task_get_source(task));
>>      Error *local_err = NULL;
>>
>>      trace_multifd_new_send_channel_async(p->id);
>>      if (!qio_task_propagate_error(task, &local_err)) {
>>          p->c = QIO_CHANNEL(sioc);
>>          qio_channel_set_delay(p->c, false);
>>          p->running = true;
>>          if (multifd_channel_connect(p, sioc, local_err)) {
>>              return;
>>          }
>>      }
>>      multifd_new_send_channel_cleanup(p, sioc, local_err);
>> }
>>
>> What do you think?
> 
> Hi Juan,
> 
> Sorry about the code. I check it again, it still needs to cleaup
> if it fails on multifd_channel_connect(). I just remove the goto
> and put the cleanup function there.
> 
> The second cleanup is called if (qio_task_propagate_error(task, 
> &local_err)) ), otherwise, it won't cleanup and return normally.
> 
> If removing the first cleanup and move the return, the logic is not 
> right.  It is that: when no error happens, it still calls the second
> cleanup.
> 

I checked source code from the qemu.
This condition is not right,
if (!multifd_channel_connect(p, sioc, local_err)) is not right.
The function multifd_channel_connect return true if no error.

The mail is right. :)

> 
> Thanks
> Li
>>
>> Later, Juan.
>>
>>
>>> @@ -1078,10 +1075,7 @@ static void *multifd_recv_thread(void *opaque)
>>>           ret = qio_channel_read_all_eof(p->c, (void *)p->packet,
>>>                                          p->packet_len, &local_err);
>>> -        if (ret == 0) {   /* EOF */
>>> -            break;
>>> -        }
>>> -        if (ret == -1) {   /* Error */
>>> +        if (ret == 0 || ret == -1) {   /* 0: EOF  -1: Error */
>>>               break;
>>>           }
>>
>> This bit is ok.
>>
> 


