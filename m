Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29165BAF69
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 16:31:41 +0200 (CEST)
Received: from localhost ([::1]:59194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZCNY-0004yZ-Vi
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 10:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oZCIr-0008Ay-Sn
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 10:26:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oZCIn-00070T-67
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 10:26:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663338404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hAB/moGl/OPk1syu6cgRiXSjPnMO5xSM2KClpc0hIoA=;
 b=jRenrik81A1D5SaLu0T1On5wcbMlN688/w/BZPGPPBvqy8di3gUQ0G8wYqe3VLvXsvsLbe
 33BfulafjhbDX7CEEKfTzlHw6rR/iw4rkluzYarrXzyRXU0DBgyZl/6/f3ERZUIQJ741dg
 IbMih9P1XP/RQV4iAfYtAz+9lJf0FOg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-Sz-scRhYPOywpvWIMu8uxQ-1; Fri, 16 Sep 2022 10:26:40 -0400
X-MC-Unique: Sz-scRhYPOywpvWIMu8uxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 500BF185A7AA;
 Fri, 16 Sep 2022 14:26:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B93D51121314;
 Fri, 16 Sep 2022 14:26:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4685121E6900; Fri, 16 Sep 2022 16:26:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Markus Armbruster <armbru@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,  qemu-devel@nongnu.org,
 dinechin@redhat.com,  Gerd Hoffmann <kraxel@redhat.com>,  =?utf-8?Q?Marc?=
 =?utf-8?Q?-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>,  Daniel =?utf-8?Q?P=2EBerrang=C3=A9?=
 <berrange@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one
 and module_load_qom_one
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de>
 <877d23ekj0.fsf@pond.sub.org>
 <bc88027a-41bb-aef4-fd64-fcc367bf179d@suse.de>
Date: Fri, 16 Sep 2022 16:26:34 +0200
In-Reply-To: <bc88027a-41bb-aef4-fd64-fcc367bf179d@suse.de> (Claudio Fontana's
 message of "Fri, 16 Sep 2022 12:48:44 +0200")
Message-ID: <87illnbdk5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

> On 9/16/22 11:27, Markus Armbruster wrote:
>> Claudio Fontana <cfontana@suse.de> writes:
>> 
>>> improve error handling during module load, by changing:
>>>
>>> bool module_load_one(const char *prefix, const char *lib_name);
>>> void module_load_qom_one(const char *type);
>>>
>>> to:
>>>
>>> bool module_load_one(const char *prefix, const char *name, Error **errp);
>>> bool module_load_qom_one(const char *type, Error **errp);
>>>
>>> module_load_qom_one has been introduced in:
>>>
>>> commit 28457744c345 ("module: qom module support"), which built on top of
>>> module_load_one, but discarded the bool return value. Restore it.
>>>
>>> Adapt all callers to emit errors, or ignore them, or fail hard,
>>> as appropriate in each context.
>> 
>> How exactly does behavior change?  The commit message is mum on the
>> behavior before the patch, and vague on the behavior afterwards.
>
> The current behavior is difficult to describe as it is basically devoid of any error handling for QOM modules.
> What error handling facilities were potentially available before were rendered moot by commit 28457744c345.

*Sigh*

> the behavior changes in this way:
>
> audio: when attempting to load an audio module, now actually report module load errors.
> Previous behavior: say nothing, and leave it to the user to figure out what is wrong by failures later on during execution.
>
> block: when attempting to load a block module, now actually report module load errors.
> Previous behavior: say nothing, and leave it to the user to figure out what is wrong by failures later on during execution.
>
> block/dmg: specifically for the dmg module, which contains submodules dmg-bz2 and dmg-lzfse, now also warn that if the submodules are not present, the corresponding decompression will not be available.
> Previous behavior: say nothing, and leave it to the user to figure out what is wrong by failures later on during execution.
>
> qdev: when creating a new qdev Device object (DeviceState), actually report module load errors. If a module cannot be loaded to create that device, abort execution as intended.
> QEMU users of qdev assume that qdev_new() returns non-NULL. There is a separate qdev_try_new() function whose only difference from qdev_new() is that it can return NULL rather than asserting.
> (see include/hw/qdev-core.h :: qdev_try_new)
>
> Previous behavior: say nothing, and leave it to the user to figure out what is wrong by failures later on during execution (likely, just segfault).
>
> qom/object.c : when initializing a QOM object, actually report module load errors.
> Previous behavior: say nothing, and leave it to the user to figure out what is wrong by failures later on during execution.
>
> qom/object.c : when looking up an ObjectClass by name (module_object_class_by_name), actually report module load errors.
> Previous behavior: say nothing, and leave it to the user to figure out what is wrong by failures later on during execution.
>
> qtest: when processing the "module_load" qtest command, if there is an actual error in the load of the module, report it in addition to sending a "FAIL" response.
>
> console: when attempting to load a display module, now actually report module load errors.
> Previous behavior: say nothing, and leave it to the user to figure out what is wrong by failures later on during execution.
>
> util/module: provide a boolean return value and an Error parameter to module_load_qom_one and provide an Error parameter to module_load_one what was missing it.
> Report an error using the Error facilities when module is present, but fails to be loaded due to an error occurring.
> Also report an error if multiple modules are loadable and try to provide the same type.
>
> Previous behavior:
> difficult to describe, a really confused implementation.
>
> The module_load_file part of the code seemed to assume being called separately, and was checking the caller arguments as though it would be a self-contained API,
> rechecking the suffix of the string for a valid ".so" (CONFIG_HOST_DSOSUF), when it is called that way explicitly and only by module_load_one as a static function.
>
> It was printing an error with fprintf specifically only in the case where g_module_open failed, and never for any other error condition.
> It only printed this error if the boolean "mayfail" was set to false, but the argument was always passed as false, in all execution paths.
> It was not reporting any error if multiple modules are present all providing the same type.

What a mess.

> Let me know if you have further questions, what I described is a summary of all the changes contained. I can add to the commit message if necessary.

Yes, please.

>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> ---
>>>  audio/audio.c         |   9 ++-
>>>  block.c               |  15 ++++-
>>>  block/dmg.c           |  18 +++++-
>>>  hw/core/qdev.c        |  10 ++-
>>>  include/qemu/module.h |  38 ++++++++++--
>>>  qom/object.c          |  18 +++++-
>>>  softmmu/qtest.c       |   6 +-
>>>  ui/console.c          |  18 +++++-
>>>  util/module.c         | 140 ++++++++++++++++++++++++------------------
>>>  9 files changed, 194 insertions(+), 78 deletions(-)
>>>
>>> diff --git a/audio/audio.c b/audio/audio.c
>>> index 76b8735b44..cff7464c07 100644
>>> --- a/audio/audio.c
>>> +++ b/audio/audio.c
>>> @@ -72,6 +72,7 @@ void audio_driver_register(audio_driver *drv)
>>>  audio_driver *audio_driver_lookup(const char *name)
>>>  {
>>>      struct audio_driver *d;
>>> +    Error *local_err = NULL;
>>>  
>>>      QLIST_FOREACH(d, &audio_drivers, next) {
>>>          if (strcmp(name, d->name) == 0) {
>>> @@ -79,7 +80,13 @@ audio_driver *audio_driver_lookup(const char *name)
>>>          }
>>>      }
>>>  
>>> -    audio_module_load_one(name);
>>> +    if (!audio_module_load_one(name, &local_err)) {
>>> +        if (local_err) {
>>> +            error_report_err(local_err);
>>> +        }
>>> +        return NULL;
>>> +    }
>>> +
>>>      QLIST_FOREACH(d, &audio_drivers, next) {
>>>          if (strcmp(name, d->name) == 0) {
>>>              return d;
>>> diff --git a/block.c b/block.c
>>> index bc85f46eed..8b610c6d95 100644
>>> --- a/block.c
>>> +++ b/block.c
>>> @@ -464,7 +464,14 @@ BlockDriver *bdrv_find_format(const char *format_name)
>>>      /* The driver isn't registered, maybe we need to load a module */
>>>      for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
>>>          if (!strcmp(block_driver_modules[i].format_name, format_name)) {
>>> -            block_module_load_one(block_driver_modules[i].library_name);
>>> +            Error *local_err = NULL;
>>> +            if (!block_module_load_one(block_driver_modules[i].library_name,
>>> +                                       &local_err)) {
>>> +                if (local_err) {
>>> +                    error_report_err(local_err);
>>> +                }
>>> +                return NULL;
>>> +            }
>>>              break;
>>>          }
>>>      }
>> 
>> Before the patch, bdrv_find_format() fails silently[*].
>> 
>> Afterwards, it reports an error on some failures, but not on others.
>> Sure this is what we want?
>
> Yes, I am sure. It only reports an error if an error exists.
> When a module is not present, no error should be printed in this context.

Callers commonly look like this (this one is in bdrv_fill_options()):

        drv = bdrv_find_format(drvname);
        if (!drv) {
            error_setg(errp, "Unknown driver '%s'", drvname);
            return -ENOENT;
        }

where @errp is a parameter.

The patch changes bdrv_find_format() to report some failures with
error_report_err().  This is effectively the same anti-pattern I pointed
out below, starting with "Uh-oh": use of error_report() or equivalent
within a function with an Error ** parameter.

If the "Unknown driver" Error object is ultimately passed to
error_report_err(), we report two errors if module loading fails, else
one.

Emitting two error messages for the same problem, a useful one and a
useless one, is bad UI, but it's arguably still better than just a
useless one.

But what if a caller wants to handle errors without reporting them?
This is a legitimate use of the Error API.  No go, we spam stderr
regardless.

What if a caller wants to report the error in some other way, say write
it to a log file?  No go, we still spam stderr.

The patch breaks on of the Error API's design maxims.  error.h's big
comment:

 * - Separation of concerns: the function is responsible for detecting
 *   errors and failing cleanly; handling the error is its caller's
 *   job.  [...]

The patch changes bdrv_find_options() to no longer satisfy this rule: it
doesn't leave handling entirely to the caller anymore.

You might argue that no existing caller does such things.  Fine.  Then
I'll ask you to document that bdrv_fill_options() may only be used in
certain ways, unlike other functions using the Error API.  Same for all
the other affected functions.  And then Kevin will probably NAK the
whole thing :)

>>> @@ -976,7 +983,11 @@ BlockDriver *bdrv_find_protocol(const char *filename,
>>>      for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
>>>          if (block_driver_modules[i].protocol_name &&
>>>              !strcmp(block_driver_modules[i].protocol_name, protocol)) {
>>> -            block_module_load_one(block_driver_modules[i].library_name);
>>> +            Error *local_err = NULL;
>>> +            if (!block_module_load_one(block_driver_modules[i].library_name,
>>> +                                       &local_err) && local_err) {
>> 
>> Break the line before && local_err, please, like you do elsewhere.
>
> This is to avoid hitting the 80 chars on one line, as warned by checkpatch. Should I disregard checkpatch, is it not used anymore?

Elsewhere, you format like this:

                 if (!block_module_load_one(block_driver_modules[i].library_name,
                                            &local_err)
                     && local_err) {

Better, isn't it?

>
>> 
>>> +                error_report_err(local_err);
>>> +            }
>>>              break;
>>>          }
>>>      }
>> 
>> Uh-oh: error_report() or equivalent in a function with an Error **
>> parameter.  This is almost always wrong.  Shouldn't you pass the error
>> to the caller?
>
> I guess this is the "almost" case. No I should not pass anything back.
>
> The Error **errp parameter of bdrv_find_protocol, and the Error local_err parameter inside it are different errors.
>
> The first is about whether a protocol has been found or not.
> The second is about whether there was an error during the load of a module.
>
> No, local_err should not be passed back to the caller in my view. The error passed back to the caller is errp and is already set correctly.

Part of bdrv_find_protocol()'s (unstated) contract is "either succeed
and return non-null, or fail, return null, and set an error."

This is pretty much ubiquitous among Error-using functions.  error.h's
big comment:

 * - On success, the function should not touch *errp.  On failure, it
 *   should set a new error, e.g. with error_setg(errp, ...), or
 *   propagate an existing one, e.g. with error_propagate(errp, ...).

Note there is no third case "except on some failures, don't set an
error".

Of course, bdrv_find_protocol() might be an exception, i.e. I still owe
you proof of my claim about its contract.  So let's examine callers:

* print_block_option_help() in qemu-img.c:

            proto_drv = bdrv_find_protocol(filename, true, &local_err);
            if (!proto_drv) {
                error_report_err(local_err);
                qemu_opts_free(create_opts);
                return 1;
            }

  If bdrv_find_protocol() returns null without setting @local_err,
  error_report_err() will crash.

  Two more instances elsewhere in qemu-img.c

* bdrv_create_file() in block.c:

        drv = bdrv_find_protocol(filename, true, errp);
        if (drv == NULL) {
            return -ENOENT;
        }

  If bdrv_find_protocol() returns null without setting @local_err, then
  bdrv_create_file() returns -ENOENT without setting an error.

  bdrv_create_file() is called by a bunch of BlockDriver
  .bdrv_co_create_opts() methods, e.g. raw_co_create_opts():

        return bdrv_create_file(filename, opts, errp);

  The method is called by bdrv_create_co_entry():

        ret = cco->drv->bdrv_co_create_opts(cco->drv,
                                            cco->filename, cco->opts, &local_err);
        error_propagate(&cco->err, local_err);
        cco->ret = ret;

       If bdrv_find_protocol() returns null without setting an error, then
       we set cco->ret = -ENOENT and cco->err = NULL.

       One of its users is bdrv_create():

        if (qemu_in_coroutine()) {
            /* Fast-path if already in coroutine context */
            bdrv_create_co_entry(&cco);
        } else {
            co = qemu_coroutine_create(bdrv_create_co_entry, &cco);
            qemu_coroutine_enter(co);
            while (cco.ret == NOT_DONE) {
                aio_poll(qemu_get_aio_context(), true);
            }
        }

        ret = cco.ret;
        if (ret < 0) {
            if (cco.err) {
                error_propagate(errp, cco.err);
            } else {
                error_setg_errno(errp, -ret, "Could not create image");
            }
        }

    out:
        g_free(cco.filename);
        return ret;

  If bdrv_find_protocol() returns null without setting an error, then
  bdrv_create() returns -ENOENT without setting an error.

  One of its callers is bdrv_append_temp_snapshot():

    ret = bdrv_create(&bdrv_qcow2, tmp_filename, opts, errp);
    qemu_opts_del(opts);
    if (ret < 0) {
        error_prepend(errp, "Could not create temporary overlay '%s': ",
                      tmp_filename);
        goto out;
    }

  Crash.

Adding failure modes that use @errp differently than existing ones is
playing with fire :)

>> Please check all uses of your FOO_load_one() for this issue.
>
> I have checked all instances multiple times. If there are issues please present them so I can address them.

I humbly suggest that instances in functions that set an error on
failures before this patch need re-checking.

>>> diff --git a/block/dmg.c b/block/dmg.c
>>> index 98db18d82a..11d184d39c 100644
>>> --- a/block/dmg.c
>>> +++ b/block/dmg.c
>>> @@ -434,6 +434,7 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>>>      uint64_t plist_xml_offset, plist_xml_length;
>>>      int64_t offset;
>>>      int ret;
>>> +    Error *local_err = NULL;
>>>  
>>>      ret = bdrv_apply_auto_read_only(bs, NULL, errp);
>>>      if (ret < 0) {
>>> @@ -446,8 +447,21 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>>>          return -EINVAL;
>>>      }
>>>  
>>> -    block_module_load_one("dmg-bz2");
>>> -    block_module_load_one("dmg-lzfse");
>>> +    if (!block_module_load_one("dmg-bz2", &local_err)) {
>>> +        if (local_err) {
>>> +            error_report_err(local_err);
>>> +            return -EINVAL;
>>> +        }
>>> +        warn_report("dmg-bz2 module not present, bz2 decomp unavailable");
>>> +    }
>>> +    local_err = NULL;
>>> +    if (!block_module_load_one("dmg-lzfse", &local_err)) {
>>> +        if (local_err) {
>>> +            error_report_err(local_err);
>>> +            return -EINVAL;
>>> +        }
>>> +        warn_report("dmg-lzfse module not present, lzfse decomp unavailable");
>>> +    }
>>>  
>>>      s->n_chunks = 0;
>>>      s->offsets = s->lengths = s->sectors = s->sectorcounts = NULL;
>>> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
>>> index 0806d8fcaa..5902c59c94 100644
>>> --- a/hw/core/qdev.c
>>> +++ b/hw/core/qdev.c
>>> @@ -148,7 +148,15 @@ bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp)
>>>  DeviceState *qdev_new(const char *name)
>>>  {
>>>      if (!object_class_by_name(name)) {
>>> -        module_load_qom_one(name);
>>> +        Error *local_err = NULL;
>>> +        if (!module_load_qom_one(name, &local_err)) {
>>> +            if (local_err) {
>>> +                error_report_err(local_err);
>>> +            } else {
>>> +                error_report("could not find a module for type '%s'", name);
>>> +            }
>>> +            abort();
>> 
>> Why is this a programming error?
>
> As described before in your request for previous/after, this is a programming error because qdev_new is not expected to fail.
> All QEMU users of qdev_new expect the API to return non-NULL and immediately use and dereference the pointer returned.
> There is a separate API, qdev_try_new, for creating a device and allowing a NULL return value.

Well, then the programming error is "adding loadable device modules
broke qdev_new()".

This is qdev_new() before commit 7ab6e7fcce "qdev: device module
support":

    DeviceState *qdev_new(const char *name)
    {
        return DEVICE(object_new(name));
    }

Precondition: @name is a valid device type name.  If it isn't, we fail
an assertion.

If you got a @name that may not be valid, you must use qdev_try_new()
instead:

    DeviceState *qdev_try_new(const char *name)
    {
        if (!object_class_by_name(name)) {
            return NULL;
        }

        return DEVICE(object_new(name));
    }

The guard ensures we call object_new() only when the precondition holds.

Except it doesn't: when @name is a valid type name, but not a *device*
type name, we still crash.  Bug.

Commit 7ab6e7fcce changed qdev_new() to

    DeviceState *qdev_new(const char *name)
    {
        if (!object_class_by_name(name)) {
            module_load_qom_one(name);
        }
        return DEVICE(object_new(name));
    }

Now the (enforced!) precondition is @name is a valid device type name
and the device is either compiled in or it will succeed to load.

"Will succeed to load" is an inappropriate precondition.

Devices compiled as modules must be instantiated with qdev_try_new().
Loadable module support should be dropped from qdev_new().

Not your patch's fault, of course.  By the way, welcome to the swamp!
Do not mind the crocodiles, they just want to play.

>>> +        }
>>>      }
>>>      return DEVICE(object_new(name));
>>>  }
>>> diff --git a/include/qemu/module.h b/include/qemu/module.h
>>> index 8c012bbe03..78d4c4de96 100644
>>> --- a/include/qemu/module.h
>>> +++ b/include/qemu/module.h
>>> @@ -61,16 +61,44 @@ typedef enum {
>>>  #define fuzz_target_init(function) module_init(function, \
>>>                                                 MODULE_INIT_FUZZ_TARGET)
>>>  #define migration_init(function) module_init(function, MODULE_INIT_MIGRATION)
>>> -#define block_module_load_one(lib) module_load_one("block-", lib)
>>> -#define ui_module_load_one(lib) module_load_one("ui-", lib)
>>> -#define audio_module_load_one(lib) module_load_one("audio-", lib)
>>> +#define block_module_load_one(lib, errp) module_load_one("block-", lib, errp)
>>> +#define ui_module_load_one(lib, errp) module_load_one("ui-", lib, errp)
>>> +#define audio_module_load_one(lib, errp) module_load_one("audio-", lib, errp)
>>>  
>>>  void register_module_init(void (*fn)(void), module_init_type type);
>>>  void register_dso_module_init(void (*fn)(void), module_init_type type);
>>>  
>>>  void module_call_init(module_init_type type);
>>> -bool module_load_one(const char *prefix, const char *lib_name);
>>> -void module_load_qom_one(const char *type);
>>> +
>>> +/*
>>> + * module_load_one: attempt to load a module from a set of directories
>>> + *
>>> + * directories searched are:
>>> + * - getenv("QEMU_MODULE_DIR")
>>> + * - get_relocated_path(CONFIG_QEMU_MODDIR);
>>> + * - /var/run/qemu/${version_dir}
>>> + *
>>> + * prefix:         a subsystem prefix, or the empty string ("audio-", ..., "")
>>> + * name:           name of the module
>>> + * errp:           error to set in case the module is found, but load failed.
>>> + *
>>> + * Return value:   true on success (found and loaded);
>>> + *                 if module if found, but load failed, errp will be set.
>>> + *                 if module is not found, errp will not be set.
>> 
>> I understand you need to distingush two failure modes "found, but load
>> failed" and "not found".
>
> That is correct.
>
>> 
>> Functions that set an error on some failures only tend to be awkward: in
>> addition to checking the return value for failure, you have to check
>> @errp for special failures.  This is particularly cumbersome when it
>> requires a @local_err and an error_propagate() just for that.  I
>> generally prefer to return an error code and always set an error.
>> 
>> That said, the patch doesn't look bad.  Perhaps it will be once the
>> issues I pointed out above have been addressed.  Let's not worry about
>> it right now.
>> 
>>> + */
>>> +bool module_load_one(const char *prefix, const char *name, Error **errp);
>>> +
>>> +/*
>>> + * module_load_qom_one: attempt to load a module to provide a QOM type
>>> + *
>>> + * type:           the type to be provided
>>> + * errp:           error to set.
>>> + *
>>> + * Return value:   true on success (found and loaded), false on failure.
>>> + *                 If a module is simply not found for the type,
>>> + *                 errp will not be set.
>>> + */
>>> +bool module_load_qom_one(const char *type, Error **errp);
>>>  void module_load_qom_all(void);
>>>  void module_allow_arch(const char *arch);
>>>  
>> 
>> [...]
>> 
>> 
>> [*] Except it prints "Module is not supported by system\n" to stderr
>> when !g_module_supported(), which doesn't look right to me.
>> 
> I don't know what this comment relates to.

It's a footnote attached to "Before the patch, bdrv_find_format() fails
silently[*]" above.


I think the root of the problems with this patch is that you convert the
FOO_module_load_one() functions to the Error API without propagating the
error far enough.  It really needs to go all the way up.


