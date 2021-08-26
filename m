Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB57D3F86AB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 13:45:52 +0200 (CEST)
Received: from localhost ([::1]:54004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJDpP-0001dE-N7
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 07:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJDmo-0000pB-Ob
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 07:43:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJDmm-00063S-UU
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 07:43:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629978188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HuSdl8VPnaKESpbQBGNzdr2jJ0Gg3btzTyK1wnQfrJQ=;
 b=Wdh8a/+fAkZid2oVc+YOLQ0BXqg1UwHxmeZ4UCTSqUwaGrlFUE8yX4TAcZ8nxnCncJgXZm
 456/q7ublZDv8sIJoqCNFIXdifkoILPQ5S+9p7e8l8JqOBKcEPRmFr7IYQePX6Mooc2lCm
 Dsi5Zn1/xu8LRQVhf8RDAFVmThL5D9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-iNApl4fXN7OaAWkLDEwwMQ-1; Thu, 26 Aug 2021 07:43:07 -0400
X-MC-Unique: iNApl4fXN7OaAWkLDEwwMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F914100A609;
 Thu, 26 Aug 2021 11:43:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 216EC19D9F;
 Thu, 26 Aug 2021 11:43:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 914E418003AA; Thu, 26 Aug 2021 13:42:59 +0200 (CEST)
Date: Thu, 26 Aug 2021 13:42:59 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [RFC PATCH v2 28/44] i386/tdx: Force x2apic mode and routing for
 TDs
Message-ID: <20210826114259.7vdae6ysph4kzoqc@sirius.home.kraxel.org>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <5524acbf0b403fea046978456129d4c59a06f8a0.1625704981.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5524acbf0b403fea046978456129d4c59a06f8a0.1625704981.git.isaku.yamahata@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: isaku.yamahata@intel.com, cohuck@redhat.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, seanjc@google.com, alistair@alistair23.me,
 xiaoyao.li@intel.com, qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>, mtosatti@redhat.com,
 erdemaktas@google.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 05:54:58PM -0700, isaku.yamahata@gmail.com wrote:
> From: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> TDX requires x2apic and "resets" vCPUs to have x2apic enabled.  Model
> this in QEMU and unconditionally enable x2apic interrupt routing.

We have a cpu flag for that.  IMHO you should verify it is set and error
out if not instead of silently fixing up things.

take care,
  Gerd


