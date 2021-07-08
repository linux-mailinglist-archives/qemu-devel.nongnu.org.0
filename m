Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8CF3C1AD4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 23:07:52 +0200 (CEST)
Received: from localhost ([::1]:59846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1bFP-0003yK-V0
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 17:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1bDH-000890-Rp
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:05:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1bDG-0006pr-Fl
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:05:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625778337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u/wF0YSYhJnl70miPetqEd1uCzVKpVvqewJpkAIVw0k=;
 b=MsFVycC2LdxLzlMLraCxE1KINLpMc6/WEAazzqHkQNFDA/BVkt/9LRGp4oYhyIZ0Wf8C6f
 ZAQfuMXh8FHNRpcj3ciEfFE9wTi6f1KuEu4EN19JIckck4d9efOxhpLojbBBpKJ3tzj6IN
 si1d4oG3EwGOyYbjKNLEueEX+NRl4pQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-56HB3tu5NaOqyuiO6ZUolA-1; Thu, 08 Jul 2021 17:05:36 -0400
X-MC-Unique: 56HB3tu5NaOqyuiO6ZUolA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E8E21084F40;
 Thu,  8 Jul 2021 21:05:35 +0000 (UTC)
Received: from localhost (unknown [10.22.8.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8BF510016FD;
 Thu,  8 Jul 2021 21:05:34 +0000 (UTC)
Date: Thu, 8 Jul 2021 17:05:34 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH] target/i386: Fix cpuid level for AMD
Message-ID: <20210708210534.dquftwu6vgom6as7@habkost.net>
References: <20210708003623.18665-1-michael.roth@amd.com>
 <20210708170641.49410-1-michael.roth@amd.com>
MIME-Version: 1.0
In-Reply-To: <20210708170641.49410-1-michael.roth@amd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 12:06:41PM -0500, Michael Roth wrote:
> From: zhenwei pi <pizhenwei@bytedance.com>
> 
> A AMD server typically has cpuid level 0x10(test on Rome/Milan), it
> should not be changed to 0x1f in multi-dies case.
> 
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: zhenwei pi <pizhenwei@bytedance.com>
> Fixes: a94e1428991 (target/i386: Add CPUID.1F generation support for multi-dies PCMachine)
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> * to maintain compatibility with older machine types, only implement
>   this change when the CPU's "x-vendor-cpuid-only" property is false
> Signed-off-by: Michael Roth <michael.roth@amd.com>

Queued, thanks!

-- 
Eduardo


