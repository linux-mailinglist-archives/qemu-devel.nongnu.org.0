Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F271A652768
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 20:54:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ifg-0007fC-4a; Tue, 20 Dec 2022 14:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p7ifd-0007cw-MU; Tue, 20 Dec 2022 14:53:01 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p7ifc-0007Ij-2P; Tue, 20 Dec 2022 14:53:01 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B6841764E5;
 Tue, 20 Dec 2022 19:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671565977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bEOLelN3wJYyNhsrZ0aPqAGwsr8/x4El2iAwqrV1puY=;
 b=eRe6EfWYlk/8UIgPWe+oNRFtehA8ZCKkFrLkG8fgACwtjwC9I2umkPr8A3ZxzfWAyiXozs
 c46eLk+5fc6r1guGzXn3kowSkYsOUQJGlvwEMzhYgz42U4OIMonjkaSrAol+PpWJRLBcGK
 xSgKcc1s4B/hw2TcF3uI6WDqjXNEV18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671565977;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bEOLelN3wJYyNhsrZ0aPqAGwsr8/x4El2iAwqrV1puY=;
 b=Xxeo7mNKV8t7XcQwk0WHV0pILXa8A5PKhKkYt/A58zVx1wBKYihTZ5VFFpPxloK9bPNvoD
 zGegudqopgOMy5CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 407D813254;
 Tue, 20 Dec 2022 19:52:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PkJhApkSomMmSAAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 20 Dec 2022 19:52:57 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alexander Graf <agraf@csgraf.de>, Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 1/5] target/arm: only build psci for TCG
In-Reply-To: <601ba0ac-cbcd-50d4-c295-5cde4a4d6e97@csgraf.de>
References: <20221216212944.28229-2-farosas@suse.de>
 <459E39B4-44F5-41B2-A595-1B0DB5AD80F3@csgraf.de>
 <3355a215-dd7a-e80a-ca53-b0d65eb435b5@suse.de>
 <76c8912f-4fb7-118a-2105-efe08f343f77@csgraf.de>
 <ced115e9-6bdb-fdb6-818d-b77e27b9ecb1@suse.de> <87r0wv8vsa.fsf@suse.de>
 <92da4de4-b00b-096a-8dd9-f4f2f9696598@csgraf.de> <875ye6rxk7.fsf@suse.de>
 <601ba0ac-cbcd-50d4-c295-5cde4a4d6e97@csgraf.de>
Date: Tue, 20 Dec 2022 16:52:54 -0300
Message-ID: <87wn6lrgx5.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Alexander Graf <agraf@csgraf.de> writes:

>>> I'm confused about the patch ordering :). Why is it easier to move the
>>> psci.c compilation target from generic to an if(CONFIG_TCG) only to
>>> later move it into a tcg/ directory?
>> It's a simple patch, so the overhead didn't cross my mind. But you are
>> right, this could go directly into tcg/ without having to put it under
>> CONFIG_TCG first.
>
>
> I'm sure more like this will follow, and it will be a lot easier on 
> everyone if the pattern is going to be "move tcg specific code to tcg/ 
> and leave generic code in the main directory".

Ok, so I'll drop this patch from this series and resend it along with
the rest of the code movement to the tcg/ directory.

> Quite the opposite: Please make sure to move everything slowly at a 
> digestible pace. There is no way you will get 100 patches in at once. 
> Make sure you can cut off at any point in between.

I meant having code under CONFIG_TCG first and later moving to tcg/. So
we separate moving the code from figuring out if it should be
moved. There was no implication of speed, size or indigestibility =).

>
> What you basically want is to move from "target/arm is tcg+generic code" 
> to "target/arm is generic, target/arm/tcg is tcg code". You will be in a 
> transitional phase along the way whatever you do, so just make it 
> "target/arm is tcg+generic code, target/arm/tcg is tcg code" while 
> things are in flight and have a final commit that indicates the 
> conversion is done.
>
>
>> I'm also rebasing this series [1] from 2021, which means I'd rather have
>> small chunks of code moved under CONFIG_TCG that I can build-test with
>> --disable-tcg (even though the build doesn't finish, I can see the
>> number of errors going down), than to move non-tcg code into tcg/ and
>> then pull it out later like in the original series.
>
>
> I think we're saying the same thing. Please don't move non-tcg code into 
> tcg/. Just move files that are absolutely clearly TCG into tcg/ right 
> from the start. The psci.c is a good example for that. translate*.c and 
> op-helper.c would be another.

Yeah, I think we agree. Thanks for taking the time to spell it out.

