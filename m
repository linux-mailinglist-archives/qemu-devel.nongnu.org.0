Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0086675CD
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:25:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyS0-0004Ob-Nq; Thu, 12 Jan 2023 09:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pFyRi-0004D4-4P; Thu, 12 Jan 2023 09:20:53 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pFyRe-0000ld-4p; Thu, 12 Jan 2023 09:20:45 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1594A3FCDC;
 Thu, 12 Jan 2023 14:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673533239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxXfMXOpCp0KR4sM5jvrXtqvji1351aoBaDwEPM+BIw=;
 b=Kji9ngYhSIgvhQnLsoWwz/KnPZGz1ZM26IhmPtwIqTbshJO4NuWPSKx5niIPPfqgflnlLl
 1fcEwaJAvj3tG/K9i1+5O8SqpCK0Dl5ZXAJL8PLos5wseNecGTqtxbr+7NltYboPAUkkfP
 Pg5Dw7Kg5fN/EQZNJA9ixu9r+4ja0a0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673533239;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxXfMXOpCp0KR4sM5jvrXtqvji1351aoBaDwEPM+BIw=;
 b=GUdlZudB7V84fYQmEcSp3sjP0tconCtMtWFMDoqJx7TSHUR0NdZdSXUjQLrdoNT7+P7X+Y
 hXi4fyIIGJwABrBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9469F13585;
 Thu, 12 Jan 2023 14:20:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vSkOFzYXwGPxAQAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 12 Jan 2023 14:20:38 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathi?=
 =?utf-8?Q?eu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 0/7] target/arm: Introduce aarch64_set_svcr
In-Reply-To: <20230112102436.1913-1-philmd@linaro.org>
References: <20230112102436.1913-1-philmd@linaro.org>
Date: Thu, 12 Jan 2023 11:20:36 -0300
Message-ID: <87ilhbhm17.fsf@suse.de>
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

> This is a respin of Richard's patch
> https://lore.kernel.org/qemu-devel/20230112004322.161330-1-richard.hender=
son@linaro.org/
> but split in multiple trivial changes, as I was having hard
> time to understand all changes at once while reviewing it.
>
> Richard Henderson (7):
>   target/arm/sme: Reorg SME access handling in handle_msr_i()
>   target/arm/sme: Rebuild hflags in set_pstate() helpers
>   target/arm/sme: Introduce aarch64_set_svcr()
>   target/arm/sme: Reset SVE state in aarch64_set_svcr()
>   target/arm/sme: Reset ZA state in aarch64_set_svcr()
>   target/arm/sme: Rebuild hflags in aarch64_set_svcr()
>   target/arm/sme: Unify set_pstate() SM/ZA helpers as set_svcr()
>
>  linux-user/aarch64/cpu_loop.c | 11 ++--------
>  linux-user/aarch64/signal.c   | 13 ++---------
>  target/arm/cpu.h              |  2 +-
>  target/arm/helper-sme.h       |  3 +--
>  target/arm/helper.c           | 41 ++++++++++++++++++++++++++++++++---
>  target/arm/sme_helper.c       | 37 ++-----------------------------
>  target/arm/translate-a64.c    | 19 ++++++----------
>  7 files changed, 53 insertions(+), 73 deletions(-)

Reviewed-by: Fabiano Rosas <farosas@suse.de>

