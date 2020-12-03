Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE732CD452
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:10:48 +0100 (CET)
Received: from localhost ([::1]:38450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmVb-0006Ax-Qg
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:10:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkmGg-00050A-H1; Thu, 03 Dec 2020 05:55:22 -0500
Received: from mail.csgraf.de ([188.138.100.120]:47114
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkmGe-0002HG-A1; Thu, 03 Dec 2020 05:55:22 -0500
Received: from Alexanders-Mac-mini.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id AD38339000E4;
 Thu,  3 Dec 2020 11:55:17 +0100 (CET)
Subject: Re: [PATCH v3 05/10] hvf: arm: Mark CPU as dirty on reset
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20201202190408.2041-1-agraf@csgraf.de>
 <20201202190408.2041-6-agraf@csgraf.de>
 <20201203015218.GA82480@SPB-NB-133.local>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <55e5dac5-6508-da7f-3f29-05ee225b13da@csgraf.de>
Date: Thu, 3 Dec 2020 11:55:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0)
 Gecko/20100101 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <20201203015218.GA82480@SPB-NB-133.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 03.12.20 02:52, Roman Bolshakov wrote:
> On Wed, Dec 02, 2020 at 08:04:03PM +0100, Alexander Graf wrote:
>> When clearing internal state of a CPU, we should also make sure that HVF
>> knows about it and can push the new values down to vcpu state.
>>
> I'm sorry if I'm asking something dumb. But isn't
> cpu_synchronize_all_post_reset() is supposed to push QEMU state into HVF
> (or any other accel) after reset?
>
> For x86 it used to work:
>
>    static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
>                                                  run_on_cpu_data arg)
>    {
>        hvf_put_registers(cpu);                                                                                                                                                                cpu->vcpu_dirty = false;
>    }


Yes, it works because after the reset is done, there is no other 
register modification happening. With the PSCI emulation code in QEMU, 
we still do modify CPU state after reset though.

Different question though: Why do we need the post_reset() call at all 
here to push state? We would just push it on the next run anyways, 
right? So if we don't set vcpu_dirty to false then, we wouldn't need 
this patch here I think.


Alex


