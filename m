Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58EC264631
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 14:39:58 +0200 (CEST)
Received: from localhost ([::1]:49642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGLrp-0005Lq-OA
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 08:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kGLqf-0004VO-Et
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 08:38:45 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58484
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kGLqc-0001Oj-PE
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 08:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599741522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWqy6p1smteYWCZ5IYH5/YWc3EdcTl5osmfODBroec8=;
 b=GpHSrH9Q49k2ZGREyokBmZaBj++VLYmxkEWCQytNSQOyagiuSO/6ITKWN+MOAyFhOGzMo1
 orKbjh2pHePdIaU2QyVeuB06h9Rg1jT4vLAq22Uq5WWzAMvjUrMzuEC7xtRr7YP0cLkzDb
 hhyOtrpdBmlAdgClud0T1gLB2BaPLNY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-Gtquf9efMqCTD7-Wz-qIpA-1; Thu, 10 Sep 2020 08:38:38 -0400
X-MC-Unique: Gtquf9efMqCTD7-Wz-qIpA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8B87640A6;
 Thu, 10 Sep 2020 12:38:29 +0000 (UTC)
Received: from gondolin (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27A9983562;
 Thu, 10 Sep 2020 12:38:24 +0000 (UTC)
Date: Thu, 10 Sep 2020 14:38:22 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200910143822.2071eca4.cohuck@redhat.com>
In-Reply-To: <20200909021308.GA1277@joy-OptiPlex-7040>
References: <20200818113652.5d81a392.cohuck@redhat.com>
 <20200820003922.GE21172@joy-OptiPlex-7040>
 <20200819212234.223667b3@x1.home>
 <20200820031621.GA24997@joy-OptiPlex-7040>
 <20200825163925.1c19b0f0.cohuck@redhat.com>
 <20200826064117.GA22243@joy-OptiPlex-7040>
 <20200828154741.30cfc1a3.cohuck@redhat.com>
 <8f5345be73ebf4f8f7f51d6cdc9c2a0d8e0aa45e.camel@redhat.com>
 <20200831044344.GB13784@joy-OptiPlex-7040>
 <20200908164130.2fe0d106.cohuck@redhat.com>
 <20200909021308.GA1277@joy-OptiPlex-7040>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=207.211.31.81; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 08:38:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, corbet@lwn.net,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Parav Pandit <parav@mellanox.com>,
 jian-feng.ding@intel.com, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 hejie.xu@intel.com, bao.yumeng@zte.com.cn,
 Alex Williamson <alex.williamson@redhat.com>, Sean Mooney <smooney@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org,
 Daniel =?UTF-8?B?UC5CZXJyYW5nw6k=?= <berrange@redhat.com>, eskultet@redhat.com,
 Jiri Pirko <jiri@mellanox.com>, dinechin@redhat.com, devel@ovirt.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Sep 2020 10:13:09 +0800
Yan Zhao <yan.y.zhao@intel.com> wrote:

> > > still, I'd like to put it more explicitly to make ensure it's not missed:
> > > the reason we want to specify compatible_type as a trait and check
> > > whether target compatible_type is the superset of source
> > > compatible_type is for the consideration of backward compatibility.
> > > e.g.
> > > an old generation device may have a mdev type xxx-v4-yyy, while a newer
> > > generation  device may be of mdev type xxx-v5-yyy.
> > > with the compatible_type traits, the old generation device is still
> > > able to be regarded as compatible to newer generation device even their
> > > mdev types are not equal.  
> > 
> > If you want to support migration from v4 to v5, can't the (presumably
> > newer) driver that supports v5 simply register the v4 type as well, so
> > that the mdev can be created as v4? (Just like QEMU versioned machine
> > types work.)  
> yes, it should work in some conditions.
> but it may not be that good in some cases when v5 and v4 in the name string
> of mdev type identify hardware generation (e.g. v4 for gen8, and v5 for
> gen9)
> 
> e.g.
> (1). when src mdev type is v4 and target mdev type is v5 as
> software does not support it initially, and v4 and v5 identify hardware
> differences.

My first hunch here is: Don't introduce types that may be compatible
later. Either make them compatible, or make them distinct by design,
and possibly add a different, compatible type later.

> then after software upgrade, v5 is now compatible to v4, should the
> software now downgrade mdev type from v5 to v4?
> not sure if moving hardware generation info into a separate attribute
> from mdev type name is better. e.g. remove v4, v5 in mdev type, while use
> compatible_pci_ids to identify compatibility.

If the generations are compatible, don't mention it in the mdev type.
If they aren't, use distinct types, so that management software doesn't
have to guess. At least that would be my naive approach here.

> 
> (2) name string of mdev type is composed by "driver_name + type_name".
> in some devices, e.g. qat, different generations of devices are binding to
> drivers of different names, e.g. "qat-v4", "qat-v5".
> then though type_name is equal, mdev type is not equal. e.g.
> "qat-v4-type1", "qat-v5-type1".

I guess that shows a shortcoming of that "driver_name + type_name"
approach? Or maybe I'm just confused.


