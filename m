Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C423F5DA1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 14:06:56 +0200 (CEST)
Received: from localhost ([::1]:55312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIVCg-0005Qr-V4
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 08:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIVBq-0004iD-2O
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 08:06:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIVBo-00041O-FM
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 08:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629806759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w41Da4IwHa5f1PBJzJ2+zhh7jnFzPPWEoZBnjdlrTME=;
 b=HHH7bFH4GdDbdlOTo0bbYE4XRvvonkj2zUPB/eT28MtRnuHJ2VDn/DZXVjIi+/PmwYOg7x
 iS3XmZGnwF4k/w3DxvUmh+y3qBM8GuPxqrEVXECm1rnePlHarPJlZtLbcLWALMu1oSboCd
 9NWajvkpfpV7CxaIS/jFJQ/eO8k1Q9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-YlRkXpBbM3Gk2J0FuR8ctg-1; Tue, 24 Aug 2021 08:05:54 -0400
X-MC-Unique: YlRkXpBbM3Gk2J0FuR8ctg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88485801E72;
 Tue, 24 Aug 2021 12:05:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FF1F69CBC;
 Tue, 24 Aug 2021 12:05:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 19B9211380A9; Tue, 24 Aug 2021 14:05:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 2/3] hw/usb/hcd-xhci-pci: Abort if setting link
 property failed
References: <20210819171547.2879725-1-philmd@redhat.com>
 <20210819171547.2879725-3-philmd@redhat.com>
 <20210823183414.hmu4ly2y5zkbw3mg@habkost.net>
 <87ilzvntu1.fsf@dusky.pond.sub.org>
 <CAFEAcA-2ShxjS6YAb_xBk=v5YJ5nLaaKtOLVEn7Vjfe6rkpp2A@mail.gmail.com>
Date: Tue, 24 Aug 2021 14:05:39 +0200
In-Reply-To: <CAFEAcA-2ShxjS6YAb_xBk=v5YJ5nLaaKtOLVEn7Vjfe6rkpp2A@mail.gmail.com>
 (Peter Maydell's message of "Tue, 24 Aug 2021 10:19:44 +0100")
Message-ID: <87tujfdp4c.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Dau?= =?utf-8?Q?d=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 24 Aug 2021 at 09:14, Markus Armbruster <armbru@redhat.com> wrote:
>> In functions with an Error **errp parameter, use of &error_fatal is
>> almost always wrong.
>
> What are the cases where it is not wrong?

I can't think of a use that isn't wrong.  Doesn't mean no such use could
exist.  Most rules have exceptions...

>                                           My guess is "in board
> code and other places where the error handling would have been
> 'print a message and call exit()' anyway".

When you know that all callers handle errors like &error_fatal does, use
of &error_fatal doesn't produce wrong behavior.  It's still kind of
wrong, because relying on such a non-local argument without a genuine
need is.


