Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3F63330AF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:14:13 +0100 (CET)
Received: from localhost ([::1]:60644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjgC-0002YS-U7
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vfazio@xes-inc.com>)
 id 1lJjX5-0005Gy-5G; Tue, 09 Mar 2021 16:04:47 -0500
Received: from mail.xes-mad.com ([162.248.234.2]:38872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vfazio@xes-inc.com>)
 id 1lJjX1-0007pj-2g; Tue, 09 Mar 2021 16:04:46 -0500
Received: from [10.52.16.140] (vfazio1.xes-mad.com [10.52.16.140])
 by mail.xes-mad.com (Postfix) with ESMTP id 0BD962C552;
 Tue,  9 Mar 2021 15:04:28 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
 t=1615323868; bh=5VhUrBba04/jpKWRHi7qHq6WuraJNq4ous2+g7AILrw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VF3Wv9Tyu7Gb+AxWMTb83zVHCzhnpYDvZp05LMZKoFYUzlsJC6C4Me3rY++vU/jGw
 t46ki+dkyVLzOyh2cCdQxxEi7W8Gk5fhYToXfZDiB2X8W5zeXmkL3hrZtsfHdBaf/Q
 0XsdvsZj7/lGP5MDlukh6QlM0hRPGWqkFeV3mD0s=
Subject: Re: [PATCH] linux-user/elfload: munmap proper address in
 pgd_find_hole_fallback
To: laurent@vivier.eu
References: <20210131061849.12615-1-vfazio@xes-inc.com>
 <87lfbqc2ab.fsf@linaro.org>
From: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <4614f136-8604-a40b-8ea9-7964eba304a3@xes-inc.com>
Date: Tue, 9 Mar 2021 15:04:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87lfbqc2ab.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=162.248.234.2; envelope-from=vfazio@xes-inc.com;
 helo=mail.xes-mad.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Vincent Fazio <vfazio@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pinging per Laurent.

On 2/14/21 5:32 AM, Alex Bennée wrote:
> 
> Vincent Fazio <vfazio@xes-inc.com> writes:
> 
>> From: Vincent Fazio <vfazio@gmail.com>
>>
>> Previously, if the build host's libc did not define MAP_FIXED_NOREPLACE
>> or if the running kernel didn't support that flag, it was possible for
>> pgd_find_hole_fallback to munmap an incorrect address which could lead to
>> SIGSEGV if the range happened to overlap with the mapped address of the
>> QEMU binary.
>>
>>    mmap(0x1000, 22261224, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_NORESERVE, -1, 0) = 0x7f889d331000
>>    munmap(0x1000, 22261224)                = 0
>>    --- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_MAPERR, si_addr=0x84b817} ---
>>    ++ killed by SIGSEGV +++
>>
>> Now, always munmap the address returned by mmap.
>>
>> Fixes: 2667e069e7b5 ("linux-user: don't use MAP_FIXED in pgd_find_hole_fallback")
>> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 

