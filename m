Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7F9270438
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 20:40:51 +0200 (CEST)
Received: from localhost ([::1]:33492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJLJS-0000Xp-7L
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 14:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kJL5m-0004oy-Sw
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 14:26:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kJL5k-0005bs-Rb
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 14:26:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600453599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qg3mFIVJK9vZUN57gdYuod+m/oyOWe0a1QGYp/cL1iM=;
 b=PbzzfgZhNs3V0+GVDMwxDdu5BZEaJeEEj1Lw0MQas/Pn70jH3+VmT9cZNGEamQzi1HciMI
 CbYJzzGpY2jAH7eWRQMmAB1Cg8YxPYY8+/NK2Gq3Cfgmzng0uT92bhDHdo/HMXBA3rPeCv
 kvJq5uHU1BoiCBpw8/zdx8Y8cLVnyHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-CnAT-qZxN8KfcKEVk6V5ow-1; Fri, 18 Sep 2020 14:26:35 -0400
X-MC-Unique: CnAT-qZxN8KfcKEVk6V5ow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8468E1019625;
 Fri, 18 Sep 2020 18:26:34 +0000 (UTC)
Received: from localhost (ovpn-119-217.rdu2.redhat.com [10.10.119.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B62268875;
 Fri, 18 Sep 2020 18:26:31 +0000 (UTC)
Date: Fri, 18 Sep 2020 14:26:29 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v7 0/2] Remove EPYC mode apicid decode and use generic
 decode
Message-ID: <20200918182629.GF7594@habkost.net>
References: <159897580089.30750.12581669374705391794.stgit@naples-babu.amd.com>
MIME-Version: 1.0
In-Reply-To: <159897580089.30750.12581669374705391794.stgit@naples-babu.amd.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 01:32:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, imammedo@redhat.com,
 pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 01, 2020 at 10:57:20AM -0500, Babu Moger wrote:
> To support some of the complex topology, we introduced EPYC mode apicid decode.
> But, EPYC mode decode is running into problems. Also it can become quite a
> maintenance problem in the future. So, it was decided to remove that code and
> use the generic decode which works for majority of the topology. Most of the
> SPECed configuration would work just fine. With some non-SPECed user inputs,
> it will create some sub-optimal configuration.
> 
> Here is the discussion thread.
> https://lore.kernel.org/qemu-devel/c0bcc1a6-1d84-a6e7-e468-d5b437c1b254@amd.com/
> https://lore.kernel.org/qemu-devel/20200826143849.59f6970b@redhat.com/
> 
> This series removes all the EPYC mode specific apicid changes and use the generic
> apicid decode.

Queued, thanks!

-- 
Eduardo


