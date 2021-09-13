Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12E3408A98
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 13:57:16 +0200 (CEST)
Received: from localhost ([::1]:51326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkaI-00011G-QN
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 07:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPkYT-0007cn-H7; Mon, 13 Sep 2021 07:55:21 -0400
Received: from mail.csgraf.de ([85.25.223.15]:43962 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPkYR-0003xG-5q; Mon, 13 Sep 2021 07:55:21 -0400
Received: from MacBook-Air.alex.local
 (dynamic-095-118-088-150.95.118.pool.telefonica.de [95.118.88.150])
 by csgraf.de (Postfix) with ESMTPSA id 7D8D4608037D;
 Mon, 13 Sep 2021 13:55:16 +0200 (CEST)
Subject: Re: [PATCH v8 15/19] hvf: arm: Implement -cpu host
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-16-agraf@csgraf.de>
 <CAFEAcA9S619pfhfEXUxGQkjBBKahOYm14jpxEam2CQTtC1dRTQ@mail.gmail.com>
 <45519c63-06b1-1e06-032d-87d2e1338fd8@csgraf.de>
 <CAFEAcA_vC0beH4NMRP4hHK0drc6PZt073ZVZM=Majnfngkn_xQ@mail.gmail.com>
 <1c992028-633d-5f5e-f433-59492876eb73@csgraf.de>
 <CAFEAcA9b0TLs1mF5LWThE7007WuFb0rXUGqpbCpG5zsHj4UUyw@mail.gmail.com>
 <ee7b2202-115f-0461-cbb1-d856199b884e@csgraf.de>
 <CAFEAcA90+XWoH9qAh5nJbtpDAaEXASLy+wLbtw15Uda_Y19DqQ@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <723641d4-9a84-7f1c-3723-9a78ce76310e@csgraf.de>
Date: Mon, 13 Sep 2021 13:55:15 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA90+XWoH9qAh5nJbtpDAaEXASLy+wLbtw15Uda_Y19DqQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.969,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 13.09.21 13:48, Peter Maydell wrote:
> On Mon, 13 Sept 2021 at 12:46, Alexander Graf <agraf@csgraf.de> wrote:
>>
>> On 13.09.21 12:52, Peter Maydell wrote:
>>> On Mon, 13 Sept 2021 at 11:46, Alexander Graf <agraf@csgraf.de> wrote:
>>>> Why? You only get to this code path if you already selected -accel hvf.
>>>> If even a simple "create scratch vcpu" syscall failed then, pretty
>>>> failure when you define -cpu host is the last thing you care about. Any
>>>> CPU creation would fail.
>>> General design principle -- low level functions should report
>>> errors upwards, not barf and exit.
>>
>> Usually I would agree with you, but here it really does not make sense
>> and would make the code significantly harder to read.
> It's an unnecessary difference from how we've structured the
> KVM code. I don't like those. Every time you put one in to
> the code you write you can be fairly sure I'm going to question
> it during review... I want to be able to look at the hvf code
> and say "ah, yes, this is just the hvf version of the kvm code
> we already have".


I'll follow the KVM pattern then ...


Alex



