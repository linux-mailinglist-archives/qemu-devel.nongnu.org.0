Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D00B672A7E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 22:29:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIFyf-0006uq-KR; Wed, 18 Jan 2023 16:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIFyb-0006ti-4o; Wed, 18 Jan 2023 16:28:09 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIFyZ-0008M5-6w; Wed, 18 Jan 2023 16:28:08 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F1A6B5C362;
 Wed, 18 Jan 2023 21:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674077284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0BSc5p7bKJXViDI3RVXRkdjdywP5P+IzvQ5qhCGuF4I=;
 b=zTMoAHVUaBWisdS6w3eu0KIByeCOKJKBJiPAyPm0Bkhxpw+b87kZX53qCGfOw0pZusmj8k
 0zkS/sLTdZGS3CNaQtAASkW1Hpmq7Hj6GGvCLEUKixmuAiQZxSa0AzB6FnqWaN/u/nzLYo
 oWNuSmGu9MfcC/clu2HHXfFff/OieWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674077284;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0BSc5p7bKJXViDI3RVXRkdjdywP5P+IzvQ5qhCGuF4I=;
 b=7NCheuY3ho43BppRhaQI0Mc2P350ih+pXaEVrVAiRRi8ozW+CfIjXeFCnkUPMQ5scRm/4X
 EPGto05UlKlU2gCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81199139D2;
 Wed, 18 Jan 2023 21:28:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id riK0EmRkyGP+NwAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 21:28:04 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
In-Reply-To: <9c740b33-240b-b4f0-82a1-cc01ad886edc@linaro.org>
References: <20230118193518.26433-1-farosas@suse.de>
 <9c740b33-240b-b4f0-82a1-cc01ad886edc@linaro.org>
Date: Wed, 18 Jan 2023 18:28:02 -0300
Message-ID: <871qnrcz31.fsf@suse.de>
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

> Hi Fabiano,
>
> On 18/1/23 20:34, Fabiano Rosas wrote:
>> These are the already reviewed patches from the first half of my
>> previous series:
>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>=20
>> This unbreaks the --disable-tcg build, but there are issues in runtime
>> that are still being hashed out in the other series.
>>=20
>> For the build _with_ TCG, this should behave the same as master.
>>=20
>> Based on Richard's "target/arm: Introduce aarch64_set_svcr":
>> https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@lina=
ro.org
>
> $ git am=20
> 20230111_richard_henderson_target_arm_introduce_aarch64_set_svcr.mbx
> Applying: target/arm: Introduce aarch64_set_svcr
> $ git am ./20230118_farosas_target_arm_config_tcg_n_part_1.mbx
> Applying: target/arm: rename handle_semihosting to tcg_handle_semihosting
> Applying: target/arm: wrap psci call with tcg_enabled
> Applying: target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
> Applying: target/arm: Move PC alignment check
> Applying: target/arm: Move cpregs code out of cpu.h
> Applying: target/arm: Move define_debug_regs() to cpregs.c
> error: target/arm/cpregs.c: does not exist in index
> Patch failed at 0006 target/arm: Move define_debug_regs() to cpregs.c
>
> I am based on commit 7ec8aeb604 ("Merge tag 'pull-tpm-2023-01-17-1' of=20
> https://github.com/stefanberger/qemu-tpm into staging"), what am I missin=
g?

How did you fetch the series? You are missing patch 06. Maybe it is too
big for the method you used?

