Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C82B2F6B88
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:54:08 +0100 (CET)
Received: from localhost ([::1]:56052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08h5-0008Fv-Ms
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:54:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l08cO-0002zr-2z
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:49:16 -0500
Received: from kerio.kamp.de ([195.62.97.192]:47347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l08cM-00034F-5c
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:49:15 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 20:49:06 +0100
Received: (qmail 22139 invoked from network); 14 Jan 2021 19:49:10 -0000
Received: from ac14.vpn.kamp-intra.net (HELO ?172.20.250.14?)
 (pl@kamp.de@::ffff:172.20.250.14)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
 14 Jan 2021 19:49:10 -0000
Subject: Re: [PATCH 4/7] block/rbd: add bdrv_{attach,detach}_aio_context
To: dillaman@redhat.com
References: <20201227164236.10143-1-pl@kamp.de>
 <20201227164236.10143-5-pl@kamp.de>
 <CA+aFP1Cbnt99DRQLwFRhxVj5Mnow6PtQpa0k4-ojOCJt3+JPJw@mail.gmail.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <a4874e73-7f6c-53f2-23c8-ec76b055ec57@kamp.de>
Date: Thu, 14 Jan 2021 20:49:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+aFP1Cbnt99DRQLwFRhxVj5Mnow6PtQpa0k4-ojOCJt3+JPJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.237,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.01.21 um 20:18 schrieb Jason Dillaman:
> On Sun, Dec 27, 2020 at 11:42 AM Peter Lieven <pl@kamp.de> wrote:
>> Signed-off-by: Peter Lieven <pl@kamp.de>
>> ---
>>  block/rbd.c | 21 +++++++++++++++++++--
>>  1 file changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/block/rbd.c b/block/rbd.c
>> index a2da70e37f..27b232f4d8 100644
>> --- a/block/rbd.c
>> +++ b/block/rbd.c
>> @@ -91,6 +91,7 @@ typedef struct BDRVRBDState {
>>      char *namespace;
>>      uint64_t image_size;
>>      uint64_t object_size;
>> +    AioContext *aio_context;
>>  } BDRVRBDState;
>>
>>  static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
>> @@ -749,6 +750,8 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>>          }
>>      }
>>
>> +    s->aio_context = bdrv_get_aio_context(bs);
>> +
>>      /* When extending regular files, we get zeros from the OS */
>>      bs->supported_truncate_flags = BDRV_REQ_ZERO_WRITE;
>>
>> @@ -839,8 +842,7 @@ static void rbd_finish_aiocb(rbd_completion_t c, RADOSCB *rcb)
>>      rcb->ret = rbd_aio_get_return_value(c);
>>      rbd_aio_release(c);
>>
>> -    replay_bh_schedule_oneshot_event(bdrv_get_aio_context(acb->common.bs),
>> -                                     rbd_finish_bh, rcb);
>> +    replay_bh_schedule_oneshot_event(acb->s->aio_context, rbd_finish_bh, rcb);
>>  }
>>
>>  static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
>> @@ -1151,6 +1153,18 @@ static const char *const qemu_rbd_strong_runtime_opts[] = {
>>      NULL
>>  };
>>
>> +static void qemu_rbd_attach_aio_context(BlockDriverState *bs,
>> +                                       AioContext *new_context)
>> +{
>> +    BDRVRBDState *s = bs->opaque;
>> +    s->aio_context = new_context;
>> +}
>> +
>> +static void qemu_rbd_detach_aio_context(BlockDriverState *bs)
>> +{
> I don't know enough about the internals of QEMU, but this seems
> suspicious to be a no-op.


You are right, I was believing attach and detach aio_context functions always needs to be implemented both at the same time.

Normally this is the point where internal timers will be deleted or polling an fd will be stopped.

We can leave it completely out or set s->aio_context = NULL if we don't want to omit it.


Peter




