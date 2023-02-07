Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BA668E2B1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 22:13:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPVFR-0001lc-Il; Tue, 07 Feb 2023 16:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPVFQ-0001jj-3j
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:11:28 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPVFM-0002MH-2u
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:11:27 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4073E336C9;
 Tue,  7 Feb 2023 21:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675804279; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BhAUyfWBJca4z2X8HqIgFSdFiw1NGeXXc1InewSYriA=;
 b=NhZBDtwL5TVAWuLblkTvJPwqYsKeMTrWwnc+YT7s2lpPig+S0moGKNh8L7aEMJCgVXiVJa
 eDP1dTqzinz1P6+7dCwcnzOCPIXES2OCIlI7qOSApbn3HLItWQzbH1HObyufGOqYK5Yixc
 glLpVqbha6Jo7EIGJnKYkLj1AHw5oyk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675804279;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BhAUyfWBJca4z2X8HqIgFSdFiw1NGeXXc1InewSYriA=;
 b=w+YVzM6BfoNa/gfI9mSuz0Q7PqMLsSUekcSutdp4rE/h5uiLc0Q3So8MXwlxoMjGwzebUS
 mO6cLEJ0vTHJCcBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C1325139ED;
 Tue,  7 Feb 2023 21:11:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wOdJIna+4mPiJwAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 07 Feb 2023 21:11:18 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Anders Roxell
 <anders.roxell@linaro.org>, Cleber Rosa <crosa@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] tests: add LKFT baseline test to avocado
In-Reply-To: <20230207204433.752020-1-alex.bennee@linaro.org>
References: <20230207204433.752020-1-alex.bennee@linaro.org>
Date: Tue, 07 Feb 2023 18:11:16 -0300
Message-ID: <87k00tmb9n.fsf@suse.de>
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

> The Linux Kernel Function Test (LKFT) project uses QEMU to test a wide
> variety of kernel configurations on wide range of our emulated
> platforms. They publish a known good set of images at:
>
>   https://storage.tuxboot.com/
>
> to help with bisecting regressions in either the kernel, firmware or
> QEMU itself. The tests are pretty lightweight as they contain just a
> kernel with a minimal rootfs which boots a lot faster than most of the
> distros. In time they might be persuaded to version there known good
> baselines and we can then enable proper checksums.
>
> Total run time: 140s
>
> Overall coverage rate:
>   lines......: 8.7% (96412 of 1106284 lines)
>   functions..: 10.8% (11515 of 106651 functions)
>   branches...: 8.3% (30685 of 370255 branches)

Cool!

We could maybe use some accel:tcg tags.

Reviewed-by: Fabiano Rosas <farosas@suse.de>


