Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BA1186B8C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 13:54:37 +0100 (CET)
Received: from localhost ([::1]:38100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDpGN-0004vv-S7
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 08:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54103)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jDnyr-0002iZ-VN
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 07:32:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1jDnyq-0008SN-JK
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 07:32:25 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33093
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1jDnyq-0008Np-A5
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 07:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584358344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ygqra1bSRTNFgX41sI+mAT0STVI66hTUovRIoloGoOk=;
 b=NmfI9t40YgTxj3SIxNMttwtAVB19rgp1tlJArnVV27jQARqiTVVdhBHvUoPxB/0saouy+c
 Xi41/d+8bEZyHCohkozC5hyPUriTJ7GwlWWqfyBxo1Csfq7IHUDlmnn71T+WTGFHs62qzz
 0OwNTKwy2XMCSA3CLrG4mum+Sq7yFvI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-QZsq_S7QM8mMGZW8N6Xv-g-1; Mon, 16 Mar 2020 07:32:20 -0400
X-MC-Unique: QZsq_S7QM8mMGZW8N6Xv-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 030488024CE;
 Mon, 16 Mar 2020 11:32:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-117.ams2.redhat.com
 [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9280F60BFB;
 Mon, 16 Mar 2020 11:32:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D8D1F9AF5; Mon, 16 Mar 2020 12:32:17 +0100 (CET)
Date: Mon, 16 Mar 2020 12:32:17 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH v2 0/6] mostly changes related to audio float samples
Message-ID: <20200316113217.5btm53znm4e5rrvu@sirius.home.kraxel.org>
References: <2a4ade5f-d39b-3094-578f-6cced4650720@t-online.de>
MIME-Version: 1.0
In-Reply-To: <2a4ade5f-d39b-3094-578f-6cced4650720@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: =?utf-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 John Arbuckle <programmingkidx@gmail.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 08, 2020 at 08:29:05PM +0100, Volker R=FCmelin wrote:
> v2:
> - "qapi/audio: add documentation for AudioFormat"
> =A0 Markus suggested to correct a spelling mistake.
>=20
> - "audio: add audiodev format=3Df32 option documentation"
> =A0 New patch.

Pull request sent.

thanks,
  Gerd


