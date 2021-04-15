Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB32536039E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 09:44:39 +0200 (CEST)
Received: from localhost ([::1]:59332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWwg2-0002vy-UW
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 03:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lWwem-0002Oi-QP
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 03:43:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lWwek-0004Nu-2g
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 03:43:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618472596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MVYIZM8JqpMU1+tIEjcXEiLZfQKMpzNM1h4+W5xOt00=;
 b=dDbEWu5WljYQpyP5ZJhvetqzTsxeOpiMZQHlAbQm2b1XDsiBH94Nq1YIHh5KinsPfwezX4
 KRziceS4AOef7p8ZzcKYVFqe0GgrrlGf8o0/trdpY6XpIDbqKiaZCZgci7OwFgylljJtfP
 qop1Lj7Pa2+/iRP2hXjXhl6DLLo0KYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-iJUVVz8QPNSdmKi9rK0ZYw-1; Thu, 15 Apr 2021 03:43:14 -0400
X-MC-Unique: iJUVVz8QPNSdmKi9rK0ZYw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0405C100A267;
 Thu, 15 Apr 2021 07:43:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-165.ams2.redhat.com
 [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF68C6F991;
 Thu, 15 Apr 2021 07:43:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C4D1E18000A1; Thu, 15 Apr 2021 09:43:07 +0200 (CEST)
Date: Thu, 15 Apr 2021 09:43:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 00/11] Add support for Blob resources feature
Message-ID: <20210415074307.6uohri7zjbiwjilm@sirius.home.kraxel.org>
References: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
 <58a1404f12d9434bae1d336f6553279e@intel.com>
 <20210414094502.krykle6fcv2ehkvg@sirius.home.kraxel.org>
 <ad10ac98a4f141e599c177bbab62982e@intel.com>
MIME-Version: 1.0
In-Reply-To: <ad10ac98a4f141e599c177bbab62982e@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, "Zhang,
 Tina" <tina.zhang@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Kim, Dongwon" <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> But I get a feeling that it is inadequate as GTK/GLArea does not manage the wl_buffers
> submitted to the compositor -- EGL does. I suspect we either need to use a new GTK
> mechanism -- that perhaps does not exist yet -- or not use GTK at all for this.
> 
> I do understand that adding a new purely Wayland backend would make it redundant given
> that GTK, SDL, Spice, etc already support Wayland; however, I do not see any good options
> available for eliminating that blit.

Well, one idea is using dbus (discovery/setup) and pipewire (data
streams) to allow other applications access the guest display (also
audio, input, ...).  Simliar to gnome exporting the wayland display
that way for remote access and screen sharing.

pipewire supports using dmabufs, so that should allow to decouple user
interface code from qemu without making compromises on performance,
which is probably quite useful for a number of use cases, like a
zero-copy wayland client, or a client using drm directly.

Right now pipewire support is at "idea" level, there isn't even a
proof-of-concept for that.  So it surely doesn't help short-term, but
IMHO this makes alot of sense medium/long-term.

Marc-André has experimental code for a dbus-based UI for qemu.  It
doesn't use pipewire as data transport though.  At least the first
version posted a while ago @ qemu-devel doesn't.

take care,
  Gerd


