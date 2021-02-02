Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA4730C755
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 18:19:16 +0100 (CET)
Received: from localhost ([::1]:51014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6zKd-00084A-LO
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 12:19:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l6yfr-0004Jh-7q
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:37:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l6yfn-0003zo-U2
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:37:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612283821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X9Hz0A42d1caUJRLPoFA/GXpYzcZ3QUPuQwyOkEwUHE=;
 b=RuaGfeo0RnOCJBpA8QXrOG/uvpUzkNa27UFIlG2a9bRSdmBYGr5SmmR1fEMoDpvfGiMWn1
 q865Rbc8XeNIumXUzaHLg9fsbgQLB3dWcXSEVSnRT0oaFifBSaslRxlAnRUrzbxgJ/gc/2
 IblGvHD91HGt8KcqF6Mqwd284TvAzVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-eQ_9Lh_3PnWrJTJskKSasA-1; Tue, 02 Feb 2021 11:37:00 -0500
X-MC-Unique: eQ_9Lh_3PnWrJTJskKSasA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E0C88049C0;
 Tue,  2 Feb 2021 16:36:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25A3B1980D;
 Tue,  2 Feb 2021 16:36:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3ED651800386; Tue,  2 Feb 2021 17:36:56 +0100 (CET)
Date: Tue, 2 Feb 2021 17:36:56 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: vnc clipboard support
Message-ID: <20210202163656.hpg4nbfvqbqnjsdm@sirius.home.kraxel.org>
References: <20210201155116.GL4131462@redhat.com>
 <0C14700F-CF47-4CD1-AB41-AA69BC0DA469@redhat.com>
 <20210201165634.GM4131462@redhat.com>
 <D704948F-96C7-441F-BCA3-F848ABFD8087@redhat.com>
 <20210201174018.GP4131462@redhat.com>
 <8456ae54-b737-fa7d-cac8-75cd701f9ef5@eik.bme.hu>
 <20210202113144.jrmqtgllpgd2nw2h@sirius.home.kraxel.org>
 <e3598537-86af-6cf7-bdfe-eac43bce0f2@eik.bme.hu>
 <20210202123829.GF4168502@redhat.com>
 <20210202133534.u364ubxxvr5xyieb@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210202133534.u364ubxxvr5xyieb@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Christophe de Dinechin <cdupontd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 02:35:34PM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > The VNC protocol is way too crude. It is limited to transferring
> > plain text, and provides no way to specify or negotiate a character
> > set. The RFB spec says apps should use latin-1. In reality few, if any,
> > impls do charset conversion so most Linux impls will be sending UTF8
> > while Windows impls will be sending Windows Codepage 1252. It clearly
> > shows its heritage of being designed in the 1990s.
> 
> Well, there is an extension which supports more than just text.  But it
> is a small number of formats which clearly has window-ish background,
> for example rich text format (windows wordpad) for formated text and dib
> (aka windows device independant bitmap) for images.

Well, spice isn't that much better.  Has a short, fixed list too:

VD_AGENT_CLIPBOARD_UTF8_TEXT
VD_AGENT_CLIPBOARD_IMAGE_PNG (mandatory if images supported)
VD_AGENT_CLIPBOARD_IMAGE_{BMP,TIFF,JPEG} (optional)

There also is ...

VD_AGENT_CLIPBOARD_FILE_LIST

... but that works hand-in-hand with the spice webdav server.

take care,
  Gerd


