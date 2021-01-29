Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25993088D3
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:06:01 +0100 (CET)
Received: from localhost ([::1]:50444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SXJ-00078F-0A
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:06:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5SUT-0005Sq-Ms
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:03:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5SUQ-00082N-Pg
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611921781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hHuhGf5gImlvS9YoFEGZrt8Z75iMeVz+XKm2OMxozq8=;
 b=LbqZU3J5WE8UFuYxXRsZH3eQk/TnEtP6zcVxjBpVrxgMy7ccZ15YPp47LzrQ7DW9Lb+rLs
 Jca5BKDNxFzychZ6NAFAu8lE5ZZFAgvRi0OMmzJqAr3SqUAAxYIYCui1nfHykMKSLKW5I4
 k1/s8ZJ7NixvjW8J7V35jP4HfpC6yfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-2X_GLBsyP0eeLHEQ-8w8ew-1; Fri, 29 Jan 2021 07:02:56 -0500
X-MC-Unique: 2X_GLBsyP0eeLHEQ-8w8ew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BCFF911E2;
 Fri, 29 Jan 2021 12:02:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C216F60BE2;
 Fri, 29 Jan 2021 12:02:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3322318000A2; Fri, 29 Jan 2021 13:02:53 +0100 (CET)
Date: Fri, 29 Jan 2021 13:02:53 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: vnc clipboard support
Message-ID: <20210129120253.36dz6ewxsc7dy43q@sirius.home.kraxel.org>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <CAJ+F1CJvJM0Vjdz1nU92H+x00+NdbqfoJ9TA--9-BuQ8SNmoFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJvJM0Vjdz1nU92H+x00+NdbqfoJ9TA--9-BuQ8SNmoFg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> - the spice protocol had a number of iterations to fix some races. It would
> be great not to repeat the same mistakes, and I don't know if VNC have the
> same flaws or not.

# grep CAP.*CLIPBOARD.*, /usr/include/spice-1/spice/vd_agent.h 
    VD_AGENT_CAP_CLIPBOARD,
    VD_AGENT_CAP_CLIPBOARD_BY_DEMAND,
    VD_AGENT_CAP_CLIPBOARD_SELECTION,
    VD_AGENT_CAP_MAX_CLIPBOARD,
    VD_AGENT_CAP_CLIPBOARD_NO_RELEASE_ON_REGRAB,
    VD_AGENT_CAP_CLIPBOARD_GRAB_SERIAL,

Oh yea, I see.  Is that (and the rest of the protocol) documented
somewhere, other than vd_agent.h?

thanks,
  Gerd


