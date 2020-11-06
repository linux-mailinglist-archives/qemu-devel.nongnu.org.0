Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683E52A8F7E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Nov 2020 07:38:12 +0100 (CET)
Received: from localhost ([::1]:40848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kavNz-0001Zp-DH
	for lists+qemu-devel@lfdr.de; Fri, 06 Nov 2020 01:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kavM9-0000kk-Rr
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 01:36:17 -0500
Received: from mail.ispras.ru ([83.149.199.84]:54044)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kavM7-0007LZ-EZ
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 01:36:17 -0500
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id A9C6740D4004;
 Fri,  6 Nov 2020 06:36:08 +0000 (UTC)
Subject: Re: [PATCH] target/openrisc: fix icount handling for timer
 instructions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <160457727672.17573.9713521384015502561.stgit@pasha-ThinkPad-X280>
 <d3185b27-4df1-20b3-605f-cb82e158bb89@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <27a08a38-46c6-20c4-3f45-1fb9f7a1fd78@ispras.ru>
Date: Fri, 6 Nov 2020 09:36:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d3185b27-4df1-20b3-605f-cb82e158bb89@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 01:36:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: shorne@gmail.com, proljc@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.11.2020 00:39, Richard Henderson wrote:
> On 11/5/20 3:54 AM, Pavel Dovgalyuk wrote:
>> This patch adds icount handling to mfspr/mtspr instructions
>> that may deal with hardware timers.
>>
>> Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
>> ---
>>   target/openrisc/translate.c |   15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
> 
> Looks correct, but it would be better not to duplicate the code from
> trans_l_mtspr, and use an is_jmp code (called DISAS_UPDATE_EXIT in some other
> targets).

mtspr includes the following comment:
* Save all of the cpu state first, allowing it to be overwritten.

Does it mean, that helper can overwrite the PC? Then the PC can't be 
updated in is_jmp handler at the end of instruction translation.


Pavel Dovgalyuk



