Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F972FCD4E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 10:15:54 +0100 (CET)
Received: from localhost ([::1]:50612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l29aj-0002N4-Hf
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 04:15:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l29YS-0001Aj-BE
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:13:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l29YQ-0008Kt-Uv
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:13:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611134010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RD79xw8V5nYfpqAHZwqwE079RAa2WKX9O9vbC7d3mIE=;
 b=APhwNvFcLyMIas1QR6iZU/8HHaJq5zY3wrQyx2NT/3gIn3BKODx0fwJoqX7bJee5TVUdfP
 QnngY9oz+LC93TkPY8DVtjsWx2+ASpQ808FftBo3vpaRtdJSlBmoEi2TxbRNkIU5T3cCTW
 GHo0DFSweq7NkwMqnSfFFou9MYiy8EY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-28hDmLa9NRGUKAl-mAA9JA-1; Wed, 20 Jan 2021 04:13:28 -0500
X-MC-Unique: 28hDmLa9NRGUKAl-mAA9JA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86E8A1005513
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 09:13:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 501E860C6A;
 Wed, 20 Jan 2021 09:13:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C6319180039D; Wed, 20 Jan 2021 10:13:25 +0100 (CET)
Date: Wed, 20 Jan 2021 10:13:25 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] usb: add pcap support.
Message-ID: <20210120091325.5ol2oaogb5cibnmd@sirius.home.kraxel.org>
References: <20210119194452.2148048-1-kraxel@redhat.com>
 <97b56d63-870c-2c41-b20c-96411301dc62@redhat.com>
MIME-Version: 1.0
In-Reply-To: <97b56d63-870c-2c41-b20c-96411301dc62@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > diff --git a/hw/usb/pcap.c b/hw/usb/pcap.c
> > new file mode 100644
> > index 000000000000..d3162d65e5fe
> > --- /dev/null
> > +++ b/hw/usb/pcap.c
> > @@ -0,0 +1,242 @@
> 
> Missing license.

Good point.

> > +struct pcap_hdr {
> 
> QEMU_PACKED?
> 
> > +struct pcaprec_hdr {
> 
> QEMU_PACKED?
> 
> > +struct usbmon_packet {
> 
> QEMU_PACKED?

Doesn't hurt, but also doesn't make a difference.
The structs are carefully layout-ed to have all
fields properly aligned.

take care,
  Gerd


