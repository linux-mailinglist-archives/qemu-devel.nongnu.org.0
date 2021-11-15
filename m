Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE254503AC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 12:39:57 +0100 (CET)
Received: from localhost ([::1]:35996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmaL5-0002it-UO
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 06:39:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mmaK9-0001s7-0h; Mon, 15 Nov 2021 06:38:57 -0500
Received: from mail.csgraf.de ([85.25.223.15]:39676 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mmaK4-0002AB-9o; Mon, 15 Nov 2021 06:38:56 -0500
Received: from [10.95.147.162]
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with ESMTPSA id F1DF36080381;
 Mon, 15 Nov 2021 12:38:41 +0100 (CET)
Message-ID: <67c00a6a-e50a-3ea6-ef1d-98494fdbd729@csgraf.de>
Date: Mon, 15 Nov 2021 12:38:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH] arm: Don't remove EL3 exposure for SMC conduit
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA8vRNC8RTAAxgYzZsGdqGfzDSr3m0UXmeZoF115z=6N3Q@mail.gmail.com>
 <8639608F-1685-48B8-B965-255D30B213F8@csgraf.de>
 <CAFEAcA_SzCtyDJfnJLLT57Xuf-TdJHRLEW00E7tQkdresxokMg@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAFEAcA_SzCtyDJfnJLLT57Xuf-TdJHRLEW00E7tQkdresxokMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.278,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Andrei Warkentin <andrey.warkentin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 15.11.21 11:46, Peter Maydell wrote:
> On Sun, 14 Nov 2021 at 17:41, Alexander Graf <agraf@csgraf.de> wrote:
>>
>>
>>> Am 14.11.2021 um 18:20 schrieb Peter Maydell <peter.maydell@linaro.org>:
>>> This is tricky, because we use the cpu->isar values to determine whether
>>> we should be emulating things. So this change means we now create an
>>> inconsistent CPU which in some ways claims to have EL3 (the ISAR ID
>>> bits say so) and in some ways does not (the ARM_FEATURE_EL3 flag is
>>> unset), and depending on which of the two "do we have EL3?" methods
>>> any bit of the TCG code is using will give different results...
>> Do you think it would be sufficient to go through all readers of the isar bits and guard them behind an ARM_FEATURE_EL3 check in addition? I'll be happy to do so then! :)
> That would be a big reverse-course on a design choice we made that
> the preference is to look at the ID registers and phase out the
> use of ARM_FEATURE bits where possible.


I'm open to alternatives. As it stands, we're lying to the guest because 
we tell it "SMC is not available" but ask it to call SMC for PSCI, which 
is bad too.


Alex



