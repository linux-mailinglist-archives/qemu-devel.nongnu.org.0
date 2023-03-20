Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FA26C1080
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 12:15:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peDTh-0000nx-3E; Mon, 20 Mar 2023 07:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1peDTe-0000kh-3T
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 07:14:58 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1peDTc-00032z-7h
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 07:14:57 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2A90D21B70;
 Mon, 20 Mar 2023 11:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679310894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELaAk+xj2RYoXM3NW36PFRU90yhRLpvQdC9FbDlukzQ=;
 b=ewlLRwUmw1pTfhCa0wvaxqFfcm5J9k2XmaQdOZv73V2goTCL1tcsSq37cmAWxSOrCUiJ6f
 dNDmlc70i4g0Rd8C4z2T4Z7P21Dx5hmx0eCuP5jF9iKaN8K6WUB0krV3kwhlr2qWUFF4XQ
 y5dW+LJW2dPjG9DckTHNbh3Q8CEBUyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679310894;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELaAk+xj2RYoXM3NW36PFRU90yhRLpvQdC9FbDlukzQ=;
 b=hHkhfQcz8k9Of4HReUZrmP3pZbJCDuol/vUzknezMoXg+nuZmwBULUnYg3OaUH48U2SetX
 5CSeMVHtojww3sBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DFE7F13416;
 Mon, 20 Mar 2023 11:14:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yMPzNC1AGGR4LgAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 20 Mar 2023 11:14:53 +0000
Message-ID: <650337f7-3433-c702-8d04-8f796a20bfe1@suse.de>
Date: Mon, 20 Mar 2023 12:14:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 00/14] File-based migration support and fixed-ram
 features
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 fabiano.rosas@suse.com
Cc: Nikolay Borisov <nborisov@suse.com>, dgilbert@redhat.com,
 qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com
References: <20221028103914.908728-1-nborisov@suse.com>
 <734376eb-0098-8885-190f-f328ddedf81b@suse.de> <Y+ZkKR+dry3aiynr@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <Y+ZkKR+dry3aiynr@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

(adding Fabiano to the thread)

On 2/10/23 16:35, Daniel P. Berrangé wrote:
> On Thu, Feb 09, 2023 at 02:32:01PM +0100, Claudio Fontana wrote:
>> Hello Daniel and all,
>>
>> resurrecting this series from end of last year,
>>
>> do we think that this is the right approach and first step to
>> be able to provide good performance for virsh save and virsh
>> restore?
> 
> I've looked through the series in some more detail now and will
> send review comments separately. Overall, I'm pretty pleased with
> the series and think it is on the right path. The new format it
> provides should be amenable to parallel I/O with multifd and
> be able to support O_DIRECT to avoid burning through the host I/O
> cache.

Just wanted to add a thought we had with Fabiano a few days ago:

experimentally, it is clear that fixed-ram is an optimization, but the actual scalability seems to come from the successive parallel I/O with multifd.

Since the goal is being able to transfer _to disk_ (fdatasync) the whole 30G memory in 5 seconds, the need to split the cpu-intensive work into smaller tasks remains,
and the main scalability solution seems to come from the multifd part of the work (or another way to split the problem), combined with the O_DIRECT friendliness to avoid the trap of the cache trashing.

Not adding much, just highlighting that fixed-ram _alone_ does not seem to suffice, we probably need all pieces of the puzzle in place.

Thanks!

Claudio

> 
> There is obviously a bit of extra complexity from having a new
> way to map RAM to the output, but it looks fairly well contained
> in just a couple of places of the code. The performance wins
> should be able to justify the extra maint burden IMHO.
> 
>> Do we still agree on this way forward, any comments? Thanks,
> 
> I'm not a migration maintainer, but overall I think it is
> good.
> 
> With regards,
> Daniel


