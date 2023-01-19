Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD4C674580
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 23:09:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pId5H-0004SN-8S; Thu, 19 Jan 2023 17:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pId5F-0004SA-Tw; Thu, 19 Jan 2023 17:08:33 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pId5E-0007Pc-1Q; Thu, 19 Jan 2023 17:08:33 -0500
Received: from [192.168.0.20] (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id D328C20E09FE;
 Thu, 19 Jan 2023 14:08:29 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D328C20E09FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674166110;
 bh=yaL9U5qPbERxoMFF9/XB1bBrqry+09uCNni20nEZlb0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KJ5NikZIuSZaqeFNs4gCLV77dwcaixV21akvSBQFWr/yHuZacrf/39qApk/+QJ7aV
 /2UC/PVOB0CSW2jtS95FroR9jr6fQ3eTQUoY2nuC9XTW3uQzUMAHPjtwM9eT9f51bn
 kCWOdQ4BD/2TP9SiALxJw3TNOSTZbGVlfa1YWfK0=
Message-ID: <95207957-10b6-838b-d2c9-35feb282d49e@linux.microsoft.com>
Date: Thu, 19 Jan 2023 23:08:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC] 2-stage translation emulation support for SMMUv3 on TCG
Content-Language: en-US
To: eric.auger@redhat.com, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <b6a1427d-51b6-0daa-c4f1-b1e8ea145844@linux.microsoft.com>
 <1fe1dc81-f6bc-3da8-81c1-16dd248cc23d@redhat.com>
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
In-Reply-To: <1fe1dc81-f6bc-3da8-81c1-16dd248cc23d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -198
X-Spam_score: -19.9
X-Spam_bar: -------------------
X-Spam_report: (-19.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 1/17/2023 18:00, Eric Auger wrote:
> Hi Evgeny,
> On 1/16/23 16:37, Evgeny Iakovlev wrote:
>> Hi!
>>
>>
>> We are using qemu-tcg-aarch64 to run Hyper-V test and debug builds for
>> arm. Besides some minor fixes that i have submitted over the last
>> couple of weeks, one big compatibility item for us is SMMUv3 2-stage
>> translations support. We can do fine without it right now, but having
>> it would also allow us to test nested arm guests with SMMUv3, which is
>> great.
>>
>>
>> One idea we have floating around is implementing 2-stage translations
>> in SMMUv3 in Qemu. We can't make a commitment yet, but before we
>> consider it i think it would be wise to ask the community about it,
>> specifically:
>>
>> * Do 2-stage translations sound like something qemu-arm would be keen
>> on accepting? Are there any other use-cases for it besides an arguably
>> wild corner case of nesting an EL2 hypervisor on software-emulated arm64?
> Personally I don't have anything against. I guess we cannot prevent you
> from adding a feature that is supported by the spec ;-) One concern I
> have is the extra complexity it will bring to the device. At least I
> would recommend you to try to isolate stage2 support at most from the
> rest and make your utmost to keep the stage1 perf as close as possible
> to what it is currently. Indeed the main "production" use case is S1
> vSMMU with KVM acceleration. Currently in linux arm-smmuv3 driver, only
> S1 is used. Out of curiosity how are the S2 and S1+S2 used with HyperV?
>
> I am mostly involved in KVM accelerated use cases so I will let others
> comment on potential use cases using S2.


Hyper-V is using 2-stage xlate i think in the same scenario KVM/vfio 
does: to expose SMMU to the guest and allow it to program stage 1 tables 
and also support some nesting scenarious.


>> * Is there anyone already working on it as we speak maybe?
> afaik I am not aware of anybody working on that at the moment
>> * Were there any previous attempts to do this and if yes why they
>> evidently didn't get through?
> afaik there were no series sent publicly


Thanks for confirming, Eric!


>
> Thanks
>
> Eric
>>
>> Thanks!
>>
>>

