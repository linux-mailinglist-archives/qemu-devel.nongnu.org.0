Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CD7414F41
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 19:38:15 +0200 (CEST)
Received: from localhost ([::1]:45094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT6CE-00060V-IP
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 13:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT69G-0002QR-TP
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:35:10 -0400
Received: from [115.28.160.31] (port=39872 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT69E-0002gl-Sf
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:35:10 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B919A633F2;
 Thu, 23 Sep 2021 01:35:03 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632332103; bh=E/iOeN8lkfVTPN+QdiksmYTtFvKgmSTT0EAxY6Xuw5U=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=vNF3Sg0Xhash0AU48P0Fq0rwa47aBiJX1ivfYd9W3ZkTEE17vbBLKxIoq39GJI4lS
 3azDB1yTVGUaXTIjcUrtmH6dtfHx4DJGS69MS2vclXfsMO9y+OvSolmzT+sI8PsImO
 4SPub/CKUh06Kg31orNE7cGhO9vhv7HeY/I6Uvpw=
Message-ID: <b6411271-105e-0661-9252-a3c9ca140115@xen0n.name>
Date: Thu, 23 Sep 2021 01:35:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v2 29/30] accel/tcg/user-exec: Implement CPU-specific
 signal handler for loongarch64 hosts
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-30-git@xen0n.name>
 <9e95577b-3c91-5ea0-fe0d-d14dd0bc079b@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <9e95577b-3c91-5ea0-fe0d-d14dd0bc079b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 9/23/21 00:51, Richard Henderson wrote:
> On 9/21/21 1:19 PM, WANG Xuerui wrote:
>> +        case 0b00011111110: /* stle.w */
>> +        case 0b00011111111: /* stle.d */
>> +            is_write = 1;
>> +            break;
>> +        default:
>> +            /* test for am* instruction range */
>> +            if (0b00011000000 <= sel && sel <= 0b00011100011) {
>> +                is_write = 1;
>> +            }
>
> Probably better to fold the range check into the switch with
>
>   case 0b00011000000 ... 0b00011100011:  /* am* insn range */

I just googled this particular syntax; it looks like a GCC-only 
extension, but is already used in a few places inside QEMU. So I think 
I'll take this advice and just make the range another switch arm.


