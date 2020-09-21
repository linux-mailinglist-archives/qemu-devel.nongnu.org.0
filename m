Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12E0272651
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 15:49:51 +0200 (CEST)
Received: from localhost ([::1]:34410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKMCV-0003Yq-0V
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 09:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1kKMAn-0002wy-Id
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 09:48:07 -0400
Received: from kerio.kamp.de ([195.62.97.192]:48331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1kKMAk-0005bV-7L
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 09:48:04 -0400
X-Footer: a2FtcC5kZQ==
Received: from [172.21.12.60] ([172.21.12.60]) (authenticated user pl@kamp.de)
 by kerio.kamp.de with ESMTPSA
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits));
 Mon, 21 Sep 2020 15:47:54 +0200
Subject: Re: Limiting per vCPU Usage
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <68336702-cedc-dc38-3d18-d153cd7652dd@kamp.de>
 <20200921082950.GF1942072@redhat.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <ddc410b9-2c15-4398-86a9-df3441e62138@kamp.de>
Date: Mon, 21 Sep 2020 15:47:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200921082950.GF1942072@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 09:47:57
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 21.09.20 um 10:29 schrieb Daniel P. Berrangé:
> On Sun, Sep 20, 2020 at 10:24:41PM +0200, Peter Lieven wrote:
>> Hi Qemu folks,
>>
>>
>> is there a BCP to limit just the maximum usage of a virtual (KVM) cpu?
>>
>> I know that there are many approaches, but as far as I know they all limit the complete qemu process which is far more
>>
>> than just the virtual CPUs.
>>
>> Is it possible to limit just the vCPU threads and leave threads that
>> handle the monitor, vnc, qmp, iothreads, storage backend etc.
> Libvirt uses cgroups to achieve what you describe. A cgroup for the
> QEMU process as a whole, then create child cgroups, one for each
> vCPUs, and a further one for non-vCPU threads. CPU limits are then
> applied on the child cgroups.


Hi Daniel,


I came up with the same solution. Is there a nice way to get the thread ids of the vCPUs?

Iterating over all thread IDs and check the names works, but the thread names are not considered

a stable API (text from original commit message).


Thanks,

Peter




