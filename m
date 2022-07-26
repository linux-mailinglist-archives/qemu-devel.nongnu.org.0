Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620CB5815AA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 16:48:52 +0200 (CEST)
Received: from localhost ([::1]:55262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGLre-0006SG-Vt
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 10:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hao.xu@linux.dev>) id 1oGLkf-0006mE-2p
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:41:43 -0400
Received: from out1.migadu.com ([91.121.223.63]:64820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hao.xu@linux.dev>) id 1oGLkc-0006pq-Io
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:41:36 -0400
Message-ID: <1d1f7854-209a-a985-e266-633ca14609da@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1658846492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uM3CH25gIo/Rm3FI9V6Bp39HKdQs8n0Zh5ABXp6DsfA=;
 b=ZLXijxQIARPu8czQTmAusYCAz8xAvtJuHIvV87qpAeRPzKEVxb4cZvqG2jWsOzgmKpv2lT
 9WeIM92j40c10rEs8p8/d+Prujmw1bRw1T7LP6ePl3gLOipe0GWJmWI8G/f8H1TDBtHgl5
 6E2ZTGsiqcQtrj2Ra73vL7lYVFLaBVE=
Date: Tue, 26 Jul 2022 22:41:23 +0800
MIME-Version: 1.0
Subject: Re: Question about performance comparison between virtio-fs and
 virtio-blk
Content-Language: en-US
To: Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, virtio-fs@redhat.com
References: <4f2c71a4-609e-6880-04d0-2eb127c55023@linux.dev>
 <CAJSP0QUzd7GXK0XN7YBBfEqO6abQSZMdJzW8pEHnz-ZnGetUWA@mail.gmail.com>
 <Yt/pVXilvkiLgowx@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
In-Reply-To: <Yt/pVXilvkiLgowx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Received-SPF: pass client-ip=91.121.223.63; envelope-from=hao.xu@linux.dev;
 helo=out1.migadu.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On 7/26/22 21:17, Vivek Goyal wrote:
> On Tue, Jul 26, 2022 at 08:55:38AM -0400, Stefan Hajnoczi wrote:
>> On Tue, 26 Jul 2022 at 08:24, Hao Xu <hao.xu@linux.dev> wrote:
>>> I watched your presentation about virtiofs in 2020,
>>>
>>> https://www.youtube.com/watch?v=EIVOzTsGMMI&t=232s
>>>
>>> which is really helpful to me, but I have a question about the graph at
>>> 3:53, could you give
>>>
>>> me more info about the test, like what tool you use for the test, if
>>> it's fio, what is the parameters.
>>>
>>> I used fio to do randread test in a qemu box, but turns out the iops of
>>> virtio-blk and virtio-fs are similar.
>>
> 
> Hi Hao,
> 
> My impression in general is that virtio-blk is much faster than virtiofs.

When testing virtio-blk, did you use the device directly or mount it and
test against a file.

> A simple macro test is do a kernel compilation and compare time taken
> between the two.

Good idea, I just tested with single file.

Thanks,
Hao

> 
>> I have CCed Vivek Goyal, who has done more virtiofs benchmarking and
>> might have ideas to share.
>>
>> The benchmarking tool was fio with the stated blocksize and I/O
>> pattern. The benchmark was probably run with direct=1. Based on the
>> virtio-blk numbers I think iodepth was greater than 1 but I don't have
>> the exact fio job parameters.
> 
> I had basically used fio jobs. I wrote some simple wrapper scripts to
> run fio and parse and report numbers.
> 
> https://github.com/rhvgoyal/virtiofs-tests
> 
> I don't have data for virtio-blk but I do seem to have some comparison
> numbers of virtiofs and virtio-9p.
> 
> https://github.com/rhvgoyal/virtiofs-tests/tree/master/performance-results/feb-23-2021
> 
> Thanks
> Vivek
> 
> 


