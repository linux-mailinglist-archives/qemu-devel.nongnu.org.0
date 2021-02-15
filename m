Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC4F31B855
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:49:43 +0100 (CET)
Received: from localhost ([::1]:52816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcNr-00042W-0P
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:49:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1lBcMX-0003WO-Nb; Mon, 15 Feb 2021 06:48:21 -0500
Received: from kerio.kamp.de ([195.62.97.192]:51615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1lBcMW-00025I-58; Mon, 15 Feb 2021 06:48:21 -0500
X-Footer: a2FtcC5kZQ==
Received: from [172.21.12.60] ([172.21.12.60]) (authenticated user pl@kamp.de)
 by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Mon, 15 Feb 2021 12:48:12 +0100
Subject: Re: [PATCH V2 4/7] block/rbd: add bdrv_attach_aio_context
To: Kevin Wolf <kwolf@redhat.com>
References: <20210126112540.11880-1-pl@kamp.de>
 <20210126112540.11880-5-pl@kamp.de> <20210215102031.GD7226@merkur.fritz.box>
From: Peter Lieven <pl@kamp.de>
Message-ID: <ef5bb8d5-b67c-fcff-0720-bb1eedf5358f@kamp.de>
Date: Mon, 15 Feb 2021 12:48:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210215102031.GD7226@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
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
Cc: qemu-block@nongnu.org, ct@flyingcircus.io, qemu-devel@nongnu.org,
 pbonzini@redhat.com, mreitz@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.02.21 um 11:20 schrieb Kevin Wolf:
> Am 26.01.2021 um 12:25 hat Peter Lieven geschrieben:
>> Signed-off-by: Peter Lieven <pl@kamp.de>
>> ---
>>   block/rbd.c | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/block/rbd.c b/block/rbd.c
>> index f68ebcf240..7abd0252c9 100644
>> --- a/block/rbd.c
>> +++ b/block/rbd.c
>> @@ -91,6 +91,7 @@ typedef struct BDRVRBDState {
>>       char *namespace;
>>       uint64_t image_size;
>>       uint64_t object_size;
>> +    AioContext *aio_context;
>>   } BDRVRBDState;
> A commit message explaining the why would be helpful here.
>
> This is already stored in BlockDriverState, which should be available
> everywhere. Keeping redundant information needs a good justification,
> which seems unlikely when BlockDriverState and BDRVRBDState are already
> connected through the BlockDriverState.opaque pointer.
>
> The rest of the series doesn't seem to make more use of it either.


You are right. I was not aware that the aio_context is already there.

We keep a local copy of aio_context in iscsi and nfs driver as well. That

is where I got it from. I will change it if we don't drop the series completely.


Peter




