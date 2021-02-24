Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE65732397E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 10:33:24 +0100 (CET)
Received: from localhost ([::1]:58224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEqXr-0006L8-Gc
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 04:33:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lEqVE-0004qW-3c
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:30:42 -0500
Received: from mx2.suse.de ([195.135.220.15]:49938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lEqVA-0006jT-1V
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:30:38 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E7E4AE05;
 Wed, 24 Feb 2021 09:30:33 +0000 (UTC)
Subject: Re: softmmu vs sysemu [Was: Re: [RFC v1 06/38] target/arm: split off
 cpu-softmmu.c]
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-7-cfontana@suse.de> <87blcc57rj.fsf@linaro.org>
 <e7f21ff9-b2c6-668e-c973-d2949b81327e@suse.de>
 <2765ff1d-8b77-c2c8-c48a-dc2f582d80ff@redhat.com>
 <477a7799-cb25-afa7-c280-09d839a2b180@suse.de>
 <a6682a0f-5993-ed12-98d7-0c8f59385bbd@suse.de>
 <0a47d627-fda8-54c7-dbf8-2ebfc9000137@linaro.org>
 <9dee8138-2088-33ba-b941-494c64925004@amsat.org>
 <cbece07f-67ae-147b-98b7-62b37b16e808@linaro.org>
 <52d854fa-120a-d748-2469-383b4b46f8e7@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <5a2a9620-1322-1e6d-a0c5-c1d495d2e289@suse.de>
Date: Wed, 24 Feb 2021 10:30:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <52d854fa-120a-d748-2469-383b4b46f8e7@redhat.com>
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@centriq4.arch.suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 10:20 AM, Paolo Bonzini wrote:
> On 24/02/21 01:06, Richard Henderson wrote:
>> On 2/23/21 3:43 PM, Philippe Mathieu-Daudé wrote:
>>> On 2/23/21 7:51 PM, Richard Henderson wrote:
>>>> I just want the file naming done correctly, while you're renaming.  That is
>>>> something you are actively changing in this patch set, so we should get it right.
>>>
>>> So what is the new directory structure?
>>>
>>> - user/
>>> - sysemu/{tcg,kvm,}/
>>>
>>> or
>>>
>>> - tcg/a-user.c
>>> - tcg/b-sysemu.c
>>> - kvm/kvm.c
>>
>> Personally I think this second one makes more sense, focused primarily on the
>> accelerator and secondarily on the kind of emulation.
> 
> I agree.

Agree here are well.

> 
> I don't care _too much_ about sysemu vs. softmmu.


I am neutral here as well.


>In any case if we 
> want to go with sysemu it can be done in steps:
> 
> - easy: rename files and directories

right. The ask in this series from Richard is to rename new files and directories from "softmmu" to "sysemu".

This gives us a resulting codebase where some directories are softmmu, some are sysemu, and the meson stuff is still softmmu.
To me this is a worse situation than where we started, but if I am the only one perceiving this I will just call the new directories and files "sysemu".


> 
> - medium: rename sourcesets in meson.build

right

> 
> - harder (or just larger): rename CONFIG_SOFTMMU

indeed. Currently (I think) CONFIG_SOFTMMU is the same as !CONFIG_USER_ONLY. But IIUC CONFIG_SOFTMMU would assume a new meaning after the change.

> 
> Paolo
> 


