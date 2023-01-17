Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C09366E67B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 19:57:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHr7Q-000066-Ro; Tue, 17 Jan 2023 13:55:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pHr7N-00005u-Vw; Tue, 17 Jan 2023 13:55:34 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pHr7I-0002ka-MZ; Tue, 17 Jan 2023 13:55:33 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 256B11FF3D;
 Tue, 17 Jan 2023 18:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673981724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dZv+jTHc+XmPDQ3MR441gXG/YLreUAMyp4/Uz9nuK/I=;
 b=FArfxiRcCP2TEC7co3pL1n9jvAjmZ9G1G68/OVMq4kNJduHxeHXIe/WAz6cMwsHkxymTGT
 Fbzjw2usV/KsZ+LIRGm3x1qWe6+cgH3bVjk6Hr1dnPbuqE6QF6ovy6I6j2vFDguJdy1KLs
 lSj6BUQAVuB6dW7KDKdU4gdQK/tOnyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673981724;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dZv+jTHc+XmPDQ3MR441gXG/YLreUAMyp4/Uz9nuK/I=;
 b=FGFsL8iqR7Gy0WR+3SlQuf1CR+NyVvvCzfs9sTOxUXLfKwCxHDpu2cmQ1xhPxbEWjlDzzV
 Xtfe2LkSUHwvycDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4C251390C;
 Tue, 17 Jan 2023 18:55:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8l+BGxvvxmOoNwAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 17 Jan 2023 18:55:23 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>
Subject: Re: [RFC PATCH v3 10/28] target/arm: move helpers to tcg/
In-Reply-To: <7d47f4df-1a14-d448-f8df-9c31dc2ee371@linaro.org>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-11-farosas@suse.de>
 <7d47f4df-1a14-d448-f8df-9c31dc2ee371@linaro.org>
Date: Tue, 17 Jan 2023 15:55:21 -0300
Message-ID: <87h6wp0z52.fsf@suse.de>
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 13/1/23 15:04, Fabiano Rosas wrote:
>> From: Claudio Fontana <cfontana@suse.de>
>>=20
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>
>> ---
>>   target/arm/meson.build               | 16 ++--------------
>>   target/arm/tcg-stubs.c               | 23 +++++++++++++++++++++++
>>   target/arm/{ =3D> tcg}/crypto_helper.c |  0
>>   target/arm/{ =3D> tcg}/debug_helper.c  |  0
>>   target/arm/{ =3D> tcg}/helper-a64.c    |  0
>>   target/arm/{ =3D> tcg}/iwmmxt_helper.c |  0
>>   target/arm/{ =3D> tcg}/m_helper.c      |  0
>>   target/arm/tcg/meson.build           | 14 ++++++++++++++
>>   target/arm/{ =3D> tcg}/mte_helper.c    |  0
>>   target/arm/{ =3D> tcg}/mve_helper.c    |  0
>>   target/arm/{ =3D> tcg}/neon_helper.c   |  0
>>   target/arm/{ =3D> tcg}/op_helper.c     |  0
>>   target/arm/{ =3D> tcg}/pauth_helper.c  |  0
>>   target/arm/{ =3D> tcg}/sme_helper.c    |  0
>>   target/arm/{ =3D> tcg}/sve_helper.c    |  0
>>   target/arm/{ =3D> tcg}/tlb_helper.c    |  0
>>   target/arm/{ =3D> tcg}/vec_helper.c    |  0
>>   target/arm/{ =3D> tcg}/vec_internal.h  |  0
>>   18 files changed, 39 insertions(+), 14 deletions(-)
>>   create mode 100644 target/arm/tcg-stubs.c
>>   rename target/arm/{ =3D> tcg}/crypto_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/debug_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/helper-a64.c (100%)
>>   rename target/arm/{ =3D> tcg}/iwmmxt_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/m_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/mte_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/mve_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/neon_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/op_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/pauth_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/sme_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/sve_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/tlb_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/vec_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/vec_internal.h (100%)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
>> +void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndr=
ome,
>> +                        uint32_t target_el, uintptr_t ra)
>> +{
>> +    g_assert_not_reached();
>> +}
>
> Do you have a plan to restrict the calls to raise_exception_ra() to TCG?

Not yet, looks like moving the sdiv and udiv helpers which call
handle_possible_div0_trap would be enough.

