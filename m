Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D334148AD9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 16:01:58 +0100 (CET)
Received: from localhost ([::1]:43424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iv0T6-00048n-Q8
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 10:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48955)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iv0S8-0003fy-JG
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 10:00:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iv0S6-0003ts-Qe
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 10:00:55 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44512)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iv0S6-0003rg-GZ
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 10:00:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579878053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2PDhoqu/AMwlDnrtswmgH102Od/khgsUY3zL2uFie7E=;
 b=QmFLmJSifZJiDRLntXvvfbr5fhgWnWLgYNeqc353hvjMCK8WOi/pVnlaV9UYufYgGi38di
 kMX93sK8H2kZG7GJfu5gQe2b6dFa48SXqWTruxVCWZgbXpZlSTZxtkE8xU+hGeo8rF3mX3
 l9hcybbTwUYnJKGwwZeWpWyNKnre72o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-Um4wxgDaNpi4cN_S8D9Ocg-1; Fri, 24 Jan 2020 10:00:47 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7876A0CCA;
 Fri, 24 Jan 2020 15:00:39 +0000 (UTC)
Received: from gondolin (dhcp-192-195.str.redhat.com [10.33.192.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0612857AF;
 Fri, 24 Jan 2020 15:00:35 +0000 (UTC)
Date: Fri, 24 Jan 2020 16:00:33 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v2] s390x: sigp: Fix sense running reporting
Message-ID: <20200124160033.5ac3c9e8.cohuck@redhat.com>
In-Reply-To: <20200124134818.9981-1-frankja@linux.ibm.com>
References: <20200124134818.9981-1-frankja@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Um4wxgDaNpi4cN_S8D9Ocg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: qemu-s390x@nongnu.org, borntraeger@de.ibm.com, thuth@redhat.com,
 qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Jan 2020 08:48:18 -0500
Janosch Frank <frankja@linux.ibm.com> wrote:

> The logic was inverted and reported running if the cpu was stopped.
> Let's fix that.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Fixes: d1b468bc8869 ("s390x/tcg: implement SIGP SENSE RUNNING STATUS")
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
> 
> Switched the actions instead of the condition so the comment still
> applies.
> 
> ---
>  target/s390x/sigp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied.


