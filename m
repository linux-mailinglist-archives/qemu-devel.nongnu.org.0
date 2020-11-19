Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A9E2B94BB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 15:39:43 +0100 (CET)
Received: from localhost ([::1]:48580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfl65-0001rV-HS
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 09:39:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fche@redhat.com>) id 1kfl59-0001Ql-8W
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:38:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <fche@redhat.com>) id 1kfl56-0002hP-BM
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605796716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+15T2pQ9byZCkKWKYI4XM1ng46yz7T1AD4loW7qr090=;
 b=ek/6Etsb9MCG8HoTqH0E/XXGhgKfwqbdy0wsqf6Rq6fLcZWYng0b59eq6Vw0VBQeD0MXZ9
 2YRLCpgQkmWSsqGHznoivxROVmqkh4AHZufG7KpRLrUPJd+7kMe35edzKMIoW3Q3kc/ITj
 aRxod2tS6HpythXqh1f6LxCv4LaE2Ys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-Cuqf916mPrqPJgXYyzq0nQ-1; Thu, 19 Nov 2020 09:38:32 -0500
X-MC-Unique: Cuqf916mPrqPJgXYyzq0nQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48E348144E1;
 Thu, 19 Nov 2020 14:38:31 +0000 (UTC)
Received: from redhat.com (ovpn-112-160.phx2.redhat.com [10.3.112.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FB451002391;
 Thu, 19 Nov 2020 14:38:25 +0000 (UTC)
Received: from fche by redhat.com with local (Exim 4.94)
 (envelope-from <fche@redhat.com>)
 id 1kfl4o-0007Wz-B8; Thu, 19 Nov 2020 09:38:22 -0500
Date: Thu, 19 Nov 2020 09:38:22 -0500
From: "Frank Ch. Eigler" <fche@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH-for-5.2 v2] trace: use STAP_SDT_V2 to work around symbol
 visibility
Message-ID: <20201119143822.GC23928@redhat.com>
References: <20201119112704.837423-1-stefanha@redhat.com>
 <fbe8f975-45a7-02e0-4765-b958630f6f2d@redhat.com>
 <CAJSP0QUAFLUT22pos0YVagyCyJ=L-bGkGMgBHEVYnSCVX9Mpng@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJSP0QUAFLUT22pos0YVagyCyJ=L-bGkGMgBHEVYnSCVX9Mpng@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fche@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=fche@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Richard W.M. Jones" <rjones@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 William Cohen <wcohen@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, ddepaula@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi -

> > Maybe add a comment? (no need to repost if you agree):
> >
> >        # Workaround to avoid dtrace(1) produces file with 'hidden'
> >        # symbol visibility, define STAP_SDT_V2 to produce 'default'
> >        # symbol visibility instead.
> >
> > > +    QEMU_CFLAGS="$QEMU_CFLAGS -DSTAP_SDT_V2"

Please note that we don't know how long this behavior will persist.
You are relying on an accident. :-)

Much of the systemtap code doesn't support real STAP_SDT_V2 format,
and /usr/include/sys/sdt.h cannot generate it at all.  That macro
tricks only the dtrace-header-generator to suppress the "hidden"
visibility attribute, but doesn't change probe metadata format to the
old V2 (in .probes sections rather than .note.* ELF notes).

We'll try not to break it, but please move toward the more proper
per-solib or per-executable hidden copies of the semaphore objects.

- FChE


