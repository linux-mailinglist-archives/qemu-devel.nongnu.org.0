Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA22A44FE6B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 06:34:36 +0100 (CET)
Received: from localhost ([::1]:56102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmUdX-0007vj-F9
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 00:34:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmUad-0006Rd-Ic
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 00:31:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmUaa-0004h8-Ij
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 00:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636954292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ix32hRVydnwaC1/8LhAoHzagUqtWA7nDIOHK1SZ7/eQ=;
 b=a7+t0uNqMEnF7agQCN4YGkF91ilv/ZMYkSiQwfBMXyFu2pQHWb9CkURTnvJCibZwgcejxO
 F3whkIcT++grOeA3hOYDEZLC0+DfbaPcmzVs+ecGPMiyeGM5oCG8US20zw2bCGMLKS+QBv
 VADBe/rfgRR22X1DChKwtZe14Fs2CW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-qTioGi_rOKal_5qOa_dIgw-1; Mon, 15 Nov 2021 00:31:29 -0500
X-MC-Unique: qTioGi_rOKal_5qOa_dIgw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A15A1E757;
 Mon, 15 Nov 2021 05:31:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92D365BAFF;
 Mon, 15 Nov 2021 05:31:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 373C411380A7; Mon, 15 Nov 2021 06:31:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: does drive_get_next(IF_NONE) make sense?
References: <CAFEAcA9zmPds0+jHm8VY465XEhK6bbVPd+nDob1ruRPaHOua_Q@mail.gmail.com>
 <87r1bxzl5c.fsf@dusky.pond.sub.org>
 <e7ec3afc-6db9-822e-5a5e-dee7c4db8f34@redhat.com>
 <87pmr5cxbt.fsf@dusky.pond.sub.org>
 <CAFEAcA8sNjLsknea5Nt-tANEniFF2FYmjiV0xz=pr+vFwkX-gw@mail.gmail.com>
Date: Mon, 15 Nov 2021 06:31:24 +0100
In-Reply-To: <CAFEAcA8sNjLsknea5Nt-tANEniFF2FYmjiV0xz=pr+vFwkX-gw@mail.gmail.com>
 (Peter Maydell's message of "Sun, 14 Nov 2021 17:16:35 +0000")
Message-ID: <875ysunfwz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.695,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Hao Wu <wuhaotsh@google.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 12 Nov 2021 at 13:34, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Thomas Huth <thuth@redhat.com> writes:
>>
>> > On 03/11/2021 09.41, Markus Armbruster wrote:
>> >> Peter Maydell <peter.maydell@linaro.org> writes:
>> >>
>> >>> Does it make sense for a device/board to do drive_get_next(IF_NONE) ?
>> >> Short answer: hell, no!  ;)
>> >
>> > Would it make sense to add an "assert(type != IF_NONE)" to drive_get()
>> > to avoid such mistakes in the future?
>>
>> Worth a try.
>
> You need to fix the sifive_u_otp device first :-)

And for that, we may want Hao Wu's "[PATCH v4 5/7] blockdev: Add a new
IF type IF_OTHER" first.


