Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8478F5EA846
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:21:45 +0200 (CEST)
Received: from localhost ([::1]:39572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocozQ-0000FN-Ld
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ocoZL-0006Sr-LA
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:54:47 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:38652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ocoZJ-0007vZ-Rf
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:54:47 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B5ED121DD9;
 Mon, 26 Sep 2022 13:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664200482; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z+Lt96mFxbMbfFnXjcNl1AUMLZ66tD2ALBbrEIS8lUI=;
 b=UUBgH5YEDlbI8GiDWtWM4/CkxVa3z2AGwy3vummhUyaC2Emb+KDp0wyC3stDQHpVuv1zdc
 FKGYw/VZBnmRNEn3MnGVLSqGE456TdKVJC776XpjdvSen3SRBT21xXIKXO7ekLaazOqIRh
 d9draZfKzLKiEDSAAEqjyAeR/W2sb/I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664200482;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z+Lt96mFxbMbfFnXjcNl1AUMLZ66tD2ALBbrEIS8lUI=;
 b=+o8sMVAlAfaYcSRd1ruzivRMB9OIJn/QRb/OiAHx/URYsYdFwYp0zArfnjI7vQtr10DFgc
 aXposBT7N5wxppAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 36246139BD;
 Mon, 26 Sep 2022 13:54:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rRXvCiKvMWNmegAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 26 Sep 2022 13:54:42 +0000
Message-ID: <3dc4a54e-7d04-36db-0931-2fb8d068b5f2@suse.de>
Date: Mon, 26 Sep 2022 15:54:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v6 3/5] module: add Error arguments to module_load and
 module_load_qom
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 dinechin@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220923232104.28420-1-cfontana@suse.de>
 <20220923232104.28420-4-cfontana@suse.de> <YzGBOwBQucv1F2NL@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <YzGBOwBQucv1F2NL@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 9/26/22 12:38, Kevin Wolf wrote:
> Am 24.09.2022 um 01:21 hat Claudio Fontana geschrieben:
>> improve error handling during module load, by changing:
>>
>> bool module_load(const char *prefix, const char *lib_name);
>> void module_load_qom(const char *type);
>>
>> to:
>>
>> int module_load(const char *prefix, const char *name, Error **errp);
>> int module_load_qom(const char *type, Error **errp);
>>
>> where the return value is:
>>
>>  -1 on module load error, and errp is set with the error
>>   0 on module or one of its dependencies are not installed
>>   1 on module load success
>>   2 on module load success (module already loaded or built-in)
>>
>> module_load_qom_one has been introduced in:
>>
>> commit 28457744c345 ("module: qom module support"), which built on top of
>> module_load_one, but discarded the bool return value. Restore it.
>>
>> Adapt all callers to emit errors, or ignore them, or fail hard,
>> as appropriate in each context.
>>
>> Some memory leaks also fixed as part of the module_load changes.
>>
>> audio: when attempting to load an audio module, report module load errors.
>> block: when attempting to load a block module, report module load errors.
>> console: when attempting to load a display module, report module load errors.
>>
>> qdev: when creating a new qdev Device object (DeviceState), report load errors.
>>       If a module cannot be loaded to create that device, now abort execution.
>>
>> qom/object.c: when initializing a QOM object, or looking up class_by_name,
>>               report module load errors.
>>
>> qtest: when processing the "module_load" qtest command, report errors
>>        in the load of the module.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> 
>> diff --git a/block/dmg.c b/block/dmg.c
>> index 007b8d9996..a422cf8d5b 100644
>> --- a/block/dmg.c
>> +++ b/block/dmg.c
>> @@ -434,6 +434,7 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>>      uint64_t plist_xml_offset, plist_xml_length;
>>      int64_t offset;
>>      int ret;
>> +    Error *local_err = NULL;
>>  
>>      ret = bdrv_apply_auto_read_only(bs, NULL, errp);
>>      if (ret < 0) {
>> @@ -446,8 +447,15 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>>          return -EINVAL;
>>      }
>>  
>> -    block_module_load("dmg-bz2");
>> -    block_module_load("dmg-lzfse");
>> +    if (block_module_load("dmg-bz2", &local_err) < 0) {
>> +        error_report_err(local_err);
>> +        return -EINVAL;
>> +    }
>> +    local_err = NULL;
>> +    if (block_module_load("dmg-lzfse", &local_err) < 0) {
>> +        error_report_err(local_err);
>> +        return -EINVAL;

I am concerned about the resources allocation here though,
is returning EINVAL here right, vs using "goto fail"?

I matched the behavior of the preceding call:

    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                               BDRV_CHILD_IMAGE, false, errp);
    if (!bs->file) {
        return -EINVAL;
    }

But afterwards the code goes:
.
    /* locate the UDIF trailer */
    offset = dmg_find_koly_offset(bs->file, errp);
    if (offset < 0) {
        ret = offset;
        goto fail;
    }

Should the resources be freed or not in your view?

Thanks,

Claudio



>> +    }
> 
> Why don't we pass the existing errp instead of adding a new local_err
> and printing it locally? If we use error_report_err(local_err) and leave
> errp untouched, the caller will print another less specific error
> message, which is generally not what we want.
> 
> Kevin
> 


