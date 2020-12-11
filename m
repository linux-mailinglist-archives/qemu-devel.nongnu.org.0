Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB862D7DAC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:10:20 +0100 (CET)
Received: from localhost ([::1]:52454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmrz-0001ZX-3m
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:10:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knm55-0007Ha-Ew
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:19:47 -0500
Received: from mx2.suse.de ([195.135.220.15]:60112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knm50-0006ME-TT
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:19:47 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 83EB3B7B6;
 Fri, 11 Dec 2020 17:19:40 +0000 (UTC)
Subject: Re: [PATCH v11 16/25] target/riscv: remove CONFIG_TCG, as it is
 always TCG
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-17-cfontana@suse.de>
 <479af498-6027-79bf-940f-207f0c3fca15@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <e1a3f236-0ce0-287a-a209-623af32dcd1c@suse.de>
Date: Fri, 11 Dec 2020 18:19:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <479af498-6027-79bf-940f-207f0c3fca15@linaro.org>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 5:56 PM, Richard Henderson wrote:
> On 12/11/20 2:31 AM, Claudio Fontana wrote:
>> for now only TCG is allowed as an accelerator for riscv,
>> so remove the CONFIG_TCG use.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  target/riscv/cpu.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> Aren't there patches on the list to add kvm support for riscv?
> 
> 
> r~
> 

Yes I saw something ongoing,

however for the current code, the CONFIG_TCG is not meaningful,
and I think the actual right wrapping of what should and should not be CONFIG_TCG, and the eventual cleanup of that using the build system is going to need more that the CONFIG_TCG that is in there.

Ciao,

Claudio

