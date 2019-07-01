Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B66910111
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 22:41:02 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLZYj-0004X6-KP
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 16:41:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hLZVS-0002Jh-A1
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 16:37:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hLZOH-0008Gc-Ac
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 16:30:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57398)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hLZOH-0008Fs-4y; Tue, 30 Apr 2019 16:30:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 85E283001A6A;
	Tue, 30 Apr 2019 20:30:11 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C36281762;
	Tue, 30 Apr 2019 20:30:10 +0000 (UTC)
Date: Tue, 30 Apr 2019 17:30:09 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190430203009.GJ28722@habkost.net>
References: <20190425132134.2839-1-cohuck@redhat.com>
	<20190425132134.2839-2-cohuck@redhat.com>
	<CAFEAcA8TvMqZRCrMF5orgaWy-CxTR8fr6yF2W_-Y6LYfi1pGng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8TvMqZRCrMF5orgaWy-CxTR8fr6yF2W_-Y6LYfi1pGng@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 30 Apr 2019 20:30:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 01/19] s390 vfio-ccw: Add bootindex property
 and IPLB data
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Jason J. Herne" <jjherne@linux.ibm.com>,
	qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 30, 2019 at 05:54:49PM +0100, Peter Maydell wrote:
> On Thu, 25 Apr 2019 at 14:21, Cornelia Huck <cohuck@redhat.com> wrote:
[...]
> > -        SCSIDevice *sd = (SCSIDevice *) object_dynamic_cast(OBJECT(dev_st),
> > -                                                            TYPE_SCSI_DEVICE);
> > -
> > -        if (sd) {
> > +        switch (devtype) {
> > +        case CCW_DEVTYPE_SCSI:
> > +            sd = (SCSIDevice *) object_dynamic_cast(OBJECT(dev_st),
> > +                                                           TYPE_SCSI_DEVICE);
> 
> Coverity doesn't like the use of object_dynamic_cast() without a
> check that the return value isn't NULL before we dereference
> it a few lines further down.
> 
> I think that if we know this cast must always succeed, we
> could instead just write
>   SCSIDevice *sd = SCSI_DEVICE(dev_st);
> 
> On the other hand if the cast might not succeed because dev_st
> isn't necessarily of the right type, then we should check it
> for NULL and handle that appropriately.

s390_get_ccw_device() will set devtype=CCW_DEVTYPE_SCSI only if
dev_st is TYPE_SCSI_DEVICE, so the cast must always succeed and
we should use SCSI_DEVICE(dev_st) here.

-- 
Eduardo

