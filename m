Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358D04B6D9B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 14:35:51 +0100 (CET)
Received: from localhost ([::1]:44986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJxzi-0002wn-3h
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 08:35:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nJxlx-0006SN-FL
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:21:37 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:42804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nJxlu-0004uh-QR
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:21:37 -0500
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 67A4720780;
 Tue, 15 Feb 2022 13:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1644931290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2IDhkrRIjs+xg9KrW5RzZ+eQKTC05q5PaTGl7iBdf9c=;
 b=EaKZ0lNsAZpbTVMU9QN8f1FF1Z4MzXH5Vgo4mTDHX4ruC9eBcqC0x17E6YgAvMWz9WIRs3
 3uYojTEx8xWolo66e0M6NiLNZIsjYv1EbQDusw8gs89mBYjpsgUV/hQXFa7C9D9Y0XIkOh
 Ci6PNm3RZHbsCudJ85tWOKPIoIJ3kp4=
Message-ID: <cfca692c-db64-aeaf-73da-3d36655a44d7@greensocs.com>
Date: Tue, 15 Feb 2022 14:21:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: qdev instance_init vs realize split
Content-Language: en-US-large
To: Peter Maydell <peter.maydell@linaro.org>
References: <e9bae713-1051-1bf0-5f3a-d9bb61aade8a@greensocs.com>
 <CAFEAcA9P7DyYqBCLeTMRSTiw2jYMfQ97vs_u+55nCdov7LDdrw@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAFEAcA9P7DyYqBCLeTMRSTiw2jYMfQ97vs_u+55nCdov7LDdrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/15/22 12:32, Peter Maydell wrote:
> On Tue, 15 Feb 2022 at 10:32, Damien Hedde <damien.hedde@greensocs.com> wrote:
>> I'm wondering if there are rules or convention about what we put in the
>> instance_init() vs realize() for simple devices ? (For complex ones we
>> generally have no choice to put everything in realize())
>>
>> For example we can declare irqs and mmios in instance_init() or
>> realize() if they do not depend on some property.
> 
> We don't, unfortunately, have a clear set of conventions for this.
> We really ideally ought to write some up, because the question
> keeps coming up. There are a few absolute rules:
>   * things that can fail must be done in realize
>   * things that depend on property values must be done in realize
>   * things that affect the simulation must be done in realize
>   * if you do something that needs a corresponding manual deinit
>     step in instance_init then you must provide an instance_finalize
>     even if the device would otherwise be "create once, lasts for
>     entire simulation" as many of our devices are
> 
> But in many cases actions can be done in either method, and we
> end up with devices being inconsistent and people wondering whether
> there's a reason for it.
> 
> I vaguely think it would be good to get into the habit of writing
> all our devices to have the full lifecycle code including supporting
> init-realize-unrealize-finalize, but on the other hand that implies
> a bunch of code (unrealize) which is never executed or tested...
> I also suspect we have a bunch of buggy code in realize methods
> which isn't correctly undoing things it has done already in the
> error-exit-from-realize case.

Are you saying that: if an operation like a mmio/irq definition is done 
in realize(), in theory, we should have the unrealize() counterpart ?

Thanks,
--
Damien

