Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B346366DD4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 16:13:11 +0200 (CEST)
Received: from localhost ([::1]:46774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZDbK-0005uY-Ki
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 10:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lZDaV-0005Pj-Py
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 10:12:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lZDaT-0004X2-Gx
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 10:12:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619014336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sBvrM+j95lp8GbYT4E6swMqDMuNQ0YO1nwy8ERyCP3w=;
 b=QDtkWFRCR0QOfF6l+3KoHzmIae7To1Wb9d4eCxmLYIt/uy477mcVZLdj7EJgdGkAlqjmo8
 xpoxQV0Xw0n9ohlfRw33a6T8M8nanF4Vn+K7gUcxl1DrDJ09Xv6S9EUo8FleFHYfT9TBff
 3b1aqRXMJXx9srdm8s/ZL8H4y1RIFhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-l9rJR3xdNWOat1JuqUkR1g-1; Wed, 21 Apr 2021 10:12:12 -0400
X-MC-Unique: l9rJR3xdNWOat1JuqUkR1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41E5418397A3;
 Wed, 21 Apr 2021 14:12:11 +0000 (UTC)
Received: from localhost (ovpn-117-199.rdu2.redhat.com [10.10.117.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12D365D9C0;
 Wed, 21 Apr 2021 14:12:10 +0000 (UTC)
Date: Wed, 21 Apr 2021 10:12:10 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>
Subject: Re: [PATCH v2] i386: Add ratelimit for bus locks acquired in guest
Message-ID: <20210421141210.mx5mt7kewahj7eij@habkost.net>
References: <20210420093736.17613-1-chenyi.qiang@intel.com>
 <20210420163417.lbns24ypfqz7icxg@habkost.net>
 <df860e12-cea5-3d88-ba16-0dd1f8f975cb@intel.com>
MIME-Version: 1.0
In-Reply-To: <df860e12-cea5-3d88-ba16-0dd1f8f975cb@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Xiaoyao Li <xiaoyao.li@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 21, 2021 at 02:26:42PM +0800, Chenyi Qiang wrote:
> Hi, Eduardo, thanks for your comments!
> 
> 
> On 4/21/2021 12:34 AM, Eduardo Habkost wrote:
> > Hello,
> > 
> > Thanks for the patch.  Comments below:
> > 
> > On Tue, Apr 20, 2021 at 05:37:36PM +0800, Chenyi Qiang wrote:
> > > Virtual Machines can exploit bus locks to degrade the performance of
> > > system. To address this kind of performance DOS attack, bus lock VM exit
> > > is introduced in KVM and it will report the bus locks detected in guest,
> > > which can help userspace to enforce throttling policies.
> > > 
> > 
> > Is there anything today that would protect the system from
> > similar attacks from userspace with access to /dev/kvm?
> > 
> 
> I can't fully understand your meaning for "similar attack with access to
> /dev/kvm". But there are some similar associated detection features on bare
> metal.

What I mean is: you say guests can make a performance DoS attack
on the host, and your patch mitigates that.

What would be the available methods to prevent untrusted
userspace running on the host with access to /dev/kvm from making
a similar DoS attack on the host?

> 
> 1. Split lock detection:https://lore.kernel.org/lkml/158031147976.396.8941798847364718785.tip-bot2@tip-bot2/
> Some CPUs can raise an #AC trap when a split lock is attempted.

Would split_lock_detect=fatal be enough to prevent the above attacks?

Is split_lock_detect=fatal the only available way to prevent them?

> 
> 2. Bus lock Debug Exception:
> https://lore.kernel.org/lkml/20210322135325.682257-1-fenghua.yu@intel.com/
> The kernel can be notified by an #DB trap after a user instruction acquires
> a bus lock and is executed.

I see a rate limit option mentioned at the above URL.  Would a
host kernel bus lock rate limit option make this QEMU patch
redundant?

-- 
Eduardo


