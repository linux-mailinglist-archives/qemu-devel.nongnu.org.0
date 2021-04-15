Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C06360999
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 14:39:52 +0200 (CEST)
Received: from localhost ([::1]:52804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1Hj-0005f2-8F
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 08:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lX18S-000601-53; Thu, 15 Apr 2021 08:30:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:33138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lX18K-0007cf-3o; Thu, 15 Apr 2021 08:30:15 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2F1FAE56;
 Thu, 15 Apr 2021 12:30:03 +0000 (UTC)
Subject: Re: [PATCH v3 0/6] qtests: Check accelerator available at runtime via
 QMP 'query-accels'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210415122633.4054644-1-philmd@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <7be73164-ab1f-f4c7-f80c-3305a71761a9@suse.de>
Date: Thu, 15 Apr 2021 14:30:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210415122633.4054644-1-philmd@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

does the tests/qtest/arm-cpu-features.c kvm_enabled() function need to be replaced by the use of this new command?

Maybe something to add to the series?

The use of "kvm_enabled()" in this function is particularly confused, because it matches the sysemu/kvm.h function name with completely different meaning.

Ciao,

CLaudio

On 4/15/21 2:26 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series aims at having accelerator-independent qtests
> by querying a QEMU instance at runtime to check the list
> of built-in accelerators.
> 
> First we add the 'query-accels' QMP command,
> then we add the qtest_has_accel() method to libqtest,
> finally we use this new method to allow running
> bios-tables-test on KVM-only builds.
> 
> As a bonus we remove CONFIG_TCG in config_host, to avoid
> building unnecessary objects depending on TCG.
> 
> Missing review:
> - #4 qtest/qmp-cmd-test: Make test build-independent from accelerator
> - #6 tests/meson: Only build softfloat objects if TCG is selected
> 
> Since v2:
> - Addressed Eric & Paolo review comments
> 
> Since v1:
> - kept over-engineered union (I don't how to do simple enum)
> - dropped arm-cpu-features patches for now
> - fixed typos (Eric)
> - rename qtest_has_accel (Thomas)
> - probe accel with machine none previous qtest (Paolo)
> - iterate over QAPI enum (Markus)
> 
> Eric's suggestion of conditional QAPI didn't worked out,
> as accelerator definitions are poisoned.
> 
> Please review,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (6):
>   accel: Introduce 'query-accels' QMP command
>   tests/qtest: Add qtest_has_accel() method
>   qtest/bios-tables-test: Make test build-independent from accelerator
>   qtest/qmp-cmd-test: Make test build-independent from accelerator
>   tests/qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore
>   tests/meson: Only build softfloat objects if TCG is selected
> 
>  meson.build                    |  1 -
>  qapi/machine.json              | 49 +++++++++++++++++
>  tests/qtest/libqos/libqtest.h  |  8 +++
>  accel/accel-qmp.c              | 49 +++++++++++++++++
>  tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------
>  tests/qtest/libqtest.c         | 29 ++++++++++
>  tests/qtest/qmp-cmd-test.c     | 18 +++++--
>  accel/meson.build              |  2 +-
>  tests/qtest/meson.build        |  3 +-
>  9 files changed, 203 insertions(+), 55 deletions(-)
>  create mode 100644 accel/accel-qmp.c
> 


