Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE617651BCB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 08:39:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7XCP-0003SD-D9; Tue, 20 Dec 2022 02:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p7XC6-0003Nc-Dc; Tue, 20 Dec 2022 02:37:51 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p7XC4-0000L1-NK; Tue, 20 Dec 2022 02:37:45 -0500
Received: from [192.168.106.118]
 (dynamic-095-114-015-034.95.114.pool.telefonica.de [95.114.15.34])
 by csgraf.de (Postfix) with ESMTPSA id 757AB6080366;
 Tue, 20 Dec 2022 08:37:42 +0100 (CET)
Message-ID: <ceeb8fef-f0dc-eac9-8b0e-e28735bfdaf2@csgraf.de>
Date: Tue, 20 Dec 2022 08:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH] hvf: arm: Add support for GICv3
Content-Language: en-US
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20221219220808.26392-1-agraf@csgraf.de>
 <d848e536-94ba-7f2e-ad40-026449fa63fd@huawei.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <d848e536-94ba-7f2e-ad40-026449fa63fd@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.149,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Zenghui,

On 20.12.22 08:14, Zenghui Yu wrote:
> On 2022/12/20 6:08, Alexander Graf wrote:
>> We currently only support GICv2 emulation.
>
> Before looking into it, I think it's worth finalizing the GIC version in
> the hvf case - only v2 is allowed and fail early if user selects the
> unsupported versions. Currently finalize_gic_version() does not deal
> with hvf at all.


Currently finalize_gic_version() treats HVF the same as TCG, which is 
incorrect. However, with this patch applied, they happen to match.

I don't think it's worth changing the finalize_gic_version() 
implementation to reflect the gicv2 only state for HVF. Instead, let's 
rather get GICv3 support in and then add explicit handling for HVF on top.

Alex


