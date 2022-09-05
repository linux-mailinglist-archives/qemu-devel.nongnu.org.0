Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1553F5AD6D1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 17:47:19 +0200 (CEST)
Received: from localhost ([::1]:50728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVEJh-0005MW-Tn
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 11:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVEG1-0001tu-Nq
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:43:30 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:47932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVEFz-00037z-Vo
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:43:29 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 97BA31FAA3;
 Mon,  5 Sep 2022 15:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662392605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ajOSOeqvoa2hxWG+R0/cwTSfaChkhHdiuDvV11MoSyw=;
 b=rjqCQE7jsa+Em7HfCYPRYIHK328XhmLIWFyzpd+CuueEkwLYwPmhl2VBztOdnWt+x6p1sQ
 DhfCAGCxfb752ZW7tsn77zxlT6aayF+6uz665pRon+9cYyScGYMn0nxkJIGtBQtSbJbpu1
 Jxxgdptade3VIPsBCjXb1FVEP3krGbo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662392605;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ajOSOeqvoa2hxWG+R0/cwTSfaChkhHdiuDvV11MoSyw=;
 b=42KjaChj3SKhsjUGkHv8kgL3YWT7XRjY/3dQcrdjVPXoRhtCnQhGIg2Uug7n5Urs9rgkWu
 UQblmO6iV6Q5+ECQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3E6F1139C7;
 Mon,  5 Sep 2022 15:43:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zfEYDR0ZFmPfYAAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 05 Sep 2022 15:43:25 +0000
Message-ID: <879a973a-c5b0-2a23-bb24-92bf5500f63f@suse.de>
Date: Mon, 5 Sep 2022 17:43:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] accel: print an error message and exit if plugin not
 loaded
Content-Language: en-US
From: Claudio Fontana <cfontana@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220905101332.1986-1-cfontana@suse.de>
 <5d922305-a559-bfdc-7038-ec1560ae0e00@linaro.org>
 <9bb31e44-e43d-b51a-712a-87e46279a0b5@suse.de>
In-Reply-To: <9bb31e44-e43d-b51a-712a-87e46279a0b5@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/5/22 16:36, Claudio Fontana wrote:
> On 9/5/22 14:06, Richard Henderson wrote:
>> On 9/5/22 11:13, Claudio Fontana wrote:
>>> If module_load_one, module_load_file fail for any reason
>>> (permissions, plugin not installed, ...), we need to provide some notification
>>> to the user to understand that this is happening; otherwise the errors
>>> reported on initialization will make no sense to the user.
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> ---
>>>   accel/accel-softmmu.c | 10 ++++++++--
>>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
>>> index 67276e4f52..807708ee86 100644
>>> --- a/accel/accel-softmmu.c
>>> +++ b/accel/accel-softmmu.c
>>> @@ -66,15 +66,21 @@ void accel_init_ops_interfaces(AccelClass *ac)
>>>   {
>>>       const char *ac_name;
>>>       char *ops_name;
>>> +    ObjectClass *oc;
>>>       AccelOpsClass *ops;
>>>   
>>>       ac_name = object_class_get_name(OBJECT_CLASS(ac));
>>>       g_assert(ac_name != NULL);
>>>   
>>>       ops_name = g_strdup_printf("%s" ACCEL_OPS_SUFFIX, ac_name);
>>> -    ops = ACCEL_OPS_CLASS(module_object_class_by_name(ops_name));
>>> +    oc = module_object_class_by_name(ops_name);
>>> +    if (!oc) {
>>> +        error_report("fatal: could not find module object of type \"%s\", "
>>> +                     "plugin might not be loaded correctly", ops_name);
>>> +        exit(EXIT_FAILURE);
>>> +    }
>>
>> The change is correct, in that we certainly cannot continue without the accelerator loaded.
>>
>> But I'm very disappointed that the module interface does not use Error, so you have no 
>> choice but to use an extremely vague message here.  I would much prefer to plumb down an 
>> error parameter so that here one could simply pass &error_fatal.
>>
>>
>> r~
>>
> 
> I agree. I see it as also connected to:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg00578.html
> 
> module_load_file actually has the pertinent information of what it going wrong at the time it goes wrong, so I presume we should collect the Error there,
> and find a way not to lose the return value along the way..
> 
> Claudio
> 

Currently module_load_qom_one() is called among other things inside qom/object.c::object_initialize() as well.

Curiously enough, module_load_one(), which is in turn called by it, takes an argument "bool mayfail", which is always false,
never passed as true in the whole codebase:

bool module_load_one(const char *prefix, const char *lib_name, bool mayfail);

/* mayfail is always false */

module_load_one calls in turn module_load_file, which also takes a bool mayfail argument:

static int module_load_file(const char *fname, bool mayfail, bool export_symbols);

You might think 'mayfail' can be called by other code as true in some cases, but no, it's always false.
I wonder why this "mayfail" argument exists and is propagated at all, when it cannot be anything else than false.
I tried to remove the "mayfail" parameter completely and things seem just fine.

In any case, the only thing that "mayfail" seems to control, is in module_load_file, and is a single printf:

    g_module = g_module_open(fname, flags);
    if (!g_module) {
        if (!mayfail) {
            fprintf(stderr, "Failed to open module: %s\n",
                    g_module_error());
        }
        ret = -EINVAL;
        goto out;
    }


Weird.. Is someone building proprietary modules on top of QEMU? Is this what this is currently trying to address?
But then, the result is just a printf...

Thanks,

C


