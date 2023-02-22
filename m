Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032FC69F4CD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 13:43:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUoQj-0006L0-Ng; Wed, 22 Feb 2023 07:41:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pUoQd-0006Kb-3Z; Wed, 22 Feb 2023 07:40:59 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pUoQb-00071A-81; Wed, 22 Feb 2023 07:40:58 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3BEEE1FFE6;
 Wed, 22 Feb 2023 12:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677069653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=og0oQdXIhFlfhW9gCpkRORQY170hBsTp6ToRrPlfDFw=;
 b=yS96Nv0tvEsfCQj/ukqvMsESXNxpidBM211iGcjj84qE5tzLo7gJn+H9zeWnSXvolltarL
 L/Dw0lW1yL1oQK95ZuAV8JJJEnmk7WLsbiswXPfMx+VGcWGIoEwhYmw+9SRskvYSZrBOaj
 cHhwEBkTRbsK6kPi9IzU5Uc5/sqT5kk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677069653;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=og0oQdXIhFlfhW9gCpkRORQY170hBsTp6ToRrPlfDFw=;
 b=XdscH0RFzD32npQPCSabz22ymdZK2+nE3Sym2Zh2VST8Zh28HMGewTPBlrzy6T5Zo4y2IF
 ZWI+zN/Rvp+AAKAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BF35C133E0;
 Wed, 22 Feb 2023 12:40:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t5AjIlQN9mP2SwAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 22 Feb 2023 12:40:52 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v6 00/29] target/arm: Allow CONFIG_TCG=n builds
In-Reply-To: <CAFEAcA-uk7V+Mspo9uZ5W9P9beYNEdhs-VSuOAD6S=5cqtPGew@mail.gmail.com>
References: <20230217201150.22032-1-farosas@suse.de>
 <CAFEAcA-uk7V+Mspo9uZ5W9P9beYNEdhs-VSuOAD6S=5cqtPGew@mail.gmail.com>
Date: Wed, 22 Feb 2023 09:40:50 -0300
Message-ID: <875ybtootp.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 17 Feb 2023 at 20:13, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> Addressed Peter's comments and dropped the cpregs change which is not
>> related to fixing the --disable-tcg build. This unblocks the xenpvh
>> series and I can tackle the regs split without holding up the build
>> work.
>
> I've applied up to and including
> [PATCH v6 15/29] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
> to target-arm.next, and also
> [PATCH v6 25/29] tests/avocado: add machine:none tag to version.py
> (and some of the rest were already upstream).

Thanks! I had a couple of days off, I'll address the feedback on the
rest of the series right away.

