Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D25415B21
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 11:39:52 +0200 (CEST)
Received: from localhost ([::1]:43388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTLCp-0004WU-8q
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 05:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mTKsQ-0008Ob-LU; Thu, 23 Sep 2021 05:18:47 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36568
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mTKsO-0003SE-48; Thu, 23 Sep 2021 05:18:46 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18N99SeQ008681; 
 Thu, 23 Sep 2021 05:18:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=s+uv/NL44JXDt7pESSOoLlCOGsyC8UiEzuAPep9Qcuo=;
 b=Hxqclnom0RtS1jMXSoVwdaklBpC5idBUd2jsPLnRxit19/xL4dWMy0MEsJREUTfyM9ZB
 3oKOAnGrOANrFROP87HxZpetFevszUkXGaG7yXjrxyy01OWX0Arqu39PrZgaRiUw6mfX
 E76tg5GJ7nA72ws/qPPJmNDL7y3uyU1foiJ36VwYH0aT54rN3LqNBT+URr454fSZl9yA
 COdP4O5G3T7zJcddBWRNeUPB+Ze02z01ylYBz9fulIW+5bVFqT2UkJWyFzjmZGKrYHkY
 89Ukd7of6zlvuuFQBMq242CLM3bBWxm9feKacDxenwmnQ/2789x7JPfB3n936zLJxrFb MA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b8n88tff4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 05:18:38 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18N8Tt9h015269;
 Thu, 23 Sep 2021 05:18:38 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b8n88tfeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 05:18:38 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18N9C3Pd014919;
 Thu, 23 Sep 2021 09:18:36 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3b7q6r83wv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 09:18:36 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18N9IWWB40894948
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Sep 2021 09:18:32 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB8A84204B;
 Thu, 23 Sep 2021 09:18:31 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55C7C42041;
 Thu, 23 Sep 2021 09:18:31 +0000 (GMT)
Received: from li-43c5434c-23b8-11b2-a85c-c4958fb47a68.ibm.com (unknown
 [9.171.67.19]) by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Sep 2021 09:18:31 +0000 (GMT)
Subject: Recent qemu patch results in aio failures with host DASD disks
 resulting in guest I/O errors
To: Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
 <20210625141822.1368639-19-pbonzini@redhat.com>
 <20210906162420.5af35eb9.pasic@linux.ibm.com>
 <20210922215143.7f289016.pasic@linux.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <8a64618b-5314-02d0-98b2-c031c02610e4@de.ibm.com>
Date: Thu, 23 Sep 2021 11:18:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210922215143.7f289016.pasic@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0R8ynoXdRb6YPS-Bu1mF3uMg490mF72O
X-Proofpoint-GUID: 0TKIQTrekzZ73_9eb1NBom1l4fjJnVXn
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_03,2021-09-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 clxscore=1011 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109200000 definitions=main-2109230056
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:AIO" <linux-aio@kvack.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Benjamin LaHaise <bcrl@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Hoeppner <Jan.Hoeppner@de.ibm.com>, Stefan Haberland <sth@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22.09.21 um 21:51 schrieb Halil Pasic:
> On Mon, 6 Sep 2021 16:24:20 +0200
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
>> On Fri, 25 Jun 2021 16:18:12 +0200
>> Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>>> bs->sg is only true for character devices, but block devices can also
>>> be used with scsi-block and scsi-generic.  Unfortunately BLKSECTGET
>>> returns bytes in an int for /dev/sgN devices, and sectors in a short
>>> for block devices, so account for that in the code.
>>>
>>> The maximum transfer also need not be a power of 2 (for example I have
>>> seen disks with 1280 KiB maximum transfer) so there's no need to pass
>>> the result through pow2floor.
>>>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>
>> We have found that this patch leads to in guest I/O errors when DASD
>> is used as a source device. I.e. libvirt domain xml wise something like:
>>
>>      <disk type='block' device='disk'>
>>        <driver name='qemu' type='raw' cache='none' io='native' iothread='1'/>
>>        <source dev='/dev/disk/by-id/ccw-XXXXXXX'/>
>>        <backingStore/>
>>        <target dev='vdb' bus='virtio'/>
>>        <address type='ccw' cssid='0xfe' ssid='0x0' devno='0x0008'/>
>>      </disk>
>>
>> I don't think it is the fault of this patch: it LGTM. But it correlates
>> 100%, furthermore the problem seems to be related to the value of
>> bl.max_iov which now comes from sysfs.
>>
>> We are still investigating what is actually wrong. Just wanted to give
>> everybody a heads-up that this does seem to cause a nasty regression on
>> s390x, even if the code itself is perfect.
>>
> 
> We have figured out what is going on here. The problem seems to be
> specific to linux aio, which seems to limit the size of the iovec to
> 1024 (UIO_MAXIOV).
> 
> Because of this requests get rejected with -EINVAL by the io_submit()
> syscall. Here comes a real world example:
> 
> (gdb) p *laiocb
> $5 = {co = 0x3ff700072c0, ctx = 0x3fe60002650, iocb = {data = 0x0, aio_rw_flags = 0, key = 0,
>      aio_lio_opcode = 8, aio_reqprio = 0, aio_fildes = 38, u = {c = {buf = 0x3ff70055bc0,
>          nbytes = 1274, offset = 19977953280, __pad3 = 0, flags = 1, resfd = 43}, v = {
>          vec = 0x3ff70055bc0, nr = 0, offset = 19977953280}, poll = {__pad1 = 1023,
>          events = 1879399360}, saddr = {addr = 0x3ff70055bc0, len = 0}}}, ret = -22,
>    nbytes = 20586496, qiov = 0x3ff700382f8, is_read = false, next = {sqe_next = 0x0}}
> 
> On the host kernel side, the -EINVAL comes from this line:
> https://elixir.bootlin.com/linux/v5.15-rc2/source/lib/iov_iter.c#L1863
> in iovec_from_user() roughly via: __do_sys_io_submit()->
> io_submit_one() -> aio_write() -> aio_setup_rw() -> __import_iovec().
> 
> Based on the offline discussion with the DASD maintainers, and on the
> linux in source tree documentation (Documentation/block/queue-sysfs.rst
> und Documentation/block/biodoc.rst), I believe that the DASD driver is
> not wrong when advertising the value 65535 for queue/max_segments.
> 
> I believe QEMU jumps to the wrong conclusion in blk_get_max_iov() or
> in virtio_blk_submit_multireq(), I can't really tell because I'm not
> sure what the semantic of blk_get_max_iov() is. But if, I had to, I would
> bet that blk_get_max_iov() returns the wrong value, when linux aio is
> used. I'm not sure what is the exact relationship between max_segments
> and max_iov.
> 
> One idea on how to fix this would be, to cap max_iov to UIO_MAXIOV
> (unconditionally, or when linux aio is used). But I have to admit, I
> don't have clarity. I couldn't even find documentation that states
> this limitation of linux aio (I didn't look for it too hard though), so
> I can not even be sure this is a QEMU problem.
> 
> That is why I decided to write this up first, and start a discussion on
> who is playing foul with the most relevant people posted. I intend to try
> myself fixing the problem once my understanding of it reaches a
> sufficient level.
> 
> Thanks in advance for your contribution!

Changing subject to reflect what we see.
For reference the QEMU patch is

https://git.qemu.org/?p=qemu.git;a=commitdiff;h=18473467d55a20d643b6c9b3a52de42f705b4d35;hp=24b36e9813ec15da7db62e3b3621730710c5f020

