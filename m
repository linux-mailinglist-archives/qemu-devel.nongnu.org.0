Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BECC40F58D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 12:03:37 +0200 (CEST)
Received: from localhost ([::1]:48960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRAiW-0004b7-HX
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 06:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mRAh7-0003Td-UT
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 06:02:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mRAh6-0007fW-Cu
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 06:02:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631872927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KlZGLamPPqTXObCcqSOETvG0XfXLyi4IysjNl9hqYDc=;
 b=gP3zwKLl0CJyphjHw71aLEjFy/9uBi6wSTQq79J6tNQ9HszWToU3CRpM4fMpm+Afz2uCET
 mKN9f7Ckr/wsb2jRNfOMBDRbc2k3FLlp40pC8ZOBxXqOfMG0UDwYloLH6R9YyhxrnBhE7e
 fjj5NBKNFLbNfjwfTag0mo06YD1Euok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-Vy2L8P-4NIyMX2LjMsG_sQ-1; Fri, 17 Sep 2021 06:02:06 -0400
X-MC-Unique: Vy2L8P-4NIyMX2LjMsG_sQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C877100CCC1;
 Fri, 17 Sep 2021 10:02:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EFBD100EBD0;
 Fri, 17 Sep 2021 10:02:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 06DF918000A9; Fri, 17 Sep 2021 12:02:03 +0200 (CEST)
Date: Fri, 17 Sep 2021 12:02:02 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Subject: Re: [PATCH] ui/gtk: skip any extra draw of same guest scanout blob res
Message-ID: <20210917100202.vrdadmmqbeebwp5g@sirius.home.kraxel.org>
References: <20210916234156.5505-1-dongwon.kim@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210916234156.5505-1-dongwon.kim@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Vivek Kasireddy <vivek.kasireddy@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +    bool      draw_submitted;
> +    QemuMutex mutex;

Why the mutex?  I think all the code runs while holding the BQL so it
should be serialized.

> +#ifdef CONFIG_GBM
> +        if (dmabuf) {
> +            qemu_mutex_lock(&dmabuf->mutex);
> +            if (!dmabuf->draw_submitted) {
> +                qemu_mutex_unlock(&dmabuf->mutex);
> +                return;
> +            } else {
> +                dmabuf->draw_submitted = false;
> +            }
> +        }
> +#endif

Factoring out that into helper functions is probably a good idea.  Then
have stub functions for the CONFIG_GBM=no case and *alot* less #ifdefs
in the code ...

thanks,
  Gerd


