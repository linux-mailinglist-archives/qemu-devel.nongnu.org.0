Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C8D65B2A3
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 14:26:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCKoQ-0004FM-0n; Mon, 02 Jan 2023 08:25:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pCKoM-0004F3-1a
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 08:25:06 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pCKoJ-0003Zf-PA
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 08:25:05 -0500
Received: from [134.155.36.187] (dhcp187.bib.uni-mannheim.de [134.155.36.187])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 0B7A2DA06C9;
 Mon,  2 Jan 2023 14:24:58 +0100 (CET)
Message-ID: <f8bee089-c072-869e-0ff7-a27a16f58ee6@weilnetz.de>
Date: Mon, 2 Jan 2023 14:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-5-alex.bennee@linaro.org>
 <bc7775b6-7a7f-a932-cf3b-61c667e83c8d@linaro.org>
Subject: Re: [PATCH v3 04/26] configure: don't enable cross compilers unless
 in target_list
In-Reply-To: <bc7775b6-7a7f-a932-cf3b-61c667e83c8d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.142,
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 21.10.22 um 00:10 schrieb Richard Henderson:
> On 10/20/22 21:51, Alex Bennée wrote:
>> This avoids the unfortunate effect of always builds the pc-bios blobs
>> for targets the user isn't interested in.
>>
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   configure | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/configure b/configure
>> index 81561be7c1..dd6f58dcde 100755
>> --- a/configure
>> +++ b/configure
>> @@ -1877,6 +1877,15 @@ probe_target_compiler() {
>>     container_cross_ranlib=
>>     container_cross_strip=
>> +  # We shall skip configuring the target compiler if the user didn't
>> +  # bother enabling an appropriate guest. This avoids building
>> +  # extraneous firmware images and tests.
>> +  if test "${target_list#*$1}" != "$1"; then
>> +      break;


Isn't break limited for exiting from for, while, or until loop? (*)
If yes, it's wrongly used here. sh does not complain, but other
shells do.

Stefan

*) https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html

