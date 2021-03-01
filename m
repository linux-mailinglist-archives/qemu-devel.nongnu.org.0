Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7B93290E0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 21:17:57 +0100 (CET)
Received: from localhost ([::1]:35162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGozM-0000iG-QS
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 15:17:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lGoy4-0000Du-US
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:16:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lGoy0-0004SZ-9b
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614629790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OE3bex2xuusC5iT4ke6HfnYe68Ca6O0+gL1TS52VkHY=;
 b=W9LzFlQNL9PW4dRssCa3ZCryOf2PbVkOqxEnfKx9BjjXcR6c+7EPl+bvsgVlMRfJIMYBj9
 STj+PcnJAk3wOhVtyL/AjxAkd8l8woRwvtHj/ZpTfgK/DSt9Do0zVgooeriM0SbqAG/nV2
 U0OzZfb0O7rkzjzg5YYFSGFOG15KYzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-sQGrLABTNaaGYtfJ6bf8fA-1; Mon, 01 Mar 2021 15:16:26 -0500
X-MC-Unique: sQGrLABTNaaGYtfJ6bf8fA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5089C2AA;
 Mon,  1 Mar 2021 20:16:24 +0000 (UTC)
Received: from localhost (unknown [10.40.208.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFE4319744;
 Mon,  1 Mar 2021 20:16:13 +0000 (UTC)
Date: Mon, 1 Mar 2021 21:16:11 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: Re: [PATCH 1/2] i386/acpi: fix inconsistent QEMU/OVMF device paths
Message-ID: <20210301211611.28d7606a@redhat.com>
In-Reply-To: <dcf40b52-e695-e516-aa26-0db30e5ee6ea@proxmox.com>
References: <20200730155755.188845-1-mst@redhat.com>
 <5b40e1ac-03ca-7954-4d50-f5f96c339772@proxmox.com>
 <20210228154208-mutt-send-email-mst@kernel.org>
 <967d3e1f-d387-0b33-95b0-6560f49657dd@proxmox.com>
 <20210301021449-mutt-send-email-mst@kernel.org>
 <4b7e58a9-e6bf-818f-b2f1-72600fced210@proxmox.com>
 <20210301152036.0c12cbf5@redhat.com>
 <dcf40b52-e695-e516-aa26-0db30e5ee6ea@proxmox.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: vit9696 <vit9696@protonmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Reiter <s.reiter@proxmox.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Mar 2021 15:27:38 +0100
Thomas Lamprecht <t.lamprecht@proxmox.com> wrote:

> On 01.03.21 15:20, Igor Mammedov wrote:
> > On Mon, 1 Mar 2021 08:45:53 +0100
> > Thomas Lamprecht <t.lamprecht@proxmox.com> wrote:  
> >> On 01.03.21 08:20, Michael S. Tsirkin wrote:  
> >>> There are various testing efforts the reason this got undetected is
> >>> because it does not affect linux guests, and even for windows
> >>> they kind of recover, there's just some boot slowdown around reconfiguration.
> >>> Not easy to detect automatically given windows has lots of random
> >>> downtime during boot around updates etc etc.
> >>>     
> >>
> >> No, Windows does not reconfigure, this is a permanent change, one is just lucky
> >> if one has a DHCP server around in the network accessible for the guest.
> >> As static addresses setup on that virtual NIC before that config is gone,
> >> no recovery whatsoever until manual intervention.  
> > Static IP's are the pain guest admin picked up to deal with so he might have to
> > reconfigure guest OS when it decides to rename NICs. In this case moving
> > to new QEMU is alike to updating BIOS which fixed PCI description.
> > (On QEMU side we try to avoid breaking changes, but sometime it happens anyway
> > and it's up guest admin to fix OS quirks)
> >   
> 
> heh, I agree, but users see it very differently, QEMU got updated, something
> stopped working/changed/... -> QEMU at fault.
lets try to workaround it as Michael have suggested, i.e. old behavior for old
machine types.

> >> I meant more of a "dump HW layout to .txt file, commit to git, and ensure
> >> there's no diff without and machine version bump" (very boiled down), e.g., like
> >> ABI checks for kernel builds are often done by distros - albeit those are easier
> >> as its quite clear what and how the kernel ABI can be used.  
> > ACPI tables are not considered as ABI change in QEMU, technically tables that QEMU
> > generates are firmware and not version-ed (same like we don't tie anything to
> > specific firmware versions). 
> > 
> > However we rarely do version ACPI changes (only when it breaks something or
> > we suspect it would break and we can't accept that breakage), this time it took
> > a lot of time to find out that. We try to minimize such cases as every
> > versioning knob adds up to maintenance.
> > 
> > For ACPI tables changes, QEMU has bios-tables-test, but it lets us to catch
> > unintended changes only.
> > Technically it's possible to keep master tables for old machine versions
> > and test against it. But I'm not sure if we should do that, because some
> > (most) changes are harmless or useful and should apply to all machine
> > versions.
> > So we will end up in the same situation, where we decide if a change
> > should be versioned or not.

If you can come up with a test case for this issue, patches are welcome.

We probably should test PCI device enumeration on Windows,
as it's what's broken. Testing that in qtest (make check) is out of question,
but there are acceptance tests which run various guest OSes and provide tools
to interact with guest. Perhaps adding test there could work.
Though I don't know if there are Windows based guest images available for it.

I guess it's something to discuss with guys who work on CI/testing
infrastructure (CCed).
 
> OK, fair enough. Many thanks for providing some rationale!
> 
> 


