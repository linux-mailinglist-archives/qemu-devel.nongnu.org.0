Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF3667212F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 16:24:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIAIV-0008Kb-Kk; Wed, 18 Jan 2023 10:24:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pIAIU-0008KT-9n
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 10:24:18 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pIAIS-00033J-T1
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 10:24:18 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C965921D19;
 Wed, 18 Jan 2023 15:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674055455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=flglQNCSAF55dqGPq1jltS8Dc/eqoEPW0inuA3zKEgk=;
 b=aPi03N/QsszU4zaFiQ323BK5iOaRXx1W5ESUnOTDgUYqCbc8SkhUPwrACtG1E3dCVD7puF
 UQkiHzwGp4GABE/cvJo5N7cHKOyROT2b6jOemhtzKFxN6plTuHnhiSt+PLoxdtvZ3JjTer
 gHOReQAeZudPYQTeByd9cFPXH++N+Jg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674055455;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=flglQNCSAF55dqGPq1jltS8Dc/eqoEPW0inuA3zKEgk=;
 b=Pk2IZXGKYd8/K9GnyPYKJT1QBPtBBRAL6PN2o2zXGNX8CnqeRafJ3YaV+dtDo/aQgvSlmL
 yXmqVcStruop4VBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A0C4139D2;
 Wed, 18 Jan 2023 15:24:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iKFOCR8PyGO6BQAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 15:24:15 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Cleber Rosa
 <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 1/3] avocado_qemu: enhance CANCEL message in
 QemuBaseTest:setUp()
In-Reply-To: <20230118124348.364771-2-dbarboza@ventanamicro.com>
References: <20230118124348.364771-1-dbarboza@ventanamicro.com>
 <20230118124348.364771-2-dbarboza@ventanamicro.com>
Date: Wed, 18 Jan 2023 12:24:12 -0300
Message-ID: <878rhzdfxf.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
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

Daniel Henrique Barboza <dbarboza@ventanamicro.com> writes:

> Trying to run 'make check-avocado' while having only non-x86_64 QEMU
> binaries built, in a x86_64 host machine, will give us the following
> cancel message:
>
> "CANCEL: No QEMU binary defined or found in the build tree"
>
> Which is not quite what's happening here. Avocado defaults to the host
> arch for every arch-agnostic test, and in the case mentioned above it
> cancelled the test because there were no qemu-system-x86_64 binary to be
> found.
>
> Change pick_default_qemu_bin() to return a (qemu_bin, arch) tuple, then
> use 'arch' in the CANCEL message. This will make the error more
> informative:
>
> "CANCEL: No QEMU binary defined or found in the build tree for arch x86_64"
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Fabiano Rosas <farosas@suse.de>

