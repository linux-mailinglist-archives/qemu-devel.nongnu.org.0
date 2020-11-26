Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6087A2C5388
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:05:35 +0100 (CET)
Received: from localhost ([::1]:39218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiG1m-00081E-Fr
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kiG0C-00076t-OO
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:03:58 -0500
Received: from mx2.suse.de ([195.135.220.15]:37194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kiG0A-0000uc-8M
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:03:56 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DC100AF30;
 Thu, 26 Nov 2020 12:03:50 +0000 (UTC)
Subject: Re: [RFC v5 09/12] module: introduce MODULE_INIT_ACCEL_CPU
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, "Emilio G . Cota" <cota@braap.org>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-10-cfontana@suse.de>
 <1f747e73-87d1-37a6-123c-76033e538b5f@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ab40db6b-5af3-b3fd-145c-7cf22e78bd96@suse.de>
Date: Thu, 26 Nov 2020 13:03:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1f747e73-87d1-37a6-123c-76033e538b5f@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/26/20 12:25 PM, Philippe Mathieu-Daudé wrote:
> On 11/24/20 5:22 PM, Claudio Fontana wrote:
>> apply this to the registration of the cpus accel interfaces,
>>
>> but this will be also in preparation for later use of this
>> new module init step to also register per-accel x86 cpu type
>> interfaces.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  accel/kvm/kvm-all.c         | 11 +++++++++--
>>  accel/qtest/qtest.c         | 10 +++++++++-
>>  accel/tcg/tcg-all.c         |  8 --------
>>  accel/tcg/tcg-cpus.c        | 15 +++++++++++++++
>>  accel/xen/xen-all.c         | 12 +++++++++---
>>  include/qemu/module.h       |  2 ++
>>  roms/qboot                  |  2 +-
>>  softmmu/vl.c                |  6 ++++++
>>  target/i386/hax/hax-all.c   | 12 +++++++++---
>>  target/i386/hvf/hvf.c       | 10 +++++++++-
>>  target/i386/whpx/whpx-all.c | 11 +++++++++--
>>  11 files changed, 78 insertions(+), 21 deletions(-)
> ...
>> diff --git a/roms/qboot b/roms/qboot
>> index a5300c4949..cb1c49e0cf 160000
>> --- a/roms/qboot
>> +++ b/roms/qboot
>> @@ -1 +1 @@
>> -Subproject commit a5300c4949b8d4de2d34bedfaed66793f48ec948
>> +Subproject commit cb1c49e0cfac99b9961d136ac0194da62c28cf64
> 
> Hmmm unrelated change I presume.
> 

Hi Philippe, yes, clearly,

Thanks!

Ciao,

CLaudio


