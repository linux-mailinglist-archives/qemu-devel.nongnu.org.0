Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C24718B314
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Mar 2020 13:13:22 +0100 (CET)
Received: from localhost ([::1]:37102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEu37-0000e6-FN
	for lists+qemu-devel@lfdr.de; Thu, 19 Mar 2020 08:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48468)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jEu27-0008D0-Ga
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 08:12:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1jEu26-0007Qw-I7
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 08:12:19 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:27919)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1jEu26-0007Qo-Eq
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 08:12:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584619938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mqKiKB2hRn1TYxDxl4/PlUppsRNoYD8Y6jh7UyD/0+I=;
 b=N/7bzsY5a+uhfAJcpQOJHIwaQD/IJb7NJMaq8Q7z6sP8Fyf3Aady3CXt3XtPNxzTsQ0NcG
 HJRfXJfejB7p7HJDUSvLnq4/1ElKzfxKHQYNeW34Tm6Uk5p6mUTcPCinRlBO/2jsOlzcsn
 TBVW2N4nh46dQFANCFSOo3dQBjQCBgk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-C6R90UyWNNOfarfQJ8922A-1; Thu, 19 Mar 2020 08:12:16 -0400
X-MC-Unique: C6R90UyWNNOfarfQJ8922A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97ACE8017CC;
 Thu, 19 Mar 2020 12:12:15 +0000 (UTC)
Received: from gondolin (ovpn-113-188.ams2.redhat.com [10.36.113.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA2FF62673;
 Thu, 19 Mar 2020 12:12:11 +0000 (UTC)
Date: Thu, 19 Mar 2020 13:12:09 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v10 11/16] s390x: protvirt: Move diag 308 data over SIDA
Message-ID: <20200319131209.0e4e8092.cohuck@redhat.com>
In-Reply-To: <20200318143047.2335-12-frankja@linux.ibm.com>
References: <20200318143047.2335-1-frankja@linux.ibm.com>
 <20200318143047.2335-12-frankja@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Mar 2020 10:30:42 -0400
Janosch Frank <frankja@linux.ibm.com> wrote:

> For protected guests the IPIB is written/read to/from the SIDA, so we
> need those accesses to go through s390_cpu_pv_mem_read/write().
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
>  target/s390x/diag.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


