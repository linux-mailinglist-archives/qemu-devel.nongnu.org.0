Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C00A852A83C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 18:37:53 +0200 (CEST)
Received: from localhost ([::1]:33848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr0Cm-0001rX-Sy
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 12:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nr097-0003c6-BY
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:34:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nr094-0004GJ-5G
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652805240;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=AqpttBcf1DqJ6+TvNukL/FIAZauY0z00xMHDD1YhE7s=;
 b=e+2nmkwwBFCsUVcBDUhnrys8NCSGN44m04Q1CDDrhX8sdkfGWwksbWofxlerap2nrnAN7/
 HDaJTYQ09QGYoUry8e33BLHm/Nbm3N6bM5qASn4+m2CLCX53GYVulZyF1crAAu08dpM+Xb
 iKQPHtFCVw4OQkIjFlZJDoTcATz/K6Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-vqM9yj3kMLajRg6PWgqfFw-1; Tue, 17 May 2022 12:33:59 -0400
X-MC-Unique: vqM9yj3kMLajRg6PWgqfFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 250343C11724;
 Tue, 17 May 2022 16:33:59 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4446B151571C;
 Tue, 17 May 2022 16:33:58 +0000 (UTC)
Date: Tue, 17 May 2022 17:33:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: dzejrou@gmail.com, qemu-devel@nongnu.org, david@redhat.com,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH] hostmem: default the amount of prealloc-threads to
 smp-cpus
Message-ID: <YoPOclX/REvSIxZK@redhat.com>
References: <20220517123858.7933-1-dzejrou@gmail.com>
 <20220517171228.44c53748@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220517171228.44c53748@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, May 17, 2022 at 05:12:28PM +0200, Igor Mammedov wrote:
> On Tue, 17 May 2022 14:38:58 +0200
> dzejrou@gmail.com wrote:
> 
> > From: Jaroslav Jindrak <dzejrou@gmail.com>
> > 
> > Prior to the introduction of the prealloc-threads property, the amount
> > of threads used to preallocate memory was derived from the value of
> > smp-cpus passed to qemu, the amount of physical cpus of the host
> > and a hardcoded maximum value. When the prealloc-threads property
> > was introduced, it included a default of 1 in backends/hostmem.c and
> > a default of smp-cpus using the sugar API for the property itself. The
> > latter default is not used when the property is not specified on qemu's
> > command line, so guests that were not adjusted for this change suddenly
> > started to use the default of 1 thread to preallocate memory, which
> > resulted in observable slowdowns in guest boots for guests with large
> > memory (e.g. when using libvirt <8.2.0 or managing guests manually).
> 
> current behavior in QEMU is intentionally conservative. threads
> number is subject to host configuration and limitations management
> layer puts on it and it's not QEMU job to conjure magic numbers that
> are host/workload depended.

I think that's missing the point. QEMU *did* historically set the
prealloc threads equal to num CPUs, so we have precedent here. The
referenced commit lost that behaviour because it only wired up the
defaults in one particular CLI scenario. That's a clear regression
on QEMU's side.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


