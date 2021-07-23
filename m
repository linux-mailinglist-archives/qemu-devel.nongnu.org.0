Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090933D361E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 10:05:58 +0200 (CEST)
Received: from localhost ([::1]:37366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6qBx-0001sI-4J
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 04:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m6qAC-0000MD-Se
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:04:08 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:50112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m6qAB-0004lG-Bg
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:04:08 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8C0B121CC9;
 Fri, 23 Jul 2021 08:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627027444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s4heI5Mvwb/CUy10lhvbvGcY49F5tI0wLXhQRaefPKA=;
 b=aKznCDqKk5qMFIu699DeFIqzsaP/2YhKxXfNl0m5BDihzOaUwr6dWAUf+KVUEDpbxClyY6
 j9MvYMW5fKDq7iSUPYVH7KAnwpXisP+ZtK2K8+hwukWQFd+guKb8CSObCsP9kcTR/DMYd8
 3j8gB98JeepKhey5aa42cUvGmQr5ABw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627027444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s4heI5Mvwb/CUy10lhvbvGcY49F5tI0wLXhQRaefPKA=;
 b=aAJ1wf6PWGrjeRaN3/MlW/AnQ2PJcJNWrOk+BZ0ssL8MRHR+Fn9R1DL1z+rcsF7JcALJab
 mIWy5UOJYRwHoXBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5609113DEC;
 Fri, 23 Jul 2021 08:04:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id F50iE/R3+mAFYQAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 23 Jul 2021 08:04:04 +0000
Subject: Re: [PATCH v2 1/1] modules: Improve error message when module is not
 found
To: Gerd Hoffmann <kraxel@redhat.com>, "Jose R. Ziviani" <jziviani@suse.de>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <20210723062520.hp6qux5enrwyw56u@sirius.home.kraxel.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <aad125f4-7bd2-2a61-17d9-48e1dc909196@suse.de>
Date: Fri, 23 Jul 2021 10:04:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210723062520.hp6qux5enrwyw56u@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/21 8:25 AM, Gerd Hoffmann wrote:
>   Hi,
> 
>> --- a/accel/accel-softmmu.c
>> +++ b/accel/accel-softmmu.c
>> @@ -79,7 +79,10 @@ void accel_init_ops_interfaces(AccelClass *ac)
>>       * all accelerators need to define ops, providing at least a mandatory
>>       * non-NULL create_vcpu_thread operation.
>>       */
>> -    g_assert(ops != NULL);
>> +    if (ops == NULL) {
> 
> Error message here?> Also split accel bits into a separate patch?

If ops is NULL there is something seriously wrong with the code assumptions.
Asserts are in my view the proper way to handle these.

I do not think there is any reason to change this.

> 
>>          g_hash_table_remove(loaded_modules, module_name);
>> +        fprintf(stderr, "%s module is missing, install the "
>> +                        "package or config the library path "
>> +                        "correctly.\n", module_name);
> 
> This should be error_report(), or maybe warn_report() as this
> isn't a fatal error in all cases.  Otherwise looks good to me.
> 
> take care,
>   Gerd
> 


