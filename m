Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED483595398
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 09:19:27 +0200 (CEST)
Received: from localhost ([::1]:59062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNqrG-0001aY-LG
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 03:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oNqlj-0007cx-6j
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 03:13:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oNqlf-0001T3-Dj
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 03:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660634018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=muPuRsbWUNvQq+AV/tXjZ/pmXJv9hf0eowkhwUQZsZs=;
 b=b6GIbqCPZQkUQEO1tdyzriMCZDOJ6XaZ7nk/OpCsSyQblGjdXgf1Of745iSxELyNYZJxMx
 cWA4issOBxKneTchPTq0H93J/+lizFKF7lnDk5aURw3TJT9oI1J22hjPGW6YXH9qKiARQ/
 qwV1qyX99VGnIf2NxUA6q+VO/udMAks=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-ygmvnsJ7N7yVnCqhMFKjbQ-1; Tue, 16 Aug 2022 03:13:36 -0400
X-MC-Unique: ygmvnsJ7N7yVnCqhMFKjbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F41D1C16B40;
 Tue, 16 Aug 2022 07:13:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A34FA40CF8EA;
 Tue, 16 Aug 2022 07:13:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 402C018003A8; Tue, 16 Aug 2022 09:13:34 +0200 (CEST)
Date: Tue, 16 Aug 2022 09:13:34 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
Subject: Re: [RFC PATCH v4 18/36] i386/tdx: Skip BIOS shadowing setup
Message-ID: <20220816071334.6aygj32xwnf6t2i3@sirius.home.kraxel.org>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-19-xiaoyao.li@intel.com>
 <20220524070804.tcrsg7cwlnbkzhjz@sirius.home.kraxel.org>
 <b294af31-fe92-f251-5d3e-0e439a59ee1e@intel.com>
 <20220530114904.242xqql3xfugy2a7@sirius.home.kraxel.org>
 <ad425c66-ce61-3e21-307e-55fc7131d954@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad425c66-ce61-3e21-307e-55fc7131d954@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 29, 2022 at 03:14:02PM +0800, Xiaoyao Li wrote:
> On 5/30/2022 7:49 PM, Gerd Hoffmann wrote:
> > On Thu, May 26, 2022 at 10:48:56AM +0800, Xiaoyao Li wrote:
> > > On 5/24/2022 3:08 PM, Gerd Hoffmann wrote:
> > > > On Thu, May 12, 2022 at 11:17:45AM +0800, Xiaoyao Li wrote:
> > > > > TDX guest cannot go to real mode, so just skip the setup of isa-bios.
> > > > 
> > > > Does isa-bios setup cause any actual problems?
> > > > (same question for patch #19).

> > There is no need for copying, end_of_1M is a alias memory region for
> > end_of_4G, so the backing storage is the same.
> 
> It is a reason that current alias approach cannot work for TDX. Because in
> TDX a private page can be only mapped to one gpa.

Ok, so memory aliasing not being supported by TDX is the underlying
reason.

> So for simplicity, I will
> just skip isa-bios shadowing for TDX instead of implementing a non-alias +
> memcpy approach.

Makes sense given that tdx wouldn't use the mapping below 1M anyway.
A comment explaining the tdx aliasing restriction would be good to make
clear why the special case for tdx exists.

take care,
  Gerd


