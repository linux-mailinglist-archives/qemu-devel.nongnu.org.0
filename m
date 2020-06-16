Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882AA1FBCB2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 19:21:13 +0200 (CEST)
Received: from localhost ([::1]:54296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlFGq-0001Mt-KU
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 13:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jlFC9-0002n9-Oo
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 13:16:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31215
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jlFC8-0000X4-2e
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 13:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592327779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wqp9+vP9WDPWv11Aw91e2+Rmy9fgS5L478vkJsRDV0E=;
 b=atEtkg364c66/A6gpK0WJ6D6GqUNIbkPw8Z6bsphi0S4ZGuJjj45a/dxwiFhSwEkv6qTqe
 ovemJKDOIr1KHYxvObbc8JUw+i3gjnsbVUQ7F0d0+cr0mqMl2nv+SMkyfHgG2GXww6kRHB
 PXoBwryO235fM2L+RkxiruFtPZWcrfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-FeuRWj2fMt2zbt3bKdMYqg-1; Tue, 16 Jun 2020 13:16:14 -0400
X-MC-Unique: FeuRWj2fMt2zbt3bKdMYqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A09F1EC1A2;
 Tue, 16 Jun 2020 17:16:13 +0000 (UTC)
Received: from work-vm (ovpn-112-42.ams2.redhat.com [10.36.112.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBA7B79303;
 Tue, 16 Jun 2020 17:16:08 +0000 (UTC)
Date: Tue, 16 Jun 2020 18:16:06 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: ovmf / PCI passthrough impaired due to very limiting PCI64
 aperture
Message-ID: <20200616171606.GI2788@work-vm>
References: <99779e9c-f05f-501b-b4be-ff719f140a88@canonical.com>
 <20200616165043.24y2cp53axk7uggy@sirius.home.kraxel.org>
 <20200616165746.GH2788@work-vm>
 <20200616171026.jhlhtewp6j6vj44m@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20200616171026.jhlhtewp6j6vj44m@sirius.home.kraxel.org>
User-Agent: Mutt/1.14.0 (2020-05-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:45:54
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
 qemu-devel@nongnu.org, christian.ehrhardt@canonical.com, lersek@redhat.com,
 fw@gpiccoli.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Gerd Hoffmann (kraxel@redhat.com) wrote:
>   Hi,
> 
> > > If we can somehow make a *trustable* physbits value available to the
> > > guest, then yes, we can go that route.  But the guest physbits we have
> > > today unfortunately don't cut it.
> > 
> > In downstream RH qemu, we run with host-physbits as default; so it's reasonably
> > trustworthy;
> 
> Can the guest figure somehow whenever it is trustworthy or not?

At any one point in time there may be things that it can try and see how
the CPU responds but I'm not 100% sure.
I know there are some bodges in to make some MSR values 1 padded by the
right amount when crossing sizes that generally work.
(were those PAM registers or something - vague memories of an old
bug)

> > of course that doesn't help you across a migration between
> > hosts with different sizes (e.g. an E5 Xeon to an E3).
> 
> Making physbits configurable for migration compatibility is fine if qemu
> outlaws the problematic guest physbits > host physbits case and throws
> an error in that case.

I'm not sure that guest < host is entirely safe either though; although
it seems to work.

Dave

> take care,
>   Gerd
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


