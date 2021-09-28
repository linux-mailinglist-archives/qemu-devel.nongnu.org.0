Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DD841AD7E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 13:03:11 +0200 (CEST)
Received: from localhost ([::1]:51640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVAtC-0005fu-IA
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 07:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAos-0001Si-8W
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:58:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAoq-0008KA-DT
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:58:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826719;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H0A3uMwY4dMnszcD5lYTVdEog54v6ibEq/X669ojMtg=;
 b=boF1bodOe2XQZvSNzqKJGBP/yUgXLH0fby27DUJW5wpJn6ddmxVioeJ9SCATjHDLv0iOgC
 DzGvXZJ1mMK1pP/mCCqEwoLfzUW/qEk93yDT5mldD6hNte3PCluyFLNcY6cLVm4oBr7xLG
 LXATOXcmnV6Lyp206mgWJJdCdo6uskM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-IZHjYDNEP92r2gpkZkHNXw-1; Tue, 28 Sep 2021 06:58:38 -0400
X-MC-Unique: IZHjYDNEP92r2gpkZkHNXw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 723FF362FA;
 Tue, 28 Sep 2021 10:58:36 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00E9413AC8;
 Tue, 28 Sep 2021 10:58:28 +0000 (UTC)
Date: Tue, 28 Sep 2021 11:58:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v11 11/14] machine: Make smp_parse generic enough for all
 arches
Message-ID: <YVL1UuCQ6+KiPwfR@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-12-wangyanan55@huawei.com>
 <2652509f-97d7-f999-a36f-47fc3b5ca346@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2652509f-97d7-f999-a36f-47fc3b5ca346@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 28, 2021 at 12:57:21PM +0200, Philippe Mathieu-Daudé wrote:
> On 9/28/21 05:57, Yanan Wang wrote:
> > Currently the only difference between smp_parse and pc_smp_parse
> > is the support of dies parameter and the related error reporting.
> > With some arch compat variables like "bool dies_supported", we can
> > make smp_parse generic enough for all arches and the PC specific
> > one can be removed.
> > 
> > Making smp_parse() generic enough can reduce code duplication and
> > ease the code maintenance, and also allows extending the topology
> > with more arch specific members (e.g., clusters) in the future.
> > 
> > Suggested-by: Andrew Jones <drjones@redhat.com>
> > Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > ---
> >  hw/core/machine.c   | 91 +++++++++++++++++++++++++++++++++++----------
> >  hw/i386/pc.c        | 84 +----------------------------------------
> >  include/hw/boards.h |  9 +++++
> >  3 files changed, 81 insertions(+), 103 deletions(-)
> 
> > +/*
> > + * smp_parse - Generic function used to parse the given SMP configuration
> > + *
> > + * Any missing parameter in "cpus/maxcpus/sockets/cores/threads" will be
> > + * automatically computed based on the provided ones.
> > + *
> > + * In the calculation of omitted sockets/cores/threads: we prefer sockets
> > + * over cores over threads before 6.2, while preferring cores over sockets
> > + * over threads since 6.2.
> > + *
> > + * In the calculation of cpus/maxcpus: When both maxcpus and cpus are omitted,
> > + * maxcpus will be computed from the given parameters and cpus will be set
> > + * equal to maxcpus. When only one of maxcpus and cpus is given then the
> > + * omitted one will be set to its given counterpart's value. Both maxcpus and
> > + * cpus may be specified, but maxcpus must be equal to or greater than cpus.
> > + *
> > + * For compatibility, apart from the parameters that will be computed, newly
> > + * introduced topology members which are likely to be target specific should
> > + * be directly set as 1 if they are omitted (e.g. dies for PC since 4.1).
> > + */
> >  static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> 
> Can we have it return a boolean instead?

That's unrelated to this change, so ought to be a separate commit if
done.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


