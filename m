Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC6C6DF62F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 14:53:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmZxA-0005mc-P5; Wed, 12 Apr 2023 08:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pmZx8-0005ho-KW
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:51:58 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pmZx6-0001fT-B1
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:51:58 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B5D2421977;
 Wed, 12 Apr 2023 12:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681303914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VoGmIlsqcWdORKcz9FoVFULPzoKHb5NjNQeKmVcafvU=;
 b=JR/bMA+GwKZEzsACqpuP4Wf8MuOlQK+oDSTIhVDIuiCMwiSRpOdRoj5Sx6DmOXsSFPshjm
 Ka2lfN1czFyI8vSpqpdVTYulvpJW3yc/foUuH+tP41J5DoFfxH+VEY3OXw9hI2YPcoYWCr
 veZj6X34Z9SdVYes0e5YJUUf57/hGfs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681303914;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VoGmIlsqcWdORKcz9FoVFULPzoKHb5NjNQeKmVcafvU=;
 b=BZMyoLWjCvmZ+9aDz5x6X+k9CqX5aypGuZvUHO2ffwsSxItR4TDrJ+aCY8NmZgL3m3mCyv
 7aO8HjHldCi4V/Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3AA23132C7;
 Wed, 12 Apr 2023 12:51:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SKu3AGqpNmRpYwAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 12 Apr 2023 12:51:54 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Vikram Garhwal
 <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
 stefano.stabellini@amd.com, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Wainer dos Santos  Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [QEMU][PATCH] gitlab-ci.d/crossbuilds: Drop the '--disable-tcg'
 configuration for xen
In-Reply-To: <877cuhpg1z.fsf@linaro.org>
References: <20230411210422.24255-1-vikram.garhwal@amd.com>
 <877cuhpg1z.fsf@linaro.org>
Date: Wed, 12 Apr 2023 09:51:51 -0300
Message-ID: <87ile1clg8.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Vikram Garhwal <vikram.garhwal@amd.com> writes:
>
>> Xen is supported for aarch64 via xenpvh machine. disable-tcg option fail=
s the
>> build for aarch64 target.
>>
>> Link for xen on arm patch series: https://mail.gnu.org/archive/html/qemu=
-devel/2023-02/msg03979.html
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>  .gitlab-ci.d/crossbuilds.yml | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>> index 61b8ac86ee..6867839248 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -186,7 +186,7 @@ cross-amd64-xen-only:
>>    variables:
>>      IMAGE: debian-amd64-cross
>>      ACCEL: xen
>> -    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
>> +    EXTRA_CONFIGURE_OPTS: --disable-kvm
>
> x86 should handle --disable-tcg fine.
>
>>=20=20
>>  cross-arm64-xen-only:
>>    extends: .cross_accel_build_job
>> @@ -195,4 +195,4 @@ cross-arm64-xen-only:
>>    variables:
>>      IMAGE: debian-arm64-cross
>>      ACCEL: xen
>> -    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
>> +    EXTRA_CONFIGURE_OPTS: --disable-kvm
>
> Currently this builds qemu-system-i386, but with your changes and the
> work Fabiano is doing:
>
>   Message-Id: <20230313151058.19645-1-farosas@suse.de>
>   Date: Mon, 13 Mar 2023 12:10:48 -0300
>   Subject: [PATCH v9 00/10] target/arm: Allow CONFIG_TCG=3Dn builds
>   From: Fabiano Rosas <farosas@suse.de>
>
> We should be able to have a qemu-system-aarch64 supporting Xen without TCG

The build should already be working on current master after Philippe
fixed the gdbstub issues. My remaining patches fix tests and general
runtime issues. I just sent v10 to the list.

