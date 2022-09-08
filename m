Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6A85B2510
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 19:43:44 +0200 (CEST)
Received: from localhost ([::1]:58216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWLZ1-0002Rm-Ea
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 13:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWLRr-0001f0-SY
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 13:36:19 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:45544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWLRo-000339-6g
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 13:36:19 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B16011F8B6;
 Thu,  8 Sep 2022 17:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662658573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/BTaMovEpOp150w3BHhYLXM8reeiOnaoPKAFnhMbxI=;
 b=H1pEyHYY/PC4neQQIgwQjjI4h6TmSixWzfoDsYcPvbaznclh68kLkctmAR3wJxw46htJ+w
 PTvnpPL38A6K4H07eWeaG+sdw6VR40/d6c2JpO7gSRWtlP2du7yBKrUbyqU68Osf8pbJmm
 8w8jofh7KM9vGEu2MS8QuLO8EZfM3Rc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662658573;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/BTaMovEpOp150w3BHhYLXM8reeiOnaoPKAFnhMbxI=;
 b=LUb3vO87dcJKLQQWs7QTT9d7R4LFVFWHYPjbYAIPz/CbT9XK1dTZVLI8mmmePzlVW3a40b
 3vGX2XujmnlPFwDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 657C41322C;
 Thu,  8 Sep 2022 17:36:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UJZLFw0oGmMuJAAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 08 Sep 2022 17:36:13 +0000
Message-ID: <8682ad9f-aea8-0419-5ff6-c14493e4e980@suse.de>
Date: Thu, 8 Sep 2022 19:36:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
From: Claudio Fontana <cfontana@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20220908145308.30282-1-cfontana@suse.de>
 <20220908145308.30282-3-cfontana@suse.de>
 <062faaa8-064c-f68a-e316-aaacb80efa5a@linaro.org>
 <3c6cb3ee-2470-654f-c2c4-3449861f9781@suse.de>
In-Reply-To: <3c6cb3ee-2470-654f-c2c4-3449861f9781@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 9/8/22 19:10, Claudio Fontana wrote:
> On 9/8/22 18:03, Richard Henderson wrote:
>> On 9/8/22 15:53, Claudio Fontana wrote:
>>> @@ -446,8 +447,13 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>>>           return -EINVAL;
>>>       }
>>>   
>>> -    block_module_load_one("dmg-bz2");
>>> -    block_module_load_one("dmg-lzfse");
>>> +    if (!block_module_load_one("dmg-bz2", &local_err) && local_err) {
>>> +        error_report_err(local_err);
>>> +    }
>>> +    local_err = NULL;
>>> +    if (!block_module_load_one("dmg-lzfse", &local_err) && local_err) {
>>> +        error_report_err(local_err);
>>> +    }
>>>   
>>>       s->n_chunks = 0;
>>>       s->offsets = s->lengths = s->sectors = s->sectorcounts = NULL;
>>
>> I wonder if these shouldn't fail hard if the modules don't exist?
>> Or at least pass back the error.
>>
>> Kevin?

is "dmg-bz" _required_ for dmg open to work? I suspect if the dmg image is not compressed,
"dmg" can function even if the extra dmg-bz module is not loaded right?

I'd suspect we should then do:

if (!block_module_load_one("dmg-bz2", &local_err)) {
  if (local_err) {
     error_report_err(local_err);
     return -EINVAL;
  }
  warn_report("dmg-bz2 is not present, dmg will skip bz2-compressed chunks */
}

and same for dmg-lzfse...?

Ciao,

C
     
>>> +        error_report_err(local_err);
>>> +    }
>>
>>> @@ -1033,7 +1039,10 @@ ObjectClass *module_object_class_by_name(const char *typename)
>>>       oc = object_class_by_name(typename);
>>>   #ifdef CONFIG_MODULES
>>>       if (!oc) {
>>> -        module_load_qom_one(typename);
>>> +        Error *local_err = NULL;
>>> +        if (!module_load_qom_one(typename, &local_err) && local_err) {
>>> +            error_report_err(local_err);
>>> +        }
>>
>> You can return NULL from this path, we know it failed.
> 
> 
> I am tempted then to change also other similar instances in the code.
> 
>>
>>> @@ -172,46 +170,38 @@ static int module_load_file(const char *fname, bool export_symbols)
>>>       }
>>>       g_module = g_module_open(fname, flags);
>>>       if (!g_module) {
>>> -        fprintf(stderr, "Failed to open module: %s\n",
>>> -                g_module_error());
>>> -        ret = -EINVAL;
>>> -        goto out;
>>> +        error_setg(errp, "failed to open module: %s", g_module_error());
>>> +        return false;
>>>       }
>>>       if (!g_module_symbol(g_module, DSO_STAMP_FUN_STR, (gpointer *)&sym)) {
>>> -        fprintf(stderr, "Failed to initialize module: %s\n",
>>> -                fname);
>>> -        /* Print some info if this is a QEMU module (but from different build),
>>> -         * this will make debugging user problems easier. */
>>> +        error_setg(errp, "failed to initialize module: %s", fname);
>>> +        /*
>>> +         * Print some info if this is a QEMU module (but from different build),
>>> +         * this will make debugging user problems easier.
>>> +         */
>>>           if (g_module_symbol(g_module, "qemu_module_dummy", (gpointer *)&sym)) {
>>> -            fprintf(stderr,
>>> -                    "Note: only modules from the same build can be loaded.\n");
>>> +            error_append_hint(errp,
>>> +                              "Only modules from the same build can be loaded");
>>
>> With error_append_hint, you add the newline.
>>
>> The rest of the util/module.c reorg looks good.
>>
>>
>> r~
> 


