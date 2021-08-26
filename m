Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DB73F85C3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 12:43:27 +0200 (CEST)
Received: from localhost ([::1]:56954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJCqy-0005VQ-Rg
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 06:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJCpP-0004np-OS
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 06:41:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJCpL-0005hy-Aj
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 06:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629974501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WUSm/I+IuKQjkjPbmUi8oDeiiUHMswrLJ2gKcEGs3AM=;
 b=RgxCqg7O/9a4PevcYNvErW8joAObf8LCP64HiUBB7seruEL4S9gPzrgTmxz3pFJ2M1jnCu
 YdRd/kMKJm0k86bLOgfZSuW9E50vg4VN6ZnroLxryYai4wPPUeL97NpsTyLbVxYoRmV4gE
 aU82KHrIShFozVl0qH5e9eYAyYcHHLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-5eWfWPlyNSmcwndz2142DA-1; Thu, 26 Aug 2021 06:41:38 -0400
X-MC-Unique: 5eWfWPlyNSmcwndz2142DA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90114100806A;
 Thu, 26 Aug 2021 10:41:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 651D25C1D5;
 Thu, 26 Aug 2021 10:41:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D420818003AA; Thu, 26 Aug 2021 12:41:29 +0200 (CEST)
Date: Thu, 26 Aug 2021 12:41:29 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [RFC PATCH v2 15/44] i386/tdx: Add hook to require generic
 device loader
Message-ID: <20210826104129.ukhut4lnttybf3sy@sirius.home.kraxel.org>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <c16cb881efabc16a94ff7c02cd8c7abe24411e3f.1625704981.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c16cb881efabc16a94ff7c02cd8c7abe24411e3f.1625704981.git.isaku.yamahata@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
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

> +    /*
> +     * Sanitiy check for tdx:
> +     * TDX uses generic loader to load bios instead of pflash.
> +     */
> +    for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
> +        if (drive_get(IF_PFLASH, 0, i)) {
> +            error_report("pflash not supported by VM type, "
> +                         "use -device loader,file=<path>");
> +            exit(1);
> +        }

I suspect that catches only "-drive if=pflash,..."
but not "-machine pflash0=..."

Also: why does tdx not support flash?
Should be explained in the commit message.

thanks,
  Gerd


