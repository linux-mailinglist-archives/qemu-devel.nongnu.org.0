Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EFE5EA36E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 13:25:14 +0200 (CEST)
Received: from localhost ([::1]:35524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocmEa-00074x-Pt
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 07:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ocmBG-0003c6-H3
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 07:21:46 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:39554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ocmBE-0000d3-PD
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 07:21:46 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D33AD21ED0;
 Mon, 26 Sep 2022 11:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664191302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFnSEL8upZ1ph0a92XhnecCMs9p2hPoEU+gYfRTmmHQ=;
 b=TZJbUDfFkVi+w7Hk0xOxxeCbzlbHC2gUXt5p+/KIleSRP1cbNbsoMcSqnpoipaDUoYpunr
 nzCthcqUUMwlrLNUikL23noDBvD21hic2vO3nISByIiY8ezeO+vvY9MUxOpT5nCMwUG3qq
 p1Lit0vLFUFr0qAO55gUhbYb6cXJxUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664191302;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFnSEL8upZ1ph0a92XhnecCMs9p2hPoEU+gYfRTmmHQ=;
 b=NG8A5TgMetxZRs0Jlibw9LgxpValHBljskjtGuizkrEweIRZvECAISKyMQfr7PPAZZKua2
 fiB8ATHdCbCNCfAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 597CB13486;
 Mon, 26 Sep 2022 11:21:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id s2YGE0aLMWPvLwAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 26 Sep 2022 11:21:42 +0000
Message-ID: <06c9beec-5c36-7675-b09b-151f7e8e6df6@suse.de>
Date: Mon, 26 Sep 2022 13:21:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v6 5/5] accel: abort if we fail to load the accelerator
 plugin
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 dinechin@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220923232104.28420-1-cfontana@suse.de>
 <20220923232104.28420-6-cfontana@suse.de>
 <989f2606-fa87-0a2e-c49e-00442c8c618c@amsat.org>
 <0e32098d-4f76-8a40-3214-98fb58dd4192@suse.de> <YzGFZ8A1InmPkNb/@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <YzGFZ8A1InmPkNb/@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 9/26/22 12:56, Kevin Wolf wrote:
> Am 26.09.2022 um 09:58 hat Claudio Fontana geschrieben:
>> On 9/24/22 14:35, Philippe Mathieu-Daudé via wrote:
>>> On 24/9/22 01:21, Claudio Fontana wrote:
>>>> if QEMU is configured with modules enabled, it is possible that the
>>>> load of an accelerator module will fail.
>>>> Abort in this case, relying on module_object_class_by_name to report
>>>> the specific load error if any.
>>>>
>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>>   accel/accel-softmmu.c | 8 +++++++-
>>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
>>>> index 67276e4f52..9fa4849f2c 100644
>>>> --- a/accel/accel-softmmu.c
>>>> +++ b/accel/accel-softmmu.c
>>>> @@ -66,6 +66,7 @@ void accel_init_ops_interfaces(AccelClass *ac)
>>>>   {
>>>>       const char *ac_name;
>>>>       char *ops_name;
>>>> +    ObjectClass *oc;
>>>>       AccelOpsClass *ops;
>>>>   
>>>>       ac_name = object_class_get_name(OBJECT_CLASS(ac));
>>>> @@ -73,8 +74,13 @@ void accel_init_ops_interfaces(AccelClass *ac)
>>>>   
>>>>       ops_name = g_strdup_printf("%s" ACCEL_OPS_SUFFIX, ac_name);
>>>>       ops = ACCEL_OPS_CLASS(module_object_class_by_name(ops_name));
>>>> +    oc = module_object_class_by_name(ops_name);
>>>> +    if (!oc) {
>>>> +        error_report("fatal: could not load module for type '%s'", ops_name);
>>>> +        abort();
>>>
>>> I still think a coredump won't help at all to figure the problem here: a 
>>
>> I can change this from abort to exit(1), the issue I am seeing is, usually when we fail to create or initialize objects
>> we seem to be using abort(), the most prominent examples are in qom/object.c:
>>
>> static TypeImpl *type_new(const TypeInfo *info)
>> {
>>     TypeImpl *ti = g_malloc0(sizeof(*ti));
>>     int i;
>>
>>     g_assert(info->name != NULL);
>>
>>     if (type_table_lookup(info->name) != NULL) {
>>         fprintf(stderr, "Registering `%s' which already exists\n", info->name);
>>         abort();
>>     }
>>
>> ...
>>
>> void object_initialize(void *data, size_t size, const char *typename)
>> {
>>     TypeImpl *type = type_get_by_name(typename);
>>
>> #ifdef CONFIG_MODULES
>>     if (!type) {
>>         Error *local_err = NULL;
>>         int rv = module_load_qom(typename, &local_err);
>>         if (rv > 0) {
>>             type = type_get_by_name(typename);
>>         } else if (rv < 0) {
>>             error_report_err(local_err);
>>         }
>>     }
>> #endif
>>     if (!type) {
>>         error_report("missing object type '%s'", typename);
>>         abort();
>>     }
>>
>>     object_initialize_with_type(data, size, type);
>> }
>>
>>
>> Do you propose to change only the assert in accel_init_ops_interfaces
>> to exit(1)?
>>
>> Or the other case as well in the series? (ie hw/core/qdev.c qdev_new()
>> ?)
>>
>> Do you propose to change this consistently through the codebase
>> including the object.c snippets above?
> 
> The difference with the snippets above (in the non-module case) is that
> calling object_new() with a type that doesn't exist is a bug, it's an
I see where you are going, however in the object initialization case,
we still have the possibility that the type is available only after module load.

So according to your differentiation, we would have to exit() in the module case, and abort() if modules are disabled.


> programming error. Calling type_new() twice for the same TypeInfo or for
> two TypeInfos with the same name is a programming error, too. abort() is
> correct for situations that should never happen in a bug free QEMU.
> 
> Not being able to load a module is generally not a bug in QEMU, it's an
> error of external origin. So here abort() is not appropriate.
> 
> The CONFIG_MODULES code in object_initialize() is problematic because it
> doesn't have a way to deal with an error case that can happen without a
> bug in QEMU. Without changing the prototype of the function to actually
> allow error returns (which I suspect might be a very invasive change),
> maybe the best approach is to just make it a fatal error and leave the
> code mostly as it is in current master:
> 
> #ifdef CONFIG_MODULES
>     if (!type) {
>         /* Assuming that module_load_qom_one() returns an error if the
>          * module doesn't exist */
>         module_load_qom_one(typename, &error_fatal);
>         type = type_get_by_name(typename);
>     }
> #endif
>     if (!type) {
>         error_report("missing object type '%s'", typename);
>         abort();
>     }
> 
>     object_initialize_with_type(data, size, type);
> 
> This makes it print an error message and exit(). Which is honestly not
> great during runtime because it doesn't properly shut down QEMU, let
> alone just fail the operation and keep running, but at least slightly
> better than abort().

Ok so the core of the issue is, if CONFIG_MODULES we want to exit() and not abort() if the type is not available.

> 
>>> module is missing, we know its name. Anyhow I don't mind much, and this
>>> can be cleaned later, so:
>>
>> Sure this could be fixed later with a series that tries to use exit()
>> vs abort() consistently throughout the codebase when initializing and
>> creating objects.
> 
> This should mean consistently distinguishing programming errors (i.e.
> QEMU bugs) from errors of external origin.
> 
> Kevin
> 

Thanks,

I'll have a new pass with this in mind.

Claudio

