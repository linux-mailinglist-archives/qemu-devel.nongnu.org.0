Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7156244EC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 15:58:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot8z9-0000Oz-9h; Thu, 10 Nov 2022 09:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1ot8yz-0000OD-BK; Thu, 10 Nov 2022 09:56:46 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1ot8yu-00031X-E1; Thu, 10 Nov 2022 09:56:44 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 53B5422883;
 Thu, 10 Nov 2022 14:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668092197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kfJJHkRufzIPhPFjO9rhvKXHVFVu84SNN4cqjFajWKI=;
 b=xh1wtQuT5GsYlspHGb2quo0afGoKMkjsRWSeQCqe8TmPUzprcG2TYmSHfC9AUZ2TCIwY20
 SDynWR6H2nbP/D8Cui/5cZYk22uhOgh7RIO46Rx0m2wulJz2m7KcmtGOV+o8uw1s3+nNrn
 BagRqxHPJXT798EGJpjohH8SDEHrgWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668092197;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kfJJHkRufzIPhPFjO9rhvKXHVFVu84SNN4cqjFajWKI=;
 b=tnd5MLoxVw0uAznX/iJbIoebVC8D7e3q47oLOGSzybHekoqSiI5AgX2YuUc4+RuyZflXA7
 3hnQ5QboDaQR3jAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2A21013B58;
 Thu, 10 Nov 2022 14:56:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PruYCCURbWN/NAAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 10 Nov 2022 14:56:37 +0000
Message-ID: <0e1559f7-ecb8-239e-855f-4faa7c45e9eb@suse.de>
Date: Thu, 10 Nov 2022 15:56:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: intermittent failures in iotest 108
Content-Language: en-US
From: Claudio Fontana <cfontana@suse.de>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
References: <6e73cae7-7bef-76b9-4c5a-24f2364a4c11@suse.de>
 <Y20BjmHPuljWY4Q4@redhat.com> <4ca9f423-4599-bc69-1ac8-996b3ccce1f5@suse.de>
In-Reply-To: <4ca9f423-4599-bc69-1ac8-996b3ccce1f5@suse.de>
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
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 11/10/22 14:51, Claudio Fontana wrote:
> On 11/10/22 14:50, Kevin Wolf wrote:
>> Am 07.11.2022 um 14:36 hat Claudio Fontana geschrieben:
>>> Hello Kevin and all,
>>>
>>> I seem to be getting intermittent failures with mainline iotest 108. Is this already known?
>>>
>>> ../configure --enable-tcg --enable-kvm --enable-modules --enable-debug
>>> make -j
>>> make -j check
>>
>> At least I haven't hit it yet. Running just the one test case in a loop
>> doesn't seem to trigger it either. Maybe it only fails under load?

btw are you running tests in parallel

make -j check

?


