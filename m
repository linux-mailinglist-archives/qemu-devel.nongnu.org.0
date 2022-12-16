Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A4164EE36
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 16:53:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6D14-0000KI-ME; Fri, 16 Dec 2022 10:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1p6D11-0000JX-K7
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:52:52 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1p6D10-0008E5-52
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:52:51 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 963445D17A;
 Fri, 16 Dec 2022 15:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671205968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m6xqDeA7m0jrUqlQ/Wi0u8wPSG9pmp74Annz87D1m/Q=;
 b=Mr74/q6HcHVHjUkii1lPCGI6NQwsyqwcxso1K1GkLJaB4EQR40AGfvFLZH0QMGjCuN4ujc
 fQKfTVwIpvNZY9B0cUBJJJ/xdTXAbHiH5duRXhUhh+FBRXJxJSxu5cSnKfFE8M/LS/Pk28
 MMRP+aaqvY0v9dCdhWquO7iVb3c+OME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671205968;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m6xqDeA7m0jrUqlQ/Wi0u8wPSG9pmp74Annz87D1m/Q=;
 b=73md6mS8LTjlYL3o+XiY6Hg0UzGfgBm+4A5orLe2Yq170D+H9Lm0GlVuQH1IkOGrGy+aFO
 BVKVfCAQc4BcjNDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 20DDB138F0;
 Fri, 16 Dec 2022 15:52:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bTNcNk+UnGNqFgAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 16 Dec 2022 15:52:47 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v1 08/10] gdbstub: move chunk of softmmu functionality
 to own file
In-Reply-To: <20221216112206.3171578-9-alex.bennee@linaro.org>
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
 <20221216112206.3171578-9-alex.bennee@linaro.org>
Date: Fri, 16 Dec 2022 12:52:45 -0300
Message-ID: <87pmcjgxbm.fsf@suse.de>
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

> This is mostly code motion but a number of things needed to be done
> for this minimal patch set:
>
>   - move shared structures to internals.h
>   - convert some helpers to public gdb_ functions (via internals.h)
>   - splitting some functions into user and softmmu versions
>   - fixing a few casting issues to keep softmmu common
>
> More CONFIG_USER_ONLY stuff will be handled in a following patches.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Moving the shared structures and adding the gdb_ prefix could have been
in separate patches. This one got a bit noisy.

Reviewed-by: Fabiano Rosas <farosas@suse.de>

