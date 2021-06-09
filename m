Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5253A1ABD
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 18:17:22 +0200 (CEST)
Received: from localhost ([::1]:43450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0tN-00085d-T7
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 12:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lr0rT-0005uL-Gf
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:15:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lr0rO-0005jr-Nu
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623255318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pBeIdckPqRGu2pOIHn8OC/Xu07cFv0G9JKawZCBWh0I=;
 b=SgaRiZJl51qk2a+vaLVHX3GLKifTpYBQSXDBDtMAICN5V2yZZdk/GRil2z4+IJdCuPqsDq
 5ATcBUTrx5UUge7few5W0KvoDWiJErVVqo5sHvuy3jalr1s9C9MPTkCR9GuWVJK9ieruWu
 qwY92Ve7w7Sh74+L43nuYIxIppIxu70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-fep_rwQZM92QZmCjhz_MTQ-1; Wed, 09 Jun 2021 12:15:15 -0400
X-MC-Unique: fep_rwQZM92QZmCjhz_MTQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B246801B13;
 Wed,  9 Jun 2021 16:15:14 +0000 (UTC)
Received: from starship (unknown [10.40.194.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56D04608BA;
 Wed,  9 Jun 2021 16:15:12 +0000 (UTC)
Message-ID: <45eefdf4fe01268dd851bb04194e5ffba727cf95.camel@redhat.com>
Subject: Re: [PATCH v4 4/7] file-posix: try BLKSECTGET on block devices too,
 do not round to power of 2
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Date: Wed, 09 Jun 2021 19:15:11 +0300
In-Reply-To: <20210608131634.423904-5-pbonzini@redhat.com>
References: <20210608131634.423904-1-pbonzini@redhat.com>
 <20210608131634.423904-5-pbonzini@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, Tom Yan <tom.ty89@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-06-08 at 15:16 +0200, Paolo Bonzini wrote:
> bs->sg is only true for character devices, but block devices can also
> be used with scsi-block and scsi-generic.  Unfortunately BLKSECTGET
> returns bytes in an int for /dev/sgN devices, and sectors in a short
> for block devices, so account for that in the code.
> 
> The maximum transfer also need not be a power of 2 (for example I have
> seen disks with 1280 KiB maximum transfer) so there's no need to pass
> the result through pow2floor.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/file-posix.c | 44 ++++++++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 20 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index c9746d3eb6..1439293f63 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1149,22 +1149,27 @@ static void raw_reopen_abort(BDRVReopenState *state)
>      s->reopen_state = NULL;
>  }
>  
> -static int sg_get_max_transfer_length(int fd)
> +static int hdev_get_max_hw_transfer(int fd, struct stat *st)
>  {
>  #ifdef BLKSECTGET
> -    int max_bytes = 0;
> -
> -    if (ioctl(fd, BLKSECTGET, &max_bytes) == 0) {
> -        return max_bytes;
> +    if (S_ISBLK(st->st_mode)) {
> +        unsigned short max_sectors = 0;
> +        if (ioctl(fd, BLKSECTGET, &max_sectors) == 0) {
> +            return max_sectors * 512;
> +        }
>      } else {
> -        return -errno;
> +        int max_bytes = 0;
> +        if (ioctl(fd, BLKSECTGET, &max_bytes) == 0) {

Again I would use the bs->sg for that.

> +            return max_bytes;
> +        }
>      }
> +    return -errno;
>  #else
>      return -ENOSYS;
>  #endif
>  }
>  
> -static int sg_get_max_segments(int fd)
> +static int hdev_get_max_segments(int fd, struct stat *st)
>  {
>  #ifdef CONFIG_LINUX
>      char buf[32];
> @@ -1173,26 +1178,20 @@ static int sg_get_max_segments(int fd)
>      int ret;
>      int sysfd = -1;
>      long max_segments;
> -    struct stat st;
>  
> -    if (fstat(fd, &st)) {
> -        ret = -errno;
> -        goto out;
> -    }
> -
> -    if (S_ISCHR(st.st_mode)) {
> +    if (S_ISCHR(st->st_mode)) {
>          if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
>              return ret;
>          }
>          return -ENOTSUP;
>      }
>  
> -    if (!S_ISBLK(st.st_mode)) {
> +    if (!S_ISBLK(st->st_mode)) {
>          return -ENOTSUP;
>      }
>  
>      sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
> -                                major(st.st_rdev), minor(st.st_rdev));
> +                                major(st->st_rdev), minor(st->st_rdev));
>      sysfd = open(sysfspath, O_RDONLY);
>      if (sysfd == -1) {
>          ret = -errno;
> @@ -1229,15 +1228,20 @@ out:
>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      BDRVRawState *s = bs->opaque;
> +    struct stat st;
> +
> +    if (fstat(s->fd, &st)) {
> +        return;
> +    }
>  
> -    if (bs->sg) {
> -        int ret = sg_get_max_transfer_length(s->fd);
> +    if (bs->sg || S_ISBLK(st.st_mode)) {
> +        int ret = hdev_get_max_hw_transfer(s->fd, &st);
>  
>          if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
> -            bs->bl.max_hw_transfer = pow2floor(ret);
> +            bs->bl.max_hw_transfer = ret;
>          }
>  
> -        ret = sg_get_max_segments(s->fd);
> +        ret = hdev_get_max_segments(s->fd, &st);
>          if (ret > 0) {
>              bs->bl.max_iov = ret;
>          }


Roughly speaking this looks correct, but I might have missed something as well.

This is roughly the same as patches from Tom Yan which I carried in my series

https://www.mail-archive.com/qemu-devel@nongnu.org/msg768258.html
https://www.mail-archive.com/qemu-devel@nongnu.org/msg768262.html


I like a bit more how he created separate functions for /dev/sg and for all other block devices.
Please take a look.

Also not related to this patch, you are missing my fix I did to the VPD limit emulation, please consider taking
it into the series:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg768260.html


Best regards,
	Maxim Levitsky




