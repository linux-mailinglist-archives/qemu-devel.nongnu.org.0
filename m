Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9144F111F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 10:43:37 +0200 (CEST)
Received: from localhost ([::1]:60980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbIJ7-0000j4-CQ
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 04:43:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nbIGs-0007SB-UA
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 04:41:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nbIGr-0000al-0z
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 04:41:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649061668;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQzLJnFR1gT4FdmyBM/FtE018I/9TNC/P/CbsJujJD0=;
 b=KNcPYmHkhjZ3Bmf7pTC4BTm83U3f6aKHfK+VDTHMhfsqqcFw2DFp3YzRVmqO9m71lfInHy
 Jxre4PtGgfwZRgo13eZ+PV+NgUqe5z/stuy7HQ1rZG3TOfqycDa3KhCFp7MZw3rhQr14Mf
 XOgz6JmyKZMJi9bzhLpB2FcgrmxpJ+k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-QtrC22XFPO6X678zCLvrhQ-1; Mon, 04 Apr 2022 04:41:05 -0400
X-MC-Unique: QtrC22XFPO6X678zCLvrhQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28EB91C01501;
 Mon,  4 Apr 2022 08:41:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.158])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50F431400C2C;
 Mon,  4 Apr 2022 08:41:01 +0000 (UTC)
Date: Mon, 4 Apr 2022 09:40:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gavin Shan <gshan@redhat.com>, peter.maydell@linaro.org,
 drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, imammedo@redhat.com
Subject: Re: [PATCH v5 1/4] qapi/machine.json: Add cluster-id
Message-ID: <YkqvGsdcnupeTMZR@redhat.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-2-gshan@redhat.com>
 <YkquNlUvAHC+sLh7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YkquNlUvAHC+sLh7@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 04, 2022 at 09:37:10AM +0100, Daniel P. Berrangé wrote:
> On Sun, Apr 03, 2022 at 10:59:50PM +0800, Gavin Shan wrote:
> > This adds cluster-id in CPU instance properties, which will be used
> > by arm/virt machine. Besides, the cluster-id is also verified or
> > dumped in various spots:
> > 
> >   * hw/core/machine.c::machine_set_cpu_numa_node() to associate
> >     CPU with its NUMA node.
> > 
> >   * hw/core/machine.c::machine_numa_finish_cpu_init() to associate
> >     CPU with NUMA node when no default association isn't provided.
> > 
> >   * hw/core/machine-hmp-cmds.c::hmp_hotpluggable_cpus() to dump
> >     cluster-id.
> > 
> > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > ---
> >  hw/core/machine-hmp-cmds.c |  4 ++++
> >  hw/core/machine.c          | 16 ++++++++++++++++
> >  qapi/machine.json          |  6 ++++--
> >  3 files changed, 24 insertions(+), 2 deletions(-)
> 
> Missing changes to hw/core/machine-smp.c similar to 'dies' in that
> file.
> 
> When 'dies' was added we added a 'dies_supported' flag, so we could
> reject use of 'dies' when it was not supported - which is everywhere
> except i386 target.
> 
> We need the same for 'clusters_supported' machine property since
> AFAICT only the arm 'virt' machine is getting supported in this
> series.

Oh, actually I'm mixing up cluster-id and clusters - the latter is
already supported.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


