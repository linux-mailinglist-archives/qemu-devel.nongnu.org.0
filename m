Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC34439E796
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 21:37:57 +0200 (CEST)
Received: from localhost ([::1]:57468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqL4O-0004GS-Sl
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 15:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7858c8838=sidcha@amazon.de>)
 id 1lqL3H-0003ZU-Be
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 15:36:47 -0400
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:13833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7858c8838=sidcha@amazon.de>)
 id 1lqL3E-0004JX-N5
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 15:36:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1623094605; x=1654630605;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3OIyzRHmDgMowmJ2Eo4aqFZIO2AdOEYwfOVmpKiyKgM=;
 b=MBqGllK8YPrLs0BAORq0OXfDG+RU5HC1iua2mS7y7OarN3vWkVkkvfsw
 Lhn/EJReD+eDaxJMK4DZJIvMaf5ZZpcd8ZrvYfQ96kYJef+GUQ5s6zLRa
 SC/dpc0iXQOkg3oS9VeTCliYvILdzTTnwj/vnq5AXjbaw1Tn5NDF+9KCr w=;
X-IronPort-AV: E=Sophos;i="5.83,255,1616457600"; d="scan'208";a="129662956"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.25.36.210])
 by smtp-border-fw-33001.sea14.amazon.com with ESMTP; 07 Jun 2021 19:36:35 +0000
Received: from EX13D28EUC003.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS
 id AB033A2265; Mon,  7 Jun 2021 19:36:33 +0000 (UTC)
Received: from uc8bbc9586ea454.ant.amazon.com (10.43.160.137) by
 EX13D28EUC003.ant.amazon.com (10.43.164.43) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Mon, 7 Jun 2021 19:36:29 +0000
Date: Mon, 7 Jun 2021 21:36:25 +0200
From: Siddharth Chandrasekaran <sidcha@amazon.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
CC: Siddharth Chandrasekaran <sidcha.dev@gmail.com>, Alexander Graf
 <graf@amazon.com>, Evgeny Iakovlev <eyakovl@amazon.de>, Liran Alon
 <liran@amazon.com>, Ioannis Aslanidis <iaslan@amazon.de>,
 <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>
Subject: Re: [PATCH 0/6] Handle hypercall code overlay page in userspace
Message-ID: <20210607193624.GA7976@uc8bbc9586ea454.ant.amazon.com>
References: <cover.1621885749.git.sidcha@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1621885749.git.sidcha@amazon.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.43.160.137]
X-ClientProxiedBy: EX13D27UWB002.ant.amazon.com (10.43.161.167) To
 EX13D28EUC003.ant.amazon.com (10.43.164.43)
Precedence: Bulk
Received-SPF: pass client-ip=207.171.190.10;
 envelope-from=prvs=7858c8838=sidcha@amazon.de; helo=smtp-fw-33001.amazon.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

A reminder email to bring these up on your inboxes :). Would love
to hear your thoughts on them.

~ Sid.



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




