Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C035E7F22
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 17:58:46 +0200 (CEST)
Received: from localhost ([::1]:34242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obl4e-0000OK-R7
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 11:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obkwW-0004pw-JZ
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 11:50:21 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:38718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obkwV-0007PJ-3b
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 11:50:20 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D744F219EF;
 Fri, 23 Sep 2022 15:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663948215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vQIOgj03F+VS6pRQQkmhpi6Syh0kadNrBBHsEdATo+4=;
 b=Xty5wU1Z0S4CR8yLmmYrkDNNswMrR3NV7OOmfxIn0sTVnaUZFIgtdkh+pC1rNmEI5bOODu
 B9DxCrnoWyFhjeJwtXEdEhNRRySWLXVfx0EUg1BbM0krQo2imZvH3J+wWYEDYQd5NRVBSf
 QHYaIrdoD4LK1pTZfecWlMFdkhDQsfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663948215;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vQIOgj03F+VS6pRQQkmhpi6Syh0kadNrBBHsEdATo+4=;
 b=GlfJuaXC18Sp2RpfvL+PdyFHnkYuEyUhCfWZVyB3Oggl+HJasB7LMwVuqViIoZoSf4RVK7
 vMHyLFsibp4x5kAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6F50E13AA5;
 Fri, 23 Sep 2022 15:50:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bU1QGbfVLWN9RAAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 23 Sep 2022 15:50:15 +0000
Message-ID: <555d01d8-ba66-5dca-3ddf-fe831a2b7bf6@suse.de>
Date: Fri, 23 Sep 2022 17:50:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 4/4] accel: abort if we fail to load the accelerator
 plugin
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220923145131.21282-1-cfontana@suse.de>
 <20220923145131.21282-5-cfontana@suse.de>
 <8d1123e8-334b-136f-1315-35448c094e6b@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <8d1123e8-334b-136f-1315-35448c094e6b@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 9/23/22 17:28, Philippe Mathieu-Daudé via wrote:
> On 23/9/22 16:51, Claudio Fontana wrote:
>> if QEMU is configured with modules enabled, it is possible that the
>> load of an accelerator module will fail.
>> Abort in this case, relying on module_object_class_by_name to report
>> the specific load error if any.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/accel-softmmu.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
>> index 67276e4f52..9fa4849f2c 100644
>> --- a/accel/accel-softmmu.c
>> +++ b/accel/accel-softmmu.c
>> @@ -66,6 +66,7 @@ void accel_init_ops_interfaces(AccelClass *ac)
>>   {
>>       const char *ac_name;
>>       char *ops_name;
>> +    ObjectClass *oc;
>>       AccelOpsClass *ops;
>>   
>>       ac_name = object_class_get_name(OBJECT_CLASS(ac));
>> @@ -73,8 +74,13 @@ void accel_init_ops_interfaces(AccelClass *ac)
>>   
>>       ops_name = g_strdup_printf("%s" ACCEL_OPS_SUFFIX, ac_name);
>>       ops = ACCEL_OPS_CLASS(module_object_class_by_name(ops_name));
>> +    oc = module_object_class_by_name(ops_name);
>> +    if (!oc) {
>> +        error_report("fatal: could not load module for type '%s'", ops_name);
>> +        abort();
> 
> I'm not sure aborting is helpful here: QEMU process state is alright,
> we only miss a module...
> 
> Aren't we good with a simple 'exit(1);'?

we are I think...

Thanks,

C

> 
>> +    }
>>       g_free(ops_name);
>> -
>> +    ops = ACCEL_OPS_CLASS(oc);
>>       /*
>>        * all accelerators need to define ops, providing at least a mandatory
>>        * non-NULL create_vcpu_thread operation.
> 
> Preferably calling exit():
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 


