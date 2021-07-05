Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651923BB728
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 08:27:02 +0200 (CEST)
Received: from localhost ([::1]:53404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0I4K-0005Yb-Vg
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 02:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1m0I2f-0003yL-Je; Mon, 05 Jul 2021 02:25:17 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:51354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1m0I2c-0004fH-TW; Mon, 05 Jul 2021 02:25:17 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9702B1FE0E;
 Mon,  5 Jul 2021 06:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625466309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bfbjl6JP5ds/GnWIlADpbeXYrhWjBwLq2QesFrXS4TA=;
 b=jxAyj75PElNpxokKsHMO6NveEcwaa+tVasvThQfNFR9fMT6M56E1w1+ky0ljkAKr7tP8PT
 szlDACB9wTBEEjSTEGYuiWuehfUfBRZ6FIaGx96GYWYDYAc7/USzo3GCP+0sLNgHoK27MB
 ebld/is/5ZZqwGMXSGDLlqPnbnJNPJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625466309;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bfbjl6JP5ds/GnWIlADpbeXYrhWjBwLq2QesFrXS4TA=;
 b=+pce3t7VrVLpbdHyYxRou8HEySNQcgKgTsA2OoTLWlAutFELwgK62VWAf7nMcanhzvQP9m
 xOFBODvOc7FuRjBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 55C8013790;
 Mon,  5 Jul 2021 06:25:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id qjzkEsWl4mDEFQAAGKfGzw
 (envelope-from <cfontana@suse.de>); Mon, 05 Jul 2021 06:25:09 +0000
Subject: Re: [RFC v6 08/13] target/s390x: split cpu-dump from helper.c
To: Al Cho <ACho@suse.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-9-acho@suse.com>
 <f4848e38-ecce-c6b1-254b-e93fe45711ca@redhat.com>
 <1fc14922aa88d7cd6cbfe3e5e76e10aa8150fe4a.camel@suse.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <101135a9-2b08-ab8b-dd48-8fc1d8f00358@suse.de>
Date: Mon, 5 Jul 2021 08:25:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1fc14922aa88d7cd6cbfe3e5e76e10aa8150fe4a.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
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
Cc: Claudio Fontana <Claudio.Fontana@suse.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 =?UTF-8?Q?Jos=c3=a9_Ricardo_Ziviani?= <jose.ziviani@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/21 9:25 AM, Al Cho wrote:
> On Thu, 2021-07-01 at 14:35 +0200, Thomas Huth wrote:
>> On 29/06/2021 16.19, Cho, Yu-Chen wrote:
>>> Splitting this functionality also allows us to make helper.c sysemu-
>>> only.
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
>>> Acked-by: Cornelia Huck <cohuck@redhat.com>
>>> ---
>>>   target/s390x/cpu-dump.c  | 176
>>> +++++++++++++++++++++++++++++++++++++++
>>
>> Apart from the dump() function, the other functions here are are used
>> in 
>> other contexts, too, so maybe the name is not very appropriate here...
>> What 
>> about naming it "cpu-state.c" instead? Or include the functions in
>> cpu.c 
>> directly?
>>
> 
> ok, I think naming it "cpu-state.c" would make more sense.
> 
> Thanks,
>             AL
> 

For context, cpu-dump.c mimics how this is done on x86,

so rather than coming up with creative new names for each architecture,
I'd rather either put the code into cpu.c, or just keep the existing "cpu-dump.c" as in the initially proposed patch, which looks like the best option to me.

Thanks

Claudio

