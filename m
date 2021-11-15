Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ACF450561
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 14:27:29 +0100 (CET)
Received: from localhost ([::1]:38674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmc19-0000xl-8N
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 08:27:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmbyB-0008MH-R1
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 08:24:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmby9-0001gJ-M7
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 08:24:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636982660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=biTBbhZoRHL/vP0kkdmLXydVpWe644F+kG2/u+HNr9c=;
 b=d8VFrp9Uuc1fkAJd0V8uAOG3f2kf7w4kTa4x3mYFFwJKyCtDjeaHFSj7LMokKlh121tMLJ
 9QLKOGcGDpbLYllMbnfMmRWhdFibb8UvRQ77hlmoCRd5lO3rgRlB333iKahxGkw5KPy9h6
 OAti77b44Dh2t5uoDzJb23o3DVX9jSo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-ThimTp64PYayf6G0Jv-tKw-1; Mon, 15 Nov 2021 08:24:19 -0500
X-MC-Unique: ThimTp64PYayf6G0Jv-tKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A32A5720F;
 Mon, 15 Nov 2021 13:24:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C3445D6D7;
 Mon, 15 Nov 2021 13:24:16 +0000 (UTC)
Date: Mon, 15 Nov 2021 14:24:14 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: does drive_get_next(IF_NONE) make sense?
Message-ID: <YZJffhlo7I3sOqFs@redhat.com>
References: <CAFEAcA9zmPds0+jHm8VY465XEhK6bbVPd+nDob1ruRPaHOua_Q@mail.gmail.com>
 <87r1bxzl5c.fsf@dusky.pond.sub.org>
 <e7ec3afc-6db9-822e-5a5e-dee7c4db8f34@redhat.com>
 <87pmr5cxbt.fsf@dusky.pond.sub.org>
 <CAFEAcA8sNjLsknea5Nt-tANEniFF2FYmjiV0xz=pr+vFwkX-gw@mail.gmail.com>
 <875ysunfwz.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <875ysunfwz.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.11.2021 um 06:31 hat Markus Armbruster geschrieben:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > On Fri, 12 Nov 2021 at 13:34, Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> Thomas Huth <thuth@redhat.com> writes:
> >>
> >> > On 03/11/2021 09.41, Markus Armbruster wrote:
> >> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >> >>
> >> >>> Does it make sense for a device/board to do drive_get_next(IF_NONE) ?
> >> >> Short answer: hell, no!  ;)
> >> >
> >> > Would it make sense to add an "assert(type != IF_NONE)" to drive_get()
> >> > to avoid such mistakes in the future?
> >>
> >> Worth a try.
> >
> > You need to fix the sifive_u_otp device first :-)
> 
> And for that, we may want Hao Wu's "[PATCH v4 5/7] blockdev: Add a new
> IF type IF_OTHER" first.

Same question as for Hao Wu's series: Wouldn't the proper solution be to
add a drive property to the machine type?

If you can't use -blockdev, it's not done right.

Kevin


