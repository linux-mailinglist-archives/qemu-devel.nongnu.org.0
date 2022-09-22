Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58015E6016
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 12:42:56 +0200 (CEST)
Received: from localhost ([::1]:43378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJfT-0004He-QY
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 06:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obIUz-0002Rx-1W
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:28:01 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:60418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obIUx-0007j1-16
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:28:00 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 792421F85D;
 Thu, 22 Sep 2022 09:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663838876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t+cEqUhG4w/GkQ11gsSyvrE1v9Z+r8CNBUDzbcto1GI=;
 b=Jd1pqJ9rBruibxIhWkTamxJ0IhoULk7w7mH5j8d32z7g3bCetuE5W5MYha2ovJeb8oc96+
 Cwco52chBqjOQS5mZlNvuIeVdySfGdsD+iRPeQm7ACbuYZNs4AztsJYQIm2HQVu0E1NK6J
 JYJsGH7Tc3ZcZyMOhhbRKU2tXU0kof4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663838876;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t+cEqUhG4w/GkQ11gsSyvrE1v9Z+r8CNBUDzbcto1GI=;
 b=K/qL/bgH81kSidt4WgHKST/+6eB+0tZbJUcM+1cJsXbxwoxi7B9u7AYGNqKH+7//+yx9FS
 N0ZRpHlcJyLRqoBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30B7B1346B;
 Thu, 22 Sep 2022 09:27:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GWifCpwqLGNGfwAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 22 Sep 2022 09:27:56 +0000
Message-ID: <17336941-7b27-aa2b-a1e0-7559c3ec80f5@suse.de>
Date: Thu, 22 Sep 2022 11:27:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de> <877d23ekj0.fsf@pond.sub.org>
 <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
 <87y1ucdirx.fsf@pond.sub.org> <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
 <878rmc54cw.fsf@pond.sub.org> <Yywcs7CpKDxahOSM@redhat.com>
 <5e6d958d-3b69-1472-b1b8-3a63186f0c5b@suse.de>
 <1a2cdd57-bc66-431f-204b-844c8cf92dfa@suse.de>
In-Reply-To: <1a2cdd57-bc66-431f-204b-844c8cf92dfa@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.702,
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

On 9/22/22 11:21, Claudio Fontana wrote:
> On 9/22/22 11:20, Claudio Fontana wrote:
>> On 9/22/22 10:28, Daniel P. Berrangé wrote:
>>> On Thu, Sep 22, 2022 at 08:07:43AM +0200, Markus Armbruster wrote:
>>>> Ease of use matters, too.  When sticking to the rule leads to awkward
>>>> code, we should stop and think.  Should we deviate from the rule?  Or
>>>> can we avoid that by tweaking the interface?
>>>>
>>>> Philippe's proposed interface sticks to the rule.
>>>
>>> The cost is that when you see a  function   dosomething(true|false) as
>>> a reader you often have no idea what the effect of true vs false is
>>> on the behaviour of that function. You resort to looking at the
>>> API docs and/or code.  This is where C would really benefit from
>>> having named parameters like as  dosomething(ignore_errors=true|false)
>>> is totally obvious. Anyway, I digress.
>>
>> The confusion here I think stems from the fact that not finding a module is _NORMAL BEHAVIOR_.
>>
>> We can configure the qemu package once including configuration for all modules,
>> and then have the packager (or user) install the modules needed.
>>
>> We should break away from the easy-to-lean-to mindset that
>>
>> not finding a module => error path
>>
>> Because this is not the case. This is what is being confused in this discussion.
>>
>> Distinguishing the normal execution path from the error path (exception, in C++ parlance),
>>
>> we are just hindered by the fact that C can only have one return value.
>>
>>
>>>
>>>> Another interface that does: return -1 for error, 0 for module not found
>>>> (no error), and 1 for loaded.
>>>
>>> IMHO this pattern is generally easier to understand when looking at
>>> the callers, as the fatal error scenario is always clear.
>>>
>>> That said I would suggest neither approach as the public facing
>>> API. Rather stop trying to overload 3 states onto an error reporting
>>> pattern that inherantly wants to be 2 states. Instead just have
>>> distinct methods
>>>
>>>   bool module_load_one(const char *prefix, const char *name, Error *errp)
>>>   bool module_try_load_one(const char *prefix, const char *name, Error *errp)
>>
>>
>> Here we are murking again the normal behavior and the error path.
>>
>> What is the meaning of try? It's not as though we would error out inside the function module_load_one,
>> it's the _caller_ that needs to decide how to treat a return value of found/not found, and the exception (Error).
>>
>> If this makes it clearer, lets keep the existing Error API pattern of using both the return value and the Error parameter for the error (exception),
>> and put the NORMAL BEHAVIOR error value in an argument using a pointer.
>>
>> We do not pass a "bool ignore_errors" , because that is again confusing the fact that it is not module_load_one that handles the errors,
>> module_load_one should neither handle nor ignore the errors,
>> it should generate an error in the error case, and a return value in the normal case.
>>
>> What about:
>>
>> /*                                                                                                                                          
>>  * module_load_one: attempt to load a module from a set of directories                                                                      
>>  *                                                                                                                                          
>>  * directories searched are:                                                                                                                
>>  * - getenv("QEMU_MODULE_DIR")                                                                                                              
>>  * - get_relocated_path(CONFIG_QEMU_MODDIR);                                                                                                
>>  * - /var/run/qemu/${version_dir}                                                                                                           
>>  *                                                                                                                                          
>>  * prefix:         a subsystem prefix, or the empty string ("audio-", ..., "")                                                              
>>  * name:           name of the module                                                                                                       
>>  * errp:           (ERROR CONDITION): errp will be set on module load error.
>>  * found:          (output): set to true if a module with this name has been found, false if no such module is present.
>>  *                                                                                                                                          
>>  * Return value:   true if no error encountered (module loaded or not present).
>>  *                 false if an error has been generated, and errp will be set with the Error.
>>  */
>>
> 
> Now with the missing prototype:
> 
> bool module_load_one(const char *prefix, const char *name, Error *errp, bool *found);

bool module_load_one(const char *prefix, const char *name, Error **errp, bool *found);


