Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD081917B6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 18:35:08 +0100 (CET)
Received: from localhost ([::1]:52722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGnSF-0006Yt-GK
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 13:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57305)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jGnPr-0004Ju-CQ
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 13:32:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1jGnPq-00030b-Dq
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 13:32:39 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:24490)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1jGnPl-0002zM-S7
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 13:32:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585071148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qA/n4GSHPrWDEN+ZLloXGLFDiSXAwOCF4l9mdEhHKug=;
 b=CTpATxU/iYAJaJfXdXIkjYro8U0UUKzpMgs3uqwHC/FxobLKrxH5h7Fjcoo1iFplZd9jS8
 Ib5lR7DWinaOfF1hg5Sg0yB4cM+X8dxeO/XHqw0EN2ycOBk/dYshzR3R1e0DLjQiDEf+gx
 hba9aDC3ZSWzYd1UgMoElE7jPgKuYDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-VkcELWSPPbiBygJ7EOaH-A-1; Tue, 24 Mar 2020 13:32:26 -0400
X-MC-Unique: VkcELWSPPbiBygJ7EOaH-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D547107ACC7;
 Tue, 24 Mar 2020 17:32:25 +0000 (UTC)
Received: from gondolin (ovpn-113-109.ams2.redhat.com [10.36.113.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2C81BBBCE;
 Tue, 24 Mar 2020 17:32:23 +0000 (UTC)
Date: Tue, 24 Mar 2020 18:32:20 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [RFC PATCH v2 6/7] vfio-ccw: Refactor ccw irq handler
Message-ID: <20200324183220.57c6514e.cohuck@redhat.com>
In-Reply-To: <20200206214509.16434-7-farman@linux.ibm.com>
References: <20200206214509.16434-1-farman@linux.ibm.com>
 <20200206214509.16434-7-farman@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 qemu-s390x@nongnu.org, Jared Rossi <jrossi@linux.ibm.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  6 Feb 2020 22:45:08 +0100
Eric Farman <farman@linux.ibm.com> wrote:

> Make it easier to add new ones in the future.
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
> 
> Notes:
>     v1->v2:
>      - Make irq parameter unsigned [CH]
>      - Remove extraneous %m from error_report calls [CH]
> 
>  hw/vfio/ccw.c | 57 ++++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 41 insertions(+), 16 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


