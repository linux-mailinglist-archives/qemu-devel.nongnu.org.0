Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D50229EEB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 20:06:29 +0200 (CEST)
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyJ8O-0005cX-2x
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 14:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jan.kiszka@siemens.com>)
 id 1jyJ7B-00055E-CU
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 14:05:14 -0400
Received: from thoth.sbs.de ([192.35.17.2]:47424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jan.kiszka@siemens.com>)
 id 1jyJ74-0003Ah-Qk
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 14:05:12 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 06MI52fm019429
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 20:05:02 +0200
Received: from [167.87.88.27] ([167.87.88.27])
 by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06MI51v5015681;
 Wed, 22 Jul 2020 20:05:01 +0200
Subject: Re: 5.1.0-rc1 regression: reset fails with kvm and -cpu host
To: Eduardo Habkost <ehabkost@redhat.com>
References: <bf007af9-f81e-3542-0237-5ea467f34377@siemens.com>
 <20200722173513.GO1274972@habkost.net>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7be95bd6-dfc6-2c22-85a1-a1c932d07fdd@siemens.com>
Date: Wed, 22 Jul 2020 20:05:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722173513.GO1274972@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.35.17.2; envelope-from=jan.kiszka@siemens.com;
 helo=thoth.sbs.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 14:05:02
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.07.20 19:35, Eduardo Habkost wrote:
> Hi Jan,
> 
> What was the last version where it worked for you?  Does using
> "-cpu host,-vmx" help?

Yeah, -vmx does indeed help.

I didn't have the time to bisect yet. Just check my reflog, picked 
eb6490f544, and that works.

HTH,
Jan

> 
> 
> On Wed, Jul 22, 2020 at 11:15:43AM +0200, Jan Kiszka wrote:
>> Hi all,
>>
>> this locks up the guest:
>>
>> - qemu-system-x86_64 -enable-kvm -cpu host
>> - trigger hard reset
>>
>> Host kernel: 5.7.7.
>> Host CPU: i7-8850H
>>
>> Jan
>>
>> -- 
>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>> Corporate Competence Center Embedded Linux
>>
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

