Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77695310702
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 09:49:53 +0100 (CET)
Received: from localhost ([::1]:51106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7woK-00046l-Hu
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 03:49:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l7wmU-0002hb-Ir
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 03:47:58 -0500
Received: from kerio.kamp.de ([195.62.97.192]:35387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l7wmH-00022I-UY
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 03:47:58 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Fri, 5 Feb 2021 09:47:36 +0100
Received: (qmail 11233 invoked from network); 5 Feb 2021 08:47:40 -0000
Received: from p4fc9d803.dip0.t-ipconnect.de (HELO ?192.168.178.50?)
 (pl@kamp.de@::ffff:79.201.216.3)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
 5 Feb 2021 08:47:40 -0000
Subject: Re: [PATCH] qemu-img: add seek and -n option to dd command
To: Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
References: <20210128140704.6547-1-pl@kamp.de>
 <99982043-ed89-5fbe-afe2-691a9c19280d@redhat.com>
 <567ab8bb-b452-d6c2-dec7-bc2cf1e34ec8@kamp.de>
 <be6e992c-fbb6-2f16-a066-0ef1e1ace9e5@redhat.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <70e0dbc0-4770-a409-945e-c31e0d93081b@kamp.de>
Date: Fri, 5 Feb 2021 09:47:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <be6e992c-fbb6-2f16-a066-0ef1e1ace9e5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.182,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.02.21 um 09:18 schrieb Max Reitz:
> On 04.02.21 21:09, Peter Lieven wrote:
>> Am 02.02.21 um 16:51 schrieb Eric Blake:
>>> On 1/28/21 8:07 AM, Peter Lieven wrote:
>>>> Signed-off-by: Peter Lieven <pl@kamp.de>
>>> Your commit message says 'what', but not 'why'.  Generally, the one-line
>>> 'what' works well as the subject line, but you want the commit body to
>>> give an argument why your patch should be applied, rather than blank.
>>>
>>> Here's the last time we tried to improve qemu-img dd:
>>> https://lists.gnu.org/archive/html/qemu-devel/2018-08/msg02618.html
>>
>>
>> I was not aware of that story. My use case is that I want to be
>>
>> able to "patch" an image that Qemu is able to handle by overwriting
>>
>> certain sectors. And I especially do not want to "mount" that image
>>
>> via qemu-nbd because I might not trust it. I totally want to avoid that the host
>>
>> system tries to analyse that image in terms of scanning the bootsector, partprobe,
>>
>> lvm etc. pp.
>
> qemu will have FUSE exporting as of 6.0 (didn’t quite make it into 5.2), so you can do something like this:
>
> $ qemu-storage-daemon \
>     --blockdev node-name=export,driver=qcow2,\
> file.driver=file,file.filename=image.qcow2 \
>     --export fuse,id=fuse,node-name=export,mountpoint=image.qcow2
>
> This exports the image on image.qcow2 (i.e., on itself) and so by accessing the image file you then get raw access to its contents (so you can use system tools like dd).
>
> Doesn’t require root rights, and shouldn’t make the kernel scan anything, because it’s exported as just a regular file.


Okay, but that is still more housekeeping than just invoking a single command.

Would it be an option to extend qemu-io to write data at a certain offset which it reads from STDIN?


Peter




