Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93922F69F3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:51:52 +0100 (CET)
Received: from localhost ([::1]:44876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07ip-0004NA-A8
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l06vk-00059x-Nz
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 13:01:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l06vi-0002va-HI
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 13:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610647265;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ig6Kp3mWpMrAooTlxwoFNFxHos9nMIFoJHer2183q+g=;
 b=ADd+13iXWcVAw2IDi91hVxGa/1tbjM30gFzWPBy/GUu6EL4H9KlCNh71Mr+Idxu2c8StzS
 vxffuCK3Th6azXgIxkhxjolEPyLOy5aC0QfVGqpAzdQG4Pfi0RX0lg4lziSCX/EtCcAaYW
 x72z9Xo2OllLKnUGofRNNajS6G/8DOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-RTAw8xEhNJOtOH2Dn-kzMQ-1; Thu, 14 Jan 2021 13:01:01 -0500
X-MC-Unique: RTAw8xEhNJOtOH2Dn-kzMQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD4A9100A679;
 Thu, 14 Jan 2021 18:00:45 +0000 (UTC)
Received: from redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 879A150F7D;
 Thu, 14 Jan 2021 18:00:38 +0000 (UTC)
Date: Thu, 14 Jan 2021 18:00:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v19 08/20] io: add qio_channel_readv_full_all_eof &
 qio_channel_readv_full_all helpers
Message-ID: <20210114180035.GY1643043@redhat.com>
References: <cover.1610638428.git.jag.raman@oracle.com>
 <02a82c80a35ab60b98028c85aa94f688a2843943.1610638428.git.jag.raman@oracle.com>
 <20210114162729.GB306329@stefanha-x1.localdomain>
 <CA0E47D0-F1F5-4825-ABB7-BE73AAD3E375@oracle.com>
MIME-Version: 1.0
In-Reply-To: <CA0E47D0-F1F5-4825-ABB7-BE73AAD3E375@oracle.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>, qemu-level <qemu-devel@nongnu.org>,
 kraxel@redhat.com, quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 pbonzini@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 12:55:58PM -0500, Jag Raman wrote:
> 
> 
> > On Jan 14, 2021, at 11:27 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > 
> > On Thu, Jan 14, 2021 at 10:40:03AM -0500, Jagannathan Raman wrote:
> >> +int qio_channel_readv_full_all(QIOChannel *ioc,
> >> +                               const struct iovec *iov,
> >> +                               size_t niov,
> >> +                               int **fds, size_t *nfds,
> >> +                               Error **errp)
> >> {
> >> -    int ret = qio_channel_readv_all_eof(ioc, iov, niov, errp);
> >> +    int ret = qio_channel_readv_full_all_eof(ioc, iov, niov, fds, nfds, errp);
> >> 
> >>     if (ret == 0) {
> >> -        ret = -1;
> >>         error_setg(errp,
> >>                    "Unexpected end-of-file before all bytes were read");
> > 
> > qio_channel_readv_full_all_eof() can read file descriptors but no data
> > and return 0.
> > 
> > Here that case is converted into an error and the file descriptors
> > aren't closed, freed, and fds/nfds isn't cleared.
> 
> That’s a valid point. I’m wondering if the fix for this case should be in
> qio_channel_readv_full_all_eof(), instead of here.
> 
> qio_channel_readv_full_all_eof() should probably return error (-1) if the
> amount of data read does not match iov_size(). If the caller is only expecting
> to read fds, and not any data, it would indicate that by setting iov to NULL
> and/or setting niov=0. If the caller is setting these parameters, it means it is
> expecting data.Does that sound good?

The API spec for the existing _eof() methods says:

 * The function will wait for all requested data
 * to be read, yielding from the current coroutine
 * if required.
 *
 * If end-of-file occurs before any data is read,
 * no error is reported; otherwise, if it occurs
 * before all requested data has been read, an error
 * will be reported.


IOW, return '0' is *only* valid if we've not read anything. I consider
file descriptors to be something.

IOW, qio_channel_readv_full_all_eof must only return 0, if it didn't
read any data and also didn't receive any file descriptors. So yeah,
we must return -1 in the scenario Stefan describes

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


