Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6423B19DA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:25:16 +0200 (CEST)
Received: from localhost ([::1]:47262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw1wR-0003uR-Qw
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lw1sE-0007k8-0S
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:20:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lw1sC-0004oR-C7
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624450851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NooOK4hXA9LlohL8CsaI4INYvsbBQgtd+QvULM2G1m4=;
 b=KvpAgdKq9D+WTHPwlMXP0a09Y1GT9iMVUpoj7A4Kd6CGcL0TtO2ASYM7C5j8s14YOGxEB2
 ZJgyLjRzLbEOqlvEVuBMdG0gM17sBW9B2d1wNc104jn903AXwrdnQoH30AUsSlD2wHnGJV
 pabxIxwqNVcgXfWi0xNgMHA5yiNlwcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-__gGJe9VNdG8RvIQoJuHkA-1; Wed, 23 Jun 2021 08:20:49 -0400
X-MC-Unique: __gGJe9VNdG8RvIQoJuHkA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76DFDCC62A;
 Wed, 23 Jun 2021 12:20:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EC46100EBAF;
 Wed, 23 Jun 2021 12:20:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 93331180060E; Wed, 23 Jun 2021 14:20:46 +0200 (CEST)
Date: Wed, 23 Jun 2021 14:20:46 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Qiang Liu <cyruscyliu@gmail.com>
Subject: Re: [PATCH] hw/audio/sb16: Restrict I/O sampling rate range for
 command 41h/42h
Message-ID: <20210623122046.q57ydwxnhomhdjrj@sirius.home.kraxel.org>
References: <CAAKa2jkj=rJVhOuE9XXC9ccsAt=2vg3_MO_NDL3OL98ALHMeFw@mail.gmail.com>
 <CAAKa2jnbOLuaDbhaVT9Pc7BVfdJ632hpbFBsfk7eCW3evzzsgA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAKa2jnbOLuaDbhaVT9Pc7BVfdJ632hpbFBsfk7eCW3evzzsgA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

Applying: hw/audio/sb16: Restrict I/O sampling rate range for command 41h/42h
error: corrupt patch at line 35
error: could not build fake ancestor

> @@ -244,17 +261,7 @@ static void dma_cmd8 (SB16State *s, int mask, int
> dma_len)

This looks like your mailer mangled the patch.
Can you resent using 'git send-email'?

thanks,
  Gerd


