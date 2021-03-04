Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E2132D3BA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 13:58:07 +0100 (CET)
Received: from localhost ([::1]:60250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHnYM-0004Ja-7n
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 07:58:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnSv-0007U4-BV
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnSu-000573-1O
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614862347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J6LtdJMWisbnkqaR3pzLYC98c1cbhJuQsTdqSnfJRTY=;
 b=NmJFlr6QlikzhOXfWRZrrMGOAIm8xiv9eeuQq45mrJ1vYGKAK1zI/G1wjv0O2UkebJiY9W
 YWoX5Pd5Do5tHwOLN19lb2L11XYEvn4qziGvB/5cB4TU2nYo/E5crSroYX0MEnx04xSbO8
 w0b3HHA9tJNbrhTsau1Wqmle1dnVpWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-2GMpV6mgOiC38-v5wLwHGQ-1; Thu, 04 Mar 2021 07:52:23 -0500
X-MC-Unique: 2GMpV6mgOiC38-v5wLwHGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFBC46409B;
 Thu,  4 Mar 2021 12:52:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-129.ams2.redhat.com
 [10.36.115.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E72510190AA;
 Thu,  4 Mar 2021 12:52:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E4FE0180063F; Thu,  4 Mar 2021 09:58:11 +0100 (CET)
Date: Thu, 4 Mar 2021 09:58:11 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 5/7] ui/vnc: clipboard support
Message-ID: <20210304085811.q2mdy5ok6tlqhdky@sirius.home.kraxel.org>
References: <20210219131349.3993192-1-kraxel@redhat.com>
 <20210219131349.3993192-6-kraxel@redhat.com>
 <CAJ+F1CLLgnKcr-jRG=2sVnNGjsGjovm+e0bbeTTwHU=CRg1w+Q@mail.gmail.com>
 <20210303121314.2ql3yj6ju4i3wvmx@sirius.home.kraxel.org>
 <CAJ+F1CJxSfEa2Y2WDdOS-x3RmiM490GotgpwETweaH1h+MPt+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJxSfEa2Y2WDdOS-x3RmiM490GotgpwETweaH1h+MPt+A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 03, 2021 at 06:27:27PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Mar 3, 2021 at 4:13 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> >   Hi,
> >
> > > > +        case Z_BUF_ERROR:
> > > > +            out_len <<= 1;
> > > > +            if (out_len > (1 << 20)) {
> > > >
> > >
> > > 1Mb isn't that much, is it? Well, since it handles only text for now it's
> > > probably enough. Would it make sense to make this a #define for clarity ?
> >
> > Yep.  While talking about sizes:  How does vdagent handles large
> > clipboard chunks?  There is ...
> >
> > #define VD_AGENT_MAX_DATA_SIZE 2048
> >
> > ... but I suspect clipboard content isn't limited to that ...
> >
> >
> The client splits large data to send in many messages.

Ok.  Is it documented anywhere how that split happens?  I suspect it'll
involve VDIChunkHeader somehow?

> I don't see the
> agent doing the same (I might be missing something).

Hmm, ok.  Guess I should better be prepared to receive messages larger
than VD_AGENT_MAX_DATA_SIZE ...

take care,
  Gerd


