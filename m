Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEE360A2AF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 13:46:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omveI-0005DV-8V; Mon, 24 Oct 2022 07:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1omve4-00058u-0x
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:29:31 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1omve2-0002RG-30
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:29:27 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 365BF22169;
 Mon, 24 Oct 2022 11:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666610964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G5rz72gpiv1E2u1AgB9/mXzK5kXw2b5U3lVNVUJK+2Y=;
 b=1tTuKZBID2qQGIjprTneWisxToPgGM6pOSGe1ySgk05i2u2P6U+qPeHIiYksCpboo4pQJs
 Wbiu18IMBPJ6Is9ifLBwW7gXTTP3/9sGseOhjOrL5DvvKErfaxymygbcGKY7l5qZPLETvk
 v6PQ6Av1adBuVMzkZBezZ2RC375ZjOM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666610964;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G5rz72gpiv1E2u1AgB9/mXzK5kXw2b5U3lVNVUJK+2Y=;
 b=So36xvkzwEi/tCeodJGDeBrrMa64NmgPqUuDf6p/J6ZMO2dHArvVTZ95weNyOd/zP81eTB
 W2BMc5VRwWR89tCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C8E9513357;
 Mon, 24 Oct 2022 11:29:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WIrpLhN3VmO6NwAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 24 Oct 2022 11:29:23 +0000
Message-ID: <37a4a0e7-ad75-426d-097e-9327d5e1f9ce@suse.de>
Date: Mon, 24 Oct 2022 13:29:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v7 3/5] module: add Error arguments to module_load and
 module_load_qom
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220927133825.32631-1-cfontana@suse.de>
 <20220927133825.32631-4-cfontana@suse.de> <87zgejybu4.fsf@pond.sub.org>
 <3487e03f-30dc-6545-4d24-cfee9ad15642@suse.de> <874jwpnkrk.fsf@pond.sub.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <874jwpnkrk.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/30/22 13:50, Markus Armbruster wrote:
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> On 9/28/22 13:31, Markus Armbruster wrote:
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>>> improve error handling during module load, by changing:
>>>>
>>>> bool module_load(const char *prefix, const char *lib_name);
>>>> void module_load_qom(const char *type);
>>>>
>>>> to:
>>>>
>>>> int module_load(const char *prefix, const char *name, Error **errp);
>>>> int module_load_qom(const char *type, Error **errp);
>>>>
>>>> where the return value is:
>>>>
>>>>  -1 on module load error, and errp is set with the error
>>>>   0 on module or one of its dependencies are not installed
>>>>   1 on module load success
>>>>   2 on module load success (module already loaded or built-in)
>>>
>>> Two changes, if I understand things correctly:
>>>
>>> 1. Convert to Error API from fprintf(stderr, ...)
>>>
>>> 2. Return a more useful value
>>>
>>> Right?
>>
>> Yes.
>>
>>>
>>> Do you add any new errors here that weren't reported before?  Just
>>
>> Yes.
> 
> Thanks!
> 
>>> trying to calibrate my expectations before I dig into the actual patch.
>>>
>>>> module_load_qom_one has been introduced in:
>>>>
>>>> commit 28457744c345 ("module: qom module support"), which built on top of
>>>> module_load_one, but discarded the bool return value. Restore it.
>>>>
>>>> Adapt all callers to emit errors, or ignore them, or fail hard,
>>>> as appropriate in each context.
>>>>
>>>> Some memory leaks also fixed as part of the module_load changes.
> 
> [...]
> 
>>>> audio: when attempting to load an audio module, report module load errors.
>>>> block: when attempting to load a block module, report module load errors.
>>>> console: when attempting to load a display module, report module load errors.
>>>>
>>>> qdev: when creating a new qdev Device object (DeviceState), report load errors.
>>>>       If a module cannot be loaded to create that device, now abort execution.
>>>>
>>>> qom/object.c: when initializing a QOM object, or looking up class_by_name,
>>>>               report module load errors.
>>>>
>>>> qtest: when processing the "module_load" qtest command, report errors
>>>>        in the load of the module.
>>>
>>> This looks like a list of behavioral changes.  Appreciated!  It's a bit
>>> terse, though.  I might come back to this and suggest improvement.  But
>>> first, I need to understand the patch.
>>>
>>>>
>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>> ---
>>>>  audio/audio.c         |  16 ++--
>>>>  block.c               |  20 +++-
>>>>  block/dmg.c           |  14 ++-
>>>>  hw/core/qdev.c        |  17 +++-
>>>>  include/qemu/module.h |  37 +++++++-
>>>>  qom/object.c          |  18 +++-
>>>>  softmmu/qtest.c       |   8 +-
>>>>  ui/console.c          |  18 +++-
>>>>  util/module.c         | 211 +++++++++++++++++++++++-------------------
>>>>  9 files changed, 235 insertions(+), 124 deletions(-)
>>>>
>>>> diff --git a/audio/audio.c b/audio/audio.c
>>>> index 0a682336a0..ea51793843 100644
>>>> --- a/audio/audio.c
>>>> +++ b/audio/audio.c
>>>> @@ -72,20 +72,24 @@ void audio_driver_register(audio_driver *drv)
>>>>  audio_driver *audio_driver_lookup(const char *name)
>>>>  {
>>>>      struct audio_driver *d;
>>>> +    Error *local_err = NULL;
>>>> +    int rv;
>>>>  
>>>>      QLIST_FOREACH(d, &audio_drivers, next) {
>>>>          if (strcmp(name, d->name) == 0) {
>>>>              return d;
>>>>          }
>>>>      }
>>>> -
>>>> -    audio_module_load(name);
>>>> -    QLIST_FOREACH(d, &audio_drivers, next) {
>>>> -        if (strcmp(name, d->name) == 0) {
>>>> -            return d;
>>>> +    rv = audio_module_load(name, &local_err);
>>>> +    if (rv > 0) {
>>>> +        QLIST_FOREACH(d, &audio_drivers, next) {
>>>> +            if (strcmp(name, d->name) == 0) {
>>>> +                return d;
>>>> +            }
>>>>          }
>>>> +    } else if (rv < 0) {
>>>> +        error_report_err(local_err);
>>>>      }
>>>> -
>>>>      return NULL;
>>>>  }
>>>>  
>>>
>>> Before: audio_module_load() reports to stderr, but the caller can't
>>
>> before: reports _some_ errors to stderr
> 
> Thanks for the reminder.
> 
>>> know.  So, error or no error, search the driver registry for the one we
>>> want.  Return it if found, else fail.
>>>
>>> After: if audio_module_load() fails, report to stderr or current
>>> monitor, and fail.  If it could find no module or loaded one, search the
>>> driver registry.  Return it if found, else fail.
>>>
>>> What if audio_module_load() fails, but a search for the driver succeeds?
>>> Before the patch, we succeed.  
>>
>> audio_module_load() is the only way that audio_drivers can be updated and the search would return a different result.
> 
> Not true.
> 
> @audio_driver gets built with audio_driver_register().  Audio drivers
> call it via type_init().  For instance:
> 
>     static void register_audio_none(void)
>     {
>         audio_driver_register(&no_audio_driver);
>     }
>     type_init(register_audio_none);
> 
> My build of qemu-system-x86_64 puts "none", "wav", "alsa", "oss", "pa",
> "sdl", and "spice" into @audio_driver without entering module_load().
> 
>> The previous code was just lazily running the same code twice to make it simpler for the programmer in those conditions.
>>
>> Afterwards, we fail.  Can this happen?
>>
>> No.
> 
> It can't, but not for the reason you claimed.  The error in my argument
> was a misreading of the patch: we *still* only call module_load() when
> the driver is not in @audio_driver.
> 
> I wish I was better at reading patches.  And, if I may be so frank, I
> wish you were better at identifying my errors.  Telling me I'm wrong
> when I actually am wrong is helpful (thanks!), but the way you told me
> this time made me waste time chasing phantoms.
> 
> [...]
> 

Hi Markus,

sorry I missed this email from you, I am just back from sick leave.

The latest is v9 at:

https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg05092.html

And it's fully reviewed from my perspective, anything else that needs to be done to make this series proceed?

thanks,

Claudio


