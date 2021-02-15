Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AFB31B85D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:50:41 +0100 (CET)
Received: from localhost ([::1]:54908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcOm-0004uj-LZ
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lBcMt-0003gQ-GH
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:48:45 -0500
Received: from mx2.suse.de ([195.135.220.15]:54510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lBcMp-0002EF-E7
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:48:43 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 998DDACD4;
 Mon, 15 Feb 2021 11:48:37 +0000 (UTC)
Subject: Re: [RFC v18 00/15] i386 cleanup PART 2
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210212123622.15834-1-cfontana@suse.de>
 <877dn9v9ue.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <f8c567e5-8a38-ab88-a56e-59b5131f870f@suse.de>
Date: Mon, 15 Feb 2021 12:48:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <877dn9v9ue.fsf@linaro.org>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 12:37 PM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
> <snip>
>> Looking forward to your comments on this proposal,
>>
> <snip>
> 
> So I've reviewed as much as I'm comfortable with - I'm going to defer to
> the x86 experts on the split of stuff for x86. However from my point of
> view I think it's a nice step in improving modularity and reducing the
> maze of #ifdefs in the code.
> 

Thanks a lot Alex for your review.

If I can leverage your TCG knowledge a bit more, as I forgot a lot about it,

have you noticed in "i386: split tcg btp_helper into softmmu and user parts"
and "i386: split smm helper (softmmu)"

those new

#ifndef CONFIG_USER_ONLY?

Basically we remove some preamble stuff that would end up calling empty stubs for user mode,
but do you think there could be some other consequence I am not seeing?

Maybe there is even more that could be removed in the code immediately preceding those CONFIG_USER_ONLY?

In particular I am referring to patches:

  i386: split tcg btp_helper into softmmu and user parts
  i386: split smm helper (softmmu)

I am commenting those patches now inline, so that it is easier to see what I am talking about.

Again, thanks a lot!

Claudio

