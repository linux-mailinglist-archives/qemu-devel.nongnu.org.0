Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764402A2B8F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 14:33:21 +0100 (CET)
Received: from localhost ([::1]:57740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZZxY-00006E-JD
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 08:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kZZwA-0007fL-83
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 08:31:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kZZw6-0003TR-Rx
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 08:31:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604323908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nwH5fkubiCEPj6LrGINHuvOB7lPZHWGfJfufEhc4KUc=;
 b=gSJdRd9wBl/3Tvm5zk0wteQyPvCcgENfQ5Yud6BQab26EqSwZJ2OD0Wbg4XY9jB39IoYRc
 KGJp+9a0hl+9vFrEsJSy4oC87kLlW+0RQFjqR7/X7V7YmcYNHtYlPPqs3FVmKV2fOHu+Ik
 aGkOCP7YTF/NcvH71x9vLhSnDBDGBwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-N2dhcf0TORCYBNYMgIlYlA-1; Mon, 02 Nov 2020 08:31:45 -0500
X-MC-Unique: N2dhcf0TORCYBNYMgIlYlA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08B6A1009E45;
 Mon,  2 Nov 2020 13:31:44 +0000 (UTC)
Received: from work-vm (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DCD5261BB;
 Mon,  2 Nov 2020 13:31:38 +0000 (UTC)
Date: Mon, 2 Nov 2020 13:31:35 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtio: skip guest index check on device load
Message-ID: <20201102133135.GA4845@work-vm>
References: <20201026151328.77611-1-felipe@nutanix.com>
 <20201027113049.GH79063@stefanha-x1.localdomain>
 <20201027082337-mutt-send-email-mst@kernel.org>
 <12146644-5D22-4CAC-9B4F-F16E84ED56AE@nutanix.com>
 <20201027085447-mutt-send-email-mst@kernel.org>
 <AE57D4EC-2C3C-4C22-9203-38A61D87B31F@nutanix.com>
 <20201027090420-mutt-send-email-mst@kernel.org>
 <20201028110038.GE221115@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201028110038.GE221115@stefanha-x1.localdomain>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 01:33:03
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Felipe Franciosi <felipe@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Tue, Oct 27, 2020 at 09:04:46AM -0400, Michael S. Tsirkin wrote:
> > It's not a waste of time, it's just a lot of work
> > within guests.
> 
> Luckily it does no harm to set the NEEDS_RESET bit even if the guest
> doesn't handle it.
> 
> If the guest driver is unaware it may continue to submit requests to the
> device for a while. The device emulation code stops accepting new
> requests though. This means the device will become unresponsive until
> reset, which is not ideal but okay in the case where the device was put
> into an invalid state.
> 
> I agree that supporting NEEDS_RESET transparently inside guests is
> difficult. The driver needs to reset and resume the device without
> reporting errors to applications.

Is that required?  I mean, what are the semantics of NEEDS_RESET - is
it assuming that you must be able to do a silent recovery?

Dave


> In some cases drivers may not have
> enough state in order to do that. It's also tricky to test all code
> paths. I guess this is why no one has done it: drivers shouldn't enter
> the NEEDS_RESET state anyway and handling it is complex.
> 
> Stefan


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


