Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E85B17A520
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 13:20:32 +0100 (CET)
Received: from localhost ([::1]:47987 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9pUN-0007KL-6w
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 07:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36337)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ppandit@redhat.com>) id 1j9pQq-00031b-9t
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:16:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1j9pQo-0004Xu-6x
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:16:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44555
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>) id 1j9pQo-0004XX-3W
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:16:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583410609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O6DWHpQzewifKsQyeHoOhR+K+Dcl4naYnog6gJrlxlw=;
 b=bXc1WdW2H/djlUtYkFRkbaHSxDPqmW3TBGzTsewlsyFA8HjUkoDZMmFl64PV8Zu2eGkF9z
 ka3CntibLa/oZgZbJRhB47lhfqtMqwcq10mAF6vT6v2kEJK48ho/8/OITv93jpWZdOSktR
 7CJGxfzG/038ULP2bLDMLJwQGxCpIiI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-jrcBvPMqOkGbUgz2EU0q6g-1; Thu, 05 Mar 2020 07:16:44 -0500
X-MC-Unique: jrcBvPMqOkGbUgz2EU0q6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C9AE108442A;
 Thu,  5 Mar 2020 12:16:42 +0000 (UTC)
Received: from kaapi (ovpn-116-80.ams2.redhat.com [10.36.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A946A272B4;
 Thu,  5 Mar 2020 12:16:37 +0000 (UTC)
Date: Thu, 5 Mar 2020 17:46:33 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: jasowang@redhat.com, svens@stackframe.org
Subject: Re: [PATCH v3 0/2] net: tulip: add checks to avoid OOB access
In-Reply-To: <158323285268.8962.6657028418668892869@abdcc9e1aa82>
Message-ID: <nycvar.YSQ.7.76.2003051742400.5086@xnncv>
References: <158323285268.8962.6657028418668892869@abdcc9e1aa82>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: pangpei.lq@antfin.com, qemu-devel@nongnu.org, ezrakiez@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+-- On Tue, 3 Mar 2020, no-reply@patchew.org wrote --+
| Patchew URL: https://patchew.org/QEMU/20200303104724.233375-1-ppandit@red=
hat.com/
| fatal: unable to access 'https://github.com/patchew-project/qemu/': Faile=
d connect to github.com:443; No route to host

@Jason, @Sven,
 These errors seem unrelated to the patch series. Please see patch v3 when =
you=20
get time.

Thank you.
--
 - P J P
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


