Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2815EA806
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:10:12 +0200 (CEST)
Received: from localhost ([::1]:43924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocooD-0001kB-Qv
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oco9x-00009V-HN
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:28:35 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:46678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oco9u-0003s3-9e
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:28:31 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BF0111F9B0;
 Mon, 26 Sep 2022 13:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664198908; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2RCgVD1rw2w1fL3zSLjcrhxkxZNRvZ/nkZBIEEojrwI=;
 b=rGZ0UJmTt97xmleMMU4z+VV2sdyHVp6aB5Dy1fTsTMsEfL7K6Hae2qcQSQQlifFgqjZ476
 pyCR8RIxqQnyhTWmdPKMv6LRxUSaLNyPdAaADtmv2E3ccnblM4EZbHFkapUDeRdtsUBLvV
 bEqjOhx0jTO2vdgLPMj4GIeTACNZ+AA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664198908;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2RCgVD1rw2w1fL3zSLjcrhxkxZNRvZ/nkZBIEEojrwI=;
 b=55QjWUx5ZSqbPTgS0OmbR9JU/i9WjGXnfGdv8wPUZT4c3ayuWei9ccrY9nSt/LYjP/oJ1L
 tG3pR7UuD2DOKRDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6A50E13486;
 Mon, 26 Sep 2022 13:28:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Nr1CGPyoMWPMbQAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 26 Sep 2022 13:28:28 +0000
Message-ID: <52682bbd-b884-3b7e-4a02-212f7d9b782b@suse.de>
Date: Mon, 26 Sep 2022 15:28:27 +0200
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
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
>> +    }
> 
> Why don't we pass the existing errp instead of adding a new local_err
> and printing it locally? If we use error_report_err(local_err) and leave
> errp untouched, the caller will print another less specific error
> message, which is generally not what we want.
> 
> Kevin
> 

Ok, you know that code best, will merge the two.

Thanks,

Claudio 

