Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4288210FE84
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 14:18:29 +0100 (CET)
Received: from localhost ([::1]:53342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ic84S-00078l-6K
	for lists+qemu-devel@lfdr.de; Tue, 03 Dec 2019 08:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56794)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ic7xJ-0003dV-Lz
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 08:11:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ic7xH-0005G5-Mo
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 08:11:05 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57864
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ic7xF-0005Bu-MY
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 08:11:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575378659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hm1pGm1KwcC8wCglvp9pxz/p0Wp5M+VQua/v1lYDDTM=;
 b=i77bn/9CIaB2yq+S4cMhjnFnAr/q2ACKtgNnzXpoe1BB9Ex0UZzOmnQRQpm8U134oo2thT
 59RuRdweOL5TclBHO9jPe8X96KRlPmCYjkjKCK0sW8wTzAVxCLkjITj0YfTJsHmt7IBYbd
 HL4ERezkcrt5yD2Ow8jJnNaNMIf+Qts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-u7Xbis8GP1yZlEIybIAvKw-1; Tue, 03 Dec 2019 08:10:56 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83FB9107ACC4;
 Tue,  3 Dec 2019 13:10:55 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E4CD65D6A7;
 Tue,  3 Dec 2019 13:10:48 +0000 (UTC)
Date: Tue, 3 Dec 2019 13:10:46 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, groug@kaod.org
Subject: Re: virtiofsd: Where should it live?
Message-ID: <20191203131046.GF3078@work-vm>
References: <20191125185021.GB3767@work-vm>
 <20191126102600.GG556568@redhat.com>
 <20191126121416.GE2928@work-vm>
 <db27af39-62a8-46e5-fccd-f09ed497b7bd@redhat.com>
 <20191203130250.GD3078@work-vm>
 <dce5bc69-b7df-1ff8-39fc-81bb8486c1c5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <dce5bc69-b7df-1ff8-39fc-81bb8486c1c5@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: u7Xbis8GP1yZlEIybIAvKw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: mszeredi@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> On 03/12/19 14:02, Dr. David Alan Gilbert wrote:
> >> It could be in fsdev/virtiofsd,
> > fsdev is currently all 9p stuff, so that would seem very confusing.
>=20
> Move it to fsdev/9p?

Greg: Are you OK with us doing that, and then having fsdev/virtiofsd for
our side of things?

> >> but I agree with Daniel that at this
> >> point the QEMU build system introduces baggage that you may not want f=
or
> >> virtiofsd.
> >
> > I've already got it wired up in contrib with qemu's build system
> > so that doesn't seem to be an issue.   The question is purely a 'where'=
.
>=20
> Oh I agree it's not an insurmountable problem.  For a new project I may
> not want to deal with the complicated rules.mak stuff; however, if
> virtiofsd doesn't have to do anything complicated then it's your choice.

Fortunately we don't seem to have touched that.

Dave

> Paolo
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


