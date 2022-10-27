Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5052560FAE7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 16:56:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo4F8-0007zA-97; Thu, 27 Oct 2022 10:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oo4F5-0007iV-OP
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:52:23 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oo4F1-0007Du-QB
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:52:22 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 32B461F8E5;
 Thu, 27 Oct 2022 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666882337; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w174bZYQZFxXmUGP78xeRD9rc/xEh0aoL12hlN/u5tI=;
 b=ncMZtl9uhDZgA7b1uhHfN1XviPCDNQB9xZYy+Xr0X0lU8U29XeS1RIYWvFSCWbL4xWhNvw
 OUgHMVqOjtiq8xUkQj4N1qFt/+xC71xordTqKd6NSxD7UqfBG2BENc3W0b8QX9nuzuJMce
 eBbJJj2e0jHr5WxrccY5ylAVwDSQ0yE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666882337;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w174bZYQZFxXmUGP78xeRD9rc/xEh0aoL12hlN/u5tI=;
 b=uPMpRS6Vi2oydRSK8m9tbB/KJFqtmvSanPGlGAl1SGAMvPL0uqefTR064TO2FAEn4GN7Ma
 I68+YuDCKiN3CYBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DA786134CA;
 Thu, 27 Oct 2022 14:52:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id P9K9MyCbWmPhHgAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 27 Oct 2022 14:52:16 +0000
Message-ID: <b68f4730-be61-b635-057e-270f3f74f63b@suse.de>
Date: Thu, 27 Oct 2022 16:52:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v9 0/5] improve error handling for module load
Content-Language: en-US
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220929093035.4231-1-cfontana@suse.de>
 <3568bac0-1b64-d096-b78a-29f628a70448@suse.de>
In-Reply-To: <3568bac0-1b64-d096-b78a-29f628a70448@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

A ping on this one, is there anything more that needs to be urgently addressed before it can be queued for inclusion?
This is currently creating problems for upstream kubevirt, due to the error handling not properly reporting permissions errors on module file access.

Thanks,

Claudio

On 10/21/22 10:24, Claudio Fontana wrote:
> ping, can this series move on?
> 
> Thanks,
> 
> Claudio
> 
> 
> On 9/29/22 11:30, Claudio Fontana wrote:
>> CHANGELOG:
>>
>> v8 -> v9:
>>
>> * add Signed-off-by tag for Kevin's commit
>> * fully reviewed, added tags.
>>
>> v7 -> v8:
>>
>> * fix a problem in module_load, where the module_name in v7 was mistakenly freed
>>   via g_free() also in the success code path, and instead module_name memory
>>   is owned by g_hash_table afer g_hash_table_add.
>>
>> * add more text to the commit message to indicate areas of further improvements,
>>   and more details about changes.
>>
>> * in PATCH 5/5, change the commit message to align with the change in v7,
>>   ie, we exit(), we do not abort().
>>
>> v6 -> v7:
>>
>> * changed instances of abort() to exit(1), for the CONFIG_MODULES case (Philippe).
>>
>> * dmg: do not use a separate local error, use the existing errp (Kevin)
>>
>> * block: do not use a separate local error, use the existing errp for
>>   bdrv_find_protocol (Markus)
>>
>> v5 -> v6:
>>
>> * added a patch by Kevin to handle the dmg warning about missing
>>   decompression submodules. (Kevin)
>>
>> * added more verbose comments about all the affected callers of module_load
>>   and module_load_qom (Markus)
>>
>> (OPEN ISSUE): change abort() to exit() when type not present even after loading module?
>>
>> (Philippe)
>>
>> v4 -> v5:
>>
>> * added a patch to rename module_load_one and friends to module_load
>>
>> * qdev_new: just reuse module_object_class_by_name, to avoid duplicating code
>>
>> * changed return value of module_load to an int:
>>   -1 error (Error **errp set).
>>    0 module or dependencies not installed,
>>    1 loaded
>>    2 already loaded (or built-in)
>>
>>    Adapted all callers.
>>
>> * module_load: fixed some pre-existing memory leaks, used an out: label
>>   to do the cleanup.
>>
>> v3 -> v4: (Richard)
>>
>> * module_object_class_by_name: return NULL immediately on load error.
>> * audio_driver_lookup: same.
>> * bdrv_find_format: same.
>>
>> * dmg_open: handle optional compression submodules better: f.e.,
>>   if "dmg-bz2" is not present, continue but offer a warning.
>>   If "dmg-bz2" load fails with error, error out and return.
>>
>> * module_load_dso: add newline to error_append_hint.
>>
>> v2 -> v3:
>>
>> * take the file existence check outside of module_load_file,
>>   rename module_load_file to module_load_dso, will be called only on
>>   an existing file. This will simplify the return value. (Richard)
>>
>> * move exported function documentation into header files (Richard)
>>
>> v1 -> v2:
>>
>> * do not treat the display help text any differently and do report
>>   module load _errors_. If the module does not exist (ENOENT, ENOTDIR),
>>   no error will be produced.
>>
>> DESCRIPTION:
>>
>> while investigating a permission issue in accel, where accel-tcg-x86_64.so
>> was not accessible, I noticed that no errors were produced regarding the
>> module load failure.
>>
>> This series attempts to improve module_load_one and module_load_qom_one
>> to handle the error cases better and produce some errors.
>>
>> Patch 1 is already reviewed and is about removing an unused existing
>> argument "mayfail" from the call stack.
>>
>> Patch 2 is the real meat, and that one I would say is RFC.
>> Will follow up with comments on the specific questions I have.
>>
>> Patch 3 finally adds a simple check in accel/, aborting if a module
>> is not found, but relying on the existing error report from
>> module_load_qom_one.
>>
>> Claudio Fontana (4):
>>   module: removed unused function argument "mayfail"
>>   module: rename module_load_one to module_load
>>   module: add Error arguments to module_load and module_load_qom
>>   accel: abort if we fail to load the accelerator plugin
>>
>> Kevin Wolf (1):
>>   dmg: warn when opening dmg images containing blocks of unknown type
>>
>>  accel/accel-softmmu.c |   8 +-
>>  audio/audio.c         |  16 ++--
>>  block.c               |  20 +++-
>>  block/dmg.c           |  33 ++++++-
>>  hw/core/qdev.c        |  17 +++-
>>  include/qemu/module.h |  37 +++++++-
>>  qom/object.c          |  18 +++-
>>  softmmu/qtest.c       |   8 +-
>>  ui/console.c          |  18 +++-
>>  util/module.c         | 211 +++++++++++++++++++++++-------------------
>>  10 files changed, 260 insertions(+), 126 deletions(-)
>>
> 
> 


