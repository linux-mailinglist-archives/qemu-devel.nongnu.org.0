Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482F626DCB9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 15:24:39 +0200 (CEST)
Received: from localhost ([::1]:46036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIttu-0004Io-7F
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 09:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kItsZ-0002xO-Fw
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 09:23:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kItsV-0003Gc-6C
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 09:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600348988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QNXQhGzUo9OMSFbYOW0eWOMaEqH3MOk7FBcRCLYoC84=;
 b=c34KzZYotTq2EeR5TZbDhwgFsKvt1LW63BP5/NnQ2qzfxUx0IoRJofteAydqdvX8qYB/4D
 EFlww3niL8LURfvTYh3fTtbwDrL51ujlhMdO6LdLLLY10uPWGNPCOiDQm37MPMW2M+Xf3F
 1b/Cig+DGYaQMg83vytAcUZ+PwX2/ak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-Y4sMQnBMOxGQrBWkHlufGw-1; Thu, 17 Sep 2020 09:23:07 -0400
X-MC-Unique: Y4sMQnBMOxGQrBWkHlufGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9095F10074CE;
 Thu, 17 Sep 2020 13:23:05 +0000 (UTC)
Received: from starship (unknown [10.35.206.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D24C67CF0;
 Thu, 17 Sep 2020 13:23:00 +0000 (UTC)
Message-ID: <ea4017fe0456a9c663f943f60f4572ecf8d0fe96.camel@redhat.com>
Subject: Re: [PATCH 1/2] file-posix: Correctly read max_segments of SG nodes
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Max Reitz <mreitz@redhat.com>, Dmitry Fomichev
 <dmitry.fomichev@wdc.com>,  Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,  Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Date: Thu, 17 Sep 2020 16:22:59 +0300
In-Reply-To: <808e395e-6f99-acdb-03dc-400f6bd32311@redhat.com>
References: <20200811225122.17342-1-dmitry.fomichev@wdc.com>
 <20200811225122.17342-2-dmitry.fomichev@wdc.com>
 <808e395e-6f99-acdb-03dc-400f6bd32311@redhat.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 20:51:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2020-09-17 at 15:16 +0200, Max Reitz wrote:
> On 12.08.20 00:51, Dmitry Fomichev wrote:
> > If scsi-generic driver is in use, an SG node can be specified in
> > the command line in place of a regular SCSI device. In this case,
> > sg_get_max_segments() fails to open max_segments entry in sysfs
> > because /dev/sgX is a character device. As the result, the maximum
> > transfer size for the device may be calculated incorrectly, causing
> > I/O errors if the maximum transfer size at the guest ends up to be
> > larger compared to the host.
> > 
> > Check system device type in sg_get_max_segments() and read the
> > max_segments value differently if it is a character device.
> > 
> > Reported-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> > Fixes: 9103f1ceb46614b150bcbc3c9a4fbc72b47fedcc
> > Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> > ---
> >  block/file-posix.c | 55 +++++++++++++++++++++++++++-------------------
> >  1 file changed, 32 insertions(+), 23 deletions(-)
> > 
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 094e3b0212..f9e2424e8f 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -1108,6 +1108,7 @@ static int sg_get_max_segments(int fd)
> >      int ret;
> >      int sysfd = -1;
> >      long max_segments;
> > +    unsigned int max_segs;
> >      struct stat st;
> >  
> >      if (fstat(fd, &st)) {
> > @@ -1115,30 +1116,38 @@ static int sg_get_max_segments(int fd)
> >          goto out;
> >      }
> >  
> > -    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
> > -                                major(st.st_rdev), minor(st.st_rdev));
> > -    sysfd = open(sysfspath, O_RDONLY);
> > -    if (sysfd == -1) {
> > -        ret = -errno;
> > -        goto out;
> > +    if (S_ISBLK(st.st_mode)) {
> > +        sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
> > +                                    major(st.st_rdev), minor(st.st_rdev));
> 
> Sounds reasonable, but this function is (naturally) only called if
> bs->sg is true, which is set by hdev_is_sg(), which returns true only if
> the device file is a character device.
> 
> So is this path ever taken, or can we just replace it all with the ioctl?
> 
> (Before 867eccfed84, this function was used for all host devices, which
> might explain why the code even exists.)
> 
> Max

I have another proposal which I am currently evaluating.

How about we drop all the SG_IO limits code alltogher from the raw driver, and
instead just let the scsi drivers (scsi-block and scsi-generic) query
the device directly, since I don't think that the kernel (I will double check this)?


Best regards,
	Maxim Levitsky




