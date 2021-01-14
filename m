Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE842F6B70
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:45:42 +0100 (CET)
Received: from localhost ([::1]:36222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08Yv-0007Px-Ab
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:45:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l08VG-000518-H4
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:41:54 -0500
Received: from kerio.kamp.de ([195.62.97.192]:47293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l08VC-0000qn-TG
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:41:54 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 20:41:43 +0100
Received: (qmail 22079 invoked from network); 14 Jan 2021 19:41:48 -0000
Received: from ac14.vpn.kamp-intra.net (HELO ?172.20.250.14?)
 (pl@kamp.de@::ffff:172.20.250.14)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
 14 Jan 2021 19:41:48 -0000
Subject: Re: [PATCH 6/7] block/rbd: add write zeroes support
To: dillaman@redhat.com
References: <20201227164236.10143-1-pl@kamp.de>
 <20201227164236.10143-7-pl@kamp.de>
 <CA+aFP1DZ2vyw8C0_=yPaYPhYFpQ9W8TszcUOBAtHLNMaATOW9Q@mail.gmail.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <2449ab2d-e9da-6e4e-7de5-8dd23501d27e@kamp.de>
Date: Thu, 14 Jan 2021 20:41:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+aFP1DZ2vyw8C0_=yPaYPhYFpQ9W8TszcUOBAtHLNMaATOW9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.237,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.01.21 um 20:19 schrieb Jason Dillaman:
> On Sun, Dec 27, 2020 at 11:42 AM Peter Lieven <pl@kamp.de> wrote:
>> Signed-off-by: Peter Lieven <pl@kamp.de>
>> ---
>>  block/rbd.c | 31 ++++++++++++++++++++++++++++++-
>>  1 file changed, 30 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/rbd.c b/block/rbd.c
>> index 2d77d0007f..27b4404adf 100644
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
>> @@ -221,8 +222,12 @@ done:
>>
>>  static void qemu_rbd_refresh_limits(BlockDriverState *bs, Error **errp)
>>  {
>> +    BDRVRBDState *s = bs->opaque;
>>      /* XXX Does RBD support AIO on less than 512-byte alignment? */
>>      bs->bl.request_alignment = 512;
>> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
>> +    bs->bl.pwrite_zeroes_alignment = s->object_size;
> The optimal alignment is 512 bytes -- but it can safely work just fine
> down to 1 byte alignment since it will pad the request with additional
> writes if needed.


Okay and this will likely be faster than having Qemu doing that request split, right?

If we drop the alignment hint Qemu will pass the original request.


>
>> +#endif
>>  }
>>
>>
>> @@ -695,6 +700,9 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>>      }
>>
>>      s->aio_context = bdrv_get_aio_context(bs);
>> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
>> +    bs->supported_zero_flags = BDRV_REQ_MAY_UNMAP;
>> +#endif
>>
>>      /* When extending regular files, we get zeros from the OS */
>>      bs->supported_truncate_flags = BDRV_REQ_ZERO_WRITE;
>> @@ -808,6 +816,11 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
>>      case RBD_AIO_FLUSH:
>>          r = rbd_aio_flush(s->image, c);
>>          break;
>> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
>> +    case RBD_AIO_WRITE_ZEROES:
>> +        r = rbd_aio_write_zeroes(s->image, offset, bytes, c, 0, 0);
>> +        break;
>> +#endif
>>      default:
>>          r = -EINVAL;
>>      }
>> @@ -880,6 +893,19 @@ static int coroutine_fn qemu_rbd_co_pdiscard(BlockDriverState *bs,
>>      return qemu_rbd_start_co(bs, offset, count, NULL, 0, RBD_AIO_DISCARD);
>>  }
>>
>> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
>> +static int
>> +coroutine_fn qemu_rbd_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
>> +                                      int count, BdrvRequestFlags flags)
>> +{
>> +    if (!(flags & BDRV_REQ_MAY_UNMAP)) {
>> +        return -ENOTSUP;
>> +    }
> There is a "RBD_WRITE_ZEROES_FLAG_THICK_PROVISION" flag that you can
> use to optionally disable unmap.


I have seen that. If you want I can support for this, too. But afaik this

is only available since Octopus release?


Peter



