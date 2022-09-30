Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BDF5F0B15
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 13:53:18 +0200 (CEST)
Received: from localhost ([::1]:47366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeEZw-0007i7-If
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 07:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oeEXu-0006Ay-8D
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 07:51:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oeEXn-0004Np-1B
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 07:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664538661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T2jwOlUfr7uRnJJmgb03JKq++0mGJviXPRIz11wLtfQ=;
 b=WB/LUA2y+rWB+XmcRjL1NPmHCuKJUXorstd3NMMPRoKnZcDjm++h8SpzkNwwmY7URGZfFm
 9yMqYIbPTQ50tjtV8C5vPmSwXwU7nHlfBpQ7T8EftlzNdDfcirLHm7knmLpyQse8khTuO/
 Cio4Cj2wLWQRax8uLfKrrAWZLR1+5k4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-E02QRjKWMzamlCaYvkUmfw-1; Fri, 30 Sep 2022 07:50:58 -0400
X-MC-Unique: E02QRjKWMzamlCaYvkUmfw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1279085A583;
 Fri, 30 Sep 2022 11:50:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D3542166B26;
 Fri, 30 Sep 2022 11:50:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4301721E691D; Fri, 30 Sep 2022 13:50:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org,  dinechin@redhat.com,  Gerd Hoffmann
 <kraxel@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Daniel =?utf-8?Q?P=2EBerrang=C3=A9?= <berrange@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v7 3/5] module: add Error arguments to module_load and
 module_load_qom
References: <20220927133825.32631-1-cfontana@suse.de>
 <20220927133825.32631-4-cfontana@suse.de>
 <87zgejybu4.fsf@pond.sub.org>
 <3487e03f-30dc-6545-4d24-cfee9ad15642@suse.de>
Date: Fri, 30 Sep 2022 13:50:55 +0200
In-Reply-To: <3487e03f-30dc-6545-4d24-cfee9ad15642@suse.de> (Claudio Fontana's
 message of "Wed, 28 Sep 2022 14:02:48 +0200")
Message-ID: <874jwpnkrk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Claudio Fontana <cfontana@suse.de> writes:

> On 9/28/22 13:31, Markus Armbruster wrote:
>> Claudio Fontana <cfontana@suse.de> writes:
>> 
>>> improve error handling during module load, by changing:
>>>
>>> bool module_load(const char *prefix, const char *lib_name);
>>> void module_load_qom(const char *type);
>>>
>>> to:
>>>
>>> int module_load(const char *prefix, const char *name, Error **errp);
>>> int module_load_qom(const char *type, Error **errp);
>>>
>>> where the return value is:
>>>
>>>  -1 on module load error, and errp is set with the error
>>>   0 on module or one of its dependencies are not installed
>>>   1 on module load success
>>>   2 on module load success (module already loaded or built-in)
>> 
>> Two changes, if I understand things correctly:
>> 
>> 1. Convert to Error API from fprintf(stderr, ...)
>> 
>> 2. Return a more useful value
>> 
>> Right?
>
> Yes.
>
>> 
>> Do you add any new errors here that weren't reported before?  Just
>
> Yes.

Thanks!

>> trying to calibrate my expectations before I dig into the actual patch.
>> 
>>> module_load_qom_one has been introduced in:
>>>
>>> commit 28457744c345 ("module: qom module support"), which built on top of
>>> module_load_one, but discarded the bool return value. Restore it.
>>>
>>> Adapt all callers to emit errors, or ignore them, or fail hard,
>>> as appropriate in each context.
>>>
>>> Some memory leaks also fixed as part of the module_load changes.

[...]

>>> audio: when attempting to load an audio module, report module load errors.
>>> block: when attempting to load a block module, report module load errors.
>>> console: when attempting to load a display module, report module load errors.
>>>
>>> qdev: when creating a new qdev Device object (DeviceState), report load errors.
>>>       If a module cannot be loaded to create that device, now abort execution.
>>>
>>> qom/object.c: when initializing a QOM object, or looking up class_by_name,
>>>               report module load errors.
>>>
>>> qtest: when processing the "module_load" qtest command, report errors
>>>        in the load of the module.
>> 
>> This looks like a list of behavioral changes.  Appreciated!  It's a bit
>> terse, though.  I might come back to this and suggest improvement.  But
>> first, I need to understand the patch.
>> 
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> ---
>>>  audio/audio.c         |  16 ++--
>>>  block.c               |  20 +++-
>>>  block/dmg.c           |  14 ++-
>>>  hw/core/qdev.c        |  17 +++-
>>>  include/qemu/module.h |  37 +++++++-
>>>  qom/object.c          |  18 +++-
>>>  softmmu/qtest.c       |   8 +-
>>>  ui/console.c          |  18 +++-
>>>  util/module.c         | 211 +++++++++++++++++++++++-------------------
>>>  9 files changed, 235 insertions(+), 124 deletions(-)
>>>
>>> diff --git a/audio/audio.c b/audio/audio.c
>>> index 0a682336a0..ea51793843 100644
>>> --- a/audio/audio.c
>>> +++ b/audio/audio.c
>>> @@ -72,20 +72,24 @@ void audio_driver_register(audio_driver *drv)
>>>  audio_driver *audio_driver_lookup(const char *name)
>>>  {
>>>      struct audio_driver *d;
>>> +    Error *local_err = NULL;
>>> +    int rv;
>>>  
>>>      QLIST_FOREACH(d, &audio_drivers, next) {
>>>          if (strcmp(name, d->name) == 0) {
>>>              return d;
>>>          }
>>>      }
>>> -
>>> -    audio_module_load(name);
>>> -    QLIST_FOREACH(d, &audio_drivers, next) {
>>> -        if (strcmp(name, d->name) == 0) {
>>> -            return d;
>>> +    rv = audio_module_load(name, &local_err);
>>> +    if (rv > 0) {
>>> +        QLIST_FOREACH(d, &audio_drivers, next) {
>>> +            if (strcmp(name, d->name) == 0) {
>>> +                return d;
>>> +            }
>>>          }
>>> +    } else if (rv < 0) {
>>> +        error_report_err(local_err);
>>>      }
>>> -
>>>      return NULL;
>>>  }
>>>  
>> 
>> Before: audio_module_load() reports to stderr, but the caller can't
>
> before: reports _some_ errors to stderr

Thanks for the reminder.

>> know.  So, error or no error, search the driver registry for the one we
>> want.  Return it if found, else fail.
>> 
>> After: if audio_module_load() fails, report to stderr or current
>> monitor, and fail.  If it could find no module or loaded one, search the
>> driver registry.  Return it if found, else fail.
>> 
>> What if audio_module_load() fails, but a search for the driver succeeds?
>> Before the patch, we succeed.  
>
> audio_module_load() is the only way that audio_drivers can be updated and the search would return a different result.

Not true.

@audio_driver gets built with audio_driver_register().  Audio drivers
call it via type_init().  For instance:

    static void register_audio_none(void)
    {
        audio_driver_register(&no_audio_driver);
    }
    type_init(register_audio_none);

My build of qemu-system-x86_64 puts "none", "wav", "alsa", "oss", "pa",
"sdl", and "spice" into @audio_driver without entering module_load().

> The previous code was just lazily running the same code twice to make it simpler for the programmer in those conditions.
>
> Afterwards, we fail.  Can this happen?
>
> No.

It can't, but not for the reason you claimed.  The error in my argument
was a misreading of the patch: we *still* only call module_load() when
the driver is not in @audio_driver.

I wish I was better at reading patches.  And, if I may be so frank, I
wish you were better at identifying my errors.  Telling me I'm wrong
when I actually am wrong is helpful (thanks!), but the way you told me
this time made me waste time chasing phantoms.

[...]


