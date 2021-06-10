Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD673A2E69
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:38:18 +0200 (CEST)
Received: from localhost ([::1]:43202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLp3-00037h-Ri
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrLoD-0002SJ-Gd
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:37:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrLo5-0003qv-Vu
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623335836;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bTzj8Y6XD2yLlB7BnCCZVMYKwG/XJbpsZuLGXBpkw9Q=;
 b=d5t6PaqmYbeRzOTUnIo7snvE01kvrF4QZEjh4ORJBIt61BqObHEDnFAPEwPC2E0U22UcdQ
 /OclEe/OLjmY+0KbspXeTGKeW5KITBgYOCmcfBjaImQsekjDUgqVpgar/Fccrep14D4RtZ
 RlHguPrQvwH7G2CjVGcNQJxzXgoVO9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-wx3xqmZFPuSJwA1grITm_Q-1; Thu, 10 Jun 2021 10:37:14 -0400
X-MC-Unique: wx3xqmZFPuSJwA1grITm_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BACF7EC1A0
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 14:37:13 +0000 (UTC)
Received: from redhat.com (ovpn-115-203.ams2.redhat.com [10.36.115.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6E77197F9;
 Thu, 10 Jun 2021 14:37:12 +0000 (UTC)
Date: Thu, 10 Jun 2021 15:37:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 09/11] machine: pass QAPI struct to mc->smp_parse
Message-ID: <YMIjlcXvSRkFh4mr@redhat.com>
References: <20210610133538.608390-1-pbonzini@redhat.com>
 <20210610133538.608390-10-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210610133538.608390-10-pbonzini@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 03:35:36PM +0200, Paolo Bonzini wrote:
> As part of converting -smp to a property with a QAPI type, define
> the struct and use it to do the actual parsing.  machine_smp_parse
> takes care of doing the QemuOpts->QAPI conversion by hand, for now.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/core/machine.c   | 33 +++++++++++++++++++++++----------
>  hw/i386/pc.c        | 18 ++++++++----------
>  include/hw/boards.h |  2 +-
>  qapi/machine.json   | 27 +++++++++++++++++++++++++++
>  4 files changed, 59 insertions(+), 21 deletions(-)


> +##
> +# @SMPConfiguration:
> +#
> +# Schema for CPU topology configuration.
> +#
> +# @cpus: number of virtual CPUs in the virtual machine
> +#
> +# @sockets: number of sockets in the CPU topology
> +#
> +# @dies: number of dies per socket in the CPU topology
> +#
> +# @cores: number of cores per thread in the CPU topology
> +#
> +# @threads: number of threads per core in the CPU topology
> +#
> +# @maxcpus: maximum number of hotpluggable virtual CPUs in the virtual machine

Perhaps document that a value of "0" means  "automatically figure
out a suitable count" based on other specified values.


From a functional POV though it is fine so

 Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


