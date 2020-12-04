Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF412CF5A3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:27:24 +0100 (CET)
Received: from localhost ([::1]:40994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHfn-0003Z4-6P
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1klF29-0002VX-L3
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:38:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1klF1b-0003Jh-HO
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:38:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607103257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nMckrw6gfbY1x6j1h9T/CPGQZymiAFOtl0LiDazSqPk=;
 b=CH7mpporC7u5mtBgsy1Eril6tDqyvoNZJYXDd+HxhCUkFrLTYUq4D3be+G32LgtKRlksgu
 wo5WHjQ0yvtbO/JwOD4ZA9F62NyS8eEneCFOqn6447l99J7bGDxF9j+w/jXhNHPvDEAsno
 D26GE8fdg35DFOHqyDgUI/0skfduhUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320--VNof-bdMNeopaBN6H316g-1; Fri, 04 Dec 2020 12:34:14 -0500
X-MC-Unique: -VNof-bdMNeopaBN6H316g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F107FAFA80;
 Fri,  4 Dec 2020 17:34:11 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77D915D6A1;
 Fri,  4 Dec 2020 17:34:08 +0000 (UTC)
Date: Fri, 4 Dec 2020 12:34:07 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v7 00/22] i386 cleanup [hw/core/cpu.c common]
Message-ID: <20201204173407.GP3836@habkost.net>
References: <20201130023535.16689-1-cfontana@suse.de>
 <07bc7bc1-a6d0-a470-b717-15cb23c06563@suse.de>
 <CABgObfYK-65Z3j1SA3zzj4WEFtjxj0QNYbvtV_LipjYAONeAeA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgObfYK-65Z3j1SA3zzj4WEFtjxj0QNYbvtV_LipjYAONeAeA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 04, 2020 at 05:07:21PM +0100, Paolo Bonzini wrote:
> Il ven 4 dic 2020, 14:54 Claudio Fontana <cfontana@suse.de> ha scritto:
> 
> > On 11/30/20 3:35 AM, Claudio Fontana wrote:
> > > Hi all, this is v7 of the i386 cleanup,
> >
> > This is fairly broken still and I am fixing it up,
> >
> > but a question arises while hunting bugs here.
> >
> > Silent bugs are introduced when trying to use code like
> >
> > #ifndef CONFIG_USER_ONLY
> >
> > in files that are built in "common" objects, since they are target
> > independent.
> >
> 
> That should be avoided by poison.h
> 
> I wonder also about the rationale why the cpu code is split between
> >
> > hw/core/cpu.c and $(top_srcdir)/cpu.c
> >
> > with one part in common and one part in "target specific".
> >
> 
> Mostly historical, cpu.c used to have much more than CPU code (it was
> exec.c until a month ago, one of the "historical" core files in QEMU and it
> had all the dispatch side of the memory API). I wouldn't mind merging these
> two files into one.
> 
> Paolo
> 
> 
> > What do we gain by having part of the cpu in common?
> >
> > In some cases we end up going through all sort of hoops because we cannot
> > just code everything in hw/core/cpu.c due to the fact
> > that we do not see CONFIG_ there.
> >

I really prefer to have core files guaranteed to be generic, so
we don't risk introducing additional per-target differences in
base QOM classes (including TYPE_CPU).

The hoops we are having to go through are hoops we must go
through if we want a multi-architecture QEMU binary in the
future.  We don't need to fix everything at once (that's why
$(top_srcdir)/cpu.c still exists), but we don't need to make this
harder.

-- 
Eduardo


