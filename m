Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432C02DD582
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 17:54:21 +0100 (CET)
Received: from localhost ([::1]:41572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpwXj-0001N5-47
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 11:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpwV3-0008Qx-SV
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:51:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpwV1-0002OR-7W
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:51:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608223890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YOeVbU0ODFRQh5p3gAiAqVn+cohW7EpHB375KTAtU2g=;
 b=Wbvk9iCCBb3ZyezcPaJdUNJID5lDoIhmg2zsw058BMTMT4Q2+Cgv9FPoo11hoDoYjJm6ui
 p5RTfxFGT0/ze8ykGDil0kn26EgPM8vz2hV6g0sB37osgqXsmfATCEowzesrBARdY/ss/D
 9Alf383zlnGjxmGW5immlTAupGHTM8A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-IxkfkvbKPnq-pSyZnCf5JQ-1; Thu, 17 Dec 2020 11:51:28 -0500
X-MC-Unique: IxkfkvbKPnq-pSyZnCf5JQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48E95800D55;
 Thu, 17 Dec 2020 16:51:27 +0000 (UTC)
Received: from starship (unknown [10.35.206.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68F70E73C;
 Thu, 17 Dec 2020 16:51:16 +0000 (UTC)
Message-ID: <48fbfb7519dedd9ca32a1ab4c72aee22699973f8.camel@redhat.com>
Subject: Re: [PATCH v2 1/5] file-posix: split hdev_refresh_limits from
 raw_refresh_limits
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Tom Yan <tom.ty89@gmail.com>
Date: Thu, 17 Dec 2020 18:51:15 +0200
In-Reply-To: <CAGnHSEni73NXKEhoBBpgnD1xyfyUBkAnK_7r-u0kwn6xQoD7_A@mail.gmail.com>
References: <20201209135355.561745-1-mlevitsk@redhat.com>
 <20201209135355.561745-2-mlevitsk@redhat.com>
 <CAGnHSEni73NXKEhoBBpgnD1xyfyUBkAnK_7r-u0kwn6xQoD7_A@mail.gmail.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2020-12-10 at 18:36 +0800, Tom Yan wrote:
> On Wed, 9 Dec 2020 at 21:54, Maxim Levitsky <mlevitsk@redhat.com> wrote:
> > From: Tom Yan <tom.ty89@gmail.com>
> > 
> > We can and should get max transfer length and max segments for all host
> > devices / cdroms (on Linux).
> > 
> > Also use MIN_NON_ZERO instead when we clamp max transfer length against
> > max segments.
> > 
> > Signed-off-by: Tom Yan <tom.ty89@gmail.com>
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  block/file-posix.c | 59 +++++++++++++++++++++++++++++++++-------------
> >  1 file changed, 43 insertions(+), 16 deletions(-)
> > 
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index d5fd1dbcd2..226ddbbdad 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -1162,6 +1162,12 @@ static void raw_reopen_abort(BDRVReopenState *state)
> > 
> >  static int sg_get_max_transfer_length(int fd)
> >  {
> > +    /*
> > +     * BLKSECTGET for /dev/sg* character devices incorrectly returns
> > +     * the max transfer size in bytes (rather than in blocks).
> > +     * Also note that /dev/sg* doesn't support BLKSSZGET ioctl.
> > +     */
> The second statement should be removed. Also maybe it's better to have
> the first one right above the line `return max_bytes;`.
Done, thanks.

Best regards,
	Maxim Levitsky

> > +
> >  #ifdef BLKSECTGET
> >      int max_bytes = 0;
> > 
> > @@ -1175,7 +1181,22 @@ static int sg_get_max_transfer_length(int fd)
> >  #endif
> >  }
> > 
> > -static int sg_get_max_segments(int fd)
> > +static int get_max_transfer_length(int fd)
> > +{
> > +#if defined(BLKSECTGET)
> > +    int sect = 0;
> > +
> > +    if (ioctl(fd, BLKSECTGET, &sect) == 0) {
> > +        return sect << 9;
> > +    } else {
> > +        return -errno;
> > +    }
> > +#else
> > +    return -ENOSYS;
> > +#endif
> > +}
> > +
> > +static int get_max_segments(int fd)
> >  {
> >  #ifdef CONFIG_LINUX
> >      char buf[32];
> > @@ -1230,23 +1251,29 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
> >  {
> >      BDRVRawState *s = bs->opaque;
> > 
> > -    if (bs->sg) {
> > -        int ret = sg_get_max_transfer_length(s->fd);
> > +    raw_probe_alignment(bs, s->fd, errp);
> > +    bs->bl.min_mem_alignment = s->buf_align;
> > +    bs->bl.opt_mem_alignment = MAX(s->buf_align, qemu_real_host_page_size);
> > +}
> > 
> > -        if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
> > -            bs->bl.max_transfer = pow2floor(ret);
> > -        }
> > +static void hdev_refresh_limits(BlockDriverState *bs, Error **errp)
> > +{
> > +    BDRVRawState *s = bs->opaque;
> > 
> > -        ret = sg_get_max_segments(s->fd);
> > -        if (ret > 0) {
> > -            bs->bl.max_transfer = MIN(bs->bl.max_transfer,
> > -                                      ret * qemu_real_host_page_size);
> > -        }
> > +    int ret = bs->sg ? sg_get_max_transfer_length(s->fd) :
> > +                       get_max_transfer_length(s->fd);
> > +
> > +    if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
> > +        bs->bl.max_transfer = pow2floor(ret);
> >      }
> > 
> > -    raw_probe_alignment(bs, s->fd, errp);
> > -    bs->bl.min_mem_alignment = s->buf_align;
> > -    bs->bl.opt_mem_alignment = MAX(s->buf_align, qemu_real_host_page_size);
> > +    ret = get_max_segments(s->fd);
> > +    if (ret > 0) {
> > +        bs->bl.max_transfer = MIN_NON_ZERO(bs->bl.max_transfer,
> > +                                           ret * qemu_real_host_page_size);
> > +    }
> > +
> > +    raw_refresh_limits(bs, errp);
> >  }
> > 
> >  static int check_for_dasd(int fd)
> > @@ -3601,7 +3628,7 @@ static BlockDriver bdrv_host_device = {
> >      .bdrv_co_pdiscard       = hdev_co_pdiscard,
> >      .bdrv_co_copy_range_from = raw_co_copy_range_from,
> >      .bdrv_co_copy_range_to  = raw_co_copy_range_to,
> > -    .bdrv_refresh_limits = raw_refresh_limits,
> > +    .bdrv_refresh_limits = hdev_refresh_limits,
> >      .bdrv_io_plug = raw_aio_plug,
> >      .bdrv_io_unplug = raw_aio_unplug,
> >      .bdrv_attach_aio_context = raw_aio_attach_aio_context,
> > @@ -3725,7 +3752,7 @@ static BlockDriver bdrv_host_cdrom = {
> >      .bdrv_co_preadv         = raw_co_preadv,
> >      .bdrv_co_pwritev        = raw_co_pwritev,
> >      .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
> > -    .bdrv_refresh_limits = raw_refresh_limits,
> > +    .bdrv_refresh_limits = hdev_refresh_limits,
> >      .bdrv_io_plug = raw_aio_plug,
> >      .bdrv_io_unplug = raw_aio_unplug,
> >      .bdrv_attach_aio_context = raw_aio_attach_aio_context,
> > --
> > 2.26.2
> > 



