Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107976721A1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 16:44:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIAaW-0000bF-E8; Wed, 18 Jan 2023 10:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pIAaU-0000al-Hc
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 10:42:54 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pIAaS-0006Q0-Uo
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 10:42:54 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AE6973EBB4;
 Wed, 18 Jan 2023 15:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674056570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vm74NZ3R6ehdTfGA8vJRiBkObwViV6g20iEiRS7+1pg=;
 b=fOfK42PrCDK0b2BCoR3mUtbcxNtz0HVDRAhHgnUa+QWDZ5ol5n0sOR0n8pwSPnLehyYBFZ
 ATR9PkbxwU/dbLzVjjottGEfzvTguGo3f4J5LXYB/bZuFVjTe4mMPWUG5hy8yYKzHFbPhk
 FVzYFvuKVejIdnnzBARxx/YEZDlofb0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674056570;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vm74NZ3R6ehdTfGA8vJRiBkObwViV6g20iEiRS7+1pg=;
 b=urQ6ON5hqFPngo9cpyVq/G+e2+H8qG+gP10JN4clwQ2s44h/6CHeurf2IzaYluAnHrYx+J
 0CsGkw1D9lPUPWAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 35C90139D2;
 Wed, 18 Jan 2023 15:42:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qsULO3kTyGMVEAAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 15:42:49 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Cleber Rosa
 <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 3/3] avocado_qemu: add AVOCADO_DEFAULT_MACHINE
In-Reply-To: <20230118124348.364771-4-dbarboza@ventanamicro.com>
References: <20230118124348.364771-1-dbarboza@ventanamicro.com>
 <20230118124348.364771-4-dbarboza@ventanamicro.com>
Date: Wed, 18 Jan 2023 12:42:47 -0300
Message-ID: <874jsndf2g.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
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

Daniel Henrique Barboza <dbarboza@ventanamicro.com> writes:

> Allow users to control which machine to use in tests where no particular
> machine is specified. This is a good way to run tests in a machine
> that's not the arch default, e.g. for qemu-system-x86_64 tests can be
> run using a machine other than pc-i440fx.
>
> This env var has greater effect when used together with the recently
> added AVOCADO_DEFAULT_ARCH, allowing full control of what the tests
> should use if no default arch/machine is given. In this example, a
> check-avocado run will use the RISC-V 'virt' machine if no default
> arch/machine is set:
>
> AVOCADO_DEFAULT_ARCH=riscv64 AVOCADO_DEFAULT_MACHINE=virt make check-avocado
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  docs/devel/testing.rst                 | 8 +++++---
>  tests/avocado/avocado_qemu/__init__.py | 3 +++
>  2 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 95d0a3e626..128b6ae964 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -1178,9 +1178,11 @@ The machine type that will be set to all QEMUMachine instances created
>  by the test.
>  
>  The ``machine`` attribute will be set to the test parameter of the same
> -name.  If one is not given explicitly, it will either be set to
> -``None``, or, if the test is tagged with one (and only one)
> -``:avocado: tags=machine:VALUE`` tag, it will be set to ``VALUE``.
> +name.  If one is not given explicitly, an env variable
> +AVOCADO_DEFAULT_MACHINE can be used as default value if set.  Otherwise
> +it will either be set to ``None``, or, if the test is tagged with one
> +(and only one) ``:avocado: tags=machine:VALUE`` tag, it will be set to
> +``VALUE``.
>  
>  qemu_bin
>  ''''''''
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> index bc42985cbb..75eaaa9265 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -282,6 +282,9 @@ def setUp(self):
>          self.machine = self.params.get('machine',
>                                         default=self._get_unique_tag_val('machine'))
>  

Would it work for you to replicate the AVOCADO_CMDLINE_TAGS behavior?

In Makefile.include:

ifdef AVOCADO_PARAMS
	AVOCADO_CMDLINE_PARAMS=$(addprefix -p , $(AVOCADO_PARAMS))
endif

make V=1 check-avocado AVOCADO_PARAMS=machine=foo AVOCADO_TESTS=../tests/avocado/migration.py

Results in:

./qemu-system-x86_64 -display none -vga none ... -machine foo

