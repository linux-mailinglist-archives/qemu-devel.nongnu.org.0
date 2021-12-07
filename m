Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C317646BC32
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 14:10:25 +0100 (CET)
Received: from localhost ([::1]:39756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muaEh-0003hG-Oi
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 08:10:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mua9o-0002dN-Ui; Tue, 07 Dec 2021 08:05:20 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:37334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mua9j-0005gT-MS; Tue, 07 Dec 2021 08:05:17 -0500
Received: from [172.17.10.6] (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPSA id A5B1A20778;
 Tue,  7 Dec 2021 13:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1638882312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nPg5C3EqanbC3wMHe1Qn0JHt2hTa+5YHPIc1iqhebgU=;
 b=wvvtPsyw/Jaq/kNIfFA56BJDjIcNsK+dL2Zsjrz5TBq+gNrbTbe2lwuAG/p5KAUd/NLFYQ
 fyu3NbJUmxyvnyN8eY0GagCKkL07EdFla2zkn2/2h5JUjNHI31T/K7BmDJpCmpRWBN8hJC
 0qs64618rl/VQF+Ka/SCBOu1LsTjRrQ=
Message-ID: <d77f21c7-2b92-2c45-aabd-36148f7fd822@greensocs.com>
Date: Tue, 7 Dec 2021 14:05:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211207094427.3473-1-damien.hedde@greensocs.com>
 <e0419fd9-ce18-a4f6-7c8a-36e36dce2ae4@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <e0419fd9-ce18-a4f6-7c8a-36e36dce2ae4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, shashi.mallela@linaro.org,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/7/21 13:45, Philippe Mathieu-Daudé wrote:
> On 12/7/21 10:44, Damien Hedde wrote:
>> According to the "Arm Generic Interrupt Controller Architecture
>> Specification GIC architecture version 3 and 4" (version G: page 345
>> for aarch64 or 509 for aarch32):
>> LRENP bit of ICH_MISR is set when ICH_HCR.LRENPIE==1 and
>> ICH_HCR.EOIcount is non-zero.
>>
>> When only LRENPIE was set (and EOI count was zero), the LRENP bit was
>> wrongly set and MISR value was wrong.
>>
>> As an additional consequence, if an hypervisor set ICH_HCR.LRENPIE,
>> the maintenance interrupt was constantly fired. It happens since patch
>> 9cee1efe92 ("hw/intc: Set GIC maintenance interrupt level to only 0 or 1")
>> which fixed another bug about maintenance interrupt (most significant
>> bits of misr, including this one, were ignored in the interrupt trigger).
>>
>> Fixes: 83f036fe3d ("hw/intc/arm_gicv3: Add accessors for ICH_ system registers")
> 
> This commit predates 6.1 release, so technically this is not
> a regression for 6.2.

Do you mean "Fixes:" is meant only for regression or simply that this 
patch should not go for 6.2 ?

9cee1efe92 was introduced after 6.1, and changed the interrupt behavior. 
Thought I'm not sure if we can consider this as a fix for 9cee1efe92: it 
only makes the previous error more visible.

Damien

