Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C9532D19D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 12:16:25 +0100 (CET)
Received: from localhost ([::1]:34850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHlxw-0004CW-U2
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 06:16:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lHlvO-0002on-MP; Thu, 04 Mar 2021 06:13:46 -0500
Received: from mx2.suse.de ([195.135.220.15]:35238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lHlvJ-0002Bc-Qd; Thu, 04 Mar 2021 06:13:46 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7ECD2AE1F;
 Thu,  4 Mar 2021 11:13:39 +0000 (UTC)
Subject: Re: [PATCH 0/9] hw/arm/virt: Improve CPU help and fix testing under
 KVM
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20210205144345.2068758-1-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <0b4ebd66-fb40-f2fc-6295-ab8b9faa29c2@suse.de>
Date: Thu, 4 Mar 2021 12:13:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210205144345.2068758-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/5/21 3:43 PM, Philippe Mathieu-Daudé wrote:
> Yet again bugfixes and cleanup patches noticed while
> rebasing my "Support disabling TCG on ARM (part 2)" series.
> 
> Sending them independently as they aren't directly dependent
> of it so don't have to be delayed by other unanswered questions.
> 
> Please review,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (9):
>   tests/qtest/arm-cpu-features: Remove Cortex-A15 check
>   tests/qtest: Restrict xlnx-can-test to TCG builds
>   tests/qtest/boot-serial-test: Test Virt machine with 'max'
>   tests/qtest/cdrom-test: Only allow the Virt machine under KVM
>   hw/arm/virt: Improve CPU name in help message
>   hw/arm/virt: Display list of valid CPUs for the Virt machine
>   hw/arm/virt: Do not include 64-bit CPUs in 32-bit build
>   hw/arm/virt: Restrict 32-bit CPUs to TCG
>   tests/qtest/arm-cpu-features: Restrict TCG-only tests
> 
>  hw/arm/virt.c                  | 20 +++++++++++++++++-
>  tests/qtest/arm-cpu-features.c | 37 ++++++++++++++++++++++++++--------
>  tests/qtest/boot-serial-test.c |  2 +-
>  tests/qtest/cdrom-test.c       |  5 ++++-
>  tests/qtest/meson.build        |  2 +-
>  5 files changed, 54 insertions(+), 12 deletions(-)
> 

Hi Philippe, Markus,

I encountered an issue where device-introspect-test.c gets me a qemu-system-aarch64 launched as:

./qemu-system-aarch64 -qtest ... -display none -nodefaults -machine none -accel qtest

and results in an attempt to create a device "ast2400-a1",
which tries to create a arm926-arm-cpu, which fails because it is a "TCG" cpu, that is not built in my kvm-only build.

Any ideas why this happens?

Thanks,

Claudio

