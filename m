Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7255244D2BF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 08:55:06 +0100 (CET)
Received: from localhost ([::1]:46598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml4vJ-0005F3-Kg
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 02:55:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml4tX-0004Jk-IK
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:53:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml4tV-00010o-R2
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636617193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7w/J3taPazbwR7H7wLHzOBUsKZMje5kJv66PvINcAGw=;
 b=V8zSxnSW4gS32XHQOqdpBorA/R90QZOkRMPYWbciW8O6I9T3bJMMJwzgDlZDHQWMUY/YdK
 O92z3fChKAJp3d8fmFQTyop/LxIjV74f7dE2sTSfc+WjOaYEAY9Qz2UC9kerB2WNnkqHou
 9GDK7yR+mUk8prxvJMVAFa3e4tM/OlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-caSteXXNPlauajrTSv3Ycw-1; Thu, 11 Nov 2021 02:53:11 -0500
X-MC-Unique: caSteXXNPlauajrTSv3Ycw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91E1619251A3;
 Thu, 11 Nov 2021 07:53:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B92965D6B1;
 Thu, 11 Nov 2021 07:53:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 077511800925; Thu, 11 Nov 2021 08:53:06 +0100 (CET)
Date: Thu, 11 Nov 2021 08:53:06 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <20211111075306.7dvpzewgclsddku6@sirius.home.kraxel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211110065942-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211110065942-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Given it's a bugfix, and given that I hear through internal channels
> that QE results so far have been encouraging, I am inclined to bite the
> bullet and merge this for -rc1.

Fine with me.

> I don't think this conflicts with Julia's patches as users can still
> disable ACPI hotplug into bridges.  Gerd, agree?  Worth the risk?

Combining this with Julia's patches looks a bit risky to me and surely
needs testing.  I expect the problematic case is both native and acpi
hotplug being enabled.  When the guest uses acpi hotplug nobody will
turn on slot power on the pcie root port ...

I'd suggest to just revert to pcie native hotplug for 6.2.  Give acpi
hotplug another try for 7.0, and post patches early in the devel cycle
then instead of waiting until -rc0 is released.

take care,
  Gerd


