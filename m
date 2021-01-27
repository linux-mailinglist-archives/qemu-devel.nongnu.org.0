Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEAD3057D0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 11:08:07 +0100 (CET)
Received: from localhost ([::1]:45028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4hk7-0004IS-0g
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 05:08:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4hj9-0003s5-66
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:07:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4hj6-0005zN-RJ
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611742023;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=POIn1xri8rBb7cDppq6ODrkjtB5bCKEuaM761mWxypw=;
 b=iXn+OktBdy1Y+koO99G8DIB2j18VO4SXOZxyf68Nw42zk19MRWdLXxwQ2bk90MKhvJ9BSI
 sHCIgyzZat2+eLSwJlWQBCxjaDrsG36YvKGJ0rlivlRLhoj3ulRe44SEjY0uJ7/KneiM1S
 /SOU101FbSHcDa66pgd02ebbzDPyjDU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-_eMsTLBnNiGOuyUi8rY39A-1; Wed, 27 Jan 2021 05:07:01 -0500
X-MC-Unique: _eMsTLBnNiGOuyUi8rY39A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 292A8804006;
 Wed, 27 Jan 2021 10:06:53 +0000 (UTC)
Received: from redhat.com (ovpn-115-120.ams2.redhat.com [10.36.115.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CC9272163;
 Wed, 27 Jan 2021 10:06:51 +0000 (UTC)
Date: Wed, 27 Jan 2021 10:06:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ben Widawsky <ben@bwidawsk.net>
Subject: Re: Handling multiple inheritance [for CXL]
Message-ID: <20210127100648.GE3653144@redhat.com>
References: <20210126213013.6v24im4sler3q3am@mail.bwidawsk.net>
MIME-Version: 1.0
In-Reply-To: <20210126213013.6v24im4sler3q3am@mail.bwidawsk.net>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 26, 2021 at 01:33:52PM -0800, Ben Widawsky wrote:
> I'm working on CXL 2.0 type 3 memory devices [1]. In short, these are PCIe devices
> that have persistent memory on them. As such, it would be nice to inherit from
> both a PCI_DEVICE class as well as an NVDIMM device class.
> 
> Truth be told, using TYPE_MEMORY_DEVICE as the interface does provide most of
> what I need. I'm wondering what the best way to handle this is. Currently, the
> only thing NVDIMM class provides is write/read_label_data, this is driven by
> _DSM. For CXL, the mechanism to read/write the equivalent area is not done via
> _DSM, but done directly via a mailbox interface. However, the intent is the
> same, and so utilizing similar code seems ideal.
> 
> If there's a desire to unify these code paths, I'd need something like multiple
> inheritance. I'm looking for some feedback here on how to do it.

We don't have a direct concept of multiple inheritance in QOM.

The closest you can get is to turn the NVDIMM class into an
interface. You can inherit from PCI_DEVICE and then implement
the NVDIMM interface.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


