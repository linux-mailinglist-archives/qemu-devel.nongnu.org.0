Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8D15E7726
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 11:30:08 +0200 (CEST)
Received: from localhost ([::1]:51974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obf0Y-0006zn-Tm
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 05:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1obepA-0004tL-6Q
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 05:18:20 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:39738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1obep1-00072m-HB
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 05:18:18 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AE3451FA40;
 Fri, 23 Sep 2022 09:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1663924687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SrCvS1iVNHYn2vPi2S2Foc0/rX0naTrRNLoHaKr2cJk=;
 b=cbD3ZzhTwtq7MKmmd515av1PWvxqTXGYWL13/bWV7U5pe/SdBnsbVm543D+nCO5+sMxGg/
 IzX+CnDiVKTboQklu/KNlq6WFbxNiFwnJNGLgcfIRaBpfmR9kNl2nZpCm7gAAARh24RUOi
 DG0GEZWopIcdFEhSQS8wDO//vp8eP/8=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7C45B13A00;
 Fri, 23 Sep 2022 09:18:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5w6VG895LWOkIAAAMHmgww
 (envelope-from <nborisov@suse.com>); Fri, 23 Sep 2022 09:18:07 +0000
Message-ID: <b0d7d304-5da5-d8c4-f9bf-e27fef882918@suse.com>
Date: Fri, 23 Sep 2022 12:18:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] migration/ram: Fix memory leak when using x-ignore-shared
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20220916084442.1349996-1-nborisov@suse.com>
 <Yyyenk4Qu6nWMsJD@work-vm>
From: Nikolay Borisov <nborisov@suse.com>
In-Reply-To: <Yyyenk4Qu6nWMsJD@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=nborisov@suse.com;
 helo=smtp-out2.suse.de
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.893,
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



On 22.09.22 г. 20:42 ч., Dr. David Alan Gilbert wrote:
> * Nikolay Borisov (nborisov@suse.com) wrote:
>> During ram initialization for migration dirty/clear bitmaps are
>> allocated for all migratable blocks, irrespective of their shared
>> status. However, during ram migration cleanup those bitmaps are freed
>> only for those blocks which aren't shared, in case x-ignore-shared
>> capability is used. This leads to a situation where the bitmaps aren't
>> freed for such blocks.
> 
> Can you show me where you're seeing the allocation based on MIGRATABLE?
> I'm looking at ram_list_init_bitmaps:
> 
> 
>          RAMBLOCK_FOREACH_NOT_IGNORED(block) {
>              block->bmap = bitmap_new(pages);
> ....
>              block->clear_bmap = bitmap_new(clear_bmap_size(pages, shift));
> 
> 
> So that's based on NOT_IGNORED.

Huhz, you are perfectly right and I assume I got confused by the 
RAMBLOCK_FOREACH_MIGRATABLE in ram_save_setup as opposed to the code in 
ram_list_init_bitmaps. Apologies for the noise...

> 
> Dave
> 
>> Fix this by switching the cleanup code to also free bitmaps for all
>> migratable blocks.
>>
>> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
>> ---
>>   migration/ram.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index dc1de9ddbc68..2e40166d2f9e 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -2678,7 +2678,7 @@ static void ram_save_cleanup(void *opaque)
>>           }
>>       }
>>   
>> -    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
>> +    RAMBLOCK_FOREACH_MIGRATABLE(block) {
>>           g_free(block->clear_bmap);
>>           block->clear_bmap = NULL;
>>           g_free(block->bmap);
>> -- 
>> 2.34.1
>>

