Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA4A3D36C0
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 10:33:43 +0200 (CEST)
Received: from localhost ([::1]:59262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6qco-0001Ad-NQ
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 04:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m6qbp-0000DG-HY
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:32:41 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:53436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m6qbn-0003Up-Oj
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:32:41 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 46A7C1FF64;
 Fri, 23 Jul 2021 08:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627029158; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AL98DLsOGC19VRbMytsvPWsUn5CdWdKP3Nd3YqM3ALc=;
 b=vRtGCpXEcRJVGq56QFFkP2dx9t+fT8Z5wHN33GwQwXV2sN/HX0Qi3drFUv/BsZwwigMw+R
 644TeSMjxhIYWpZMfBxpNe6rfxB7k/cH+liN2hEyTHt3APag+GzDzcztHlez5cxW1GuuXv
 bF2mt5ZwE5Wjeb04OKgh6G6vhlbhHBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627029158;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AL98DLsOGC19VRbMytsvPWsUn5CdWdKP3Nd3YqM3ALc=;
 b=7oOKMC5vCuVdHwcjTHXrWJyqehzu7GWGNC9Yb+dljJDaVqigZk6aXxh08GuCE/VfzRM8Wv
 rtVrkQc7rIpnsTDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0347613DF5;
 Fri, 23 Jul 2021 08:32:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id T/3POaV++mAMaQAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 23 Jul 2021 08:32:37 +0000
Subject: Re: [PATCH v2 1/1] modules: Improve error message when module is not
 found
To: Markus Armbruster <armbru@redhat.com>, "Jose R. Ziviani" <jziviani@suse.de>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de> <87a6mdcu39.fsf@dusky.pond.sub.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <f063c92f-a80f-7bef-931b-b55006bb8214@suse.de>
Date: Fri, 23 Jul 2021 10:32:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87a6mdcu39.fsf@dusky.pond.sub.org>
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Markus

On 7/23/21 10:28 AM, Markus Armbruster wrote:
> "Jose R. Ziviani" <jziviani@suse.de> writes:
> 
>> When a module is not found, specially accelerators, QEMU displays
>> a error message that not easy to understand[1]. This patch improves
>> the readability by offering a user-friendly message[2].
>>
>> This patch also moves the accelerator ops check to runtine (instead
>> of the original g_assert) because it works better with dynamic
>> modules.
>>
>> [1] qemu-system-x86_64 -accel tcg
>> ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed:
>> (ops != NULL)
>> Bail out! ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces:
>> assertion failed: (ops != NULL)
>>     31964 IOT instruction (core dumped)  ./qemu-system-x86_64 ...
> 
> This isn't an error message, it's a crash :)


Yes, and the reason of the crash is that the code that needs to initialize ops is missing.

The assert needs to _stay there_,
this is a symptom, not the cause of the problem,

we should not be blindly removing asserts.


> 
>> [2] qemu-system-x86_64 -accel tcg
>> accel-tcg-x86_64 module is missing, install the package or config the library path correctly.
> 
> s/config/configure/
> 
> Also drop the period.
> 
>>
>> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
>> ---
>>  accel/accel-softmmu.c |  5 ++++-
>>  util/module.c         | 14 ++++++++------
>>  2 files changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
>> index 67276e4f52..52449ac2d0 100644
>> --- a/accel/accel-softmmu.c
>> +++ b/accel/accel-softmmu.c
>> @@ -79,7 +79,10 @@ void accel_init_ops_interfaces(AccelClass *ac)
>>       * all accelerators need to define ops, providing at least a mandatory
>>       * non-NULL create_vcpu_thread operation.
>>       */
>> -    g_assert(ops != NULL);
>> +    if (ops == NULL) {
>> +        exit(1);
>> +    }
>> +
> 
> Not your patch's fault: I'm not sure the comment makes sense.


Yes, the comment makes sense.


> 
>>      if (ops->ops_init) {
>>          ops->ops_init(ops);
>>      }
>> diff --git a/util/module.c b/util/module.c
>> index 6bb4ad915a..268a8563fd 100644
>> --- a/util/module.c
>> +++ b/util/module.c
>> @@ -206,13 +206,10 @@ static int module_load_file(const char *fname, bool mayfail, bool export_symbols
>>  out:
>>      return ret;
>>  }
>> -#endif
> 
> Why do you need to mess with the ifdeffery?
> 
>>  
>>  bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
>>  {
>>      bool success = false;
>> -
>> -#ifdef CONFIG_MODULES
>>      char *fname = NULL;
>>  #ifdef CONFIG_MODULE_UPGRADES
>>      char *version_dir;
>> @@ -300,6 +297,9 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
>>  
>>      if (!success) {
>>          g_hash_table_remove(loaded_modules, module_name);
>> +        fprintf(stderr, "%s module is missing, install the "
>> +                        "package or config the library path "
>> +                        "correctly.\n", module_name);
>>          g_free(module_name);
>>      }
>>  
> 
> Again, not your patch's fault: reporting to stderr with fprintf() is
> almost always wrong.
> 
> When the thing we report is an error, we should use error_report() for
> correct formatting.  Likewise, warn_report() for warnings, info_report()
> for informational messages.
> 
> When the module load is triggered by a monitor command, we probably want
> to report problems to the monitor.  error_report() & friends do the
> right thing for HMP.  For QMP, you have to use the Error API, i.e. have
> the function take an Error ** argument, which the callers propagate all
> the way to the QMP core.
> 
> To fix this issue, we first need to decide what kind of message this is:
> error, warning, something else.
> 
>> @@ -307,12 +307,9 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
>>          g_free(dirs[i]);
>>      }
>>  
>> -#endif
>>      return success;
>>  }
>>  
>> -#ifdef CONFIG_MODULES
>> -
>>  static bool module_loaded_qom_all;
>>  
>>  void module_load_qom_one(const char *type)
>> @@ -384,4 +381,9 @@ void qemu_load_module_for_opts(const char *group) {}
>>  void module_load_qom_one(const char *type) {}
>>  void module_load_qom_all(void) {}
>>  
>> +bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
>> +{
>> +    return false;
>> +}
>> +
>>  #endif
> 


