Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E78205E5B21
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 08:12:18 +0200 (CEST)
Received: from localhost ([::1]:58922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obFRW-00063X-OH
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 02:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obFNb-0004Lz-L9
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 02:08:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obFNI-0002ji-Ra
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 02:08:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663826871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=db+rBY+Xdv2LJg4JQCLshv3Hykx5hB4UrRLZaa+miwo=;
 b=W1qHYGA4JoE/+oyacqDjeKIDota+54Lou9heZvyP/GgxxmPEI2+/e9EADZK4y/xo+nijlr
 6CYQNS6S0kezbSvQyXU/wgcJNN7vu+U7bbUsvTOc8M9hhCuorUlvSjI9JTwSnl+ZUWKeuR
 WL1KoRrkgkEj/0HyAkSM4ewzCCCf9RM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-svlM7xrWP0-ki_hJTcb2hA-1; Thu, 22 Sep 2022 02:07:47 -0400
X-MC-Unique: svlM7xrWP0-ki_hJTcb2hA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C16B1185A78B;
 Thu, 22 Sep 2022 06:07:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61F19C15BB2;
 Thu, 22 Sep 2022 06:07:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7119921E6900; Thu, 22 Sep 2022 08:07:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,  qemu-devel@nongnu.org,
 dinechin@redhat.com,  Gerd Hoffmann <kraxel@redhat.com>,  =?utf-8?Q?Marc?=
 =?utf-8?Q?-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>,  Daniel =?utf-8?Q?P=2EBerrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one
 and module_load_qom_one
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de>
 <877d23ekj0.fsf@pond.sub.org>
 <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
 <87y1ucdirx.fsf@pond.sub.org>
 <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
Date: Thu, 22 Sep 2022 08:07:43 +0200
In-Reply-To: <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de> (Claudio Fontana's
 message of "Wed, 21 Sep 2022 18:03:05 +0200")
Message-ID: <878rmc54cw.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

> On 9/21/22 14:16, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>=20
>>> On 16/9/22 11:27, Markus Armbruster wrote:
>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>
>>>>> improve error handling during module load, by changing:
>>>>>
>>>>> bool module_load_one(const char *prefix, const char *lib_name);
>>>>> void module_load_qom_one(const char *type);
>>>>>
>>>>> to:
>>>>>
>>>>> bool module_load_one(const char *prefix, const char *name, Error **er=
rp);
>>>>> bool module_load_qom_one(const char *type, Error **errp);
>>>>>
>>>>> module_load_qom_one has been introduced in:
>>>>>
>>>>> commit 28457744c345 ("module: qom module support"), which built on to=
p of
>>>>> module_load_one, but discarded the bool return value. Restore it.
>>>>>
>>>>> Adapt all callers to emit errors, or ignore them, or fail hard,
>>>>> as appropriate in each context.
>>>>
>>>> How exactly does behavior change?  The commit message is mum on the
>>>> behavior before the patch, and vague on the behavior afterwards.
>>>>
>>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>>> ---
>>>>>   audio/audio.c         |   9 ++-
>>>>>   block.c               |  15 ++++-
>>>>>   block/dmg.c           |  18 +++++-
>>>>>   hw/core/qdev.c        |  10 ++-
>>>>>   include/qemu/module.h |  38 ++++++++++--
>>>>>   qom/object.c          |  18 +++++-
>>>>>   softmmu/qtest.c       |   6 +-
>>>>>   ui/console.c          |  18 +++++-
>>>>>   util/module.c         | 140 ++++++++++++++++++++++++---------------=
---
>>>>>   9 files changed, 194 insertions(+), 78 deletions(-)
>>>
>>>>> diff --git a/include/qemu/module.h b/include/qemu/module.h
>>>>> index 8c012bbe03..78d4c4de96 100644
>>>>> --- a/include/qemu/module.h
>>>>> +++ b/include/qemu/module.h
>>>>> @@ -61,16 +61,44 @@ typedef enum {
>>>
>>>>>=20=20=20
>>>>>   void module_call_init(module_init_type type);
>>>>> -bool module_load_one(const char *prefix, const char *lib_name);
>>>>> -void module_load_qom_one(const char *type);
>>>>> +
>>>>> +/*
>>>>> + * module_load_one: attempt to load a module from a set of directori=
es
>>>>> + *
>>>>> + * directories searched are:
>>>>> + * - getenv("QEMU_MODULE_DIR")
>>>>> + * - get_relocated_path(CONFIG_QEMU_MODDIR);
>>>>> + * - /var/run/qemu/${version_dir}
>>>>> + *
>>>>> + * prefix:         a subsystem prefix, or the empty string ("audio-"=
, ..., "")
>>>>> + * name:           name of the module
>>>>> + * errp:           error to set in case the module is found, but loa=
d failed.
>>>>> + *
>>>>> + * Return value:   true on success (found and loaded);
>>>>> + *                 if module if found, but load failed, errp will be=
 set.
>>>>> + *                 if module is not found, errp will not be set.
>>>>
>>>> I understand you need to distingush two failure modes "found, but load
>>>> failed" and "not found".
>>>>
>>>> Functions that set an error on some failures only tend to be awkward: =
in
>>>> addition to checking the return value for failure, you have to check
>>>> @errp for special failures.  This is particularly cumbersome when it
>>>> requires a @local_err and an error_propagate() just for that.  I
>>>> generally prefer to return an error code and always set an error.
>>>
>>> I notice the same issue, therefore would suggest this alternative
>>> prototype:
>>>
>>>    bool module_load_one(const char *prefix, const char *name,=20
>>>              bool ignore_if_missing, Error **errp);
>>> which always sets *errp when returning false:
>>>
>>>   * Return value:   if ignore_if_missing is true:
>>>   *                   true on success (found or missing), false on
>>>   *                   load failure.
>>>   *                 if ignore_if_missing is false:
>>>   *                   true on success (found and loaded); false if
>>>   *                   not found or load failed.
>>>   *                 errp will be set if the returned value is false.
>>>   */
>>=20
>> I think this interface is less surprising.
>>=20
>> If having to pass a flag turns out to to be a legibility issue, we can
>> have wrapper functions.
>>=20
>
> To me it seems even more confusing tbh. Do we have more ideas? Richard?
>
> bool module_load_one(const char *prefix, const char *name, Error **errp);
>
> In my mind we should really say,
>
> RETURN VALUE: a bool with the meaning: "was a module loaded? true/false"
>
> ERROR: The Error parameter tells us: "was there an error loading the modu=
le?"
>
> Makes sense to me, but maybe someone has a better one.
>
> Btw, as an aside, for the general Error API pattern, if the bool return v=
alue and Error !=3D NULL should be always related 1:1,
> It would have been better to design it with only one of those informing a=
bout the error (Error, as it carries the additional Error information, besi=
des the information that Error !=3D NULL),
> and remove the extra degree of freedom for a return value that at this po=
int (in the current code) carries ZERO additional useful information.
>
> We could have designed the API to use the return value as... an actual re=
turn value for solving the domain problem at hand,
> and use only the Error parameter for the error path.

We did in the beginning, although only tacitly.  A deviation from
Error's inspiration GError (we rolled our own because we didn't use GLib
back then).

This deviation turned out to make Error cumbersome to use.  Which then
bred inconsistent usage, which led to confusion about how it should be
used, which complicated review, which finally made me bite the bullet
and correct the mistake:

 * - Whenever practical, also return a value that indicates success /
 *   failure.  This can make the error checking more concise, and can
 *   avoid useless error object creation and destruction.  Note that
 *   we still have many functions returning void.  We recommend
 *   =E2=80=A2 bool-valued functions return true on success / false on fail=
ure,
 *   =E2=80=A2 pointer-valued functions return non-null / null pointer, and
 *   =E2=80=A2 integer-valued functions return non-negative / negative.

This part of error.h's big comment goes back to

commit e3fe3988d7851cac30abffae06d2f555ff7bee62
Author: Markus Armbruster <armbru@redhat.com>
Date:   Tue Jul 7 18:05:31 2020 +0200

    error: Document Error API usage rules
=20=20=20=20
    This merely codifies existing practice, with one exception: the rule
    advising against returning void, where existing practice is mixed.
=20=20=20=20
    When the Error API was created, we adopted the (unwritten) rule to
    return void when the function returns no useful value on success,
    unlike GError, which recommends to return true on success and false on
    error then.
=20=20=20=20
    When a function returns a distinct error value, say false, a checked
    call that passes the error up looks like
=20=20=20=20
        if (!frobnicate(..., errp)) {
            handle the error...
        }
=20=20=20=20
    When it returns void, we need
=20=20=20=20
        Error *err =3D NULL;
=20=20=20=20
        frobnicate(..., &err);
        if (err) {
            handle the error...
            error_propagate(errp, err);
        }
=20=20=20=20
    Not only is this more verbose, it also creates an Error object even
    when @errp is null, &error_abort or &error_fatal.

Note: same issue when it returns something without a recognizable error
value.
=20=20=20=20
    People got tired of the additional boilerplate, and started to ignore
    the unwritten rule.  The result is confusion among developers about
    the preferred usage.
=20=20=20=20
    Make the rule advising against returning void official by putting it
    in writing.  This will hopefully reduce confusion.
=20=20=20=20
    Update the examples accordingly.
=20=20=20=20
    The remainder of this series will update a substantial amount of code
    to honor the rule.
=20=20=20=20
    Signed-off-by: Markus Armbruster <armbru@redhat.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>
    Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
    Reviewed-by: Greg Kurz <groug@kaod.org>
    Message-Id: <20200707160613.848843-4-armbru@redhat.com>
    [Tweak prose as per advice from Eric]

Please note "whenever practical".  Deviating from the rule is okay when
sticking to the rule is not practical.  In other words, judgement call.

When something is used a lot, consistency matters, because it reduces
cognitive load.  The assumption "this works just like it does all over
the place" is fair, so it better be correct.

Ease of use matters, too.  When sticking to the rule leads to awkward
code, we should stop and think.  Should we deviate from the rule?  Or
can we avoid that by tweaking the interface?

Philippe's proposed interface sticks to the rule.

Another interface that does: return -1 for error, 0 for module not found
(no error), and 1 for loaded.

I think I'd prefer Philippe's.

> Ie the API standard pattern could have been, instead of bool function(Err=
or **),
>
> return_value_type_t function_that_can_fail(function_arguments, ..., Error=
 **errp);
>
> and then leave both return_value_type_t and the function_arguments for th=
e normal function operation.
>
> rv =3D function_that_can_fail(errp);
> if (errp !=3D NULL) {
>     /* handle the error */

This is wrong.  You need to test *errp.

Which is also wrong.  You need ERRP_GUARD().  error.h's big comment
again:

 * Call a function, receive an error from it, and pass it to the caller
 * - when the function returns a value that indicates failure, say
 *   false:
 *     if (!foo(arg, errp)) {
 *         handle the error...
 *     }
 * - when it does not, say because it is a void function:
 *     ERRP_GUARD();
 *     foo(arg, errp);
 *     if (*errp) {
 *         handle the error...
 *     }
 * More on ERRP_GUARD() below.
 *
 * Code predating ERRP_GUARD() still exists, and looks like this:
 *     Error *err =3D NULL;
 *     foo(arg, &err);
 *     if (err) {
 *         handle the error...
 *         error_propagate(errp, err); // deprecated
 *     }
 * Avoid in new code.  Do *not* "optimize" it to
 *     foo(arg, errp);
 *     if (*errp) { // WRONG!
 *         handle the error...
 *     }
 * because errp may be NULL without the ERRP_GUARD() guard.
 *
 * But when all you do with the error is pass it on, please use
 *     foo(arg, errp);
 * for readability.
[...]
 * =3D Why, when and how to use ERRP_GUARD() =3D
 *
 * Without ERRP_GUARD(), use of the @errp parameter is restricted:
 * - It must not be dereferenced, because it may be null.
 * - It should not be passed to error_prepend() or
 *   error_append_hint(), because that doesn't work with &error_fatal.
 * ERRP_GUARD() lifts these restrictions.
 *
 * To use ERRP_GUARD(), add it right at the beginning of the function.
 * @errp can then be used without worrying about the argument being
 * NULL or &error_fatal.
 *
 * Using it when it's not needed is safe, but please avoid cluttering
 * the source with useless code.

> }
> if (rv > 7) {
>     /* handle the return value */
> }
>
> Would it not be better to handle the Error path and the normal return val=
ue separately?
>
> With this pattern in mind, this specific case would then not be surprisin=
g to anyone,
> and we would not have to start cooking up booleans to start passing to ea=
ch function to say how errors should be treated,
> as nobody would expect the bool returned to mean anything related with th=
e Error path.
>
> But this again would be rethinking the whole Error API.

Tall order.

> We should in any case do the right thing in this specific case, and this =
specific case (handling module load errors vs modules not installed),
> is not served well by the current code, whether it went through this atte=
ntive abstract principles scrutiny or not (seems not to me).

Loadable modules look grafted on, and the error handling seems quite
bad.


