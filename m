Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4473D32B616
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:17:12 +0100 (CET)
Received: from localhost ([::1]:60952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHNd0-0002q3-UD
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lHNbs-0002JF-A5
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:16:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lHNbo-0007mC-Ra
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:15:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614762955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1WcyRfYarYvAVfc4uRT0UnooK4cgL+AVQlORv3n5ic=;
 b=VVyDLQeS3kxfV86MVtYEbtam+4IdlH3b1CO2/wp+YfzmbxP0aJn2wlfC8xCSHzAoLgNZNj
 zyQztA5ZFfHxkytTJ6jEoRW9ESgEipmJEMvdk7SuX2dOUhOg25cli9xqhSnrgsDoc5zRA7
 Ndr9n8j67zAW5+dFWH5JD0kH0MkMxWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-yPrwOGIjMMaJKGDkJNLMtA-1; Wed, 03 Mar 2021 04:15:51 -0500
X-MC-Unique: yPrwOGIjMMaJKGDkJNLMtA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74A9A50740;
 Wed,  3 Mar 2021 09:15:49 +0000 (UTC)
Received: from work-vm (ovpn-115-41.ams2.redhat.com [10.36.115.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 584385D9C2;
 Wed,  3 Mar 2021 09:15:41 +0000 (UTC)
Date: Wed, 3 Mar 2021 09:15:38 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Sai Pavan Boddu <saipava@xilinx.com>
Subject: Re: [PATCH v3 12/21] sd: emmc: add CMD21 tuning sequence
Message-ID: <YD9TukdPgVH4coHs@work-vm>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1614540807-30686-13-git-send-email-sai.pavan.boddu@xilinx.com>
 <YDzFEZvgF5aj4qrw@work-vm>
 <BY5PR02MB6772300E84C0553278094EBDCA989@BY5PR02MB6772.namprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BY5PR02MB6772300E84C0553278094EBDCA989@BY5PR02MB6772.namprd02.prod.outlook.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Sai Pavan Boddu (saipava@xilinx.com) wrote:
> Hi David,
> 
> > -----Original Message-----
> > From: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Sent: Monday, March 1, 2021 4:12 PM
> > To: Sai Pavan Boddu <saipava@xilinx.com>
> > Cc: Markus Armbruster <armbru@redhat.com>; Kevin Wolf
> > <kwolf@redhat.com>; Max Reitz <mreitz@redhat.com>; Vladimir Sementsov-
> > Ogievskiy <vsementsov@virtuozzo.com>; Eric Blake <eblake@redhat.com>;
> > Joel Stanley <joel@jms.id.au>; Cédric Le Goater <clg@kaod.org>; Vincent
> > Palatin <vpalatin@chromium.org>; Thomas Huth <thuth@redhat.com>; Stefan
> > Hajnoczi <stefanha@redhat.com>; Peter Maydell <peter.maydell@linaro.org>;
> > Alistair Francis <alistair.francis@wdc.com>; Edgar Iglesias <edgari@xilinx.com>;
> > Luc Michel <luc.michel@greensocs.com>; Paolo Bonzini
> > <pbonzini@redhat.com>; qemu-block@nongnu.org; qemu-devel@nongnu.org;
> > Sai Pavan Boddu <saipava@xilinx.com>
> > Subject: Re: [PATCH v3 12/21] sd: emmc: add CMD21 tuning sequence
> > 
> > * Sai Pavan Boddu (sai.pavan.boddu@xilinx.com) wrote:
> > > eMMC cards support tuning sequence for entering HS200 mode.
> > >
> > > Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > > ---
> > >  hw/sd/sd.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 47 insertions(+)
> > >
> > > diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> > > index bf963ec..174c28e 100644
> > > --- a/hw/sd/sd.c
> > > +++ b/hw/sd/sd.c
> > > @@ -1386,6 +1386,14 @@ static sd_rsp_type_t
> > sd_normal_command(SDState *sd, SDRequest req)
> > >          }
> > >          break;
> > >
> > > +    case 21:    /* CMD21: mmc SEND TUNING_BLOCK */
> > > +        if (sd->emmc && (sd->state == sd_transfer_state)) {
> > > +            sd->state = sd_sendingdata_state;
> > > +            sd->data_offset = 0;
> > > +            return sd_r1;
> > > +        }
> > > +        break;
> > > +
> > >      case 23:    /* CMD23: SET_BLOCK_COUNT */
> > >          if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
> > >              break;
> > > @@ -2120,6 +2128,30 @@ static const uint8_t
> > sd_tuning_block_pattern[SD_TUNING_BLOCK_SIZE] = {
> > >      0xbb, 0xff, 0xf7, 0xff,         0xf7, 0x7f, 0x7b, 0xde,
> > >  };
> > >
> > > +#define EXCSD_BUS_WIDTH_OFFSET 183
> > > +#define BUS_WIDTH_8_MASK    0x4
> > > +#define BUS_WIDTH_4_MASK    0x2
> > > +#define MMC_TUNING_BLOCK_SIZE   128
> > > +
> > > +static const uint8_t mmc_tunning_block_pattern[128] = {
> > > +       0xff, 0xff, 0x00, 0xff, 0xff, 0xff, 0x00, 0x00,
> > > +       0xff, 0xff, 0xcc, 0xcc, 0xcc, 0x33, 0xcc, 0xcc,
> > > +       0xcc, 0x33, 0x33, 0xcc, 0xcc, 0xcc, 0xff, 0xff,
> > > +       0xff, 0xee, 0xff, 0xff, 0xff, 0xee, 0xee, 0xff,
> > > +       0xff, 0xff, 0xdd, 0xff, 0xff, 0xff, 0xdd, 0xdd,
> > > +       0xff, 0xff, 0xff, 0xbb, 0xff, 0xff, 0xff, 0xbb,
> > > +       0xbb, 0xff, 0xff, 0xff, 0x77, 0xff, 0xff, 0xff,
> > > +       0x77, 0x77, 0xff, 0x77, 0xbb, 0xdd, 0xee, 0xff,
> > > +       0xff, 0xff, 0xff, 0x00, 0xff, 0xff, 0xff, 0x00,
> > > +       0x00, 0xff, 0xff, 0xcc, 0xcc, 0xcc, 0x33, 0xcc,
> > > +       0xcc, 0xcc, 0x33, 0x33, 0xcc, 0xcc, 0xcc, 0xff,
> > > +       0xff, 0xff, 0xee, 0xff, 0xff, 0xff, 0xee, 0xee,
> > > +       0xff, 0xff, 0xff, 0xdd, 0xff, 0xff, 0xff, 0xdd,
> > > +       0xdd, 0xff, 0xff, 0xff, 0xbb, 0xff, 0xff, 0xff,
> > > +       0xbb, 0xbb, 0xff, 0xff, 0xff, 0x77, 0xff, 0xff,
> > > +       0xff, 0x77, 0x77, 0xff, 0x77, 0xbb, 0xdd, 0xee,
> > 
> > Where does this magic pattern come from?  Is it part of some spec?
> [Sai Pavan Boddu] Yes its part of JEDEC eMMC spec. It's the tuning sequence for HS200 mode.

OK, if you have to repost it, then please add a comment saying that.

DAve

> Regards,
> Sai Pavan
> > 
> > Dave
> > 
> > > +};
> > > +
> > >  uint8_t sd_read_byte(SDState *sd)
> > >  {
> > >      /* TODO: Append CRCs */
> > > @@ -2213,6 +2245,21 @@ uint8_t sd_read_byte(SDState *sd)
> > >          ret = sd_tuning_block_pattern[sd->data_offset++];
> > >          break;
> > >
> > > +    case 21:    /* CMD21: SEND_TUNNING_BLOCK (MMC) */
> > > +        if (sd->data_offset >= MMC_TUNING_BLOCK_SIZE - 1) {
> > > +            sd->state = sd_transfer_state;
> > > +        }
> > > +        if (sd->ext_csd[EXCSD_BUS_WIDTH_OFFSET] & BUS_WIDTH_8_MASK) {
> > > +            ret = mmc_tunning_block_pattern[sd->data_offset++];
> > > +        } else {
> > > +            /* Return LSB Nibbles of two byte from the 8bit tuning block
> > > +             * for 4bit mode
> > > +             */
> > > +            ret = mmc_tunning_block_pattern[sd->data_offset++] & 0x0F;
> > > +            ret |= (mmc_tunning_block_pattern[sd->data_offset++] & 0x0F) << 4;
> > > +        }
> > > +        break;
> > > +
> > >      case 22:    /* ACMD22: SEND_NUM_WR_BLOCKS */
> > >          ret = sd->data[sd->data_offset ++];
> > >
> > > --
> > > 2.7.4
> > >
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


