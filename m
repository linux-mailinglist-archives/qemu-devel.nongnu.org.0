Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEB232D29F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 13:10:14 +0100 (CET)
Received: from localhost ([::1]:57000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHmo1-0004CI-Vv
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 07:10:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lHmnB-0003kZ-Ha
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:09:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lHmn9-0002n8-Td
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614859759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tw3Lcnvl0lchmFd/VPGyyWwcZdmJxU9aRsbOFpEqh1E=;
 b=bqst4WUyH1v+qYBxfWcqsb0OnBPA521DSuDp7BMJIyCfjXNjLpZt6BBYppOgpSpQnWMt/o
 5NCXykbtSCYksaEgQW/9Pdc3qkh/P1QbPEyXPQ6XKB1SCISTAEFDeOTsj0mN7piSc6A1Pc
 4vtv6SrmnMnqGnUR0Wc4YbqDoK7u7EI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-ICrkf4vsNE-aC3n1Gsc7Vw-1; Thu, 04 Mar 2021 07:09:17 -0500
X-MC-Unique: ICrkf4vsNE-aC3n1Gsc7Vw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58FD5804333;
 Thu,  4 Mar 2021 12:09:16 +0000 (UTC)
Received: from gondolin (ovpn-114-163.ams2.redhat.com [10.36.114.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FE945D705;
 Thu,  4 Mar 2021 12:09:15 +0000 (UTC)
Date: Thu, 4 Mar 2021 13:09:13 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v2] vfio-ccw: Do not read region ret_code after write
Message-ID: <20210304130913.115724dd.cohuck@redhat.com>
In-Reply-To: <20210303160739.2179378-1-farman@linux.ibm.com>
References: <20210303160739.2179378-1-farman@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

On Wed,  3 Mar 2021 17:07:39 +0100
Eric Farman <farman@linux.ibm.com> wrote:

> A pwrite() call returns the number of bytes written (or -1 on error),
> and vfio-ccw compares this number with the size of the region to
> determine if an error had occurred or not.
> 
> If they are not equal, this is a failure and the errno is used to
> determine exactly how things failed. An errno of zero is possible
> (though unlikely) in this situation and would be translated to a
> successful operation.
> 
> If they ARE equal, the ret_code field is read from the region to
> determine how to proceed. While the kernel sets the ret_code field
> as necessary, the region and thus this field is not "written back"
> to the user. So the value can only be what it was initialized to,
> which is zero.
> 
> So, let's convert an unexpected length with errno of zero to a
> return code of -EFAULT, and explicitly set an expected length to
> a return code of zero. This will be a little safer and clearer.
> 
> Suggested-by: Matthew Rosato <mjrosato@linux.ibm.com>
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
> 
> Notes:
>     Changes v1->v2:
>      - Add code to handle an unexpected length being returned,
>        but errno is not set. [CH]
>     
>     v1: https://lore.kernel.org/qemu-devel/cc440ee8-28c5-3208-19db-ebb48ea60e9d@linux.ibm.com/
> 
>  hw/vfio/ccw.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Thanks, applied.


