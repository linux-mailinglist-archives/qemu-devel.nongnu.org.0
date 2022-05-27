Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B24535C37
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 11:01:23 +0200 (CEST)
Received: from localhost ([::1]:35992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuVqU-0002ZK-LO
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 05:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nuVcD-0006q8-0y
 for qemu-devel@nongnu.org; Fri, 27 May 2022 04:46:40 -0400
Received: from mail.ispras.ru ([83.149.199.84]:58496)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nuVcB-0004Ze-2V
 for qemu-devel@nongnu.org; Fri, 27 May 2022 04:46:36 -0400
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 516A240D403E;
 Fri, 27 May 2022 08:45:41 +0000 (UTC)
Message-ID: <d94a48e6-e90c-90a3-5195-79d5d3020e99@ispras.ru>
Date: Fri, 27 May 2022 11:45:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 2/9] replay: notify vCPU when BH is scheduled
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, crosa@redhat.com, f4bug@amsat.org
References: <165355470196.533615.1219754093587154582.stgit@pasha-ThinkPad-X280>
 <165355471287.533615.6762485479325805298.stgit@pasha-ThinkPad-X280>
 <7a7d78b5-5c8a-3817-ec7c-27789586076f@redhat.com>
 <a841cf3c-2cc7-3d87-8352-ed23c3b1a186@ispras.ru>
 <5d36f941-8958-f42f-f3dd-aed3a92d270b@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <5d36f941-8958-f42f-f3dd-aed3a92d270b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 26.05.2022 15:10, Paolo Bonzini wrote:
> On 5/26/22 11:51, Pavel Dovgalyuk wrote:
>>>
>>> At least aio_bh_schedule_oneshot_full should have the same effect, so 
>>> should this be done at a lower level, in aio_bh_enqueue() or even 
>>> aio_notify()?
>>
>> Not sure about aio_notify. It can operate with different contexts.
>> Can some of them be not related to the VM state?
> 
> All but the main AioContext one would have current_cpu == NULL.

aio_bh_enqueue is better. Moving this code to aio_notify breaks the tests.



