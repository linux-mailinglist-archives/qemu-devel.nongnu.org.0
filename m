Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E323D3B98
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 16:04:21 +0200 (CEST)
Received: from localhost ([::1]:47626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6vml-0006sV-NV
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 10:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m6vl0-0005Qb-S8
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:02:30 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:51194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m6vky-0001io-VL
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:02:30 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 59F541FFBA;
 Fri, 23 Jul 2021 14:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627048947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fo7KR+1tLh/m/yrMuqa29GIg/p3S2d9DHcJvDW4j73A=;
 b=wQ7/BdXs3MbW42g5tOSd1l9RdAMedfizOUt/TbjkYSAMY76UQvwmaSt+dhz3tV/2Fg8w6z
 xm21PBqoDaMqbXewZ979uw44QgMDKIRgy5jMRGNkAhgzeT4CnsaadjUkb7bYKuvgsS4WQa
 W7TXU7JdgWPhrkJBa3sBptiNIqhumdk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627048947;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fo7KR+1tLh/m/yrMuqa29GIg/p3S2d9DHcJvDW4j73A=;
 b=g7Sz5YKSPBELRjphBu4tWBSJ0JBhEWrx83p6RccZ08VFMd3Zeat3AHq5dAUyBdoizDhkRT
 jPRyvM/WoiszAsAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B75213D5B;
 Fri, 23 Jul 2021 14:02:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id o6/uAPPL+mB7QwAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 23 Jul 2021 14:02:27 +0000
Subject: Re: [PATCH v2 1/1] modules: Improve error message when module is not
 found
To: "Jose R. Ziviani" <jziviani@suse.de>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de> <YPrJMTF+3lfeNdC5@pizza>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <1dec44e9-3587-ff96-f8c4-81399f689e58@suse.de>
Date: Fri, 23 Jul 2021 16:02:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YPrJMTF+3lfeNdC5@pizza>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
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
Cc: pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/21 3:50 PM, Jose R. Ziviani wrote:
> On Fri, Jul 23, 2021 at 11:41:19AM +0200, Claudio Fontana wrote:
>> On 7/23/21 12:09 AM, Jose R. Ziviani wrote:
>>> When a module is not found, specially accelerators, QEMU displays
>>> a error message that not easy to understand[1]. This patch improves
>>> the readability by offering a user-friendly message[2].
>>>
>>> This patch also moves the accelerator ops check to runtine (instead
>>> of the original g_assert) because it works better with dynamic
>>> modules.
>>>
>>> [1] qemu-system-x86_64 -accel tcg
>>> ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed:
>>> (ops != NULL)
>>> Bail out! ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces:
>>> assertion failed: (ops != NULL)
>>>     31964 IOT instruction (core dumped)  ./qemu-system-x86_64 ...
>>>
>>> [2] qemu-system-x86_64 -accel tcg
>>> accel-tcg-x86_64 module is missing, install the package or config the library path correctly.
>>>
>>> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
>>> ---
>>>  accel/accel-softmmu.c |  5 ++++-
>>>  util/module.c         | 14 ++++++++------
>>>  2 files changed, 12 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
>>> index 67276e4f52..52449ac2d0 100644
>>> --- a/accel/accel-softmmu.c
>>> +++ b/accel/accel-softmmu.c
>>> @@ -79,7 +79,10 @@ void accel_init_ops_interfaces(AccelClass *ac)
>>>       * all accelerators need to define ops, providing at least a mandatory
>>>       * non-NULL create_vcpu_thread operation.
>>>       */
>>> -    g_assert(ops != NULL);
>>> +    if (ops == NULL) {
>>> +        exit(1);
>>> +    }
>>> +
>>
>>
>> Ah, again, why?
>> This change looks wrong to me, 
>>
>> the ops code should be present when ops interfaces are initialized:
>> it should be a code level assertion, as it has to do with the proper order of initializations in QEMU,
>>
>> why would we want to do anything else but to assert here?
>>
>> Am I blind to something obvious?
> 
> Hello!
> 
> Thank you for reviewing it!
> 
> The problem is that if your TCG module is not installed and you start
> QEMU like:
> 
> ./qemu-system-x86_64 -accel tcg
> 
> You'll get the error message + a crash with a core dump:
> 
> accel-tcg-x86_64 module is missing, install the package or config the library path correctly.
> **
> ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed: (ops != NULL)
> Bail out! ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed: (ops != NULL)
> [1]    5740 IOT instruction (core dumped)  ./qemu-system-x86_64 -accel tcg
> 
> I was digging a little bit more in order to move this responsibility to
> module.c but there isn't enough information there to safely exit() in
> all situations that a module may be loaded. As Gerd mentioned, more work
> is needed in order to achieve that.
> 
> However, it's not nice to have a crash due to an optional module missing.
> It's specially confusing because TCG has always been native. Considering
> also that we're already in hard freeze for 6.1, I thought to have this
> simpler check instead.
> 
> What do you think if we have something like:
> 
> /* FIXME: this isn't the right place to handle a missing module and
>    must be reverted when the module refactoring is completely done */
> #ifdef CONFIG_MODULES
> if (ops == NULL) {
>     exit(1);
> }
> #else
> g_assert(ops != NULL);
> #endif
> 
> Regards!


For the normal builds (without modular tcg), this issue does not appear right?
So maybe there is no pressure to change anything for 6.1, and we can work on the right solution on master?

Not sure how we consider this feature for 6.1, I guess it is still not a supported option,
(is there any CI for this? Probably not right?),

so I would consider building modular tcg in 6.1 as "experimental", and we can proceed to do the right thing on master?

Thanks,

Claudio

> 
>>
>>>      if (ops->ops_init) {
>>>          ops->ops_init(ops);
>>>      }
>>> diff --git a/util/module.c b/util/module.c
>>> index 6bb4ad915a..268a8563fd 100644
>>> --- a/util/module.c
>>> +++ b/util/module.c
>>> @@ -206,13 +206,10 @@ static int module_load_file(const char *fname, bool mayfail, bool export_symbols
>>>  out:
>>>      return ret;
>>>  }
>>> -#endif
>>>  
>>>  bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
>>>  {
>>>      bool success = false;
>>> -
>>> -#ifdef CONFIG_MODULES
>>>      char *fname = NULL;
>>>  #ifdef CONFIG_MODULE_UPGRADES
>>>      char *version_dir;
>>> @@ -300,6 +297,9 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
>>>  
>>>      if (!success) {
>>>          g_hash_table_remove(loaded_modules, module_name);
>>> +        fprintf(stderr, "%s module is missing, install the "
>>> +                        "package or config the library path "
>>> +                        "correctly.\n", module_name);
>>>          g_free(module_name);
>>>      }
>>>  
>>> @@ -307,12 +307,9 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
>>>          g_free(dirs[i]);
>>>      }
>>>  
>>> -#endif
>>>      return success;
>>>  }
>>>  
>>> -#ifdef CONFIG_MODULES
>>> -
>>>  static bool module_loaded_qom_all;
>>>  
>>>  void module_load_qom_one(const char *type)
>>> @@ -384,4 +381,9 @@ void qemu_load_module_for_opts(const char *group) {}
>>>  void module_load_qom_one(const char *type) {}
>>>  void module_load_qom_all(void) {}
>>>  
>>> +bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
>>> +{
>>> +    return false;
>>> +}
>>> +
>>>  #endif
>>>
>>


