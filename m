Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC08307BFE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:18:17 +0100 (CET)
Received: from localhost ([::1]:36726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Avw-0001Vs-Bd
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5AqX-0007Vk-Qd
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:12:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5AqT-0005cI-Vi
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611853956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qCaVP+kxSpYlZpblZN5bwNYbTLAYEX752Qa3HCB48Lo=;
 b=exLg6OSb0gu1DwFA7KijEHXqdi2/3oc3B1jr/MdO0qjVobcGXufttfgj2mvAxvNjNw8MSH
 Gm1h9DYksnII24S/7sXLQWKqtQg1xG4v/O/xEzqW/UMI31vBsuMrShvi0wv2uI9hm0bP04
 /MuoHiSkCXu5DckM1qW0V2T0/ehfcLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-XXRmJua2Om-kAtO6hRKqHw-1; Thu, 28 Jan 2021 12:12:31 -0500
X-MC-Unique: XXRmJua2Om-kAtO6hRKqHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA8011936B66
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 17:12:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 727FC60C69
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 17:12:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A094D18000B1; Thu, 28 Jan 2021 18:12:24 +0100 (CET)
Date: Thu, 28 Jan 2021 18:12:24 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: vnc clipboard support
Message-ID: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi folks,

I'm looking for a good way to implement cut+paste support for vnc.

The vnc core protocol has support for text/plain cut+paste, and there
is an extension adding support for other formats.  That'll cover one
part of the problem, exchanging cut+paste data between vnc client and
qemu vnc server.

The tricky part is the second: the guest <=> qemu communication.
I see basically two possible approaches here:

  (1) Have some guest agent (spice does it that way).
      Advantage: more flexible, allows more features.
      Disadvantage: requires agent in the guest.
  
  (2) Send text as key events.
      Advantage: no guest agent needed.
      Disadvantage: is translated by guests keyboard map, so qemu
      needs to know the map for proper char -> key event translation.
      Only works for text/plain and only for chars you can easily
      type, anything needing input methods (emoji 😊 for example)
      isn't going to fly.

I think that (1) is clearly the better way.  Given that the agent
would need to run in user wayland/xorg session context the existing
qemu-guest-agent will not work.  Also linking against some UI library
like gtk3 for clipboard handling is not something we want for the
qemu-guest-agent.  So we need another one, I'll name it
qemu-clipboard-agent for the rest of this mail.  And we need a
communication channel.

I'd tend to model the qemu-clipboard-agent simliar to the
qemu-guest-agent, i.e. have some stream as communication path and run
some stream protocol over it.

Stream options I see are (in order of personal preference):

  (1) New virtio-serial port.  virtio-serial likely is there anyway
      for the qemu-guest-agent ...

  (2) Have qemu-clipboard-agent and qemu-guest-agent share the agent
      channel, i.e. qemu-clipboard-agent will proxy everything through
      qemu-guest-agent (spice does it that way).

Protocol options I see are (not sure yet which to prefer, need to have
a closer look at the candidates):

  (1) Add clipboard commands to QMP and use these.

  (2) Reuse the clipboard bits of the vnc protocol (forward
      VNC_MSG_CLIENT_CUT_TEXT messages to the guest agent)

  (3) Reuse the clipboard bits of the spice-agent protocol.

  (4) Reuse the clipboard bits of the wayland protocol.

Once we have sorted the qemu <-> guest communication path it should be
possible to also hook up other UIs (specifically gtk) without too much
effort.  Which probably makes (2) a rather poor choice.

Comments?
Suggestions?
Other ideas?

take care,
  Gerd


