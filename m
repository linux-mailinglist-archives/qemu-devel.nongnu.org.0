Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AF61D90A7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 09:04:52 +0200 (CEST)
Received: from localhost ([::1]:44910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jawJ1-00088A-IT
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 03:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jawIA-0007hH-05
 for qemu-devel@nongnu.org; Tue, 19 May 2020 03:03:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49018
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jawI9-0004WW-8D
 for qemu-devel@nongnu.org; Tue, 19 May 2020 03:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589871836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DEKFP7F4ZMijvghSAqo8THYpL0ng9vMQdIO1XdORUOQ=;
 b=XbAmBtO+ht6Bg0+L5c6tgSifCG0BOw+UpaYVaslKX/WSRRTSUWg8OiZzctwiNNYApQn2bb
 2H2EA4ZzN97e6ubDqlIbRxBeDGcpMPEG1i7nrHqw4sTyUhGUGSixVbDlkedzcQhBYq3kfH
 JVIjpfyfsExoWiZTg/1jYKcvxYWW0W8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-6V-3o9uaOle5NCv6yRyXbA-1; Tue, 19 May 2020 03:03:52 -0400
X-MC-Unique: 6V-3o9uaOle5NCv6yRyXbA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B5248018A7;
 Tue, 19 May 2020 07:03:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF8291002394;
 Tue, 19 May 2020 07:03:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2158416E16; Tue, 19 May 2020 09:03:49 +0200 (CEST)
Date: Tue, 19 May 2020 09:03:49 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH v2 06/11] ui/sdl2: fix handling of AltGr key on Windows
Message-ID: <20200519070349.6z627ph32ibh6gx6@sirius.home.kraxel.org>
References: <bea1a22a-1fb4-b49b-c089-e0a5c5cf55cd@t-online.de>
 <20200516072014.7766-6-vr_qemu@t-online.de>
MIME-Version: 1.0
In-Reply-To: <20200516072014.7766-6-vr_qemu@t-online.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 23:56:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Stefan Weil <sw@weilnetz.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, May 16, 2020 at 09:20:09AM +0200, Volker Rümelin wrote:
> Wire up the keyboard hooking code on Windows to fix the AltGr
> key and improve keyboard grabbing.

Ah, I see, you've kept any gtk dependency out of win32-kbd-hook for
sharing with sdl.  Hmm.  I guess there is no easy way around the #ifdefs
then.

take care,
  Gerd


