Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3BF347163
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 07:06:07 +0100 (CET)
Received: from localhost ([::1]:52282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOwec-0003LP-Ra
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 02:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lOwcm-0002qU-0i
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:04:12 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:45528
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lOwcg-00033x-1a
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:04:11 -0400
HMM_SOURCE_IP: 172.18.0.48:8535.2023472176
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-110.184.65.177?logid-fa82a22ccced4c7eaadb1c9b3bbb06f9
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 8201D280081;
 Wed, 24 Mar 2021 14:03:56 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by App0024 with ESMTP id fa82a22ccced4c7eaadb1c9b3bbb06f9 for
 quintela@redhat.com; Wed Mar 24 14:03:58 2021
X-Transaction-ID: fa82a22ccced4c7eaadb1c9b3bbb06f9
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Subject: Re: [PATCH] tests/migration: fix parameter of auto-converge migration
To: Thomas Huth <thuth@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, berrange@redhat.com
References: <0195d34a317ce3cc417b3efd275e30cad35a7618.1616513998.git.huangy81@chinatelecom.cn>
 <YFpEId2vw9ceC1Ly@work-vm> <58fd7151-f026-ca82-9818-8156083398db@redhat.com>
From: Hyman Huang <huangy81@chinatelecom.cn>
Message-ID: <4745b145-9678-a09c-be7b-bb1d9b4e6263@chinatelecom.cn>
Date: Wed, 24 Mar 2021 14:03:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <58fd7151-f026-ca82-9818-8156083398db@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/3/24 13:42, Thomas Huth 写道:
> On 23/03/2021 20.40, Dr. David Alan Gilbert wrote:
>> * huangy81@chinatelecom.cn (huangy81@chinatelecom.cn) wrote:
>>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>>
>>> when execute the following test command:
>>> $ ./guestperf-batch.py --auto-converge \
>>>      --auto-converge-step {percent} ...
>>> test aborts and error message be throwed as the following:
>>> "Parameter 'x-cpu-throttle-increment' is unexpected"
>>>
>>> The reason is that 'x-cpu-throttle-increment' has been
>>> deprecated and 'cpu-throttle-increment' was introduced
>>> Since v2.7. Use the new parameter instead.
>>>
>>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>
>> Please cc thuth@redhat.com and berrange@redhat.com on fixes to this
>> file.
> 
> This not really my turf, since it's not directly related to the qtests.
> 
> But I wonder why tests/migration/ is not listed in the "Migration" 
> sections in the MAINTAINERS file ... care to send a patch?

the following patch aim to do this, it's already reviewed and has not 
been merged yet.

https://patchew.org/QEMU/91d5978357fb8709ef61d2030984f7142847037d.1616141556.git.huangy81@chinatelecom.cn/

> 
>   Thomas
> 

-- 
Best regard

Hyman Huang(黄勇)

