Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C95741AC9F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 12:07:36 +0200 (CEST)
Received: from localhost ([::1]:48784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVA1P-0003Jn-4l
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 06:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVA0S-0002Bw-Hd
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:06:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVA0O-0007Bt-7D
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632823590;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YBeOBbox1HwsF8JTwhOk9KD3iyUunnJtBddX7znXmGY=;
 b=PALiaayFimOr8o47i+IaJnHhIhBgYcwylZIlYWnIfughDtxYAggNia2kN4NDNpIpLqzaJL
 WOLp46eBdyIcp5fPq/eA1ZgIWSsLdBHHdDFx/Nnay6hC78AiDfGUiSOYS4QEXTJrqyf30D
 h6TdqaoUT6LJftBO0Pr5stNuoH829qk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-6om5TrKuMRmbbeGAA5zrYg-1; Tue, 28 Sep 2021 06:06:29 -0400
X-MC-Unique: 6om5TrKuMRmbbeGAA5zrYg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8AB6180830C;
 Tue, 28 Sep 2021 10:06:27 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E07EF60871;
 Tue, 28 Sep 2021 10:06:17 +0000 (UTC)
Date: Tue, 28 Sep 2021 11:06:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v11 02/14] machine: Minor refactor/fix for the smp parsers
Message-ID: <YVLpF6YlTWjjS3wE@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-3-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928035755.11684-3-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 28, 2021 at 11:57:43AM +0800, Yanan Wang wrote:
> To pave the way for the functional improvement in later patches,
> make some refactor/cleanup for the smp parsers, including using
> local maxcpus instead of ms->smp.max_cpus in the calculation,
> defaulting dies to 0 initially like other members, cleanup the
> sanity check for dies.
> 
> We actually also fix a hidden defect by avoiding directly using
> the provided *zero value* in the calculation, which could cause
> a segment fault (e.g. using dies=0 in the calculation).
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/core/machine.c | 18 ++++++++++--------
>  hw/i386/pc.c      | 23 ++++++++++++++---------
>  2 files changed, 24 insertions(+), 17 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


