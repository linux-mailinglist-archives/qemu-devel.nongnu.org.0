Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45691FCA90
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 12:13:44 +0200 (CEST)
Received: from localhost ([::1]:49006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlV4h-0007zE-GQ
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 06:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jlV3k-0007Xa-MG
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 06:12:44 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28206
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jlV3h-0005GJ-Ep
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 06:12:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592388760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8PH+aBFQhaaxJuiZ/GoEzxDAK48PB7lLMQZV7XnC9ms=;
 b=dSp01IFOh4/6BVLhB9yRtl53xI41L8tZyB4+oiwUUe1XzjwqMxB2FGjLg758ltpiXrbebC
 BzSfc9+xWPINBXI9Lx5RRNBuo/k1OUKWpj1Fn8fqX7FHZ6tYrvWAK4lWM0Md5Lqmr1Y08r
 mRzuqX40Godah++G9Kg7/+BGshUiVfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-koRDVVH6Poi-6gwFoOF3YA-1; Wed, 17 Jun 2020 06:12:36 -0400
X-MC-Unique: koRDVVH6Poi-6gwFoOF3YA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 030368C3201;
 Wed, 17 Jun 2020 10:12:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76FBB5D9D3;
 Wed, 17 Jun 2020 10:12:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 54F9116E16; Wed, 17 Jun 2020 12:12:33 +0200 (CEST)
Date: Wed, 17 Jun 2020 12:12:33 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christophe de Dinechin <cdupontd@redhat.com>
Subject: Re: ovmf / PCI passthrough impaired due to very limiting PCI64
 aperture
Message-ID: <20200617101233.feo4vvdsgdpc4n3f@sirius.home.kraxel.org>
References: <99779e9c-f05f-501b-b4be-ff719f140a88@canonical.com>
 <20200616165043.24y2cp53axk7uggy@sirius.home.kraxel.org>
 <97D6912A-C840-4723-A32F-7B05FF827EB8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <97D6912A-C840-4723-A32F-7B05FF827EB8@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 01:42:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: pedro.principeza@canonical.com, ehabkost@redhat.com,
 dann.frazier@canonical.com, "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
 qemu-devel@nongnu.org, christian.ehrhardt@canonical.com, dgilbert@redhat.com,
 lersek@redhat.com, fw@gpiccoli.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 17, 2020 at 10:16:55AM +0200, Christophe de Dinechin wrote:
> 
> 
> > Le 16 Jun 2020 à 18:50, Gerd Hoffmann <kraxel@redhat.com> a écrit :
> > 
> >  Hi,
> > 
> >> (a) We could rely in the guest physbits to calculate the PCI64 aperture.
> > 
> > I'd love to do that.  Move the 64-bit I/O window as high as possible and
> > use -- say -- 25% of the physical address space for it.
> > 
> > Problem is we can't.
> 
> Is the only reason unreliable guest physbits?

Yes.

> > If we can somehow make a *trustable* physbits value available to the
> > guest, then yes, we can go that route.  But the guest physbits we have
> > today unfortunately don't cut it.
> 
> What is the rationale for ever allowing guest physbits > host physbits?

I can't think of a good reason.  So probably simply historical reasons
and the fact that this isn't a problem with tcg.

take care,
  Gerd Hoffmann


