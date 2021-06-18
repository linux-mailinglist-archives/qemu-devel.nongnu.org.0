Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E753AC7CC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 11:40:02 +0200 (CEST)
Received: from localhost ([::1]:40252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luAyn-0001hx-2s
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 05:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1luAxr-0000vn-68
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:39:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1luAxp-0005sn-Hp
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:39:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624009140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W9FaYUajG8ACuuTjJVNq971n/EmnhjsxOtaXh4YECW8=;
 b=TOexn3oJzoF9DfEIC7BxXIfQZ9r+FUkhFKVoGUr1vrZno7p9R+4PAfHFUUnYevFeJ/XkDq
 sSUUNLEunxX9khyAZUkuY8Zcc2gRH8ShI5ckJMQV9WYw+c0bL9GfAytYT2KnFpFkKJCvPT
 Ji0xYuRxoLL7KV5etenX++VrPYJ2vJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-SzJcZdrfMxagviKTEuWHhg-1; Fri, 18 Jun 2021 05:38:58 -0400
X-MC-Unique: SzJcZdrfMxagviKTEuWHhg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFC4E8030AF;
 Fri, 18 Jun 2021 09:38:57 +0000 (UTC)
Received: from localhost (ovpn-113-13.ams2.redhat.com [10.36.113.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 195C05C22A;
 Fri, 18 Jun 2021 09:38:50 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v4 1/4] s390x/css: Introduce an ESW struct
In-Reply-To: <20210617232537.1337506-2-farman@linux.ibm.com>
Organization: Red Hat GmbH
References: <20210617232537.1337506-1-farman@linux.ibm.com>
 <20210617232537.1337506-2-farman@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 18 Jun 2021 11:38:49 +0200
Message-ID: <87czsjpl5i.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 18 2021, Eric Farman <farman@linux.ibm.com> wrote:

> The Interrupt Response Block is comprised of several other
> structures concatenated together, but only the 12-byte
> Subchannel-Status Word (SCSW) is defined as a proper struct.
> Everything else is a simple array of 32-bit words.
>
> Let's define a proper struct for the 20-byte Extended-Status
> Word (ESW) so that we can make good decisions about the sense
> data that would go into the ECW area for virtual vs
> passthrough devices.
>
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>  hw/s390x/css.c            | 19 +++++++++++++------
>  include/hw/s390x/ioinst.h | 12 +++++++++++-
>  2 files changed, 24 insertions(+), 7 deletions(-)

(...)

> diff --git a/include/hw/s390x/ioinst.h b/include/hw/s390x/ioinst.h
> index c6737a30d4..e7ab401781 100644
> --- a/include/hw/s390x/ioinst.h
> +++ b/include/hw/s390x/ioinst.h
> @@ -123,10 +123,20 @@ typedef struct SCHIB {
>      uint8_t mda[4];
>  } QEMU_PACKED SCHIB;
>  
> +/* format-0 extended-status word */
> +typedef struct ESW {
> +   uint32_t word0;

Maybe append /* subchannel logout for format 0 */? Can do when applying.

> +   uint32_t erw;
> +   uint64_t f_addr;     /* Zeros for other ESW formats */
> +   uint32_t s_addr;     /* Zeros for other ESW formats */
> +} QEMU_PACKED ESW;
> +
> +#define ESW_ERW_SENSE 0x01000000
> +
>  /* interruption response block */
>  typedef struct IRB {
>      SCSW scsw;
> -    uint32_t esw[5];
> +    ESW esw;
>      uint32_t ecw[8];
>      uint32_t emw[8];
>  } IRB;


