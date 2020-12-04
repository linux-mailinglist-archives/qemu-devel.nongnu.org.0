Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6292CF5BB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:39:25 +0100 (CET)
Received: from localhost ([::1]:38844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHrQ-0006Xm-Nn
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:39:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klFNs-00052k-4b
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 13:01:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klFNV-0007kS-6A
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 13:00:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607104813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w5G6pXScbaRxvgKjcxxwPJLQRpReoICKErtTTjGgEco=;
 b=TE3couiDk1byBJN6tlrl1d/pcDE5r44q73cagZ2IetA4TCbStTA3PmjWdPFsw/OrR6FNj+
 6/5EDDUBM2VHzMVUvMfjqw4sNpPNAnOAOWqXCsHKsAlnEuVTExUjSAfm+0Jq75wa1m/Lty
 fBtZJ7pb4qjmp94kNGwISjYoDAwRzjE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-wXCD1rgNNRSogvTX1ABZ-g-1; Fri, 04 Dec 2020 13:00:11 -0500
X-MC-Unique: wXCD1rgNNRSogvTX1ABZ-g-1
Received: by mail-ej1-f69.google.com with SMTP id m11so2344981ejr.20
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 10:00:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w5G6pXScbaRxvgKjcxxwPJLQRpReoICKErtTTjGgEco=;
 b=igmhd5YKCGUCsV3k3p0SJ37Q0AJuJLaSksUbGtN34zWj96f5lePbEIs8vodiQxI922
 XCNAwv8cRE7k9NFwnUHjWcBkO7bqdBd6iAiH7339D6bZk2o38zQDLge9YGDxjJ6zQDyz
 cD6wG/05+JxzUC5Ay59YYJwhiHvDH7AXzPi4giUkmn7NRKfEtQDNbPn24VVgrDt4IawJ
 dORwia8+HIWmvyaejdROayW3jm70U3sSF5mjGViG2XpYGxz8DSlcRYIxy/UbJk9sj7Dn
 6igxQl+huhcx3l9hDSx5VP+ryBjw4XV9bsMJb+DcHiSak4yp52Dk2R3Hp5KTedpidbwT
 gkjA==
X-Gm-Message-State: AOAM530yE7luDInbeElGXJd+akAmW5RTu0JUK3mXyBJnlolvfLmHL0rv
 b2CU6WEOAq/FTxHtDzit9EFxhRdNy5cNVW48DN8np0Dnyc9f9xdelyHAhMUiYNaQaV6WKSzzMLA
 ai47D99dPkTH/uF4=
X-Received: by 2002:a05:6402:411:: with SMTP id
 q17mr8778477edv.125.1607104810710; 
 Fri, 04 Dec 2020 10:00:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGsf363u4OjVjbCd60/l+nXG8XpIyKr6yRsKB46Cb4FH7Lf3S5GwXvnGPaZbCrhxwMg+qzZA==
X-Received: by 2002:a05:6402:411:: with SMTP id
 q17mr8778407edv.125.1607104810166; 
 Fri, 04 Dec 2020 10:00:10 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id x15sm3796943edj.91.2020.12.04.10.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 10:00:09 -0800 (PST)
Subject: Re: [RFC v7 15/22] cpu: Move tlb_fill to tcg_ops
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201130023535.16689-1-cfontana@suse.de>
 <20201130023535.16689-16-cfontana@suse.de>
 <4c7fe436-7c2d-e55d-1139-8aa30e91965f@redhat.com>
 <20201204173703.GQ3836@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6233d4db-546a-2ec3-376d-154af8ed2cdb@redhat.com>
Date: Fri, 4 Dec 2020 19:00:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201204173703.GQ3836@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 6:37 PM, Eduardo Habkost wrote:
> On Fri, Dec 04, 2020 at 06:14:07PM +0100, Philippe Mathieu-Daudé wrote:
>> On 11/30/20 3:35 AM, Claudio Fontana wrote:
>>> From: Eduardo Habkost <ehabkost@redhat.com>
>>>
>>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>> ---
>>>  accel/tcg/cputlb.c              |  6 +++---
>>>  accel/tcg/user-exec.c           |  6 +++---
>>>  include/hw/core/cpu.h           |  9 ---------
>>>  include/hw/core/tcg-cpu-ops.h   | 12 ++++++++++++
>>>  target/alpha/cpu.c              |  2 +-
>>>  target/arm/cpu.c                |  2 +-
>>>  target/avr/cpu.c                |  2 +-
>>>  target/cris/cpu.c               |  2 +-
>>>  target/hppa/cpu.c               |  2 +-
>>>  target/i386/tcg-cpu.c           |  2 +-
>>>  target/lm32/cpu.c               |  2 +-
>>>  target/m68k/cpu.c               |  2 +-
>>>  target/microblaze/cpu.c         |  2 +-
>>>  target/mips/cpu.c               |  2 +-
>>>  target/moxie/cpu.c              |  2 +-
>>>  target/nios2/cpu.c              |  2 +-
>>>  target/openrisc/cpu.c           |  2 +-
>>>  target/ppc/translate_init.c.inc |  2 +-
>>>  target/riscv/cpu.c              |  2 +-
>>>  target/rx/cpu.c                 |  2 +-
>>>  target/s390x/cpu.c              |  2 +-
>>>  target/sh4/cpu.c                |  2 +-
>>>  target/sparc/cpu.c              |  2 +-
>>>  target/tilegx/cpu.c             |  2 +-
>>>  target/tricore/cpu.c            |  2 +-
>>>  target/unicore32/cpu.c          |  2 +-
>>>  target/xtensa/cpu.c             |  2 +-
>>>  27 files changed, 41 insertions(+), 38 deletions(-)
>>
>> With cc->tcg_ops.* guarded with #ifdef CONFIG_TCG:
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Thanks!
> 
> Are the #ifdefs a hard condition for your Reviewed-by?

No, as you said, this is fine as a first step, so you can
include them.

> Even if we agree #ifdef CONFIG_TCG is the way to go, I don't
> think this should block a series that's a step in the right
> direction.  It can be done in a separate patch.
> 
> (Unless the lack of #ifdef introduces regressions, of course)

I'm worried about the +system -tcg build configuration.

s390x is the only target testing for such regressions
(see "[s390x] Clang (disable-tcg)" on Travis-CI.


