Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5985E5EDC
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:47:06 +0200 (CEST)
Received: from localhost ([::1]:60668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obInR-0001jC-UI
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obIbI-0008Pq-6R
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:34:32 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:38952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obIbB-0000jk-Nc
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:34:30 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7CF361F85D;
 Thu, 22 Sep 2022 09:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663839263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hUDd9KhwaAZzgk1F2Hnl4qFr5fXu35/7BHQqyMxSXKY=;
 b=ScFda01EkQybILEAC/rTJXYsc+2RDJBsSycamB1L/j5qHyPvhKQdJv0GRxR01pKHXs1NqR
 CBmq8YMF1J4mYiuh/OB5FhTRohnGBrUqKfDs9C4K7LbvHlNhakpQvvDhfuzG3XtoV0ey69
 6HnuMp9g/vuaU39vPsRedbSkBEN+7lk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663839263;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hUDd9KhwaAZzgk1F2Hnl4qFr5fXu35/7BHQqyMxSXKY=;
 b=2njsuJ2rp1a5xz3zwPs36xhR9dWSg8Rnkg+BxUgnEbi42+f6wq90FHASqoQjbOLPZBXRFK
 2Jv1xduf23azrPDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 360211346B;
 Thu, 22 Sep 2022 09:34:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vwnACx8sLGO0AwAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 22 Sep 2022 09:34:23 +0000
Message-ID: <df4c09e9-addf-c643-6da0-62a6cf94b349@suse.de>
Date: Thu, 22 Sep 2022 11:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
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
 <5e6d958d-3b69-1472-b1b8-3a63186f0c5b@suse.de> <YywraWlVnJoy6ypN@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <YywraWlVnJoy6ypN@redhat.com>
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

On 9/22/22 11:31, Daniel P. Berrangé wrote:
> On Thu, Sep 22, 2022 at 11:20:07AM +0200, Claudio Fontana wrote:
>> On 9/22/22 10:28, Daniel P. Berrangé wrote:
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
> 
> I suggested "try" as in the  g_malloc vs g_try_malloc API naming pattern,
> where the latter ignores the OOM error condition.
> 
> So in this case 'try' means try to load the module, but don't fail if
> the module is missing on disk.

I understand what you mean, but this is wrong in this case.

We _do not fail_ in module_load_one, whether an error is present or not, whether a module is found or not.


