Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD5B6F067F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 15:18:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps1Ud-0006zO-KN; Thu, 27 Apr 2023 09:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ps1UX-0006yp-6J; Thu, 27 Apr 2023 09:16:57 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ps1UV-0002Dp-Dj; Thu, 27 Apr 2023 09:16:56 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4CD8821B34;
 Thu, 27 Apr 2023 13:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682601411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MX6UVE4mjzxG9yyliZyZZXDI0qRbdsD1I4FO143MM78=;
 b=z36CFUnj8VFVgi37lLzTYRvr+6OjlKh8Og7SEhuI6LmproqH01NMl89QGSpCnQRu3NCwlr
 Yljtf02M6z26IPjDongNyx+WP1Dx+ef4aUnSkOkpkYkktExOGZc7+NlfTq7+oozMC3xtAG
 XJTwPbbwB5luY+/M2W6stf1RcoY/Mpo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682601411;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MX6UVE4mjzxG9yyliZyZZXDI0qRbdsD1I4FO143MM78=;
 b=E0DzPQk6dGBGxxtCS3ZwVfi7ZmeP03GaNSMnAtFlNBHs9sKOJCayKYey2+siNfJjbtRvlJ
 5GxSNLNo8zq7/wBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C4453138F9;
 Thu, 27 Apr 2023 13:16:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KjPxIcJ1SmSDcAAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 27 Apr 2023 13:16:50 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v11 06/13] tests/qtest: Adjust and document
 query-cpu-model-expansion test for arm
In-Reply-To: <c2853e95-2aec-246a-5846-d91d40329c61@linaro.org>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-7-farosas@suse.de>
 <c2853e95-2aec-246a-5846-d91d40329c61@linaro.org>
Date: Thu, 27 Apr 2023 10:16:48 -0300
Message-ID: <87a5ytpirj.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/26/23 19:00, Fabiano Rosas wrote:
>> We're about to move the 32-bit CPUs under CONFIG_TCG, so adjust the
>> query-cpu-model-expansion test to check against the cortex-a7, which
>> is already under CONFIG_TCG. That allows the next patch to contain
>> only code movement.
>>=20
>> While here add comments clarifying what we're testing.
>>=20
>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
>> Suggested-by: Philippe Mathieu-Daud=C3=A9<philmd@linaro.org>
>> ---
>>   tests/qtest/arm-cpu-features.c | 20 +++++++++++++++++---
>>   1 file changed, 17 insertions(+), 3 deletions(-)
>
> I don't see why you're changing the cpu model here.
> Neither cpu will work, of course, but why change?
>

Because there's already a patch in master that puts the cortex-a7 under
CONFIG_TCG, so I can have the whole if/else in this patch.

If I keep the cortex-a15, this change needs to go into the next patch
("move cpu_tcg to tcg/cpu32.c") which moves the rest of the 32bit cpus,
which was supposed to be only code movement.

