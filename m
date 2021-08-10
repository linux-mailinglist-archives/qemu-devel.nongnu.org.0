Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C413E5301
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 07:42:01 +0200 (CEST)
Received: from localhost ([::1]:52138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDKWV-00072g-Mb
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 01:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDKV4-0006Cs-U0
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 01:40:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDKV1-0005gC-GN
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 01:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628574025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7fdzANSt03kOEc2C3y07fjAZsuYUf5wqX29RHs+AW+c=;
 b=SLIC3AOVCu/OtRDpbN4gdiIkci+i/qHRtmjhGuIIyE+T5bx/Ju6gmOnYfT/2U8xgcKgVP2
 HGmWBnQ+Xo1rWxUK4rqJLHMPvekce2KsgO2WFBYr7ylLQL/RkHgnRwNdV0BnHTqO8rPbhn
 d+Kv4vX8xLKkoHrxTWmAkKrl4tvjz+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-IqOKUA9AO_iqHnBTRfqYlQ-1; Tue, 10 Aug 2021 01:40:24 -0400
X-MC-Unique: IqOKUA9AO_iqHnBTRfqYlQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EE508749A8;
 Tue, 10 Aug 2021 05:40:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E62BF620DE;
 Tue, 10 Aug 2021 05:40:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 232EF18003AA; Tue, 10 Aug 2021 07:40:21 +0200 (CEST)
Date: Tue, 10 Aug 2021 07:40:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 3/3] ps2: migration support for command reply queue
Message-ID: <20210810054021.m6isaht5yb3pgaoz@sirius.home.kraxel.org>
References: <4d1c8467-d976-2c0f-ba54-c767df7b8fe7@t-online.de>
 <20210807121202.6294-3-vr_qemu@t-online.de>
 <20210809101808.ds3kf37np46gxedc@sirius.home.kraxel.org>
 <87553bd1-6493-d04c-ab44-6a239dde6cbe@t-online.de>
MIME-Version: 1.0
In-Reply-To: <87553bd1-6493-d04c-ab44-6a239dde6cbe@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> this part actually works. .needed is only evaluated on the sending side. For
> the receiving side subsections are optional.  Migration doesn't fail if a
> subsection isn't loaded. Before I sent this patch series one of the
> migration tests was a migration from 6.0.92 to 6.0.92 with one byte in the
> command reply queue and 3 bytes in the scancode queue. The migration didn't
> fail.

Hmm, ok.  If you actually tested it you are probably right.  My memory
tells me ->needed() is evaluated on both sending and receiving side as
the migration data stream does not carry the information whenever a
subsection is present or not.  But maybe my memories are wrong, or
things have changed, I don't follow migration changes that closely.

> > If we can't find something we can add a property simliar to the one
> > for the extended keyboard state.
> 
> What is the best way to add such a compat property? The ps2 keyboard isn't a
> qdev device. I can't just add a property to the device class. Do I have to
> add a property to the i8042 and the pl050 device and propagate the property
> value with the ps2_kbd_init() call to the PS2KbdState?

Yes, I think so.  But double-check the migration thing first, if your
approach works that is the easier way of course.

take care,
  Gerd


