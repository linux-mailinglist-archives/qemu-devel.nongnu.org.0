Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE27652686
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 19:47:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7hd9-00055K-Co; Tue, 20 Dec 2022 13:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p7hd0-00051Y-9P; Tue, 20 Dec 2022 13:46:14 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p7hcs-0002x6-Ne; Tue, 20 Dec 2022 13:46:10 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 901D076AD7;
 Tue, 20 Dec 2022 18:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671561962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZTO6pa7qaHpP6piL1fH0HXlYhosk9HC3Rfh+1xK3aNY=;
 b=ymFWm29H47AuPPYFsa7KhGixI3R4KkT3FrWBv95WYNU4zYtSWE4eZ4Q5CcEEV0lHTI9tec
 V/n81SnTpTM58mVQy1UBxdlcer4jI411OmvoRt2jKzRPxDmPmLWulOuVHpxDDYoQCiz81h
 XbYO9zyOg7yVSRk2vsg5iq3wqoLg7Jo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671561962;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZTO6pa7qaHpP6piL1fH0HXlYhosk9HC3Rfh+1xK3aNY=;
 b=XkUixFaNB/K5bsn8ztc7QEpU/wQd3bI73FROOHb1pbvBeEuvE2M2AEvGONomNQkw2nU7ct
 5CICtLNqCh+bKVDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 15C531390E;
 Tue, 20 Dec 2022 18:46:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id A+4SM+kComMNLQAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 20 Dec 2022 18:46:01 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>, Stefan Hajnoczi
 <stefanha@redhat.com>
Subject: Re: [PATCH] block/io: Check for replay-enabled in
 bdrv_drain_all_begin()
In-Reply-To: <20221220174638.2156308-1-peter.maydell@linaro.org>
References: <20221220174638.2156308-1-peter.maydell@linaro.org>
Date: Tue, 20 Dec 2022 15:45:59 -0300
Message-ID: <873599syl4.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
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

Peter Maydell <peter.maydell@linaro.org> writes:

> In commit da0bd74434 we refactored bdrv_drain_all_begin() to pull out
> the non-polling part into bdrv_drain_all_begin_nopoll().  This change
> broke record-and-replay, because the "return early if replay enabled"
> check is now in the sub-function bdrv_drain_all_begin_nopoll(), and
> so it only causes us to return from that function, and not from the
> calling bdrv_drain_all_begin().
>
> Fix the regression by checking whether replay is enabled in both
> functions.
>
> The breakage and fix can be tested via 'make check-avocado': the
> tests/avocado/reverse_debugging.py:ReverseDebugging_X86_64.test_x86_64_pc
> tests/avocado/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt
> tests were both broken by this.
>
> Fixes: da0bd744344adb1f285 ("block: Factor out bdrv_drain_all_begin_nopoll()")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Tested-by: Fabiano Rosas <farosas@suse.de>

