Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABCD2B0519
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 13:43:10 +0100 (CET)
Received: from localhost ([::1]:52728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdBwT-0008WO-HW
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 07:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1kdBtf-0007Nq-JR
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 07:40:17 -0500
Received: from kerio.kamp.de ([195.62.97.192]:60957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1kdBtc-0002Ep-CL
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 07:40:15 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:39:59 +0100
Received: (qmail 64782 invoked from network); 12 Nov 2020 12:40:01 -0000
Received: from ac80.vpn.kamp-intra.net (HELO ?172.20.250.80?)
 (pl@kamp.de@::ffff:172.20.250.80)
 by submission.kamp.de with ESMTPS (AES128-SHA encrypted) ESMTPA;
 12 Nov 2020 12:40:01 -0000
Subject: Re: [PATCH 2/2] qemu-img: align next status sector on destination
 alignment.
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20201111153913.41840-1-mlevitsk@redhat.com>
 <20201111153913.41840-3-mlevitsk@redhat.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <2903c8a0-00c9-5f2c-b261-d825ded3042c@kamp.de>
Date: Thu, 12 Nov 2020 13:40:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201111153913.41840-3-mlevitsk@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 07:40:03
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jan Kara <jack@suse.cz>,
 qemu-block@nongnu.org, "Darrick J . Wong" <darrick.wong@oracle.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.11.20 um 16:39 schrieb Maxim Levitsky:
> This helps avoid unneeded writes and discards.
>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  qemu-img.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/qemu-img.c b/qemu-img.c
> index c2c56fc797..7e9b0f659f 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -1722,7 +1722,7 @@ static void convert_select_part(ImgConvertState *s, int64_t sector_num,
>  static int convert_iteration_sectors(ImgConvertState *s, int64_t sector_num)
>  {
>      int64_t src_cur_offset;
> -    int ret, n, src_cur;
> +    int ret, n, src_cur, alignment;
>      bool post_backing_zero = false;
>  
>      convert_select_part(s, sector_num, &src_cur, &src_cur_offset);
> @@ -1785,11 +1785,14 @@ static int convert_iteration_sectors(ImgConvertState *s, int64_t sector_num)
>          n = DIV_ROUND_UP(count, BDRV_SECTOR_SIZE);
>  
>          /*
> -         * Avoid that s->sector_next_status becomes unaligned to the source
> -         * request alignment and/or cluster size to avoid unnecessary read
> -         * cycles.
> +         * Avoid that s->sector_next_status becomes unaligned to the
> +         * source/destination request alignment and/or cluster size to avoid
> +         * unnecessary read/write cycles.
>           */
> -        tail = (sector_num - src_cur_offset + n) % s->src_alignment[src_cur];
> +        alignment = MAX(s->src_alignment[src_cur], s->alignment);
> +        assert(is_power_of_2(alignment));
> +
> +        tail = (sector_num - src_cur_offset + n) % alignment;
>          if (n > tail) {
>              n -= tail;
>          }


I was also considering including the s->alignment when adding this chance. However, you need the least common multiple of both alignments, not the maximum, otherwise

you might get misaligned to either source or destination.


Why exactly do you need the power of two requirement?


Peter



