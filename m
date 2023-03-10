Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D93666B406A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 14:30:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pacnt-0008Fu-H0; Fri, 10 Mar 2023 08:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pacnn-0008FZ-KT; Fri, 10 Mar 2023 08:28:55 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pacnl-0001MO-UO; Fri, 10 Mar 2023 08:28:55 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0E87420653;
 Fri, 10 Mar 2023 13:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678454932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2iPqXMUfIsAEqeZcV1a6ZwbIfCpqSP8BIPD4RI9e2so=;
 b=YHhYI9uG371mP1QYPcJ9xVB08b01zdzwhEZqgg3fLAv3e3tvdy5ufIKGmWJ5r31OjUsitA
 krGRXHUqSeSc7L+l6837xTH4wvAvGP8ACglv87nc5f8/jGjU3QQvv7Exz6cfOtJ/TqJeKN
 x2qOxPBR8wmE/4vgPYJFbIGuAs8dVSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678454932;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2iPqXMUfIsAEqeZcV1a6ZwbIfCpqSP8BIPD4RI9e2so=;
 b=D9fy2D2zhNLX58Ton9MXA/MrMybNuLBAIFruMMIiOSyO5V80eQ+MtbYVrl4sDJWzLDciQj
 gI24rWNWBnIjo/Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 90BAC134F7;
 Fri, 10 Mar 2023 13:28:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vSWJFpMwC2TxQAAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 10 Mar 2023 13:28:51 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v8 03/11] target/arm: Move aa32_max_features out of
 cpu_tcg.c
In-Reply-To: <3f660759-b37a-6b9e-3eaa-1f879db5ed48@linaro.org>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-4-farosas@suse.de>
 <3f660759-b37a-6b9e-3eaa-1f879db5ed48@linaro.org>
Date: Fri, 10 Mar 2023 10:28:49 -0300
Message-ID: <87a60kenvy.fsf@suse.de>
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

Richard Henderson <richard.henderson@linaro.org> writes:

> On 3/9/23 12:14, Fabiano Rosas wrote:
>> In preparation to moving the cpu_tcg.c code into a 32-bit, tcg-only
>> file, move the aa32_max_features function which is shared between
>> 32/64/tcg/non-tcg into cpu.c.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   target/arm/cpu.c     | 69 ++++++++++++++++++++++++++++++++++++++++++++
>>   target/arm/cpu_tcg.c | 69 --------------------------------------------
>>   2 files changed, 69 insertions(+), 69 deletions(-)
>
> I'm not keen on this, as it's completely tcg.
>
> Perhaps it would be better to let -cpu max devolve to aarch64_a57_initfn when tcg is not 
> available (i.e. qtest_enabled())?  Move all of the tcg stuff out of aarch64_max_initfn 
> into tcg/cpu64.c.
>
> Thoughts?
>

That's what I had in v6. I would prefer it that way as well. Perhaps I
was too quick in changing it.

https://lore.kernel.org/all/20230217201150.22032-20-farosas@suse.de/

Unless anyone says otherwise, I'll revert back to that state.

