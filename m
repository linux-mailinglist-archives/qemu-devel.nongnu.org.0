Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9DE699A7B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:49:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShQQ-0000PG-QM; Thu, 16 Feb 2023 11:48:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pShQO-0000Oi-9E; Thu, 16 Feb 2023 11:48:00 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pShQM-00037A-FB; Thu, 16 Feb 2023 11:48:00 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4D59D22580;
 Thu, 16 Feb 2023 16:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676566075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9BXwRmktdYDT64nWxu6McPLW5wPO1Yug5aQx11PgREc=;
 b=Ve7NQeBLXO2to4huSdJet4OuTukFRJ1wNno+C2PSdBE3gj98eJFgVeZTZbmAEOwp7LWSOe
 GRNIF8aetC6X3ROi4/N9rRreX/qOLlmPuq0SO+h1DeSyD5UY0zddsG68QiKexkMi+J1C+3
 XbyxdvmRmkJHIiSttZXXyQIfbZ0cq84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676566075;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9BXwRmktdYDT64nWxu6McPLW5wPO1Yug5aQx11PgREc=;
 b=deVDsdPyUmY2X47gaIoMZu4fKaVWWHtgmmsozHi57YwgzrOugDssjFkCz+tYJOozVkhbnp
 0v5U3O1rsBljNECQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF47B13438;
 Thu, 16 Feb 2023 16:47:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +qLFJTpe7mPRNAAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 16 Feb 2023 16:47:54 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH RESEND v5 00/28] target/arm: Allow CONFIG_TCG=n builds
In-Reply-To: <CAFEAcA8yXgqdCvt6KWHQBUNrjca_n2gWeBG-=RGQQKR1vWrf6A@mail.gmail.com>
References: <20230213202927.28992-1-farosas@suse.de>
 <CAFEAcA8yXgqdCvt6KWHQBUNrjca_n2gWeBG-=RGQQKR1vWrf6A@mail.gmail.com>
Date: Thu, 16 Feb 2023 13:47:52 -0300
Message-ID: <87357536br.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 13 Feb 2023 at 20:31, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> Hi, could someone take this?
>>
>> I rebased and put the two series together to simplify. I'm keeping it
>> up-to-date and tested while it doesn't go in.
>>
>> CI run here: https://gitlab.com/farosas/qemu/-/pipelines/776103500
>>
>> Based on master.
>> Supersedes "target/arm: CONFIG_TCG=n part 1".
>
> I've taken patches 1-5 into target-arm.next.
> Patch 6 doesn't apply on top of my tree, which is unsurprising
> given that it's trying to move 9000+ lines of code in a single
> patch. That's so much I couldn't even figure out how to recreate
> the code movement locally. The diff is not very legible either.

Ugh, sorry about that. I forgot to apply --patience on this last resend.
That diff should be just a sequence of 9k '-' lines and 9k '+' lines.

I'll try to split it up, let's see how it goes, the ARMCPRegInfo arrays
are huge, they might end up pulling everything with them.


