Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A9232B9C7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:18:52 +0100 (CET)
Received: from localhost ([::1]:43110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHW5D-0001kC-Eu
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:18:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lHW41-0001F4-Q9
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:17:37 -0500
Received: from mx2.suse.de ([195.135.220.15]:54350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lHW40-0007B4-6E
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:17:37 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4BEC1AC24;
 Wed,  3 Mar 2021 18:17:34 +0000 (UTC)
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <875z2k53mn.fsf@linaro.org> <a3ed4064-6dec-24c6-8138-ce8301f01e1e@redhat.com>
 <63847c79-93c2-5ee3-d568-9091fedf325c@suse.de> <87a6rmkffo.fsf@linaro.org>
 <8d4a427a-94dd-7472-e8ae-98c4efa44ce0@suse.de>
 <CAFEAcA_eWrgo9CcLF3ZpAPeK08_PmKNLjqKAzuBPcSGh+1SFCA@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <5fb3cf49-fc09-7e7c-d34e-299f04e9842a@suse.de>
Date: Wed, 3 Mar 2021 19:17:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_eWrgo9CcLF3ZpAPeK08_PmKNLjqKAzuBPcSGh+1SFCA@mail.gmail.com>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 7:09 PM, Peter Maydell wrote:
> On Wed, 3 Mar 2021 at 17:57, Claudio Fontana <cfontana@suse.de> wrote:
>> One thing I noticed is that tests try to run qemu-system-aarch64 with accel "qtest" and machine "virt",
>> and the thing tries to create a cortex-a15 cpu model for some unknown reason.
> 
> That is expected. The default CPU type for 'virt' is cortex-a15; if you want
> something else then you need to specify the -cpu option.
> 
> -- PMM
> 

I see, I'll experiment a bit thanks.

I assume changing the default to "max" is out of the question,
and we should instead feed the -cpu option from the tests?

Ciao,

Claudio

