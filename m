Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE700338596
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 06:55:52 +0100 (CET)
Received: from localhost ([::1]:36870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKam7-0007zx-5f
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 00:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKak3-0006lc-97
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 00:53:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKak1-00081q-82
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 00:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615528419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lkPdMs3gW63TryGGFO98QH3i4WpZFx+UEfNPPLaA9Nk=;
 b=H7g3O8oqWNsPa4qYQvHwfJsSx9z4OCOcBbXpTEZl44ddQqbkvY6/NTn27gRYrmhb+/bbG1
 yERvsJQ0aoT1M76Q5ZquRh/GxFbS8gS6bX9hlint+i49tOL6ZsRMW9tujD9KuCMC4QzTLS
 y5H7RcTvWh3/mNHDXlKTrOdjiwRKgcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-Lo4un77jPkOvjgGIZnEeSw-1; Fri, 12 Mar 2021 00:53:37 -0500
X-MC-Unique: Lo4un77jPkOvjgGIZnEeSw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49A55192D785;
 Fri, 12 Mar 2021 05:53:36 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CA4860C5D;
 Fri, 12 Mar 2021 05:53:33 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] tests/qtest: Add test for Aspeed HACE
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Laurent Vivier <lvivier@redhat.com>
References: <20210311234726.437676-1-joel@jms.id.au>
 <20210311234726.437676-4-joel@jms.id.au>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ee8d96c5-fc66-79f5-7ac7-f3bb443eb724@redhat.com>
Date: Fri, 12 Mar 2021 06:53:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311234726.437676-4-joel@jms.id.au>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/2021 00.47, Joel Stanley wrote:
> This adds a test for the Aspeed Hash and Crypto (HACE) engine. It tests
> the currently implemented behavior of the hash functionality.
> 
> The tests are similar, but are cut/pasted instead of broken out into a
> common function so the assert machinery produces useful output when a
> test fails.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   tests/qtest/aspeed_hace-test.c | 215 +++++++++++++++++++++++++++++++++
>   MAINTAINERS                    |   1 +
>   tests/qtest/meson.build        |   3 +
>   3 files changed, 219 insertions(+)
>   create mode 100644 tests/qtest/aspeed_hace-test.c
> 
> diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-test.c
> new file mode 100644
> index 000000000000..52501ee37afb
> --- /dev/null
> +++ b/tests/qtest/aspeed_hace-test.c
> @@ -0,0 +1,215 @@
> +/*
> + * QTest testcase for the ASPEED Hash and Crypto Engine
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright 2021 IBM Corp.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "libqtest-single.h"

Bonus points for writing the test without "libqtest-single.h" and using only 
"libqtest.h" instead. We should try to avoid libqtest-single.h in new code 
since such code can not be shared with tests that run multiple instances of 
QEMU. But if it's too cumbersome, I do not insist.

> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 2688e1bfad7f..2eec06b10094 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -156,12 +156,15 @@ qtests_npcm7xx = \
>      'npcm7xx_timer-test',
>      'npcm7xx_watchdog_timer-test'] + \
>      (slirp.found() ? ['npcm7xx_emc-test'] : [])
> +qtests_aspeed = \
> +  ['aspeed_hace-test']

Do you plan to add more aspeed tests later? If not, I think you could simply 
do it without this variable and use ['aspeed_hace-test'] below.

>   qtests_arm = \
>     (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-dualtimer-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_CMSDK_APB_WATCHDOG') ? ['cmsdk-apb-watchdog-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
> +  (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed : []) + \
>     (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
>     ['arm-cpu-features',
>      'microbit-test',
> 

  Thomas


