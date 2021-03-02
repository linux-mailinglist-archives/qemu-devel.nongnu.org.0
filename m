Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC4432AA31
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:19:54 +0100 (CET)
Received: from localhost ([::1]:42360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAYj-0006FG-Ig
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lH9XC-00031B-A6
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:14:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lH9XA-0001dx-FC
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614708851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GGZ+V4BuMUjN/dyzBouw6tuQ4nBWV+cZH0uyaasrD7c=;
 b=HAT9LgzuJTjYdPV5j7I2h8099f5kvSl8L0YmrKKLTriIZZeMOJ8ftn+IK4FQGLxbkI4iqT
 UP54LYrlTngMCvXoshg4m4s+pVyE1IKxwPBOvDNmuDivedvGsvrYL0JQ70bH4pLosSLKn4
 2QXkXbJmymoV0fHlbfj5B+iyANbRLQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-XHotEw4dNaWznIMyNuqAmg-1; Tue, 02 Mar 2021 13:14:07 -0500
X-MC-Unique: XHotEw4dNaWznIMyNuqAmg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80BFC8799F3;
 Tue,  2 Mar 2021 18:14:06 +0000 (UTC)
Received: from gondolin (ovpn-113-150.ams2.redhat.com [10.36.113.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BE3F10013C1;
 Tue,  2 Mar 2021 18:14:05 +0000 (UTC)
Date: Tue, 2 Mar 2021 19:14:02 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH] vfio-ccw: Do not read region ret_code after write
Message-ID: <20210302191402.7bce604b.cohuck@redhat.com>
In-Reply-To: <20210301195143.4106604-1-farman@linux.ibm.com>
References: <20210301195143.4106604-1-farman@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  1 Mar 2021 20:51:43 +0100
Eric Farman <farman@linux.ibm.com> wrote:

> A pwrite() call returns the number of bytes written (or -1 on error),
> and vfio-ccw compares this number with the size of the region to
> determine if an error had occurred or not. If they are equal, the
> code reads the ret_code field from the region. However, while the
> kernel sets the ret_code field as necessary, the region and thus
> this field is not "written back" to the user. So the value can only
> be what it was initialized to, which is zero.
> 
> Not harming anything, but it's a puzzle. Let's avoid the confusion
> and just set the return code to zero for this case.

Yes, ret_code seems to be pretty much useless for us: we don't even
look at it when we read the region for interrupt handling. Thankfully,
we don't seem to really need it, as we can rely on errno. (Probably
worth double checking that this is indeed the case.)

I don't suppose we need to handle a hypothetical broken kernel that
returns the wrong size with errno==0?

> 
> Suggested-by: Matthew Rosato <mjrosato@linux.ibm.com>
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>  hw/vfio/ccw.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index bc78a0ad76..bfd5fd07a5 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -106,7 +106,7 @@ again:
>          error_report("vfio-ccw: write I/O region failed with errno=%d", errno);
>          ret = -errno;
>      } else {
> -        ret = region->ret_code;
> +        ret = 0;
>      }
>      switch (ret) {
>      case 0:
> @@ -194,7 +194,7 @@ again:
>          error_report("vfio-ccw: write cmd region failed with errno=%d", errno);
>          ret = -errno;
>      } else {
> -        ret = region->ret_code;
> +        ret = 0;
>      }
>      switch (ret) {
>      case 0:
> @@ -234,7 +234,7 @@ again:
>          error_report("vfio-ccw: write cmd region failed with errno=%d", errno);
>          ret = -errno;
>      } else {
> -        ret = region->ret_code;
> +        ret = 0;
>      }
>      switch (ret) {
>      case 0:


