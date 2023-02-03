Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D03368A3A1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 21:37:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO2mU-0005cr-EW; Fri, 03 Feb 2023 15:35:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pO2mR-0005c5-PF; Fri, 03 Feb 2023 15:35:31 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pO2mQ-0003fX-9Q; Fri, 03 Feb 2023 15:35:31 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D98DA5C296;
 Fri,  3 Feb 2023 20:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675456526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t4DQXPc/X5fUbNeg2HxRM2Pr6KA5NGApVuBsRUVLFFg=;
 b=FoimQh3o0l9hGPacNsJI0YN8s/0hEEnFUUJ6MEJ2KjzBud2t/PLUXLKZQau+y93CcxEgF0
 fq/GdXcW4WAToJ/LRM/v0NID85uvhOcbGYSqsX2SrVPz5dMfc8jrHzqNs7qqPK2uLKoZTf
 JDj9dz1e4A9V38px6bZPToLbwqmlb+M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675456526;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t4DQXPc/X5fUbNeg2HxRM2Pr6KA5NGApVuBsRUVLFFg=;
 b=iwd5FgieWBFuIThHoiyNkDo1oBI1EsBXCXUrL6pvCLQBTRChwOHmKxrsWA0dvuHfOagYtl
 YW8XBtxRrr4/+wDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 621211358A;
 Fri,  3 Feb 2023 20:35:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MzR7Cg5w3WMrIgAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 03 Feb 2023 20:35:26 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] tests/avocado: retire the Aarch64 TCG tests from
 boot_linux.py
In-Reply-To: <20230203181632.2919715-1-alex.bennee@linaro.org>
References: <20230203181632.2919715-1-alex.bennee@linaro.org>
Date: Fri, 03 Feb 2023 17:35:23 -0300
Message-ID: <87ilgia3n8.fsf@suse.de>
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> The two TCG tests for GICv2 and GICv3 are very heavy weight distros
> that take a long time to boot up, especially for an --enable-debug
> build. The total code coverage they give is:
>
>   Overall coverage rate:
>     lines......: 11.2% (59584 of 530123 lines)
>     functions..: 15.0% (7436 of 49443 functions)
>     branches...: 6.3% (19273 of 303933 branches)
>
> We already get pretty close to that with the machine_aarch64_virt
> tests which only does one full boot (~120s vs ~600s) of alpine. We
> expand the kernel+initrd boot (~8s) to test both GICs and also add an
> RNG device and a block device to generate a few IRQs and exercise the
> storage layer. With that we get to a coverage of:
>
>   Overall coverage rate:
>     lines......: 11.0% (58121 of 530123 lines)
>     functions..: 14.9% (7343 of 49443 functions)
>     branches...: 6.0% (18269 of 303933 branches)
>
> which I feel is close enough given the massive time saving. If we want
> to target any more sub-systems we can use lighter weight more directed
> tests.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>

