Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8282961E7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 17:51:38 +0200 (CEST)
Received: from localhost ([::1]:56864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVcsL-0004S8-Rx
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 11:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kVcqf-0003w6-PF
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 11:49:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kVcqd-0007mJ-72
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 11:49:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603381790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3URjes8xitPdDAk5s2ADC6/CHuiWsbO7CajfEGBImVk=;
 b=R+JlW+8qHVv8LVdlR68LyGdzEUAtJKjqATHfurdGAZKa8+1cPGqFOQrCyPYDYU29f9J2gT
 2Px4/n0+KJzsPSraFEco0NpJV6zbEBM6UxgXwqzuqodkXST8a4qwg4vZWuA9/npa890pkg
 Ti0+9R3jcx1qe00Xnpx5KbcEgvsLmVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-FZxVuBjqNbSjUGzzQzzTNA-1; Thu, 22 Oct 2020 11:49:46 -0400
X-MC-Unique: FZxVuBjqNbSjUGzzQzzTNA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE401191E2A0;
 Thu, 22 Oct 2020 15:49:43 +0000 (UTC)
Received: from gondolin (ovpn-112-67.ams2.redhat.com [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 922325C22D;
 Thu, 22 Oct 2020 15:49:27 +0000 (UTC)
Date: Thu, 22 Oct 2020 17:49:24 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH v26 05/17] vfio: Add VM state change handler to know
 state of VM
Message-ID: <20201022174924.418bb30b.cohuck@redhat.com>
In-Reply-To: <39a59eb5-9a22-4f66-531c-489de9ecdf52@nvidia.com>
References: <1600817059-26721-1-git-send-email-kwankhede@nvidia.com>
 <1600817059-26721-6-git-send-email-kwankhede@nvidia.com>
 <20200924170220.0a9836fe.cohuck@redhat.com>
 <20200929110312.GF2826@work-vm>
 <3dd3fe95-c81a-de40-47b0-24f0772974d4@nvidia.com>
 <20201020125105.5cd790df.cohuck@redhat.com>
 <245abdf6-245d-5f88-e04b-35fad763560c@nvidia.com>
 <20201022095125.60319084.cohuck@redhat.com>
 <39a59eb5-9a22-4f66-531c-489de9ecdf52@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 08:33:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: cjia@nvidia.com, aik@ozlabs.ru, Zhengxiao.zx@alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, qemu-devel@nongnu.org, peterx@redhat.com,
 eauger@redhat.com, yi.l.liu@intel.com, quintela@redhat.com,
 ziye.yang@intel.com, armbru@redhat.com, mlevitsk@redhat.com,
 pasic@linux.ibm.com, felipe@nutanix.com, zhi.a.wang@intel.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, alex.williamson@redhat.com,
 changpeng.liu@intel.com, eskultet@redhat.com, Ken.Xue@amd.com,
 jonathan.davies@nutanix.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Oct 2020 21:12:58 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> On 10/22/2020 1:21 PM, Cornelia Huck wrote:

> > I'm a bit worried though that all that reasoning which flags are set or
> > cleared when is quite complex, and it's easy to make mistakes.
> > 
> > Can we model this as a FSM, where an event (running state changes)
> > transitions the device state from one state to another? I (personally)
> > find FSMs easier to comprehend, but I'm not sure whether that change
> > would be too invasive. If others can parse the state changes with that
> > mask/value interface, I won't object to it.
> >   
> 
> I agree FSM will be easy and for long term may be easy to maintain. But 
> at this moment it will be intrusive change. For now we can go ahead with 
> this code and later we can change to FSM model, if all agrees on it.

Yes, we can certainly revisit this later.


