Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B9833EC45
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 10:12:20 +0100 (CET)
Received: from localhost ([::1]:33872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMSDz-0004a5-2R
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 05:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMSCs-0003kr-25
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:11:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMSCm-0006Op-Ub
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615972263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zmVF9RVVSSR1C6mhha/tzB6KTMh3MIBo44gBWwVG0d8=;
 b=Ua2qFRSCUvte1H9tb5beo4UXYJPBTWuxbLaSTjIs1kAErz5QbL7/u6odNhVjF8RRznDvRi
 H/rmE7Lk/LqTnPbGsIkRBslpmhuACqeRAhU/nEsd1pePa9H7VHaORKVgMQzLamLi003Lai
 QhP5GNDoBLu0oniZelgvpUbEVqYQVTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-871SiPvkNdKOaSuMjRegdw-1; Wed, 17 Mar 2021 05:11:01 -0400
X-MC-Unique: 871SiPvkNdKOaSuMjRegdw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1253683DD21
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 09:11:01 +0000 (UTC)
Received: from work-vm (ovpn-114-138.ams2.redhat.com [10.36.114.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D60D460CCE;
 Wed, 17 Mar 2021 09:10:53 +0000 (UTC)
Date: Wed, 17 Mar 2021 09:10:51 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Half a usb-redir idea
Message-ID: <YFHHm8CWwUUc2B7o@work-vm>
References: <YFDo/oHikOEcXFcg@work-vm>
 <20210317062404.bkl5s4qmtaeg2yeo@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210317062404.bkl5s4qmtaeg2yeo@sirius.home.kraxel.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: victortoso@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Gerd Hoffmann (kraxel@redhat.com) wrote:
> On Tue, Mar 16, 2021 at 05:21:02PM +0000, Dr. David Alan Gilbert wrote:
> > Hi,
> >   I've got a half-baked idea, which I thought might be worth mentioning.
> > 
> > How hard would it be to give qemu a usbredir server rather than client?
> 
> The usb part is probably not that hard.  The devices are not standalone
> though.  Tricky is the integration with the rest of qemu, with the input
> subsystem (hid devices), chardevs (usb-serial), network (usb-net), sound
> (usb-audio), block (usb-storage), ...

As long as this was still the qemu binary would that be a problem?

> ccid and u2f are probably easierst.
> mtp should not be hard too.
> maybe storage when limiting support to storage daemon.
> then it'll be tricky.
> maybe the multi-process qemu effort solves (some of) these problems.

It doesn't handle remote does it?

Dave

> take care,
>   Gerd
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


