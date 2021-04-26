Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B0D36B3D1
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 15:09:39 +0200 (CEST)
Received: from localhost ([::1]:57484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb0za-0006Wk-KY
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 09:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lb0xq-0005G5-Jf
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 09:07:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lb0xo-0004d8-LK
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 09:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619442467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQXzKsOIFXzBUyNmDSeCKP84gqBuw/nXDwpVA/6ZPIA=;
 b=csmFRjXO7iVKGPJKW+5Zzk/LXeIPbfYDMZWNIRIN9dkXow8+BHZC76dFCPQmbiypnT4xD3
 dfAZKK1W/D8V/IdfuZQ6joESX03v29ObPP0UuJEfxr+ZXOKaAEXCuOhsxhW8UlAhzBD+0t
 4xG5k+ei2MZ5+Qc1SC+t9qBoNFziZ8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-zijU4nEcOmKRmJYEuXnpww-1; Mon, 26 Apr 2021 09:07:45 -0400
X-MC-Unique: zijU4nEcOmKRmJYEuXnpww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B480C809AC5;
 Mon, 26 Apr 2021 13:07:43 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-150.ams2.redhat.com
 [10.36.113.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2533060855;
 Mon, 26 Apr 2021 13:07:38 +0000 (UTC)
Date: Mon, 26 Apr 2021 15:07:36 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v2] vfio-ccw: Permit missing IRQs
Message-ID: <20210426150736.7a4e7498.cohuck@redhat.com>
In-Reply-To: <20210421152053.2379873-1-farman@linux.ibm.com>
References: <20210421152053.2379873-1-farman@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-s390x@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 qemu-devel@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Apr 2021 17:20:53 +0200
Eric Farman <farman@linux.ibm.com> wrote:

> Commit 690e29b91102 ("vfio-ccw: Refactor ccw irq handler") changed
> one of the checks for the IRQ notifier registration from saying
> "the host needs to recognize the only IRQ that exists" to saying
> "the host needs to recognize ANY IRQ that exists."
> 
> And this worked fine, because the subsequent change to support the
> CRW IRQ notifier doesn't get into this code when running on an older
> kernel, thanks to a guard by a capability region. The later addition
> of the REQ(uest) IRQ by commit b2f96f9e4f5f ("vfio-ccw: Connect the
> device request notifier") broke this assumption because there is no
> matching capability region. Thus, running new QEMU on an older
> kernel fails with:
> 
>   vfio: unexpected number of irqs 2
> 
> Let's adapt the message here so that there's a better clue of what
> IRQ is missing.
> 
> Furthermore, let's make the REQ(uest) IRQ not fail when attempting
> to register it, to permit running vfio-ccw on a newer QEMU with an
> older kernel.
> 
> Fixes: b2f96f9e4f5f ("vfio-ccw: Connect the device request notifier")
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
> 
> Notes:
>     v1->v2:
>      - Keep existing "invalid number of IRQs" message with adapted text [CH]
>      - Move the "is this an error" test to the registration of the IRQ in
>        question, rather than making it allowable for any IRQ mismatch [CH]
>      - Drop Fixes tag for initial commit [EF]
>     
>     v1: https://lore.kernel.org/qemu-devel/20210419184906.2847283-1-farman@linux.ibm.com/
> 
>  hw/vfio/ccw.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Thanks, applied.


