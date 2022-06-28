Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C546255BF76
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:34:53 +0200 (CEST)
Received: from localhost ([::1]:39886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66gO-0004eE-Rz
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o65nd-0004Qw-Sp; Tue, 28 Jun 2022 03:38:17 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:40584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o65na-0005VD-T5; Tue, 28 Jun 2022 03:38:16 -0400
Received: from myt6-79704c0e15e4.qloud-c.yandex.net
 (myt6-79704c0e15e4.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:239b:0:640:7970:4c0e])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id AA2752E128F;
 Tue, 28 Jun 2022 10:38:05 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 RUJOgivgZa-c5JCWDXF; Tue, 28 Jun 2022 10:38:05 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656401885; bh=oAjHjZJArRDMK5T/EMYfa7dk+uo2X60w4WNkFeBufFo=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=vh32LjeLQJXSXM+sBMXKWr+1tx1iqqdfftEAuplK+LzXLVdFCbWMu1EJ5Q9FYf0Z/
 Otuf7mRghH4HYxz3vV0H7AeT+ACNu4idQfAQsX37n7WJGm1Tgs3o7dpAyPhHCU/8nv
 YMu6CzpMgv9RSQNFZj3DjQ/iTkypx+Biw7dZHw74=
Authentication-Results: myt6-79704c0e15e4.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:b686::1:1f] (unknown
 [2a02:6b8:b081:b686::1:1f])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 y1NPRZGX6r-c4MWLVib; Tue, 28 Jun 2022 10:38:04 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <2087da15-141d-ba6d-04c6-c670f5faf8a4@yandex-team.ru>
Date: Tue, 28 Jun 2022 10:38:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 6/7] block/copy-before-write: implement cbw-timeout
 option
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 stefanha@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 v.sementsov-og@mail.ru, jsnow@redhat.com, vsementsov@openvz.org
References: <20220407132726.85114-1-vsementsov@openvz.org>
 <20220407132726.85114-7-vsementsov@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220407132726.85114-7-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

While debugging my "[PULL 00/10] Block jobs & NBD patches", I found that we have bdrv_dec_in_flight() and bdrv_inc_in_flight().

So, this should be fixed:

On 4/7/22 16:27, Vladimir Sementsov-Ogievskiy wrote:
> In some scenarios, when copy-before-write operations lasts too long
> time, it's better to cancel it.
> 
> Most useful would be to use the new option together with
> on-cbw-error=break-snapshot: this way if cbw operation takes too long
> time we'll just cancel backup process but do not disturb the guest too
> much.
> 

[..]

>   
> +static void block_copy_cb(void *opaque)
> +{
> +    BlockDriverState *bs = opaque;
> +
> +    bs->in_flight--;
> +    aio_wait_kick();

Just bdrv_dec_in_flight(bs), which includes aio_wait_kick().

> +}
> +
>   /*
>    * Do copy-before-write operation.
>    *
> @@ -111,7 +120,16 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
>       off = QEMU_ALIGN_DOWN(offset, cluster_size);
>       end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
>   
> -    ret = block_copy(s->bcs, off, end - off, true, 0, NULL, NULL);
> +    /*
> +     * Increase in_flight, so that in case of timed-out block-copy, the
> +     * remaining background block_copy() request (which can't be immediately
> +     * cancelled by timeout) is presented in bs->in_flight. This way we are
> +     * sure that on bs close() we'll previously wait for all timed-out but yet
> +     * running block_copy calls.
> +     */
> +    bs->in_flight++;

bdrv_inc_in_flight(bs)

> +    ret = block_copy(s->bcs, off, end - off, true, s->cbw_timeout_ns,
> +                     block_copy_cb, bs);
>       if (ret < 0 && s->on_cbw_error == ON_CBW_ERROR_BREAK_GUEST_WRITE) {
>           return ret;
>       }
> @@ -377,6 +395,7 @@ static BlockdevOptions *cbw_parse_options(QDict *options, Error **errp)
>        */
>       qdict_extract_subqdict(options, NULL, "bitmap");
>       qdict_del(options, "on-cbw-error");
> +    qdict_del(options, "cbw-timeout");
>   

I'm going to resend "[PULL 00/10] Block jobs & NBD patches" with this fix and with fix in 03, if no objections.

-- 
Best regards,
Vladimir

