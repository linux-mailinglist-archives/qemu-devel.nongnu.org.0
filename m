Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E6F113F28
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 11:14:13 +0100 (CET)
Received: from localhost ([::1]:52514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ico9E-0000yW-2m
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 05:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40073)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ico7v-0000UN-Cu
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 05:12:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ico7t-00065M-Ly
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 05:12:50 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56357
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ico7t-00060h-5m
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 05:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575540768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0VoEV0CNvUCekb3vj3WlZui/bfPA+ZjWcJzKP8eW4lg=;
 b=M2QeSB7VpBA+sY8b35yLe3MLzRNTr33/XdOaxWN3sQ9T46BUpwwbJBIpio8hu09RmYAaH1
 btX97ECPkSLvCWX1H24yqY+Fu75QT4tQX/ZMRUeuF12s6jTq7nsCVEnQmLg2NCSMl/az0E
 VF/YMw3oJOX0qRlzKptwKKBfA33ahk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-9DV4TWZCOhCxBlMCVfuPLQ-1; Thu, 05 Dec 2019 05:12:45 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5AB7593D6;
 Thu,  5 Dec 2019 10:12:43 +0000 (UTC)
Received: from gondolin (unknown [10.36.118.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F3065D6A5;
 Thu,  5 Dec 2019 10:12:42 +0000 (UTC)
Date: Thu, 5 Dec 2019 11:12:39 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v3 4/4] pc-bios/s390x: Fix reset psw mask
Message-ID: <20191205111239.01e7b114.cohuck@redhat.com>
In-Reply-To: <20191203132813.2734-5-frankja@linux.ibm.com>
References: <20191203132813.2734-1-frankja@linux.ibm.com>
 <20191203132813.2734-5-frankja@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 9DV4TWZCOhCxBlMCVfuPLQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  3 Dec 2019 08:28:13 -0500
Janosch Frank <frankja@linux.ibm.com> wrote:

> We need to set the short psw indication bit in the reset psw, as it is
> a short psw.
> 
> fixes: 9629823290 ("pc-bios/s390-ccw: do a subsystem reset before running the guest")
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  pc-bios/s390-ccw/jump2ipl.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Thanks, applied (together with a rebuild of the bios images.)


