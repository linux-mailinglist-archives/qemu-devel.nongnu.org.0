Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8EC66E67F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 20:01:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHrCG-0001Gv-VG; Tue, 17 Jan 2023 14:00:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pHrCA-0001GK-3r; Tue, 17 Jan 2023 14:00:31 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pHrC8-0003Ua-Ei; Tue, 17 Jan 2023 14:00:29 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 338BE1FF0D;
 Tue, 17 Jan 2023 19:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673982026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tytMECktt2q8IMOwV1IDHPfg1Wk4gHqp+asVqAXJr4o=;
 b=Lb11nkLOzJWT4dWlNhLo0qNHdxmPOgqJ4TG8JLbKd9pm/hMF7XYGNsg/fTaYwVc5g9REeO
 9r9ghlDdqBn5YpNSEjhm1NogRxXzAfR1Kq4pBeO0MnWv0cNmFiGsyJkuhGyKveG+7lJciE
 AaQ1nbxRd9h5VOuR2Lsw/UmuXSbB9Y8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673982026;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tytMECktt2q8IMOwV1IDHPfg1Wk4gHqp+asVqAXJr4o=;
 b=fM5yOdV24ZCMhTHVuVPU9fDZ1rLxcbCypsYXgqpECmtwXOJOVPdWEaOKy7EB5t/ejbM0Cp
 kMcUPHDS0gXf7sBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B6F711390C;
 Tue, 17 Jan 2023 19:00:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MC8XIEnwxmMIOgAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 17 Jan 2023 19:00:25 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>
Subject: Re: [RFC PATCH v3 12/28] target/arm: Wrap arm_rebuild_hflags calls
 with tcg_enabled
In-Reply-To: <0a3720ef-fbc4-2be8-14b6-2906117f9fe6@linaro.org>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-13-farosas@suse.de>
 <0a3720ef-fbc4-2be8-14b6-2906117f9fe6@linaro.org>
Date: Tue, 17 Jan 2023 16:00:23 -0300
Message-ID: <87edrt0ywo.fsf@suse.de>
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 13/1/23 15:04, Fabiano Rosas wrote:
>> This is in preparation to moving the hflags code into its own file
>> under the tcg/ directory.
>>=20
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>> I extracted these into a separate patch so we can discuss. If I move
>> the tcg_enabled check to a header that would add overhead for all the
>> calls where we know for sure that the code is running with TCG. And I
>> don't think we want a new arm_rebuild_hflags_foo to be used for common
>> code.
>> ---
>>   hw/arm/boot.c             |  6 +++++-
>>   hw/intc/armv7m_nvic.c     | 20 +++++++++++++-------
>>   target/arm/arm-powerctl.c |  7 +++++--
>>   target/arm/cpregs.c       |  2 +-
>>   target/arm/cpu.c          |  3 ++-
>>   target/arm/helper.c       | 16 ++++++++++++----
>>   target/arm/machine.c      |  5 ++++-
>>   7 files changed, 42 insertions(+), 17 deletions(-)
>
> Shouldn't we also restrict arm_rebuild_hflags() to CONFIG_TCG in
> target/arm/cpu.h (to be sure future code using this helper stays
> TCG-only)?

We could, but in practice hflags.c is already under CONFIG_TCG
anyway. If people don't build with disable-tcg they will not notice.

