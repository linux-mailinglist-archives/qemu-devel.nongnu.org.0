Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415A441EDDD
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 14:52:56 +0200 (CEST)
Received: from localhost ([::1]:37026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWI23-0000W4-1h
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 08:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mWHyy-0006jj-6h
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 08:49:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mWHyu-0000zZ-BG
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 08:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633092579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k25JVQvjnq/SDeAVeBZMaIPrNf6dtlGlCxevbWGzBMA=;
 b=fc9DHMLx1oalPio/N2o3BV3qvq3N6HBfouv0cjTKKOz1pJtVXAeaGHphlHLOaj2Zr0y1Os
 iPFDDf1odTqkn7prCKePjH31/aPMa1dYtui7CUNXSvfUJhqzKPm/XyWZAyvjl6Zi4SbgU4
 Po96T8KQ2RF30K9LHIlDkGMgNbd+e58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-vAUxzkd8PPW1ybzSLkw0HA-1; Fri, 01 Oct 2021 08:49:38 -0400
X-MC-Unique: vAUxzkd8PPW1ybzSLkw0HA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C164B1084685;
 Fri,  1 Oct 2021 12:49:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83ED85F4E1;
 Fri,  1 Oct 2021 12:49:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A721E18007AC; Fri,  1 Oct 2021 14:49:35 +0200 (CEST)
Date: Fri, 1 Oct 2021 14:49:35 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v3] failover: fix unplug pending detection
Message-ID: <20211001124935.qal55li6aozocan3@sirius.home.kraxel.org>
References: <20211001082502.1342878-1-lvivier@redhat.com>
 <20211001104514.46bhlpenx4rz2qnm@sirius.home.kraxel.org>
 <0eeefb15-1b41-076c-7dd4-ca5fc78eefa9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0eeefb15-1b41-076c-7dd4-ca5fc78eefa9@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > So, in case the first time didn't work (for example due to the guest not
> > listening because grub just doesn't do that), you can try a second time
> > once the linux kernel is up'n'running.
> > 
> > I suspect this patch will break that (didn't actually test though).
> 
> I think the solution to this problem is to not check for
> pending_deleted_event value in qmp_device_del().
> 
> But this has been explicitly added by:
> 
> commit cce8944cc9efab47d4bf29cfffb3470371c3541b
> Author: Julia Suvorova <jusual@redhat.com>
> Date:   Thu Feb 20 17:55:56 2020 +0100
> 
>     qdev-monitor: Forbid repeated device_del
> 
>     [ ... ]
> 
> So do you mean ACPI differs from PCIe Native hotplug in this case?

Yes.

It's one of the issues I'm trying to address with the

  https://gitlab.com/kraxel/qemu/-/commits/sirius/pcie-hotplug

series.  See this commit:

  https://gitlab.com/kraxel/qemu/-/commit/675d9257d794c9d59ea7c80f48fe176a2aa3f8ba

So, yes, I think acpi and pcie hotplug should show consistent behavior
here.  And I think we need some way to recover in case the guest didn't
respond to an unplug event.  Just allowing to send device_del multiple
times looks like a sensible approach to me, and given OpenStack already
does that it looks like the most sensible way forward.

take care,
  Gerd


