Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5373D0C87
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:46:40 +0200 (CEST)
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69kN-0005pX-8I
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m69Zg-0000Gi-IQ
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:35:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m69Ze-0004IC-Bh
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:35:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626863733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eRcSPmuK8UJ+1kHE+D4gRyi86nIQltCstKCD/QyYEeM=;
 b=NouS3BIk4SyZOH7UrPCtywJMNqs1iKIn14LwdFSNTxhAzGsubVITK3VY9navatD1V8BEIW
 eD/PsYIauszur9r3SVQoliVFeZt+nsxNcwkKS4Jcn/Y6Wd7eEsbA2TEx2GmQ3yb9haLNe6
 aA/u/R5deQdx2fjycfCxq0IJ3lRukAI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-CYlgDKzpPkKYXs4pBbWI3A-1; Wed, 21 Jul 2021 06:35:32 -0400
X-MC-Unique: CYlgDKzpPkKYXs4pBbWI3A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90F79800D62;
 Wed, 21 Jul 2021 10:35:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4551360854;
 Wed, 21 Jul 2021 10:35:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A2A7918000B2; Wed, 21 Jul 2021 12:35:28 +0200 (CEST)
Date: Wed, 21 Jul 2021 12:35:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: QEMU modules improvements objective (Was: Re: [RFC 0/3] Improve
 module accelerator error message)
Message-ID: <20210721103528.5y4tvcpjggfn6hvi@sirius.home.kraxel.org>
References: <20210630232749.21873-1-jziviani@suse.de>
 <2ab57f8e-cb8c-d708-274d-0c2092acfff3@suse.de>
MIME-Version: 1.0
In-Reply-To: <2ab57f8e-cb8c-d708-274d-0c2092acfff3@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 ehabkost@redhat.com, "Jose R. Ziviani" <jziviani@suse.de>,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Open question to all,
> 
> why don't we have/add the ability to configure
> 
> CONFIG_XXX=m
> 
> for all potentially modular pieces?
> 
> It should be possible to say, I want to build the storage plugins as modules, TCG I would like it built-in, and KVM as a module,
> or any combination of these.
>
> The most useful combination I see for virtualization use of qemu is with TCG as a module (M), KVM as built-in (Y), and various other optional pieces as modules (M).

Surely doable.  Comes with maintenance and testing cost though.

For example you'll get new kinds of dependencies: when building foo as
module stuff depending on foo must be built modular too (spice-core=m +
qxl=y doesn't work).

I see mainly two use cases:

  (1) distro builds.  Those would enable most features and also modules
      for fine-grained rpm/deb packaging.

  (2) builds for specific use cases.  Those would disable modules and
      just use CONFIG_FOO=n for things they don't need.

Being able to set CONFIG_FOO=y for features used in >90% of the use
cases (kvm, some virtio devices come to mind) might be useful for (1).
Distros do that with linux kernel builds too (Fedora kernel has
CONFIG_SATA_AHCI=y, CONFIG_USB_XHCI_PCI=y, ...).

But the question is: Are the benefits worth the effort?

take care,
  Gerd


