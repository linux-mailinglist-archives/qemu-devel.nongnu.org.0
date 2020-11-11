Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2846C2AF4BD
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:31:14 +0100 (CET)
Received: from localhost ([::1]:42392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcs5W-0004U7-47
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:31:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kcs3B-00031U-1c
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:28:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kcs37-00075y-O8
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:28:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605108517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U34a02RVThaWi6u649vNFrb2rL5xtiDZzQCK/yfPtV4=;
 b=Zw+LGtLYZDqjRE2Ib5zKiIxBIriiRJsIPZZOJ893ET6WCzpgaHKh+3CH5UDsBWAFJM7Ut4
 bYziq3Zz+BnBCPA4budKpIOuvuNwSYwECXgZcu5eElOeXkxzgyhQVsFEDXrbJ57VZrExne
 8XtlMpBHhwCrHAiK8DjnYsSIwqtpjFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-uqVCcC-APGq4igK3y60mmQ-1; Wed, 11 Nov 2020 10:28:33 -0500
X-MC-Unique: uqVCcC-APGq4igK3y60mmQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B1541009458;
 Wed, 11 Nov 2020 15:28:31 +0000 (UTC)
Received: from gondolin (ovpn-113-72.ams2.redhat.com [10.36.113.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1C5560CD0;
 Wed, 11 Nov 2020 15:28:13 +0000 (UTC)
Date: Wed, 11 Nov 2020 16:28:10 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201111162810.675b1fe6.cohuck@redhat.com>
In-Reply-To: <20201111151014.GB1421166@stefanha-x1.localdomain>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <20201110131404.2c0f0d9d@w520.home>
 <20201111151014.GB1421166@stefanha-x1.localdomain>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>, "Zeng, Xin" <xin.zeng@intel.com>,
 qemu-devel@nongnu.org, Kirti Wankhede <kwankhede@nvidia.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Nov 2020 15:10:14 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Tue, Nov 10, 2020 at 01:14:04PM -0700, Alex Williamson wrote:
> > On Tue, 10 Nov 2020 09:53:49 +0000
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > Documentation/filesystems/sysfs.rst:
> > ---
> > Attributes
> > ~~~~~~~~~~
> > 
> > Attributes can be exported for kobjects in the form of regular files in
> > the filesystem. Sysfs forwards file I/O operations to methods defined
> > for the attributes, providing a means to read and write kernel
> > attributes.
> > 
> > Attributes should be ASCII text files, preferably with only one value
> > per file. It is noted that it may not be efficient to contain only one
> > value per file, so it is socially acceptable to express an array of
> > values of the same type.
> > 
> > Mixing types, expressing multiple lines of data, and doing fancy
> > formatting of data is heavily frowned upon. Doing these things may get
> > you publicly humiliated and your code rewritten without notice.
> > ---
> > 
> > We'd either need to address your TODO and create a hierarchical
> > representation or find another means to exchange this format.  
> 
> Okay, thanks for pointing this out. If the limitations on sysfs
> directory structure are really what I think they are, then we can work
> around the lack of sub-directories by flattening the hierarchical
> information in an attribute name prefix, but it's ugly:
> 
>   <parent-device>/<mdev_supported_types>/<type-id>/
>     migration_param_FOO_off_value
>     migration_param_FOO_init_value
>     migration_param_FOO_description
>     migration_param_FOO_type
> 
> It makes enumerating migration parameters more awkward for userspace
> because they need to skip many of the files when scanning for parameter
> names.
> 
> Or we could create a kobject for each migration parameter, but that
> seems wrong too.

Hm, ISTR that you can do something with ksets.

> 
> Or we could investigate other file systems like configfs. Maybe this is
> why tracefs and other specific file systems exist - sysfs is too
> limited?

If you want to express complex data, sysfs is quickly hitting its
limits. The benefits of using sysfs are basically that sysfs is always
present (and therefore readily consumed by existing tooling), and that
you have device properties properly grouped with the device.


