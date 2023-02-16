Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6FA699505
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:59:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdrJ-0007a7-Na; Thu, 16 Feb 2023 07:59:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pSdrG-0007Ym-8X
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:59:30 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pSdrE-0008Cz-Jg
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:59:30 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0BEB81FD9F;
 Thu, 16 Feb 2023 12:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676552367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=quJCBr8K1cqAak55jQNxc72yelIgmQ2bgmJA2rjHwCE=;
 b=p/c/etnmazP7/hhi0w1DE7qvQpDQZ2gZy+Q37EPcJz5qZWmFmOWLRKJ6L5eIMSpTbwbNqs
 G9y+tByO1uQANQz/okuWmO/dbGKCw028jiMkCVn1gkyegpmCGEHx3RtelpD5vIWnIqA+wY
 mvQxPlCXqi4QdnEicbTHbxzh7Yezoyg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676552367;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=quJCBr8K1cqAak55jQNxc72yelIgmQ2bgmJA2rjHwCE=;
 b=T00rqlIGxHEOu0ixvy66e48I/VeJhmXJV7xqMeLWpdqvsvVEyNvvyYyFooE1sWilj71V1r
 cxzTCKlvg65rkiDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8FE7613438;
 Thu, 16 Feb 2023 12:59:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xyNVFq4o7mPhTwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 16 Feb 2023 12:59:26 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini
 <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL v2 0/10] xenpvh
In-Reply-To: <CAFEAcA96Mb5KAdPQrncqh9SM2iRc7aE2f4deoiF_2vChdMF0rw@mail.gmail.com>
References: <alpine.DEB.2.22.394.2302141541100.2025117@ubuntu-linux-20-04-desktop>
 <CAFEAcA96Mb5KAdPQrncqh9SM2iRc7aE2f4deoiF_2vChdMF0rw@mail.gmail.com>
Date: Thu, 16 Feb 2023 09:59:24 -0300
Message-ID: <878rgx3gwj.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
>
> This job fails in 'make check':
> https://gitlab.com/qemu-project/qemu/-/jobs/3775821028
>
> qemu-system-aarch64: The -accel and "-machine accel=3D" options are incom=
patible

Here the issue is that we have:

mc->default_machine_opts =3D "accel=3Dxen";

which conflicts with -accel qtest added by the tests.

