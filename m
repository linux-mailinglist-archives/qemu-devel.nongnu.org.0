Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DC932188F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:28:05 +0100 (CET)
Received: from localhost ([::1]:57344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBFs-0001Jb-3f
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lEB5H-00077a-3x
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:17:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lEB5D-0001ck-Pa
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:17:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613999823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YiW/F9i1cqXIOJUJ0kilc5hslxjjvm2cQwUWcjYFzu8=;
 b=hDJMQFy7LAkc2tbr3wVozhlmZ+czx+8/6zxFcqvg8yHkkg2nWFJn9/WPt5fGpjb9Euy+r+
 eKvRrec9xHLZCDmB08cSa5JVt/N3mOHLBbUpky8UV1RWVz1N7jBcEkYga4vIPH6/5IpRf8
 IzuplJMb0f8aSAwxBy5z9fIoZ9sdyz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-r2_G4v9RNaOGWBDqZoPxZw-1; Mon, 22 Feb 2021 08:16:59 -0500
X-MC-Unique: r2_G4v9RNaOGWBDqZoPxZw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C197D107ACED;
 Mon, 22 Feb 2021 13:16:56 +0000 (UTC)
Received: from work-vm (ovpn-115-14.ams2.redhat.com [10.36.115.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DA5719CA8;
 Mon, 22 Feb 2021 13:16:44 +0000 (UTC)
Date: Mon, 22 Feb 2021 13:16:42 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 01/22] block: add eMMC block device type
Message-ID: <YDOuutVPzV2UNGjY@work-vm>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613982039-13861-2-git-send-email-sai.pavan.boddu@xilinx.com>
 <3c229241-fdc5-a445-d96e-ca16a5c0106b@redhat.com>
 <87ft1opa5k.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87ft1opa5k.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>,
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, qemu-block@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, saipava@xilinx.com,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
> > On 2/22/21 9:20 AM, Sai Pavan Boddu wrote:
> >> From: Vincent Palatin <vpalatin@chromium.org>
> >> 
> >> Add new block device type.
> >> 
> >> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
> >> [SPB: Rebased over 5.1 version]
> >> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> >> Signed-off-by: Joel Stanley <joel@jms.id.au>
> >> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> >> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >> ---
> >>  include/sysemu/blockdev.h | 1 +
> >>  blockdev.c                | 1 +
> >>  2 files changed, 2 insertions(+)
> >> 
> >> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
> >> index 3b5fcda..eefae9f 100644
> >> --- a/include/sysemu/blockdev.h
> >> +++ b/include/sysemu/blockdev.h
> >> @@ -24,6 +24,7 @@ typedef enum {
> >>       */
> >>      IF_NONE = 0,
> >>      IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF_XEN,
> >> +    IF_EMMC,
> >>      IF_COUNT
> >>  } BlockInterfaceType;
> >>  
> >> diff --git a/blockdev.c b/blockdev.c
> >> index cd438e6..390d43c 100644
> >> --- a/blockdev.c
> >> +++ b/blockdev.c
> >> @@ -83,6 +83,7 @@ static const char *const if_name[IF_COUNT] = {
> >>      [IF_SD] = "sd",
> >>      [IF_VIRTIO] = "virtio",
> >>      [IF_XEN] = "xen",
> >> +    [IF_EMMC] = "emmc",
> >>  };
> >
> > We don't need to introduce support for the legacy -drive magic.
> >
> > -device should be enough for this device, right?
> 
> External interface extensions need rationale: why do we want / need it?
> The commit message neglects to provide one.
> 
> Even more so when the interface in question is in a state like -drive
> is.

I wouldn't be too nasty about -drive;  for me I still find it the
easiest way to start a VM.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


