Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF4930009C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 11:48:14 +0100 (CET)
Received: from localhost ([::1]:51270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2tzB-0003Dc-9X
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 05:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l2tyT-0002o9-78
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:47:29 -0500
Received: from mail.ispras.ru ([83.149.199.84]:49822)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l2tyR-0006tO-1x
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:47:28 -0500
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id D90E740D403D;
 Fri, 22 Jan 2021 10:47:21 +0000 (UTC)
Subject: Re: [PATCH] util/log: flush TB cache when log level changes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <161130982491.1038646.15688151175539344664.stgit@pasha-ThinkPad-X280>
 <672fc936-9207-636c-4f16-76fb2f849960@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <ed5201f1-5cbc-ee7c-1575-4db705735d0c@ispras.ru>
Date: Fri, 22 Jan 2021 13:47:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <672fc936-9207-636c-4f16-76fb2f849960@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.01.2021 13:32, Philippe Mathieu-Daudé wrote:
> Hi Pavel,
> 
> On 1/22/21 11:03 AM, Pavel Dovgalyuk wrote:
>> Sometimes we need to collect the translation logs starting
>> from some point of the execution. Some TB listings may
>> be missed in this case, when blocks were translated before.
>> This patch clears TB cache to allow re-translation of such
>> code blocks.
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>> ---
>>   accel/tcg/translate-all.c |    8 ++++++++
>>   include/sysemu/tcg.h      |    1 +
>>   stubs/meson.build         |    1 +
>>   stubs/tcg.c               |   12 ++++++++++++
>>   util/log.c                |    3 +++
>>   5 files changed, 25 insertions(+)
>>   create mode 100644 stubs/tcg.c
> ...
> 
>>   /*
>>    * Formerly ifdef DEBUG_TB_CHECK. These debug functions are user-mode-only,
>>    * so in order to prevent bit rot we compile them unconditionally in user-mode,
>> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
>> index 00349fb18a..7415f11022 100644
>> --- a/include/sysemu/tcg.h
>> +++ b/include/sysemu/tcg.h
>> @@ -9,6 +9,7 @@
>>   #define SYSEMU_TCG_H
>>   
>>   void tcg_exec_init(unsigned long tb_size, int splitwx);
>> +void tb_flush_all(void);
> 
> Why not declare in "exec/exec-all.h"?
> 

It includes cpu.h, which is not available for all tools, that use logs.

Pavel Dovgalyuk


