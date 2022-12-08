Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BCC6473B5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 16:59:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3JIY-0007WU-P4; Thu, 08 Dec 2022 10:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p3JIM-0007Vg-FR; Thu, 08 Dec 2022 10:58:46 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p3JIK-0008FC-VT; Thu, 08 Dec 2022 10:58:46 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E6D7022BBE;
 Thu,  8 Dec 2022 15:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670515121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e9SOScxXH7FngR4nroCXALSqtojX7LBnIMJzGT02/F0=;
 b=tRfIS1vA6tfY3J/gm/NyVmspa2C3OJk5fV7/dk7IYzv7WJPkQWdNyqpCS1SAopWR9U+vBw
 h0dsBMhSbT5R6NFRbqFMvJapBMUqhnCSkpziTbCc8c+qJv815jyt/LKqmOG8LM9h2G6Ngd
 TjQDWUtE1Hb14VYiII1B/5h8+nEoXL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670515121;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e9SOScxXH7FngR4nroCXALSqtojX7LBnIMJzGT02/F0=;
 b=6kw5RQ3ql5hb0RguKvs1CLb497VKUn8lUEiC641b65WBz2fIpGfeT1CYPQ8IPSk5Mbnklu
 7x1Qy2QHLxgI2QBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 648D7138E0;
 Thu,  8 Dec 2022 15:58:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EQa3CrEJkmNMGQAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 08 Dec 2022 15:58:41 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>, David
 Gibson <david@gibson.dropbear.id.au>, kvm@vger.kernel.org, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Richard Henderson
 <richard.henderson@linaro.org>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Stafford Horne <shorne@gmail.com>, Anton
 Johansson <anjo@rev.ng>, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, Chris Wulff
 <crwulff@gmail.com>, Yanan Wang <wangyanan55@huawei.com>, Fabiano Rosas
 <farosas@linux.ibm.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Marek Vasut
 <marex@denx.de>, Max Filippov <jcmvbkbc@gmail.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Laurent Vivier <laurent@vivier.eu>, Daniel
 Henrique Barboza <danielhb413@gmail.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Subject: Re: [PATCH-for-8.0 v2 2/4] gdbstub: Use vaddr type for generic
 insert/remove_breakpoint() API
In-Reply-To: <20221208153528.27238-3-philmd@linaro.org>
References: <20221208153528.27238-1-philmd@linaro.org>
 <20221208153528.27238-3-philmd@linaro.org>
Date: Thu, 08 Dec 2022 12:58:38 -0300
Message-ID: <87mt7xubtd.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Both insert/remove_breakpoint() handlers are used in system and
> user emulation. We can not use the 'hwaddr' type on user emulation,
> we have to use 'vaddr' which is defined as "wide enough to contain
> any #target_ulong virtual address".
>
> gdbstub.c doesn't require to include "exec/hwaddr.h" anymore.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>

