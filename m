Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4934D698531
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:06:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSO2G-0002qW-JL; Wed, 15 Feb 2023 15:05:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pSO2E-0002q9-Bs
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:05:46 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pSO2C-0006SD-OP
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:05:46 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1FE1F1F8C2;
 Wed, 15 Feb 2023 20:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676491543; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jKwWcNDFTuOl1B8AXpPih4pcldT8z2ZvgqpdcxmDorE=;
 b=J94bHOnCc0v+ZlqOCKhhmokkCZYaH/bEZ0WCJ4PbzdxyVM3SXjnNgM06dg0Sk7GXaSq5ms
 IJhNOw7cHLV375jrQwNvzA+AL2n6rSm/97gD9v2l5uKK0M2q9hJfuH1984+IULhTiukY//
 9QCl19LRZmBf0Gai+AgPw7Xg6xRYn8g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676491543;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jKwWcNDFTuOl1B8AXpPih4pcldT8z2ZvgqpdcxmDorE=;
 b=jgyAtDYCSnEjFb60PLvoDrLErq0FGaSym81UaGho6yYEWQhhjhrft6hF0y9c2bePBmWhjI
 Of3O9DKM7kqKTzAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A05DA134BA;
 Wed, 15 Feb 2023 20:05:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kdYPGhY77WOyFgAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 15 Feb 2023 20:05:42 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini
 <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL v2 0/10] xenpvh
In-Reply-To: <CAFEAcA96Mb5KAdPQrncqh9SM2iRc7aE2f4deoiF_2vChdMF0rw@mail.gmail.com>
References: <alpine.DEB.2.22.394.2302141541100.2025117@ubuntu-linux-20-04-desktop>
 <CAFEAcA96Mb5KAdPQrncqh9SM2iRc7aE2f4deoiF_2vChdMF0rw@mail.gmail.com>
Date: Wed, 15 Feb 2023 17:05:40 -0300
Message-ID: <87bkluelt7.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 14 Feb 2023 at 23:43, Stefano Stabellini <sstabellini@kernel.org>=
 wrote:
>>
>> The following changes since commit 6a50f64ca01d0a7b97f14f069762bfd88160f=
31e:
>>
>>   Merge tag 'pull-request-2023-02-14' of https://gitlab.com/thuth/qemu i=
nto staging (2023-02-14 14:46:10 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/sstabellini/qemu xenpvh2
>>
>> for you to fetch changes up to 86b01d58ca2840bea6e4e7260aad450a660fbd46:
>>
>>   meson.build: enable xenpv machine build for ARM (2023-02-14 15:39:25 -=
0800)
>>
>> ----------------------------------------------------------------
>
> Fails to compile for some configs, eg:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/3775820949
> https://gitlab.com/qemu-project/qemu/-/jobs/3775820984
>
> In file included from ../target/arm/machine.c:6:
> ../target/arm/internals.h:1141:21: error: field =E2=80=98f=E2=80=99 has i=
ncomplete type
> 1141 | CPUTLBEntryFull f;
>

For this to work we'll probably need to cherry-pick some parts of my
disable-tcg series:

https://lore.kernel.org/r/20230213202927.28992-1-farosas@suse.de

For this error specifically, patch 16.

And when the build eventually succeeds we might have make check
issues. We just encountered an analogous problem on an aarch64 host: Xen
brings qemu-system-x86_64 on an aarch64 host and tests fail because
there's no TCG.

