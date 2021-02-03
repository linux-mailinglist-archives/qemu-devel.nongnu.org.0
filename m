Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6047F30DB41
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 14:30:06 +0100 (CET)
Received: from localhost ([::1]:54528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7IEP-0003BJ-6b
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 08:30:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l7ICJ-0002D3-Oj
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:27:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l7ICH-0008Fr-FL
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:27:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612358872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=53AjtmAoDyMx4FBPOhqchGgaUj9uELvb2Lq6FE9mSyk=;
 b=htf28Z9nDpLry+JRELwJ2SIHWELRgxVSaYYLGQPwlxLBOn+YX0tb3E6V1O26s79m35ibta
 xTKcFBokOthSX7bXxJtwHV4pQXHEPRG4z7m6cUxMNQQq+H4iwN0CDP+pcP9cEtQNPdl8FG
 r3xQuHIfL0liT2Xh6HHeHHlTGLxSXvI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-lkahAlhvMFmZHm01ryjhDA-1; Wed, 03 Feb 2021 08:27:51 -0500
X-MC-Unique: lkahAlhvMFmZHm01ryjhDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B037685B6C0;
 Wed,  3 Feb 2021 13:27:49 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAF004D;
 Wed,  3 Feb 2021 13:27:47 +0000 (UTC)
Date: Wed, 3 Feb 2021 14:27:44 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 2/2] migration: dirty-bitmap: Allow control of bitmap
 persistence on destination
Message-ID: <20210203132744.GE54538@angien.pipo.sk>
References: <cover.1612356810.git.pkrempa@redhat.com>
 <3afd4b353cf75c01c9260ca65e073d897e8c42d2.1612356810.git.pkrempa@redhat.com>
 <a519d6af-7f24-e9bc-894b-070738008e01@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <a519d6af-7f24-e9bc-894b-070738008e01@virtuozzo.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 16:23:21 +0300, Vladimir Sementsov-Ogievskiy wrote:
> 03.02.2021 16:00, Peter Krempa wrote:
> > Bitmap's source persistence is transported over the migration stream and
> > the destination mirrors it. In some cases the destination might want to
> > persist bitmaps which are not persistent on the source (e.g. the result
> > of merge of bitmaps from a number of layers on the source when migrating
> > into a squashed image)
> 
> Why not make merge target on source be persistent itself? Then it will be persistent on migration destination.

Because they are temporary on the source. I don't want to make it
persistent in case of a failure so that it doesn't get written to the
disk e.g. in case of VM shutdown.

> 
> > but currently it would need to create another set
> > of persistent bitmaps and merge them.
> > 
> > This adds 'dest-persistent' optional property to
> > 'BitmapMigrationBitmapAlias' which when present overrides the bitmap
> > presence state from the source.
> 
> It's seems simpler to make a separate qmp command block-dirty-bitmap-make-persistent.. Didn't you consider this way?

I'm not sure how the internals work entirely. In my case it's way
simpler to do this setup when generating the mapping which I need to do
anyways rather than calling separate commands.


