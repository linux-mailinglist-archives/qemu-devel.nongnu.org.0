Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BCD3C1AD3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 23:07:30 +0200 (CEST)
Received: from localhost ([::1]:58322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1bF3-0002di-LI
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 17:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1bDA-0007yh-1P
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:05:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1bD7-0006nX-1s
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625778328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kduDzfcIEbrIIbDyiIehPjyMueLxR97EAQJceAvJjig=;
 b=BRTMd12UCS2IG4mGhX4xw7iNmDav6xMIPL5AqYnfNojsXm1idbTHLdZogCP8f1svsUhoaf
 RSJNzFL4c2SoHPQqk6vaVTmyP+Fd2vJ/k/Llqb9WU3rz7jCBvfARf7gG8++UfP8Gl0jufr
 X+GQoY27dnioP7oTcUNvRTBLyiUiCJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-ejU-nwR1NkCnV0RQ8bRUjg-1; Thu, 08 Jul 2021 17:05:26 -0400
X-MC-Unique: ejU-nwR1NkCnV0RQ8bRUjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4F3D18358F1;
 Thu,  8 Jul 2021 21:05:25 +0000 (UTC)
Received: from localhost (unknown [10.22.8.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36FD85D9D3;
 Thu,  8 Jul 2021 21:05:25 +0000 (UTC)
Date: Thu, 8 Jul 2021 17:05:24 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH] target/i386: suppress CPUID leaves not defined by the
 CPU vendor
Message-ID: <20210708210524.msk7mot5ynapb7xx@habkost.net>
References: <20210708003623.18665-1-michael.roth@amd.com>
MIME-Version: 1.0
In-Reply-To: <20210708003623.18665-1-michael.roth@amd.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On Wed, Jul 07, 2021 at 07:36:23PM -0500, Michael Roth wrote:
> Currently all built-in CPUs report cache information via CPUID leaves 2
> and 4, but these have never been defined for AMD. In the case of
> SEV-SNP this can cause issues with CPUID enforcement. Address this by
> allowing CPU types to suppress these via a new "x-vendor-cpuid-only"
> CPU property, which is true by default, but switched off for older
> machine types to maintain compatibility.
> 
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: zhenwei pi <pizhenwei@bytedance.com>
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>

Queued, thanks!

-- 
Eduardo


