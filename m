Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68453C5D66
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:37:09 +0200 (CEST)
Received: from localhost ([::1]:51780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2w7Q-0001V3-V8
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1m2viR-0002q3-LA
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:11:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1m2viQ-0000lO-4R
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626095477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BOw9n8cwdGuw2ZXr5gCJOWOTHCO5x6bd3gOnjgUDUhY=;
 b=R+Lxd0D7xdEgZIDgXtMRW53dpBCSa1y8gi+/GPAWlnDfYGZCASAKcyoSgSGFkYuyESWWmi
 cjxFoT2q95zqMreo35ukxX9JFTNwdFjP/xS2+kltfl0PqsO6cSuYo2KbYNUbKkzZZ83m5s
 7JmeDlGhn1WyZI9JgzX4rb4hjghvAPQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-Yz5WTe6JO9mBhKQ2MVlT6g-1; Mon, 12 Jul 2021 09:11:15 -0400
X-MC-Unique: Yz5WTe6JO9mBhKQ2MVlT6g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0389719057A0;
 Mon, 12 Jul 2021 13:11:14 +0000 (UTC)
Received: from starship (unknown [10.40.192.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 502D45D6AD;
 Mon, 12 Jul 2021 13:11:08 +0000 (UTC)
Message-ID: <d95d40428ec07ee07e7c583a383d5f324f89686a.camel@redhat.com>
Subject: Re: About two-dimensional page translation (e.g., Intel EPT) and
 shadow page table in Linux QEMU/KVM
From: Maxim Levitsky <mlevitsk@redhat.com>
To: harry harry <hiharryharryharry@gmail.com>
Date: Mon, 12 Jul 2021 16:11:06 +0300
In-Reply-To: <CA+-xGqOdu1rjhkG0FhxfzF1N1Uiq+z0b3MBJ=sjuVStHP5TBKg@mail.gmail.com>
References: <CA+-xGqNUX4dpzFV7coJSoJnPz6cE5gdPy1kzRKsQtGD371hyEg@mail.gmail.com>
 <d79db3d7c443f392f5a8b3cf631e5607b72b6208.camel@redhat.com>
 <CA+-xGqOdu1rjhkG0FhxfzF1N1Uiq+z0b3MBJ=sjuVStHP5TBKg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 mathieu.tarral@protonmail.com, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2021-07-12 at 08:02 -0500, harry harry wrote:
> Dear Maxim,
> 
> Thanks for your reply. I knew, in our current design/implementation,
> EPT/NPT is enabled by a module param. I think it is possible to modify
> the QEMU/KVM code to let it support EPT/NPT and show page table (SPT)
> simultaneously (e.g., for an 80-core server, 40 cores use EPT/NPT and
> the other 40 cores use SPT). What do you think? Thanks!
> 
> Best regards,
> Harry
> 
> On Mon, Jul 12, 2021 at 4:49 AM Maxim Levitsky <mlevitsk@redhat.com> wrote:
> > On Sun, 2021-07-11 at 15:13 -0500, harry harry wrote:
> > > Hi all,
> > > 
> > > I hope you are very well! May I know whether it is possible to enable
> > > two-dimensional page translation (e.g., Intel EPT) mechanisms and
> > > shadow page table mechanisms in Linux QEMU/KVM at the same time on a
> > > physical server? For example, if the physical server has 80 cores, is
> > > it possible to let 40 cores use Intel EPT mechanisms for page
> > > translation and the other 40 cores use shadow page table mechanisms?
> > > Thanks!
> > 
> > Nope sadly. EPT/NPT is enabled by a module param.
> > 
> > Best regards,
> >         Maxim Levitsky
> > 
> > > Best,
> > > Harry
> > > 
For same VM, I don't think it is feasable.

For multiple VMs make some use NPT/EPT and some don't,
this should be possible to implement.

Why do you need it?

Best regards,
	Maxim Levitsky


