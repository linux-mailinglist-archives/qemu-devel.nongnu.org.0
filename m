Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5AF3DA2D9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:09:11 +0200 (CEST)
Received: from localhost ([::1]:60176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94qc-0005mG-TG
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m94Nt-0001KI-R1
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:39:29 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:53168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m94Ns-0000d7-3V
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:39:29 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 692E8222F0;
 Thu, 29 Jul 2021 11:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627558765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3z6qg0Plw2J4oQMQo7rIKpsAVJFMYvqgTgKw9arVMIs=;
 b=dZNqezcPA8zUK3nAerqZsW4iA59K5Ys4t5PxWMsvsbR9qYoYTEeMsaXSQRNqyIYDIIaasH
 gFGHoFd0SZ+nC21ttMMRBoOQTXyRHz1L/+c9pp7rM15S/Eg9//7nRgO//C/WhF5vSbHdmd
 z1WDYWnD4pwFHKd00O483OT00iUcSKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627558765;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3z6qg0Plw2J4oQMQo7rIKpsAVJFMYvqgTgKw9arVMIs=;
 b=SItVLxIxZOb3DRS7hsju9IqX7DPvvtmi7M7Pg7E9erRMUUqkgMMQ8vuAj/UiMMLZ3uvIFD
 5V9+yMq21e0BzqDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E260613ADD;
 Thu, 29 Jul 2021 11:39:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id B+6QNGyTAmFsYwAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 29 Jul 2021 11:39:24 +0000
Subject: Re: modular tcg
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Alex Bennee <alex.bennee@linaro.org>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de>
 <20210723095231.sfbkhdwdg43nedkk@sirius.home.kraxel.org>
 <4b5c010f-1365-e746-c269-9b9e48771f7b@suse.de>
 <6a3940a4-ca70-343b-5724-0f8f59d6fde4@suse.de>
 <20210723124858.rh63jh2esxahib4e@sirius.home.kraxel.org>
 <20210729091407.n7bdlyw5rsievdch@sirius.home.kraxel.org>
 <f264970b-b12c-4e36-548f-d2411c7e3842@suse.de>
 <20210729102955.k34jqpetqy6owivr@sirius.home.kraxel.org>
 <75a7378d-63b2-d1d7-c7e1-ca4d13cf01cb@suse.de>
 <6514e353-fca6-98a7-cb35-46a90c37389b@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <0f40bdb2-2ee4-4c27-6611-1bd98e7d8c79@suse.de>
Date: Thu, 29 Jul 2021 13:39:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6514e353-fca6-98a7-cb35-46a90c37389b@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 1:34 PM, Philippe Mathieu-Daudé wrote:
> On 7/29/21 12:44 PM, Claudio Fontana wrote:
>> On 7/29/21 12:29 PM, Gerd Hoffmann wrote:
>>>   Hi,
>>>
>>>> And another comment: I think we should have some progress on ARM with
>>>> the kvm/tcg split and with the KConfig of boards, before we continue
>>>> here.
>>>
>>> Why?  This can easily be tacked in parallel.  We can flip the switch
>>> for modular tcg per target in meson.build.
>>>
>>> take care,
>>>   Gerd
>>>
>>
>> Because in the end we need to do this for ARM too and for the other archs too (s390 is already ok),
>>
>> and in order to be sure not to end up in a dead-end, I think it would be good to have at least a sketch for the other archs as well..
>>
>> Just my 2c ofc, I think really here still ARM is behind, and we should help it catch up.
>>
>> If I had more time I would have pushed more on the ARM series, but.. yeah.
> 
> IIUC Alex is waiting 6.2 release to respin.
> 

Ah that's great to know (and thanks again for picking it up).

CLaudio

