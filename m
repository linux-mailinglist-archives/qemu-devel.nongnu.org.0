Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05024951D3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 16:54:27 +0100 (CET)
Received: from localhost ([::1]:35066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAZla-0002ju-OE
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 10:54:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAVpR-0003sy-Ag
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:42:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAVpN-0000Go-TR
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642678924;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gqKT5QZ09jc3TqLrE12z+UjsDuUy/ROC+299ZTgEQFY=;
 b=TY8pePWfJZsb3hqotycN35VA39atiNNNz4SSrh6G8Zx/Mc04h6vDzAWOuAtv5lNcESFD0y
 0OaJhTYYZkmV1BNNkBbwV5crOQA4bJV+JXiqkzzapCPZzkMdGn4s78SkvOiHCcPL6ue7GD
 pT/vKTcltPaUiQce8cmV3orsEeW1uAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-2uL82Sp0MmSU5yJXnsjPsQ-1; Thu, 20 Jan 2022 06:42:01 -0500
X-MC-Unique: 2uL82Sp0MmSU5yJXnsjPsQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4113210247A6;
 Thu, 20 Jan 2022 11:42:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 829D77D702;
 Thu, 20 Jan 2022 11:41:58 +0000 (UTC)
Date: Thu, 20 Jan 2022 11:41:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: MP tables do not report multiple CPUs in Qemu 6.2.0 on x86 when
 given -smp cpus=n flag
Message-ID: <YelKgywMaiHXCR4n@redhat.com>
References: <CAB4+JY+3N5qvC3p_e2DWWa=-QUtW+wH5ZdEJFPKTdSD5TVPXMA@mail.gmail.com>
 <CAFEAcA9tGnEOOhSbCJv2=JoU5C3cFB08mdaLRERgzPdatKQB=g@mail.gmail.com>
 <alpine.DEB.2.22.394.2201201305580.844042@anisinha-lenovo>
 <alpine.OSX.2.20.2201201527140.38065@athabasca.local>
 <alpine.OSX.2.20.2201201536020.38065@athabasca.local>
MIME-Version: 1.0
In-Reply-To: <alpine.OSX.2.20.2201201536020.38065@athabasca.local>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Godmar Back <gback@cs.vt.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 qemu-discuss@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 03:38:26PM +0530, Ani Sinha wrote:
> Actually I am not quite right. This is the real change which changed the
> preference. The previous change was a code re-org that preserved the
> behavior:
> 
> commit 4a0af2930a4e4f64ce551152fdb4b9e7be106408
> Author: Yanan Wang <wangyanan55@huawei.com>
> Date:   Wed Sep 29 10:58:09 2021 +0800
> 
>     machine: Prefer cores over sockets in smp parsing since 6.2
> 
>     In the real SMP hardware topology world, it's much more likely that
>     we have high cores-per-socket counts and few sockets totally. While
>     the current preference of sockets over cores in smp parsing results
>     in a virtual cpu topology with low cores-per-sockets counts and a
>     large number of sockets, which is just contrary to the real world.
> 
>     Given that it is better to make the virtual cpu topology be more
>     reflective of the real world and also for the sake of compatibility,
>     we start to prefer cores over sockets over threads in smp parsing
>     since machine type 6.2 for different arches.
> 
>     In this patch, a boolean "smp_prefer_sockets" is added, and we only
>     enable the old preference on older machines and enable the new one
>     since type 6.2 for all arches by using the machine compat mechanism.
> 
>     Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>     Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>     Acked-by: David Gibson <david@gibson.dropbear.id.au>
>     Acked-by: Cornelia Huck <cohuck@redhat.com>
>     Reviewed-by: Andrew Jones <drjones@redhat.com>
>     Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
>     Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>     Message-Id: <20210929025816.21076-10-wangyanan55@huawei.com>
>     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> In any case, the behavior change is intended because of the reasons the
> above commit outlines.

Further compelling reason not mentioned there is that some OS will
artifically restrict how many sockets they are willing to use, while
happily using as many cores as they get. This is usually a licensing
or billing restriction rather than some technical reason, and kinda
silly since cores/sockets are basically interchangable, but that's
life.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


