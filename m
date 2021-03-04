Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3731832D64B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:19:03 +0100 (CET)
Received: from localhost ([::1]:56400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpkk-0003Nw-5s
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:19:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHpdp-0002Ij-LO
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:11:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHpdo-00013C-5p
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614870711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=giwaHCUYp1Nd1/Dl1EyNyPa8urGFm9fTSEcvtfPt+sU=;
 b=iztJl5c6zcj80GMthPpIgF0Zyja/agwZqLI9BbkkJuyrrRYYV6YXYBSYsWIx0oY0EvF1bO
 4zjLGVX6I3jPMZeyXv1xylC5tUIAT8Hs5Caqb5qsyblmDemoa7LNw2UXXtzcbiaeT1vQRH
 yWhodZoR7BpQOzx4Vc7m9Dn5Wu1ohqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-WOU1JLwlOJifYJgJJSCUrQ-1; Thu, 04 Mar 2021 10:11:49 -0500
X-MC-Unique: WOU1JLwlOJifYJgJJSCUrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BEFC19200DD;
 Thu,  4 Mar 2021 15:11:48 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-64.ams2.redhat.com [10.36.113.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0221260C43;
 Thu,  4 Mar 2021 15:11:42 +0000 (UTC)
Date: Thu, 4 Mar 2021 16:11:41 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: "Denis V. Lunev" <den@openvz.org>
Subject: Re: [PATCH v2 3/6] block/parallels: BDRVParallelsState: add
 cluster_size field
Message-ID: <20210304151141.GG9607@merkur.fritz.box>
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
 <20210224104707.88430-4-vsementsov@virtuozzo.com>
 <20210304142450.GD9607@merkur.fritz.box>
 <1891d7fb-a7fa-73fa-e6df-e3f281fa759c@openvz.org>
MIME-Version: 1.0
In-Reply-To: <1891d7fb-a7fa-73fa-e6df-e3f281fa759c@openvz.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.03.2021 um 15:57 hat Denis V. Lunev geschrieben:
> On 3/4/21 5:24 PM, Kevin Wolf wrote:
> > Am 24.02.2021 um 11:47 hat Vladimir Sementsov-Ogievskiy geschrieben:
> >> We are going to use it in more places, calculating
> >> "s->tracks << BDRV_SECTOR_BITS" doesn't look good.
> >>
> >> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> >> @@ -771,6 +770,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
> >>          ret = -EFBIG;
> >>          goto fail;
> >>      }
> >> +    s->cluster_size = s->tracks << BDRV_SECTOR_BITS;
> >>  
> >>      s->bat_size = le32_to_cpu(ph.bat_entries);
> >>      if (s->bat_size > INT_MAX / sizeof(uint32_t)) {
> > Checking the context, I saw this a few lines above:
> >
> >     if (s->tracks > INT32_MAX/513) {
> >
> > Is the 513 intentional?
> >
> > Kevin
> >
> I can not remember why I have written this at that time,
> but original comment for the commit was
> 
> commit d25d59802021a747812472780d80a0e792078f40
> Author: Denis V. Lunev <den@openvz.org>
> Date:   Mon Jul 28 20:23:55 2014 +0400
> 
>     parallels: 2TB+ parallels images support
>    
>     Parallels has released in the recent updates of Parallels Server 5/6
>     new addition to his image format. Images with signature WithouFreSpacExt
>     have offsets in the catalog coded not as offsets in sectors (multiple
>     of 512 bytes) but offsets coded in blocks (i.e. header->tracks * 512)
>    
>     In this case all 64 bits of header->nb_sectors are used for image size.
>    
>     This patch implements support of this for qemu-img and also adds
> specific
>     check for an incorrect image. Images with block size greater than
>     INT_MAX/513 are not supported. The biggest available Parallels image
>     cluster size in the field is 1 Mb. Thus this limit will not hurt
>     anyone.
>    
>     Signed-off-by: Denis V. Lunev <den@openvz.org>
>     CC: Jeff Cody <jcody@redhat.com>
>     CC: Kevin Wolf <kwolf@redhat.com>
>     CC: Stefan Hajnoczi <stefanha@redhat.com>
>     Reviewed-by: Jeff Cody <jcody@redhat.com>
>     Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> 
> Thus I believe that this is intentional.

Hm, fair. It's a weird number. I would have guessed a typo, but if it's
in the commit message as well, it might be intentional. Or just a typo
combined with copy & paste.

If we ever remember or find a new reason why it has to be 513 rather
than 512, adding a comment would be nice.

Kevin


