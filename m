Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F1E5AD508
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 16:38:10 +0200 (CEST)
Received: from localhost ([::1]:46692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVDEn-0007Ns-EB
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 10:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVDDR-00061e-SR
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 10:36:45 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:39396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVDDM-0001Pd-Oc
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 10:36:45 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB81A1F9ED;
 Mon,  5 Sep 2022 14:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662388598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=66rNJyEIGcx0BrYEamOWOPu8sj9CcIC2tM9qdEzFjno=;
 b=H4WMKQKUKBG4K5NAuEyNWQrXYKn5uoR1zY9IvLWJibr6SyA8f4sE1RUIePLzXs94UXdqfw
 mtaeHPAZCFyhhoG9OJjpB5OfRsI/iTWiFaEwL0axBMnIPSv3jU+LxXp9VcJEtzx9MRktKc
 rFhITj/ZT4Uk4+6xqvo5Vyr/P36ffKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662388598;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=66rNJyEIGcx0BrYEamOWOPu8sj9CcIC2tM9qdEzFjno=;
 b=Za0rBzHHdwFEJiP1n8K27pqIhbx6XKcwvzrMw3UtSieKFrOAcPa3FEoXBCcPyb3t1bu2ru
 VH0p0l1yaRE198CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 95D8113A66;
 Mon,  5 Sep 2022 14:36:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4ZIzI3UJFmOTQQAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 05 Sep 2022 14:36:37 +0000
Message-ID: <9bb31e44-e43d-b51a-712a-87e46279a0b5@suse.de>
Date: Mon, 5 Sep 2022 16:36:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] accel: print an error message and exit if plugin not
 loaded
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220905101332.1986-1-cfontana@suse.de>
 <5d922305-a559-bfdc-7038-ec1560ae0e00@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <5d922305-a559-bfdc-7038-ec1560ae0e00@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 9/5/22 14:06, Richard Henderson wrote:
> On 9/5/22 11:13, Claudio Fontana wrote:
>> If module_load_one, module_load_file fail for any reason
>> (permissions, plugin not installed, ...), we need to provide some notification
>> to the user to understand that this is happening; otherwise the errors
>> reported on initialization will make no sense to the user.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>   accel/accel-softmmu.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
>> index 67276e4f52..807708ee86 100644
>> --- a/accel/accel-softmmu.c
>> +++ b/accel/accel-softmmu.c
>> @@ -66,15 +66,21 @@ void accel_init_ops_interfaces(AccelClass *ac)
>>   {
>>       const char *ac_name;
>>       char *ops_name;
>> +    ObjectClass *oc;
>>       AccelOpsClass *ops;
>>   
>>       ac_name = object_class_get_name(OBJECT_CLASS(ac));
>>       g_assert(ac_name != NULL);
>>   
>>       ops_name = g_strdup_printf("%s" ACCEL_OPS_SUFFIX, ac_name);
>> -    ops = ACCEL_OPS_CLASS(module_object_class_by_name(ops_name));
>> +    oc = module_object_class_by_name(ops_name);
>> +    if (!oc) {
>> +        error_report("fatal: could not find module object of type \"%s\", "
>> +                     "plugin might not be loaded correctly", ops_name);
>> +        exit(EXIT_FAILURE);
>> +    }
> 
> The change is correct, in that we certainly cannot continue without the accelerator loaded.
> 
> But I'm very disappointed that the module interface does not use Error, so you have no 
> choice but to use an extremely vague message here.  I would much prefer to plumb down an 
> error parameter so that here one could simply pass &error_fatal.
> 
> 
> r~
> 

I agree. I see it as also connected to:

https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg00578.html

module_load_file actually has the pertinent information of what it going wrong at the time it goes wrong, so I presume we should collect the Error there,
and find a way not to lose the return value along the way..

Claudio










