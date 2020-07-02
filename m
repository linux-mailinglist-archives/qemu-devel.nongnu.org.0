Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537BF2121B1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 13:02:45 +0200 (CEST)
Received: from localhost ([::1]:47344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqwzM-0001n7-Cx
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 07:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jqwyB-00013n-4R
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:01:31 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51626
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jqwy9-0008Q9-8w
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593687687;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bzq8v3Nr8KlyFxRUVpf/tWN1pFNIa+pEMn+v4Xyz1mI=;
 b=POyITSjLZOuXNraoPgaixRh3oAkI5+i3cb7qNlNT5USg/vZcfAKLM63OCkIMTPUsGwtv11
 MQOD1p2KUbAZ9vsfBUOkKUblT5u7u9LO1LPByBnGX7Mw0QIxIbndT8+il5nUKpVapB6fBg
 tyWOR5ogJASjkXG2aOPlyfkEMmcEypI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-OEcDvFq4MSG_yrbbACfKSA-1; Thu, 02 Jul 2020 07:01:19 -0400
X-MC-Unique: OEcDvFq4MSG_yrbbACfKSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 159EB800C60
 for <qemu-devel@nongnu.org>; Thu,  2 Jul 2020 11:01:19 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCAD079221;
 Thu,  2 Jul 2020 11:01:17 +0000 (UTC)
Date: Thu, 2 Jul 2020 12:01:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH v10 0/5] fw_cfg: Add FW_CFG_DATA_GENERATOR; crypto: Add
 tls-cipher-suites
Message-ID: <20200702110114.GH1888119@redhat.com>
References: <20200623172726.21040-1-philmd@redhat.com>
 <20200701103155.GE1427561@redhat.com>
 <b450f105-59a6-7502-93a0-fb9cf26e8ad2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b450f105-59a6-7502-93a0-fb9cf26e8ad2@redhat.com>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:42:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 02, 2020 at 01:00:02PM +0200, Laszlo Ersek wrote:
> On 07/01/20 12:31, Daniel P. Berrangé wrote:
> > On Tue, Jun 23, 2020 at 07:27:21PM +0200, Philippe Mathieu-Daudé wrote:
> >> Hi,
> >>
> >> This series has 3 parts:
> >>
> >> - First we add the tls-cipher-suites object
> >>
> >> - We add the ability to QOM objects to produce data
> >>   consumable by the fw_cfg device,
> >>
> >> - Then we let the tls-cipher-suites object implement
> >>   the FW_CFG_DATA_GENERATOR interface.
> >>
> >> This is required by EDK2 'HTTPS Boot' feature [*] to tell
> >> the guest which TLS ciphers it can use.
> > 
> > On my crypto side, the series is ready to merge.
> > 
> > The code is split 50/50 between crypto subsystem and firmware
> > subsystem, so the question is who wants to merge it ?
> > 
> > If Laszlo wants to merge it, then consider the whole series
> > to have   Acked-by: Daniel P. Berrangé <berrange@redhat.com>
> > 
> > If Laszlo wants me to merge it, then I'll just wait for him
> > to give his Ack.
> > 
> > Soft-freeze is fast approaching in less than a week...
> 
> We should let Phil send a pull request. :)

Fine by me.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


