Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175BB49C5DB
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 10:10:09 +0100 (CET)
Received: from localhost ([::1]:58310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCeJc-0004F1-3D
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 04:10:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nCeIE-000331-So
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 04:08:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nCeIC-0006aQ-3M
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 04:08:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643188119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SaEBbzUJ6Gq4I9NvgvbU9hvWgu9pGzFKTl166kJKKTQ=;
 b=PiR94rHKE9jGR4LO4cRaMKh8AsUvQRlZJNpkl5bHQYeezMmQedsbaW2/jkTbRUHHpE6Ipo
 kHKZ34U+gjStyobnF+tSGy4YsFSjBLiAuhR3wwpuxoNxn/pMsWTfwPMnIodGMr+kJR+2LN
 +qLjOaGdJw01GsEYJy68vP9zJrhd7Fw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-ZWURZbziNku5BxzPJbg2ZA-1; Wed, 26 Jan 2022 04:08:35 -0500
X-MC-Unique: ZWURZbziNku5BxzPJbg2ZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 685C219251A4;
 Wed, 26 Jan 2022 09:08:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12A0C62D76;
 Wed, 26 Jan 2022 09:08:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 271E018000AA; Wed, 26 Jan 2022 10:08:32 +0100 (CET)
Date: Wed, 26 Jan 2022 10:08:32 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sven Schnelle <svens@stackframe.org>
Subject: Re: [PATCH 3/3] hw/display/artist: rewrite vram access mode handling
Message-ID: <20220126090832.gkus22icdmvri6ta@sirius.home.kraxel.org>
References: <20220121221619.1069447-1-svens@stackframe.org>
 <20220121221619.1069447-4-svens@stackframe.org>
 <20220125082552.uupa7yyqdnpxgopw@sirius.home.kraxel.org>
 <87tudr6any.fsf@x1.stackframe.org>
MIME-Version: 1.0
In-Reply-To: <87tudr6any.fsf@x1.stackframe.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Helge Deller <deller@gmx.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 25, 2022 at 05:29:53PM +0100, Sven Schnelle wrote:
> Gerd Hoffmann <kraxel@redhat.com> writes:
> 
> >   Hi,
> >
> >> +static void artist_vram_write4(ARTISTState *s, struct vram_buffer *buf,
> >> +                               uint32_t offset, uint32_t data)
> >
> > You should pass around offsets not pointers.  An offset can trivially be
> > checked whenever it is within the valid range (i.e. smaller than vram
> > size), or it can be masked to strip off high bits when accessing virtual
> > vram.  You need that for robustness and security reasons (i.e. make sure
> > the guest can't write to host memory by tricking your get_vram_offset
> > calculations).
> 
> I'm not sure i understand the problem. get_vram_offset() returns an
> offset, which is passed to artist_vram_write4() which itself doesn't
> do anything on the buffer. artist_rop8() in the end accesses the buffer,
> and that function checks whether it's < buf->size. Can you elaborate
> a bit more? Maybe it's just so obvious that i don't see it.

Oops.  Sorry,  Didn't look carefully enough.  You are passing on both
buffer and offset, that is fine.  Missed that because the offset comes
after the line wrap, and also not enough coffee ...

I just had a flashback to the series of CVEs we had for the cirrus
blitter, which used to calculate pointers from buffer + offset, then
passed on those pointers to other functions which where unable to
sanity-check those pointers because all context was gone.

take care,
  Gerd


