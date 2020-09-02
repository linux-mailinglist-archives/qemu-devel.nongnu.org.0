Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4108025A70A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 09:51:52 +0200 (CEST)
Received: from localhost ([::1]:41156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDNYd-0002N1-B2
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 03:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kDNXt-0001s7-9q
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 03:51:05 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28780
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kDNXr-0007xQ-Qp
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 03:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599033062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=flpSMnK7w/w9BqKw+ZC4zDGY7qUpAGfGUboItt8h6fA=;
 b=ONwRMo/cUjlpIVydaKmh2fSa6wootTQ4InncWGIiRlR6VxGus/FqOrvOWsm5dDKBVROBMR
 U2Yb80a3khpdT0xknuaQkHdtoz+ffJVj9NViIu3Ht+tzFFRgTYksVI0vnJMtxwCGI4I9Zc
 IvkWRBAjWQWx7PKUafkrq4IQDivohqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-U8rewpBkPX6AqZ4sHMtFzg-1; Wed, 02 Sep 2020 03:51:00 -0400
X-MC-Unique: U8rewpBkPX6AqZ4sHMtFzg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ACEB107B26B
 for <qemu-devel@nongnu.org>; Wed,  2 Sep 2020 07:50:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 617235C1BB;
 Wed,  2 Sep 2020 07:50:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 640859D5A; Wed,  2 Sep 2020 09:50:58 +0200 (CEST)
Date: Wed, 2 Sep 2020 09:50:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] meson: use pkg-config method to find dependencies
Message-ID: <20200902075058.ip5qqtpkpo5dbpi5@sirius.home.kraxel.org>
References: <20200901070459.27489-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200901070459.27489-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 03:24:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 01, 2020 at 03:04:59AM -0400, Paolo Bonzini wrote:
> We do not need to ask cmake for the dependencies, so just use the
> pkg-config mechanism.  Keep "auto" for SDL so that it tries using
> sdl-config too.
> 
> The documentation is adjusted to use SDL2_image as the example,
> rather than SDL which does not use the "pkg-config" method.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


