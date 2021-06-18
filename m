Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4E33AC6BE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 11:04:09 +0200 (CEST)
Received: from localhost ([::1]:55510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luAQ4-0006IV-JS
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 05:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1luAMn-0004O8-Qo
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:00:45 -0400
Received: from kerio.kamp.de ([195.62.97.192]:40654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1luAMk-0001Ks-Ni
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:00:45 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:00:36 +0200
Received: (qmail 39678 invoked from network); 18 Jun 2021 09:00:38 -0000
Received: from ac17.vpn.kamp-intra.net (HELO ?172.20.250.17?)
 (pl@kamp.de@::ffff:172.20.250.17)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
 18 Jun 2021 09:00:38 -0000
Subject: Re: [PATCH V3 5/6] block/rbd: add write zeroes support
To: Ilya Dryomov <idryomov@gmail.com>
References: <20210519142359.23083-1-pl@kamp.de>
 <20210519142359.23083-6-pl@kamp.de>
 <CAOi1vP8AFWaS7Qwu8DVQP0EGZh48CcsrYnTfCWU2J6ZctGA2EQ@mail.gmail.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <99aaf586-5555-8c45-08c8-e50e3b5919de@kamp.de>
Date: Fri, 18 Jun 2021 11:00:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOi1vP8AFWaS7Qwu8DVQP0EGZh48CcsrYnTfCWU2J6ZctGA2EQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.254,
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, ct@flyingcircus.io, Paolo Bonzini <pbonzini@redhat.com>,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.06.21 um 14:34 schrieb Ilya Dryomov:
> On Wed, May 19, 2021 at 4:28 PM Peter Lieven <pl@kamp.de> wrote:
>> Signed-off-by: Peter Lieven <pl@kamp.de>
>> ---
>>  block/rbd.c | 37 ++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 36 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/rbd.c b/block/rbd.c
>> index 0d8612a988..ee13f08a74 100644
>> --- a/block/rbd.c
>> +++ b/block/rbd.c
>> @@ -63,7 +63,8 @@ typedef enum {
>>      RBD_AIO_READ,
>>      RBD_AIO_WRITE,
>>      RBD_AIO_DISCARD,
>> -    RBD_AIO_FLUSH
>> +    RBD_AIO_FLUSH,
>> +    RBD_AIO_WRITE_ZEROES
>>  } RBDAIOCmd;
>>
>>  typedef struct BDRVRBDState {
>> @@ -705,6 +706,10 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>>          }
>>      }
>>
>> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
>> +    bs->supported_zero_flags = BDRV_REQ_MAY_UNMAP;
> I wonder if we should also set BDRV_REQ_NO_FALLBACK here since librbd
> does not really have a notion of non-efficient explicit zeroing.


This is only true if thick provisioning is supported which is in Octopus onwards, right?

So it would only be correct to set this if thick provisioning is supported otherwise we could

fail with ENOTSUP and then qemu emulates the zeroing with plain writes.


Peter




