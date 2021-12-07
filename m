Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B691046BFF3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 16:53:36 +0100 (CET)
Received: from localhost ([::1]:41794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mucmd-00088k-2L
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 10:53:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1muciJ-00077O-13; Tue, 07 Dec 2021 10:49:07 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:38684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1muciG-0000Jq-K9; Tue, 07 Dec 2021 10:49:06 -0500
Received: from [172.17.10.6] (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 511C520778;
 Tue,  7 Dec 2021 15:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1638892141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6uLIpSxwGOEemHy6EjCphqwtbELdEvsBM1v7kqk+j7o=;
 b=EtzE4SVCec9gquNKZ14bvyySOjld6OqOB654TjSU4BUdGBSk3Z1Yw8frN2ANinCdAgEA5R
 GW01Y5/GnOq7qgnRSZLUIV5yv7UWXiOrTxLnhB5FHwZ2djCVC4G4aHF3K1tzNBBpB7TW4S
 21QgMCrsv/ifPsxLHj6SvcSQqiAeL/s=
Message-ID: <7c9d97ab-1662-106a-5b51-630a4d2375cf@greensocs.com>
Date: Tue, 7 Dec 2021 16:49:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
Content-Language: en-US-large
To: Peter Maydell <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>
References: <20211207094427.3473-1-damien.hedde@greensocs.com>
 <CAFEAcA-=8an6Q0ZC2Nx6=VoaB0_rucv+vEGS8Fy+ChMc2zCqHg@mail.gmail.com>
 <SN6PR02MB42054732F8B59940998D01EDB86E9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <CAFEAcA-x_e4NrQziTEpYrTZn7X_enEMjKn0bHEK8uS4ED1vjzw@mail.gmail.com>
 <CAFEAcA_C17byZDDdenOfmD6TU4UuTq=uHfXQxdurppaa18S4mQ@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAFEAcA_C17byZDDdenOfmD6TU4UuTq=uHfXQxdurppaa18S4mQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Sid Manning <sidneym@quicinc.com>,
 Carl van Schaik <cvanscha@qti.qualcomm.com>,
 "shashi.mallela@linaro.org" <shashi.mallela@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/7/21 16:45, Peter Maydell wrote:
> On Tue, 7 Dec 2021 at 15:24, Peter Maydell <peter.maydell@linaro.org> wrote:
>> The bug is a bug in any case and we'll fix it, it's just a
>> question of whether it meets the bar to go into 6.2, which is
>> hopefully going to have its final RC tagged today. If this
>> patch had arrived a week ago then the bar would have been
>> lower and it would definitely have gone in. As it is I have
>> to weigh up the chances of this change causing a regression
>> for eg KVM running on emulated QEMU.
> 
> Looking at the KVM source it doesn't ever set the LRENPIE
> bit (it doesn't even have a #define for it), which both
> explains why we didn't notice this bug before and also
> means we can be pretty certain we're not going to cause a
> regression for KVM at least if we fix it...
> 
> -- PMM
> 

We are perfectly fine with this not going into 6.2.

--
Damien

