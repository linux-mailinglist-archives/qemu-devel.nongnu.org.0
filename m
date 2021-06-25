Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76113B41C8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 12:37:29 +0200 (CEST)
Received: from localhost ([::1]:45804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwjDE-0005fi-FR
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 06:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8031d3708=sidcha@amazon.de>)
 id 1lwjC5-0004zT-Hh
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 06:36:17 -0400
Received: from smtp-fw-80007.amazon.com ([99.78.197.218]:55981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8031d3708=sidcha@amazon.de>)
 id 1lwjC3-000605-OR
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 06:36:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1624617376; x=1656153376;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KzhMXHLw9k4GxAobVRtJ2eDWA6JjcGFVLfsz2oYkbJg=;
 b=D5dtwZcUreB+ULsuUz0kQchczqmo0NsjUIAIp8Hr/NPK902LidHaZ4de
 GwHV5X185vBq5/0vopH62jgQSkaypodF1lWtaMbDZkNRJge8g8zWBPap7
 /6UFpe0Gx1DF8LTo3Vq3Io4xfnA3m3WgnU8XvA6BYU9MprHwka0XdWXwu g=;
X-IronPort-AV: E=Sophos;i="5.83,298,1616457600"; 
   d="scan'208";a="8675781"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.25.36.210])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP;
 25 Jun 2021 10:36:07 +0000
Received: from EX13D28EUC003.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3F061288D3B; Fri, 25 Jun 2021 10:36:05 +0000 (UTC)
Received: from uc8bbc9586ea454.ant.amazon.com (10.43.161.229) by
 EX13D28EUC003.ant.amazon.com (10.43.164.43) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Fri, 25 Jun 2021 10:36:01 +0000
Date: Fri, 25 Jun 2021 12:35:57 +0200
From: Siddharth Chandrasekaran <sidcha@amazon.de>
To: Alexander Graf <graf@amazon.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Siddharth Chandrasekaran <sidcha.dev@gmail.com>,
 Evgeny Iakovlev <eyakovl@amazon.de>, Liran Alon <liran@amazon.com>, Ioannis
 Aslanidis <iaslan@amazon.de>, <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>
Subject: Re: [PATCH 5/6] kvm/i386: Add support for user space MSR filtering
Message-ID: <20210625103556.GA17845@uc8bbc9586ea454.ant.amazon.com>
References: <cover.1621885749.git.sidcha@amazon.de>
 <4c7ecaab0295e8420ee03baf37c7722e01bb81ce.1621885749.git.sidcha@amazon.de>
 <2c6375b0-e7e0-a19e-8cc9-a8b81a64dfc1@amazon.com>
 <20210608105317.GA25597@u366d62d47e3651.ant.amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210608105317.GA25597@u366d62d47e3651.ant.amazon.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.43.161.229]
X-ClientProxiedBy: EX13D42UWB002.ant.amazon.com (10.43.161.155) To
 EX13D28EUC003.ant.amazon.com (10.43.164.43)
Precedence: Bulk
Received-SPF: pass client-ip=99.78.197.218;
 envelope-from=prvs=8031d3708=sidcha@amazon.de; helo=smtp-fw-80007.amazon.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 12:53:17PM +0200, Siddharth Chandrasekaran wrote:
> On Tue, Jun 08, 2021 at 10:48:53AM +0200, Alexander Graf wrote:
> > On 24.05.21 22:01, Siddharth Chandrasekaran wrote:
> > > Check and enable user space MSR filtering capability and handle new exit
> > > reason KVM_EXIT_X86_WRMSR. This will be used in a follow up patch to
> > > implement hyper-v overlay pages.
> > > 
> > > Signed-off-by: Siddharth Chandrasekaran <sidcha@amazon.de>
> > 
> > This patch will break bisection, because we're no longer handling the writes
> > in kernel space after this, but we also don't have user space handling
> > available yet, right? It might be better to move all logic in this patch
> > that sets up the filter for Hyper-V MSRs into the next one.
> 
> Yes, that's correct. I'll just bounce back all reads/writes to KVM. That
> should maintain the existing behaviour.

Okay, bouncing back to KVM was a bad idea :). Moved filters to next
patch as suggested.

~ Sid.



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




