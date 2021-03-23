Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DB934598D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 09:20:39 +0100 (CET)
Received: from localhost ([::1]:36516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOcHF-00048u-VX
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 04:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lOcFe-0003LV-4K
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 04:18:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lOcFb-0003gd-CP
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 04:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616487529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IxOap5T2zKNrkkj0ZLMIM2Qn1M+tthlDpFL5pg0F9pQ=;
 b=RtOh4kMqreTnZsq6m2T4aMhM+H3Glv9shntzbO148DnTcFoRsxX/2u6z0kEuaIiC8Ye1rS
 BLjwup+XSzxQ0munqEEEUyOJsxbGl43VvfYdHASSbhliNf6ZoEsMVeA9XTcnnRHfM9TlzA
 cN7AjVFF2ogg+HJ4MmW7kzszZDY7HuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-q0UQmXmfPEySi5Wf9cXoDQ-1; Tue, 23 Mar 2021 04:18:48 -0400
X-MC-Unique: q0UQmXmfPEySi5Wf9cXoDQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 093BE107B7C3;
 Tue, 23 Mar 2021 08:18:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04E81612A5;
 Tue, 23 Mar 2021 08:18:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6137918000B9; Tue, 23 Mar 2021 09:18:42 +0100 (CET)
Date: Tue, 23 Mar 2021 09:18:42 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 00/15] virtio-gpu: split into two devices.
Message-ID: <20210323081842.yifdhyu4smznleqd@sirius.home.kraxel.org>
References: <20210319112147.4138943-1-kraxel@redhat.com>
 <CAJ+F1C+FPAwLxCtZG+Fhnizqy7KU2ttdr0w72WWoS+mprthgwA@mail.gmail.com>
 <20210322081454.vpkvybavjoaqfa6q@sirius.home.kraxel.org>
 <7bce08a87c9c4deeb511f555ed835c49@intel.com>
MIME-Version: 1.0
In-Reply-To: <7bce08a87c9c4deeb511f555ed835c49@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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
Cc: "Zhang, Tina" <tina.zhang@intel.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 06:41:47PM +0000, Kasireddy, Vivek wrote:
> Hi Gerd,
> 
> > On Fri, Mar 19, 2021 at 03:48:42PM +0400, Marc-André Lureau wrote:
> > > Hi Gerd
> > >
> > > On Fri, Mar 19, 2021 at 3:22 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > > Currently we have one virtio-gpu device.  Problem with this approach is
> > > > that if you compile a full-featured qemu you'll get a virtio-gpu device
> > > > which depends on opengl and virgl, so these dependencies must be
> > > > installed and the libraries will be loaded into memory even if you don't
> > > > use virgl.  Also the code is cluttered with #ifdefs and a bit messy.
> > > >
> > > > This patch series splits the virtio-gpu device into two:
> > > >
> > > >  (1) virtio-gpu-device becomes the non-virgl device, same as
> > > >      virtio-gpu-device,virgl=off today.
> > > >  (2) virtio-gpu-gl-device is the new virgl device, same as
> > > >      virtio-gpu-device,virgl=on today.
> > > >
> > > > When compiling qemu without virglrenderer support virtio-gpu-device
> > > > behavior doesn't change.
> [Kasireddy, Vivek] Just a random thought: if a user enables both these devices 
> either intentionally or accidentally, can they play nice with each other?

Yes, should work fine.

take care,
  Gerd


