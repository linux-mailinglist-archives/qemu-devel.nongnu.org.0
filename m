Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC1312EB02
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jan 2020 22:04:29 +0100 (CET)
Received: from localhost ([::1]:45630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1in7ds-0005lp-5L
	for lists+qemu-devel@lfdr.de; Thu, 02 Jan 2020 16:04:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54207)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1in7bb-00047m-SQ
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 16:02:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1in7bX-0001b2-1W
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 16:02:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54050
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1in7bW-0001ZW-FT
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 16:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577998921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7YCLpR+elqo2z3rxy6eLmrOdvuLyD7kqB7N2geleoLw=;
 b=bcXpdZLOBUFW/3zaNNqcsKvkCJC1mqgxdtS57eZTBl6ZCbAON7PFkg91QwMDGYjOMuZLDr
 DdAscWOK/pmhbMHzau1qaSLaH3wpE5XUQBUS4oKotJwS9y1meOF5xW5ndlJIW0rtcXT61H
 /b3d5IxHukE2wWV19pFiU1TO9v/Q4vg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-AstXqiCZP0KT8kFyq8xlTw-1; Thu, 02 Jan 2020 16:01:58 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F93F107ACC4;
 Thu,  2 Jan 2020 21:01:57 +0000 (UTC)
Received: from localhost (ovpn-112-20.ams2.redhat.com [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9275C6F432;
 Thu,  2 Jan 2020 21:01:52 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tpm: fix PPI RAM migration
Date: Fri,  3 Jan 2020 01:01:47 +0400
Message-Id: <20200102210149.926077-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: AstXqiCZP0KT8kFyq8xlTw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

The following series fixes a migration issue with the TPM PPI code due
to unaligned host RAM pointer.

Marc-Andr=C3=A9 Lureau (2):
  RFC: savevm: check RAM is page_size aligned
  tpm-ppi: page-align PPI RAM

 hw/tpm/tpm_ppi.c   | 3 ++-
 migration/savevm.c | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

--=20
2.24.0.308.g228f53135a


