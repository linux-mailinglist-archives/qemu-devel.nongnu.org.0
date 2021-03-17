Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837A033F63C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:03:56 +0100 (CET)
Received: from localhost ([::1]:60564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZaN-0001NG-Ip
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lMZHI-0002Cc-2q
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:44:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lMZHG-0000hx-BN
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615999449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y+QsfFv44VuvpTsejIFPhyl21zlSkjR+9wrT9OEvrWc=;
 b=B0/vFxEQMGYclNSLUGmVc3QwljBbLCkOBK9UUSvuURFpSvEo8uF8F9MQVE7aYrc7chLw2R
 zQI3mO8L3O3bByMmWlwl03mscCWwf9xZUhp666F02I941CaPuqfsaW1oh4Nyd7uHLmX+W8
 4X4sEdr82N8UX6xAQ+OnEBjCluhYXeo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-1Jg5eWd6MkO4jeYrimLouw-1; Wed, 17 Mar 2021 12:44:04 -0400
X-MC-Unique: 1Jg5eWd6MkO4jeYrimLouw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84C2E107ACCA;
 Wed, 17 Mar 2021 16:44:02 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-202.ams2.redhat.com [10.36.114.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BDD55C23E;
 Wed, 17 Mar 2021 16:44:01 +0000 (UTC)
Date: Wed, 17 Mar 2021 17:43:59 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH] curl: Allow reading after EOF
Message-ID: <YFIxz4V4MuGdL2D0@merkur.fritz.box>
References: <20210317151734.41656-1-kwolf@redhat.com>
 <YFIqercny3vOpo34@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YFIqercny3vOpo34@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: afrosi@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.03.2021 um 17:12 hat Daniel P. Berrangé geschrieben:
> On Wed, Mar 17, 2021 at 04:17:34PM +0100, Kevin Wolf wrote:
> > This makes the curl driver more consistent with file-posix in that it
> > doesn't return errors any more for reading after the end of the remote
> > file. Instead, zeros are returned for these areas.
> > 
> > This inconsistency was reported in:
> > https://bugzilla.redhat.com/show_bug.cgi?id=1935061
> > 
> > Note that the image used in this bug report has a corrupted snapshot
> > table, which means that the qcow2 driver tries to do a zero-length read
> > after EOF on its image file.
> > 
> > The old behaviour of the curl driver can hardly be called a bug, but the
> > inconsistency turned out to be confusing.
> > 
> > Reported-by: Alice Frosi <afrosi@redhat.com>
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> > 
> > It is not entirely clear to me if this is something we want to do. If we
> > do care about consistency between protocol drivers, something like this
> > should probably be done in block/io.c eventually - but that would
> > require converting bs->total_sectors to byte granularity first.
> > 
> > Any opinions on what the most desirable semantics would be and whether
> > we should patch individual drivers until we can have a generic solution?
> 
> What valid scenarios are there for wanting to read beyond the bounds
> of the protocol driver storage ? Why was file-posix allowing this
> so far ?
> 
> If I've given file-posix a 10 GB plain file or device and something
> requests a read from the 11 GB offset, IMHO, that is a sign of serious
> error somewhere and possible impending doom.
> 
> For writable storage, I would think that read + write should be
> symmetric, by which I mean if a read() at a particular offset
> succeeds, then I would also expect a write() at the same offset to
> succeed, and have its data later returned by a read().
> 
> We generally can't write at an offset beyond the storage (unless we
> are intending to auto-enlarge a plain file), so I think we shouldn't
> allow reads either.

It is definitely related to format drivers that grow their image files.
I think the reason for allowing this may have been that with O_DIRECT,
you need aligned requests and when format drivers write just a few
bytes, we actually do a RMW - and you don't want to get an error during
the read part just because the image file will only be resized by the
write.

Since curl is a read-only protocol driver (at the moment, I actually
have an experimental branch that adds write support so we can run
iotests for http), this reason doesn't really apply. At the moment, it
would be just for consistency.

Kevin


