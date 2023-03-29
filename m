Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA6C6CDB56
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 15:58:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phWJs-0004o5-CY; Wed, 29 Mar 2023 09:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1phWJn-0004kz-Rb; Wed, 29 Mar 2023 09:58:28 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1phWJm-0000v4-9K; Wed, 29 Mar 2023 09:58:27 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E6794219E8;
 Wed, 29 Mar 2023 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680098302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=95YmYhA7ki+TZC4T3l9Mr5muPYJroIXUV9t1BWvU/2E=;
 b=Gq+mnb1JfEitGhapUj7FK7mZpU+Xx08N6ihNcNSUmmRhrEDeX5IX5rO3mlbwlg7+x2E5IH
 S5PNjTZ95Wuuag/oVErhHv4XiJueY7Im025nHsobi9VYPOnACPQU+joPtcZp2WowW9YN/O
 2eEzLzNrE6oiUtw11YFEFryaV86S1fw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680098302;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=95YmYhA7ki+TZC4T3l9Mr5muPYJroIXUV9t1BWvU/2E=;
 b=J97+9T98Z6FPs4nNyGEWVKcCxRt8GKLT/wF/YDjGrAUbN4FcJfOOxCZ0HejscxaDkV4zXS
 biE/DhAUdcKuphAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6A9B1138FF;
 Wed, 29 Mar 2023 13:58:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id um1fDP5DJGQoJQAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 29 Mar 2023 13:58:22 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, David Gibson
 <david@gibson.dropbear.id.au>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, qemu-ppc@nongnu.org, Yanan Wang
 <wangyanan55@huawei.com>, David Hildenbrand <david@redhat.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eduardo Habkost
 <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Greg Kurz <groug@kaod.org>,
 kvm@vger.kernel.org, Ilya Leoshkevich <iii@linux.ibm.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Thomas
 Huth <thuth@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Da?=
 =?utf-8?Q?ud=C3=A9?=
 <philmd@linaro.org>, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH-for-8.0 v2 2/3] softmmu/watchpoint: Add missing
 'qemu/error-report.h' include
In-Reply-To: <20230328173117.15226-3-philmd@linaro.org>
References: <20230328173117.15226-1-philmd@linaro.org>
 <20230328173117.15226-3-philmd@linaro.org>
Date: Wed, 29 Mar 2023 10:58:19 -0300
Message-ID: <87sfdny804.fsf@suse.de>
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> cpu_watchpoint_insert() calls error_report() which is declared
> in "qemu/error-report.h". When moving this code in commit 2609ec2868
> ("softmmu: Extract watchpoint API from physmem.c") we neglected to
> include this header. This works so far because it is indirectly
> included by TCG headers -> "qemu/plugin.h" -> "qemu/error-report.h".
>
> Currently cpu_watchpoint_insert() is only built with the TCG
> accelerator. When building it with other ones (or without TCG)
> we get:
>
>   softmmu/watchpoint.c:38:9: error: implicit declaration of function 'err=
or_report' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>         error_report("tried to set invalid watchpoint at %"
>         ^
>
> Include "qemu/error-report.h" in order to fix this for non-TCG
> builds.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>

