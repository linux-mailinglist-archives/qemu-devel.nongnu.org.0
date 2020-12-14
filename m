Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876F82D96F2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 12:06:49 +0100 (CET)
Received: from localhost ([::1]:42942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolgm-0007gO-LJ
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 06:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kolfF-0006jD-UY
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:05:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kolfD-0006Sb-WD
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607943911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tUjog/YT0uaWkpfuK5Vn8/rXzIDsK/XJRuZsRzADBkM=;
 b=iv20MqVvPdXLb3YWvoeR1jjTLx4E2YZ42zmPi3/68Jie7XtihUlN5rZblHuWUCTwawmoUF
 6dxt4U8GS7k7ZZG+A/eccI2vl0gdN3Mtnkhd9I2dCOtEMTIrbYdqdzBJrKAG8Trk1y0FVt
 m0L2qdlCsszEx3aOo+bXDvzfJocgy5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-n9mwIwnaMUmQILac_3uOSQ-1; Mon, 14 Dec 2020 06:05:09 -0500
X-MC-Unique: n9mwIwnaMUmQILac_3uOSQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68F8F59
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 11:05:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32F512B6FF;
 Mon, 14 Dec 2020 11:05:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 30C3611AB8; Mon, 14 Dec 2020 12:05:07 +0100 (CET)
Date: Mon, 14 Dec 2020 12:05:07 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH] ui: add support for remote power control to VNC server
Message-ID: <20201214110507.kwz74f4kwfofb7x7@sirius.home.kraxel.org>
References: <20201211160825.102679-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201211160825.102679-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Fri, Dec 11, 2020 at 04:08:25PM +0000, Daniel P. Berrangé wrote:
> The "XVP" (Xen VNC Proxy) extension defines a mechanism for a VNC client
> to issue power control requests to trigger graceful shutdown, reboot, or
> hard reset.

Looks good.  Any other clients are supporting this?

> +            case VNC_XVP_ACTION_REBOOT:
> +                send_xvp_message(vs, VNC_XVP_CODE_FAIL);
> +                break;

> +            default:
> +                send_xvp_message(vs, VNC_XVP_CODE_FAIL);
> +                break;

Minor nit:

These two are identical, so you can drop the first.

take care,
  Gerd


