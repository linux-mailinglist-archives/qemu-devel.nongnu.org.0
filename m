Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C381D5BFEAA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 15:09:55 +0200 (CEST)
Received: from localhost ([::1]:40128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oazUA-0000n4-Vr
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 09:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oayex-0007Al-Kx
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:17:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oayeu-0007kc-Mh
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663762615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJ3Z1YQLSEGdZ9kuLUWyo/z09yR5hOZyFyExF2k2CbQ=;
 b=KLZw8yZccKc7L5w7o4WrNh1m8VQS4wXD83zBBhUQUqEZ67TQwjdvZCifyLzIvs5oLJiDgz
 p/oB936tOJSHucz3duJa9fvfQcgMt6yhtdc1yHEUZxQD4izqUvr2sxu9R9gxkLRbzVMxRK
 2sL8AdFc4sar/DrsfzJtL3DXZI7D7js=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-HzAgIEiNMDOu0ImCci-YCA-1; Wed, 21 Sep 2022 08:16:52 -0400
X-MC-Unique: HzAgIEiNMDOu0ImCci-YCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 499BB833948;
 Wed, 21 Sep 2022 12:16:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3C3D140EBF3;
 Wed, 21 Sep 2022 12:16:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C61C321E6900; Wed, 21 Sep 2022 14:16:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Claudio Fontana <cfontana@suse.de>,  Paolo Bonzini
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
Date: Wed, 21 Sep 2022 14:16:50 +0200
In-Reply-To: <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 19 Sep 2022 12:18:16
 +0200")
Message-ID: <87y1ucdirx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 16/9/22 11:27, Markus Armbruster wrote:
>> Claudio Fontana <cfontana@suse.de> writes:
>>=20
>>> improve error handling during module load, by changing:
>>>
>>> bool module_load_one(const char *prefix, const char *lib_name);
>>> void module_load_qom_one(const char *type);
>>>
>>> to:
>>>
>>> bool module_load_one(const char *prefix, const char *name, Error **errp=
);
>>> bool module_load_qom_one(const char *type, Error **errp);
>>>
>>> module_load_qom_one has been introduced in:
>>>
>>> commit 28457744c345 ("module: qom module support"), which built on top =
of
>>> module_load_one, but discarded the bool return value. Restore it.
>>>
>>> Adapt all callers to emit errors, or ignore them, or fail hard,
>>> as appropriate in each context.
>>=20
>> How exactly does behavior change?  The commit message is mum on the
>> behavior before the patch, and vague on the behavior afterwards.
>>=20
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> ---
>>>   audio/audio.c         |   9 ++-
>>>   block.c               |  15 ++++-
>>>   block/dmg.c           |  18 +++++-
>>>   hw/core/qdev.c        |  10 ++-
>>>   include/qemu/module.h |  38 ++++++++++--
>>>   qom/object.c          |  18 +++++-
>>>   softmmu/qtest.c       |   6 +-
>>>   ui/console.c          |  18 +++++-
>>>   util/module.c         | 140 ++++++++++++++++++++++++------------------
>>>   9 files changed, 194 insertions(+), 78 deletions(-)
>
>>> diff --git a/include/qemu/module.h b/include/qemu/module.h
>>> index 8c012bbe03..78d4c4de96 100644
>>> --- a/include/qemu/module.h
>>> +++ b/include/qemu/module.h
>>> @@ -61,16 +61,44 @@ typedef enum {
>
>>>=20=20=20
>>>   void module_call_init(module_init_type type);
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
>>> + * prefix:         a subsystem prefix, or the empty string ("audio-", =
..., "")
>>> + * name:           name of the module
>>> + * errp:           error to set in case the module is found, but load =
failed.
>>> + *
>>> + * Return value:   true on success (found and loaded);
>>> + *                 if module if found, but load failed, errp will be s=
et.
>>> + *                 if module is not found, errp will not be set.
>>=20
>> I understand you need to distingush two failure modes "found, but load
>> failed" and "not found".
>>=20
>> Functions that set an error on some failures only tend to be awkward: in
>> addition to checking the return value for failure, you have to check
>> @errp for special failures.  This is particularly cumbersome when it
>> requires a @local_err and an error_propagate() just for that.  I
>> generally prefer to return an error code and always set an error.
>
> I notice the same issue, therefore would suggest this alternative
> prototype:
>
>    bool module_load_one(const char *prefix, const char *name,=20
>              bool ignore_if_missing, Error **errp);
> which always sets *errp when returning false:
>
>   * Return value:   if ignore_if_missing is true:
>   *                   true on success (found or missing), false on
>   *                   load failure.
>   *                 if ignore_if_missing is false:
>   *                   true on success (found and loaded); false if
>   *                   not found or load failed.
>   *                 errp will be set if the returned value is false.
>   */

I think this interface is less surprising.

If having to pass a flag turns out to to be a legibility issue, we can
have wrapper functions.


