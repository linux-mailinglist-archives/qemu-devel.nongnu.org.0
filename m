Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9624B67212E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 16:24:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIAI6-0008Ir-1N; Wed, 18 Jan 2023 10:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pIAI4-0008Id-9M
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 10:23:52 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pIAI2-0002zh-Kz
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 10:23:52 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4841B3F82A;
 Wed, 18 Jan 2023 15:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674055429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MOUP2mBERBFsFSdh6+B8JqtFs/KcUdzrgT8bfbAFYvs=;
 b=MqjYCEpukcBbo9DJKvYM0wGYX4hREwQfzaM0eRR0dik/kVya35sYCkyNLqbr/3ka+W1x4+
 GiComnwhAVFwW9Uxvh7s+bss92tg8Nzvh9ynurczhHsrUt2lxj6/cnqFDP7UPnK2Q76+Uz
 sOipp6hrjGIZK+6FDCQwP6M6lKDQsxo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674055429;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MOUP2mBERBFsFSdh6+B8JqtFs/KcUdzrgT8bfbAFYvs=;
 b=6V7jYYdc/OYloyWaqmGdU8y+TSybIAwYXq0tO6A1qz8v87XzJGFCGd8s+IBnIg5ECluWMg
 0tMwu97+Vv8yA2AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE101139D2;
 Wed, 18 Jan 2023 15:23:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IG6IJQQPyGNzBQAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 15:23:48 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Cleber Rosa
 <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 2/3] avocado_qemu: add AVOCADO_DEFAULT_ARCH for
 cross-arch tests
In-Reply-To: <20230118124348.364771-3-dbarboza@ventanamicro.com>
References: <20230118124348.364771-1-dbarboza@ventanamicro.com>
 <20230118124348.364771-3-dbarboza@ventanamicro.com>
Date: Wed, 18 Jan 2023 12:23:46 -0300
Message-ID: <87bkmvdfy5.fsf@suse.de>
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

> All avocado tests that are arch agnostic (i.e. does not set an 'arch'
> tag) are run with arch=None in pick_default_qemu_bin(), and then 'arch'
> is set to os.uname()[4], meaning that it will take the arch of the
> running host.
>
> This means that if one compiles QEMU binaries for non-x86 targets on an
> x86 machine, and then run 'make check-avocado', all arch agnostic tests
> will be cancelled because there's no qemu-system-x86_64 to be found.
>
> There is no particular reason to not allow these tests to be run with
> other arch binaries in a x86_64 host. Allow the developer to do it by
> adding a a new env variable called AVOCADO_DEFAULT_ARCH. Any 'arch' that
> is set by this variable will take precedence of setting it via
> os.uname()[4]. We can then run non-x86 binaries tests in a x86_64 host
> as follows:
>
> $ AVOCADO_DEFAULT_ARCH=riscv64 make check-avocado
> (...)
> RESULTS: PASS 11 | ERROR 0 | FAIL 0 | SKIP 1 | WARN 0 | INTERRUPT 0 | CANCEL 0

I don't understand why tags don't solve the problem. We
are already passing a tag for each target:

ifndef AVOCADO_TAGS
	AVOCADO_CMDLINE_TAGS=$(patsubst %-softmmu,-t arch:%, \
						 $(filter %-softmmu,$(TARGETS)))
else
	AVOCADO_CMDLINE_TAGS=$(addprefix -t , $(AVOCADO_TAGS))
endif

I then tried to tag migration.py with:

    :avocado: tags=arch:x86_64
    :avocado: tags=arch:aarch64

On an x86_64 machine with target-list=x86_64-softmmu,aarch64-softmmu,
only the x86_64 test runs. Even if I remove the x86_64 tag from the
avocado line. Possibly due to the --filter-by-tags-include-empty
options. But I would expect a second run with aarch64, even if it
failed.

If I use only:

    :avocado: tags=arch:riscv

and run:

python3 -m avocado --show=app run -t arch:riscv -t arch:x86_64 --failfast ../tests/avocado/migration.py

Then it complains about the binary, but the x86_64 binary is present! So
it looked at the tag after all:

CANCEL: No QEMU binary defined or found in the build tree for arch riscv
                                                                   ^^^^^

I don't know how to make this work, but I feel there should be a way to
have the framework select the correct test AND pass the correct arch
parameter along. 

