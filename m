Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E59346D61
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:40:48 +0100 (CET)
Received: from localhost ([::1]:57028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOphf-00017W-3L
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <posteuca@mutex.one>)
 id 1lOpgQ-0000RS-2p; Tue, 23 Mar 2021 18:39:30 -0400
Received: from mail.mutex.one ([62.77.152.124]:40356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <posteuca@mutex.one>)
 id 1lOpgO-00058s-IQ; Tue, 23 Mar 2021 18:39:29 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id E558ABF42269;
 Wed, 24 Mar 2021 00:39:24 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2phtxNXJBdfC; Wed, 24 Mar 2021 00:39:24 +0200 (EET)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [109.103.89.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id 72AB3BF4225B;
 Wed, 24 Mar 2021 00:39:24 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1616539164; bh=IJx7G/epgcxZdJVsP5YE9q4AnG8gp1nQZKSg4j79GX4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Ocogb1iB64c3RmBfVGym0vJBcHKcB4LLzV5tnFNS4YU5hNTY3viX6/RLUYdZU+odt
 sR/RMk+HnTK5fsgHy4RJgYJOl4Xfr6QgdCABni/MBYuxUoAUNrrvWvRLmfo62Dl129
 YN5Vtnsgf43uMNhcfU+yloulKvzhHuhA/fVkDSdo=
From: Marian Postevca <posteuca@mutex.one>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 1/1] acpi: Consolidate the handling of OEM ID and OEM
 Table ID fields
In-Reply-To: <20210322184231-mutt-send-email-mst@kernel.org>
References: <20210322215554.24875-1-posteuca@mutex.one>
 <20210322215554.24875-2-posteuca@mutex.one>
 <20210322184231-mutt-send-email-mst@kernel.org>
Date: Wed, 24 Mar 2021 00:39:22 +0200
Message-ID: <87lfadsdet.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=62.77.152.124; envelope-from=posteuca@mutex.one;
 helo=mail.mutex.one
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Michael S. Tsirkin" <mst@redhat.com> writes:

>> +#include "qemu/cutils.h"
>> +
>> +#define ACPI_BUILD_APPNAME6 "BOCHS "
>> +#define ACPI_BUILD_APPNAME8 "BXPC    "
>
> A single user for each of these now ... drop the defines?
>

Unfortunately ACPI_BUILD_APPNAME8 is still used in build_header() in
aml-build.c, and to me it didn't look nice for one to have a define and
the other not, but if you prefer with only ACPI_BUILD_APPNAME8 as a
define, I can do the change.


>> +#define ACPI_INIT_DEFAULT_BUILD_OEM(__bld_oem) do {                     \
>> +        ACPI_INIT_BUILD_OEM(__bld_oem,                                  \
>> +                            ACPI_BUILD_APPNAME6, ACPI_BUILD_APPNAME8);  \
>> +} while (0)
>
> OK but ... why are these macros? Won't inline functions
> work just as well with more type safety?
>

Didn't know what was the attitude in this project to inlined functions
in headers and went with macros. I will change to inlined functions.

