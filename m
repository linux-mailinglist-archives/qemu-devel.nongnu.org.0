Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4F86243A2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 14:51:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot7xn-0003fa-Kc; Thu, 10 Nov 2022 08:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1ot7xg-0003cj-Ee; Thu, 10 Nov 2022 08:51:20 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1ot7xd-0000vQ-In; Thu, 10 Nov 2022 08:51:20 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1036322A7F;
 Thu, 10 Nov 2022 13:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668088275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1EnmRd9AprR9sGl08LPB1GlkHEdF/happUZHSZWso9E=;
 b=dqIgRBhGiYgWk8iE5munETBxx2/3z8JtEj55AuimUDq3HazKwk/MR0YyMFyLB4lAn+3gLW
 6upseArLLEe5CFLayVAidYjSoPHhjXV3fUk79PxtZlsfSjoukCcSY2RedwQ2XWgKvSLXkL
 5JhlDDk1omMDYo0voLay+W+jblNhxow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668088275;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1EnmRd9AprR9sGl08LPB1GlkHEdF/happUZHSZWso9E=;
 b=am85PW0nlkLMGFunrtZnPLujZKzoTBwht6CMag3GRNzNVYDj71plqJoe5afabntnhitmi3
 KtFWQ5OGmqlngcBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DD2441332F;
 Thu, 10 Nov 2022 13:51:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wstmNNIBbWM6CgAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 10 Nov 2022 13:51:14 +0000
Message-ID: <4ca9f423-4599-bc69-1ac8-996b3ccce1f5@suse.de>
Date: Thu, 10 Nov 2022 14:51:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: intermittent failures in iotest 108
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
References: <6e73cae7-7bef-76b9-4c5a-24f2364a4c11@suse.de>
 <Y20BjmHPuljWY4Q4@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <Y20BjmHPuljWY4Q4@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/10/22 14:50, Kevin Wolf wrote:
> Am 07.11.2022 um 14:36 hat Claudio Fontana geschrieben:
>> Hello Kevin and all,
>>
>> I seem to be getting intermittent failures with mainline iotest 108. Is this already known?
>>
>> ../configure --enable-tcg --enable-kvm --enable-modules --enable-debug
>> make -j
>> make -j check
> 
> At least I haven't hit it yet. Running just the one test case in a loop
> doesn't seem to trigger it either. Maybe it only fails under load?
> 
> Kevin
> 

I'll give it a few more spins, see how often I hit it.

Ciao,

C

