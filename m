Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2167131F5F5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 09:36:10 +0100 (CET)
Received: from localhost ([::1]:59316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD1Gj-0007Zh-5w
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 03:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD1Fr-00073z-SF
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 03:35:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD1Fq-0001UT-8r
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 03:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613723713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LDNHS5KW4F1R1w0mo3m6THOA4bF73chIEY6dWI6cylo=;
 b=YL+3Z/GBc8f82e7OoXTdTAw/l8C0Ni1CM0xFACrYPSgb+md1/Xmr+/igcbaSa7jdmvQo8m
 EfACC2QpGKfG1Rv5TLZjsB6nhlD+I7FL1RcTkbWcGdtofZb4t2PQCAXwPZNgTJgSSem1So
 4BzUsqGIFTXGAxUweJ5wXscgbr9vtUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-GxnQb-r7PbWk2bd_IMApVA-1; Fri, 19 Feb 2021 03:35:09 -0500
X-MC-Unique: GxnQb-r7PbWk2bd_IMApVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11C411009627;
 Fri, 19 Feb 2021 08:35:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1F8119D9D;
 Fri, 19 Feb 2021 08:34:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4986918003B0; Fri, 19 Feb 2021 09:34:56 +0100 (CET)
Date: Fri, 19 Feb 2021 09:34:56 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210219083456.pd7s2cxg2bwp6w6p@sirius.home.kraxel.org>
References: <20210218022227.979741-1-pasic@linux.ibm.com>
 <6c0f5acf-9ebb-ba04-1389-c6690796a6ad@redhat.com>
 <20210218113438.3fe80078.pasic@linux.ibm.com>
 <20210218135618.06532573.cohuck@redhat.com>
 <20210218133820.cflf455nj44mxzja@sirius.home.kraxel.org>
 <20210218191739.71bf8800.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210218191739.71bf8800.pasic@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> I'm not against cleaning up the includes for virtio-ccw devices, but I
> tend to see that as a separate, less pressing issue.

Well, it would allow to build virtio-ccw as common code (i.e. move from
specific_ss to softmmu_ss).

> > Alternatively add support for
> > target-specific modules (which we don't really have right now).
> 
> I think a target-specific module is what I did in this patch.

Nope.

Specifically target-specific modules must be built once for each
target and have a target-specific name (prefix or subdir).   So
when modularizing -- for example -- vga you'll get modules such as
x86_64/hw-display-vga.so, ppc64/hw-display-vga.so, ...

Qemu needs support for loading the correct version.

What you did is a rather incomplete version of that which happens to
work for ccw because ccw is used by s390x only so you can shortcut
the "build once for each target" part of the problem.

> Furthermore, I think any virtio-ccw device that is about to be built as
> a module, must be built as a target-specific module. If the realized
> (guest) architecture is not s390x, then there are no s390 IO instructions
> and ccw won't fly.

Well, it can happen that generic modules don't load into some qemu
versions.  Devices which need PCI can't be loaded by qemu-system-avr
for example because the avr target lacks PCI bus support.

ccw modules only loading into qemu-system-s390x because that is the
only target providing the bus needed is pretty much the same.

take care,
  Gerd


