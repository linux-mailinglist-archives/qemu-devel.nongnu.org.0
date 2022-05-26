Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEC3534CCC
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 11:56:17 +0200 (CEST)
Received: from localhost ([::1]:34664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuAE4-0002Tp-C0
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 05:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nuABM-0000aj-4p
 for qemu-devel@nongnu.org; Thu, 26 May 2022 05:53:28 -0400
Received: from mail.ispras.ru ([83.149.199.84]:59946)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nuABJ-00076Z-EJ
 for qemu-devel@nongnu.org; Thu, 26 May 2022 05:53:27 -0400
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id C8EBF40755D0;
 Thu, 26 May 2022 09:53:23 +0000 (UTC)
Message-ID: <e40126ba-ba2b-614a-36f5-dfdb775ed593@ispras.ru>
Date: Thu, 26 May 2022 12:53:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 4/9] replay: simplify async event processing
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, crosa@redhat.com, f4bug@amsat.org
References: <165355470196.533615.1219754093587154582.stgit@pasha-ThinkPad-X280>
 <165355472374.533615.18197241124455918315.stgit@pasha-ThinkPad-X280>
 <04b4715c-e5e8-038e-e3e1-179ff9085d3a@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <04b4715c-e5e8-038e-e3e1-179ff9085d3a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.05.2022 12:40, Paolo Bonzini wrote:
> On 5/26/22 10:45, Pavel Dovgalyuk wrote:
>> +
>> +typedef enum ReplayAsyncEventKind {
>> +    REPLAY_ASYNC_EVENT_BH,
>> +    REPLAY_ASYNC_EVENT_BH_ONESHOT,
>> +    REPLAY_ASYNC_EVENT_INPUT,
>> +    REPLAY_ASYNC_EVENT_INPUT_SYNC,
>> +    REPLAY_ASYNC_EVENT_CHAR_READ,
>> +    REPLAY_ASYNC_EVENT_BLOCK,
>> +    REPLAY_ASYNC_EVENT_NET,
>> +    REPLAY_ASYNC_COUNT
>> +} ReplayAsyncEventKind;
>> +
>>   /* Any changes to order/number of events will need to bump 
>> REPLAY_VERSION */
>>   enum ReplayEvents {
>>       /* for instruction event */
>> @@ -22,6 +35,7 @@ enum ReplayEvents {
>>       EVENT_EXCEPTION,
>>       /* for async events */
>>       EVENT_ASYNC,
>> +    EVENT_ASYNC_LAST = EVENT_ASYNC + REPLAY_ASYNC_COUNT - 1,
> 
> Why not unify the two enums into one?

ReplayAsyncEventKind is used as a variable type.
I think narrow type describes the value better than common enum.

> 
> Paolo


