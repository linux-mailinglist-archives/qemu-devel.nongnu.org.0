Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B187132BBA2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 22:28:06 +0100 (CET)
Received: from localhost ([::1]:60642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZ2L-0002Os-P7
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 16:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1lHZ0o-0001rg-I0
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 16:26:30 -0500
Received: from kerio.kamp.de ([195.62.97.192]:40902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1lHZ0j-0004SP-TP
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 16:26:30 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Wed, 3 Mar 2021 22:26:07 +0100
Received: (qmail 11052 invoked from network); 3 Mar 2021 21:26:13 -0000
Received: from ac19.vpn.kamp-intra.net (HELO ?172.20.250.19?)
 (pl@kamp.de@::ffff:172.20.250.19)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
 3 Mar 2021 21:26:13 -0000
Subject: Re: QEMU RBD is slow with QCOW2 images
To: dillaman@redhat.com, Stefano Garzarella <sgarzare@redhat.com>
References: <20210303174058.sdy5ygdfu75xy4rr@steredhat>
 <CA+aFP1CXWaZ4a7pB2EGhyf1CWt5k884qwgvwKxSRrZKTn=f3wg@mail.gmail.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <f1ba8a4c-94b6-fc94-131d-fd41ce96e6de@kamp.de>
Date: Wed, 3 Mar 2021 22:26:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+aFP1CXWaZ4a7pB2EGhyf1CWt5k884qwgvwKxSRrZKTn=f3wg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.03.21 um 19:47 schrieb Jason Dillaman:
> On Wed, Mar 3, 2021 at 12:41 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>> Hi Jason,
>> as reported in this BZ [1], when qemu-img creates a QCOW2 image on RBD
>> writing data is very slow compared to a raw file.
>>
>> Comparing raw vs QCOW2 image creation with RBD I found that we use a
>> different object size, for the raw file I see '4 MiB objects', for QCOW2
>> I see '64 KiB objects' as reported on comment 14 [2].
>> This should be the main issue of slowness, indeed forcing in the code 4
>> MiB object size also for QCOW2 increased the speed a lot.
>>
>> Looking better I discovered that for raw files, we call rbd_create()
>> with obj_order = 0 (if 'cluster_size' options is not defined), so the
>> default object size is used.
>> Instead for QCOW2, we use obj_order = 16, since the default
>> 'cluster_size' defined for QCOW2, is 64 KiB.
>>
>> Using '-o cluster_size=2M' with qemu-img changed only the qcow2 cluster
>> size, since in qcow2_co_create_opts() we remove the 'cluster_size' from
>> QemuOpts calling qemu_opts_to_qdict_filtered().
>> For some reason that I have yet to understand, after this deletion,
>> however remains in QemuOpts the default value of 'cluster_size' for
>> qcow2 (64 KiB), that it's used in qemu_rbd_co_create_opts()
>>
>> At this point my doubts are:
>> Does it make sense to use the same cluster_size as qcow2 as object_size
>> in RBD?
> No, not really. But it also doesn't really make any sense to put a
> QCOW2 image within an RBD image. To clarify from the BZ, OpenStack
> does not put QCOW2 images on RBD, it converts QCOW2 images into raw
> images to store in RBD.


As discussed earlier the only reasonable format for rbd image is raw.

What is the idea behind putting a qcow2 on an rbd pool?

Jason and I even discussed shortly durign the review of the rbd driver rewrite I posted

earlier if it was ok to drop support for writing past the end of file.


Anyway the reason why it is so slow is that write requests serialize if the

qcow2 file grows. If there is a sane reason why we need qcow2 on rbd

we need to implement at least preallocation mode = full to overcome

the serialization.


Peter



