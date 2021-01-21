Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D903A2FF19A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:18:18 +0100 (CET)
Received: from localhost ([::1]:47074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2db7-0003Fs-Pk
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:18:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l2dMy-00075v-Mz
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:03:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l2dMs-0000G5-Nd
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:03:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611248613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NaJVVIBq0q6XSmM1C58fdOo7eWjwxW3qIZ8B80KgCcE=;
 b=aCL/FsKdBxiz+nV6wIhLxVzmDdjgRpLyXdLJS6fJyjTMj+7TWEusDcRJMUXYdPrb+XYwss
 +kf1v02AgB6FH/oBNk5jLhVi9cfh0mjRRfZjDKG+UaHLve2t+bxXBdhRr0Hmz/rhMjv1H+
 8JyX08IvHPFVufBOBIXpjYy6pfq3yV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-a772V30uOESHL6GgXAB9Cg-1; Thu, 21 Jan 2021 12:03:30 -0500
X-MC-Unique: a772V30uOESHL6GgXAB9Cg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8297219357B8;
 Thu, 21 Jan 2021 17:03:29 +0000 (UTC)
Received: from localhost (ovpn-115-60.ams2.redhat.com [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2465C19CB1;
 Thu, 21 Jan 2021 17:03:28 +0000 (UTC)
Date: Thu, 21 Jan 2021 17:03:28 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: What are libvhost-user locking requirements
Message-ID: <20210121170328.GE59088@stefanha-x1.localdomain>
References: <20210119221849.GC77840@redhat.com> <20210120104501.GB2930@work-vm>
MIME-Version: 1.0
In-Reply-To: <20210120104501.GB2930@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="u5E4XgoOPWr4PD9E"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: gkurz@redhat.com, slp@redhat.com, johannes.berg@intel.com,
 qemu-devel@nongnu.org, virtio-fs-list <virtio-fs@redhat.com>,
 marcandre.lureau@redhat.com, Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--u5E4XgoOPWr4PD9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 10:45:01AM +0000, Dr. David Alan Gilbert wrote:
> * Vivek Goyal (vgoyal@redhat.com) wrote:
> > - what's the locking model needed to use libvhost-user. Is there one?=
=20
>=20
> I don't think it really had one.

Same. Most libvhost-user applications are single-threaded.

Stefan

--u5E4XgoOPWr4PD9E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAJs+AACgkQnKSrs4Gr
c8h6DggAhqheaeMFWe1tnHAqYPpYcacSoGr8yUTVsy94B750Ro+mSXuvRbFl6lS5
bCV/VeNTjoJFRb9/Le1twrnodelEsrlKP6hL9MMDVfaBDp56mmmbG5e1GfVzkt0R
MIIrsArluXkXwLCuzq04Lj8A+33/+vmL1ELHCDgsw82ODIEzpE7HzmN8WNlr2nAT
6phl0OMln38CtLnNrUe/rAfj3lDdf6/Z68IXBKDb9natMpfwtZBdg7XYHU2LPE5B
HT9WoVbk4KR/oH94nK5oQ+vQUhpcYLk0WbD2bbFffccxT5vS5MWQINkZalNYp72s
brbNqD4tsutKhhAr/YvmY8MJVSp84Q==
=/2ur
-----END PGP SIGNATURE-----

--u5E4XgoOPWr4PD9E--


