Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953FC29CF9B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 12:03:00 +0100 (CET)
Received: from localhost ([::1]:36622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXjEJ-000449-82
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 07:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kXjCH-0003Fa-Uj
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 07:00:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kXjCC-0001xQ-Mv
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 07:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603882846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g53R4eD6qQLw90WlbRTHrglC4EGCBo/LnhVX0Z3z/KQ=;
 b=XBwfKHoCchH/dqdH9a8v98xaGytFpfrP88GeeDFo5FMFYMD75MM6kJqMu8sVsmd1287nmQ
 u5N5cJrTeIk8uyZ4FYjVhMhDGn78n0VQrc6Fl9fisxeaBlCC1mATgJXRuXmS7EpSeoS/yr
 fskC/x1d1z0M7KKhMRkD3wBdtE9ex88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113--M942F-HOPmepslO5FVy0A-1; Wed, 28 Oct 2020 07:00:44 -0400
X-MC-Unique: -M942F-HOPmepslO5FVy0A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06A63807103;
 Wed, 28 Oct 2020 11:00:43 +0000 (UTC)
Received: from localhost (ovpn-113-87.ams2.redhat.com [10.36.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 747981002D41;
 Wed, 28 Oct 2020 11:00:39 +0000 (UTC)
Date: Wed, 28 Oct 2020 11:00:38 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] virtio: skip guest index check on device load
Message-ID: <20201028110038.GE221115@stefanha-x1.localdomain>
References: <20201026151328.77611-1-felipe@nutanix.com>
 <20201027113049.GH79063@stefanha-x1.localdomain>
 <20201027082337-mutt-send-email-mst@kernel.org>
 <12146644-5D22-4CAC-9B4F-F16E84ED56AE@nutanix.com>
 <20201027085447-mutt-send-email-mst@kernel.org>
 <AE57D4EC-2C3C-4C22-9203-38A61D87B31F@nutanix.com>
 <20201027090420-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201027090420-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="T6xhMxlHU34Bk0ad"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:50:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Felipe Franciosi <felipe@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--T6xhMxlHU34Bk0ad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 27, 2020 at 09:04:46AM -0400, Michael S. Tsirkin wrote:
> It's not a waste of time, it's just a lot of work
> within guests.

Luckily it does no harm to set the NEEDS_RESET bit even if the guest
doesn't handle it.

If the guest driver is unaware it may continue to submit requests to the
device for a while. The device emulation code stops accepting new
requests though. This means the device will become unresponsive until
reset, which is not ideal but okay in the case where the device was put
into an invalid state.

I agree that supporting NEEDS_RESET transparently inside guests is
difficult. The driver needs to reset and resume the device without
reporting errors to applications. In some cases drivers may not have
enough state in order to do that. It's also tricky to test all code
paths. I guess this is why no one has done it: drivers shouldn't enter
the NEEDS_RESET state anyway and handling it is complex.

Stefan

--T6xhMxlHU34Bk0ad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+ZT1YACgkQnKSrs4Gr
c8gbEQgAmoJQySu64D/fTL5kZD2xLV7vb6nBQoD8jVlprtIF6747LQn82me/93dK
JcgR3TaWHDQI4HPxQQjyNYxhsnAiCxnqJCLJUoHXUS1nWgMr2uKHg6AcyoiS/52k
FryIYtd54dmMTshNga7JeGI4UGLKPJMStki3o9s5F0IG/VNUlVE5HitDkGQQ02hD
NSsCNktKj5NN5HyhB5KmGRRSMbhWkQa0UyGj41ToYoSip2ioy4B5gyzfYvDNscAI
4n4e1UZXp478JgmzsKlZWh8yUhgXOphT9PdghUz72vkF03hW6LOTcaMGIs1NT06i
yy9uphiM+213Zk0Bw/sPs7QDo5ijIg==
=MDNJ
-----END PGP SIGNATURE-----

--T6xhMxlHU34Bk0ad--


