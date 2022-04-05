Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF04E4F2B99
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 13:12:33 +0200 (CEST)
Received: from localhost ([::1]:45094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbh6t-0004sQ-JR
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 07:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nbh4i-0002hj-T2
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 07:10:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nbh4g-0004md-EK
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 07:10:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649157013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WuOo+PAZdnvMOGUEZd2flirmLksZVFFoa64JScxarVk=;
 b=Dus/d05Md4GFXXMFlzD9mAMMhrW3GU9KMPpGnoRNPips/Ve/q7b5DnpvvjJw91R5ogswUQ
 1uJMj/zJokJwNhk+0rTrN63kEcLbt9wPotjk/mNmuDPFk58ecCzuEZutLf4SgTJFIoYtLx
 XpS19F2TWAY0x8jVLDRvMbXZsj3FCFU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-yAJuBodxMpWsOuL6ZmnoKg-1; Tue, 05 Apr 2022 07:10:11 -0400
X-MC-Unique: yAJuBodxMpWsOuL6ZmnoKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CABE833976;
 Tue,  5 Apr 2022 11:10:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72D45C15E71;
 Tue,  5 Apr 2022 11:10:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 125E81800916; Tue,  5 Apr 2022 13:10:10 +0200 (CEST)
Date: Tue, 5 Apr 2022 13:10:10 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH] ui/cursor: fix integer overflow in cursor_alloc
 (CVE-2022-4206)
Message-ID: <20220405111010.kpjlfvtow7jxzk7w@sirius.home.kraxel.org>
References: <20220405103258.105701-1-mcascell@redhat.com>
 <CAJ+F1CKKyAg-d+3F_H+Q9gBTT0fz5txXkg0bsaRgu=qGkxRN1Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CKKyAg-d+3F_H+Q9gBTT0fz5txXkg0bsaRgu=qGkxRN1Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > +++ b/ui/cursor.c
> > @@ -46,6 +46,13 @@ static QEMUCursor *cursor_parse_xpm(const char *xpm[])
> >
> >      /* parse pixel data */
> >      c = cursor_alloc(width, height);
> > +
> > +    if (!c) {
> > +        fprintf(stderr, "%s: cursor %ux%u alloc error\n",
> > +                __func__, width, height);
> > +        return NULL;
> > +    }
> >
> 
> I think you could simply abort() in this function. It is used with static
> data (ui/cursor*.xpm)

Yes, that should never happen.

Missing: vmsvga_cursor_define() calls cursor_alloc() with guest-supplied
values too.

take care,
  Gerd


