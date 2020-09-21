Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F19E271AA9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 08:05:07 +0200 (CEST)
Received: from localhost ([::1]:49370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKEwk-0008Io-1u
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 02:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kKEvS-0007sj-Er
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 02:03:46 -0400
Received: from mail.ispras.ru ([83.149.199.84]:60448)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kKEvQ-0000Lg-1R
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 02:03:46 -0400
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id F06BA40D403E;
 Mon, 21 Sep 2020 06:03:37 +0000 (UTC)
Subject: Re: [PATCH v4 00/15] Reverse debugging
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <160006358590.31457.16757371597343007847.stgit@pasha-ThinkPad-X280>
 <ad338011-6abf-7833-6553-cf724b4fb23d@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <70d75fb9-fb91-8574-2f69-f730969a61ba@ispras.ru>
Date: Mon, 21 Sep 2020 09:03:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ad338011-6abf-7833-6553-cf724b4fb23d@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 02:03:38
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
Cc: kwolf@redhat.com, wrampazz@redhat.com, ehabkost@redhat.com,
 alex.bennee@linaro.org, mtosatti@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, stefanha@redhat.com, crosa@redhat.com, philmd@redhat.com,
 zhiwei_liu@c-sky.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.09.2020 10:58, Paolo Bonzini wrote:
> On 14/09/20 08:06, Pavel Dovgalyuk wrote:
>> GDB remote protocol supports reverse debugging of the targets.
>> It includes 'reverse step' and 'reverse continue' operations.
>> The first one finds the previous step of the execution,
>> and the second one is intended to stop at the last breakpoint that
>> would happen when the program is executed normally.
>>
>> Reverse debugging is possible in the replay mode, when at least
>> one snapshot was created at the record or replay phase.
>> QEMU can use these snapshots for travelling back in time with GDB.
> 
> I had queued this, it is a very nice patch series.  Unfortunately, the
> tests failed on gitlab:
> 
> https://gitlab.com/bonzini/qemu/-/jobs/745795080

There is a strange thing in your environment:

15:49:41 INFO | Downloading/preparing boot image
15:49:42 INFO | Running '/builds/bonzini/qemu/build/qemu-img create -f 
qcow2 -b 
/builds/bonzini/qemu/avocado-cache/by_location/d2a8d6b607afec50de14560c064f34ffd99836b2/Fedora-Cloud-Base-31-1.9.x86_64.qcow2 
/var/tmp/avocado_tj2janfx/avocado_job_ys7ueohj/04-tests_acceptance_boot_linux.py_BootLinuxX8664.test_pc_q35_kvm/Fedora-Cloud-Base-31-1.9.x86_64-d1ac1224.qcow2'


It downloads boot image, but there is no such requirement in the test.
And all this stuff consumes most of the time for the test.

Pavel Dovgalyuk



