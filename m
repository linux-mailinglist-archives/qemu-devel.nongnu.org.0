Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C863730BCB1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 12:12:00 +0100 (CET)
Received: from localhost ([::1]:45790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6tbD-0001pi-Tp
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 06:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l6tZk-0001KY-6Z
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:10:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l6tZf-00064u-Ua
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:10:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612264221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MwNKZXLxWTLoT+dkK7Hvk9VW5WVp2Cl+kFKPDwjY/30=;
 b=RMlong/sTTmazs8a7yiPSLYpSN7GQvtDgXakh0b6aoW738y9JSu2lbBXpJ4P71UNz0+ON2
 Vn/JS3ZLVmviWPfaaIwOTkdyicrvbLdOGf0Nc7Gdfxi4kx77R9FOBRZeGl5FkVY4B9MF9d
 LEDsXpagr1s4Xo3V2dIRgBzwOK6gtOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-Km6oVcqJMQyJ2Bqduj7MVQ-1; Tue, 02 Feb 2021 06:10:19 -0500
X-MC-Unique: Km6oVcqJMQyJ2Bqduj7MVQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 984D48030A2
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 11:10:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61D845F9B8;
 Tue,  2 Feb 2021 11:10:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2878118000A7; Tue,  2 Feb 2021 12:10:15 +0100 (CET)
Date: Tue, 2 Feb 2021 12:10:15 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: vnc clipboard support
Message-ID: <20210202111015.peh4cslwvxuot6qv@sirius.home.kraxel.org>
References: <8E05F8C9-A60D-45A9-AFCB-79D866F57660@redhat.com>
 <20210129110814.GF4001740@redhat.com>
 <0F802343-19F8-487C-8BBE-5BBE2014BA1C@redhat.com>
 <20210129143252.GE4008275@redhat.com>
 <05C58667-D9BA-49E2-897D-2286B243E802@redhat.com>
 <20210201155116.GL4131462@redhat.com>
 <0C14700F-CF47-4CD1-AB41-AA69BC0DA469@redhat.com>
 <20210201165634.GM4131462@redhat.com>
 <D704948F-96C7-441F-BCA3-F848ABFD8087@redhat.com>
 <20210201174018.GP4131462@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210201174018.GP4131462@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Christophe de Dinechin <cdupontd@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > How do you rate-limit intelligently to avoid overflowing the guest keyboard buffers?
> 
> Like I said earlier in this thread, this is a big problem with
> keyboard injection.

It's a solved problem though, the qemu vnc server has throttling
implemented already.  There even is an option to configure the delay
(key-delay-ms).

> My preferred solution is to have QEMU leverage the existing SPICE
> guest agent if at all possible, because that's already widely
> available in existing guest OS.

Yep, that is an big advantage.

take care,
  Gerd


