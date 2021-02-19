Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA92D31F9B5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:17:32 +0100 (CET)
Received: from localhost ([::1]:34646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD5f1-0005NG-Tf
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lD5bG-0003nn-Ja
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:13:38 -0500
Received: from mx2.suse.de ([195.135.220.15]:52896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lD5bE-0006F3-PV
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:13:38 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC5CAABAE;
 Fri, 19 Feb 2021 13:13:34 +0000 (UTC)
Subject: Re: meson, NEED_CPU_H, CONFIG_TCG and tests/
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <eb7d8eca-13ef-07cf-41b4-d7276399fff1@suse.de>
Message-ID: <fe900b5b-3987-e9e7-345c-8df77d430292@suse.de>
Date: Fri, 19 Feb 2021 14:13:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <eb7d8eca-13ef-07cf-41b4-d7276399fff1@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Alex Bennee <alex.bennee@linaro.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 2:04 PM, Claudio Fontana wrote:
> Hi Paolo,
> 
> currently we have use of CONFIG_TCG in tests/,
> 
> but is that variable available at all in there?
> 
> I have to adapt some qemu/tests/qtest/* to work also without tcg for ARM,
> 
> but I think I am not seeing CONFIG_TCG filtering through, and I wonder whether all the checks in there are actually "wrong".
> 
> Looking at meson.build it would seem to me that only stuff in target/ would be able to see CONFIG_TCG,
> as a result of
> 
> foreach target : target_dirs
>   config_target = config_target_mak[target]
>   target_name = config_target['TARGET_NAME']
>   arch = config_target['TARGET_BASE_ARCH']
>   arch_srcs = [config_target_h[target]]
>   arch_deps = []
>   c_args = ['-DNEED_CPU_H',
>             '-DCONFIG_TARGET="@0@-config-target.h"'.format(target),
>             '-DCONFIG_DEVICES="@0@-config-devices.h"'.format(target)]
> 
> But how could tests see this?
> 
> Thanks,
> 
> Claudio
> 

By the way, I think Alex is working around this in the TCG tests in the tests/tcg/Makefile.target:

all:
-include ../../../config-host.mak
-include ../config-$(TARGET).mak

..


In my view we need some solution for at least:

tests/qtest/qmp-cmd-test.c
tests/qtest/boot-serial-test.c
tests/qtest/bios-tables-test.c

which need to behave differently according to whether TCG is available or not (--disable-tcg):

For the specific case at hand that I encountered, reopening the issue, 

I need to make tests/qtest/boot-serial-test.c pass different cpu options for TCG and KVM,
ie "cortex-a57" for TCG, and "host" for KVM.

Wdyt?

Ciao,

Claudio


