Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E8F3DA178
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 12:46:21 +0200 (CEST)
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m93YS-00025m-Ib
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 06:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m93XC-0001Nk-LE
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:45:02 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:42606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m93XB-0003kM-2j
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:45:02 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F3D66223E7;
 Thu, 29 Jul 2021 10:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627555500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sRNs/Lz/giqw7An8+N01P10tLRirHStC8rGUm2JJUWU=;
 b=BmYQzW4doKkziyD2Nf7mpc2+3EpG1aZFIavEUo/twieqO5MjhfuEizPTGQwg+N2WF/E6LF
 wgQ6htqgH+YHcpO617wH2hRp3wxqEYsz9JRmdxPZu8D6zwvgahjAmznkIJfYlEdb8lMY+8
 Q4HDhbF3VRCKBhSx87MSVg5PSRNZI98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627555500;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sRNs/Lz/giqw7An8+N01P10tLRirHStC8rGUm2JJUWU=;
 b=t1lXcMJ7fTl6vNdfm3NyZCpV7SqwRwxBHJQsFt65pj3IbU2PITf6HdK2wUL6pO4bkUu4f2
 J3Frt0/2U3tufhAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 662211348A;
 Thu, 29 Jul 2021 10:44:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TfgtD6uGAmFbUwAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 29 Jul 2021 10:44:59 +0000
Subject: Re: modular tcg
To: Gerd Hoffmann <kraxel@redhat.com>
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
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <75a7378d-63b2-d1d7-c7e1-ca4d13cf01cb@suse.de>
Date: Thu, 29 Jul 2021 12:44:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210729102955.k34jqpetqy6owivr@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.277,
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
Cc: "Jose R. Ziviani" <jziviani@suse.de>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, pbonzini@redhat.com,
 Alex Bennee <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 12:29 PM, Gerd Hoffmann wrote:
>   Hi,
> 
>> And another comment: I think we should have some progress on ARM with
>> the kvm/tcg split and with the KConfig of boards, before we continue
>> here.
> 
> Why?  This can easily be tacked in parallel.  We can flip the switch
> for modular tcg per target in meson.build.
> 
> take care,
>   Gerd
> 

Because in the end we need to do this for ARM too and for the other archs too (s390 is already ok),

and in order to be sure not to end up in a dead-end, I think it would be good to have at least a sketch for the other archs as well..

Just my 2c ofc, I think really here still ARM is behind, and we should help it catch up.

If I had more time I would have pushed more on the ARM series, but.. yeah.

Ciao,

Claudio

