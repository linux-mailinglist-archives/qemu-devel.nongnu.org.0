Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41282DB1FA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 18:10:32 +0200 (CEST)
Received: from localhost ([::1]:52064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL8MA-0004ZA-JF
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 12:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56024)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iL7YL-0006NV-DE
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 11:19:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iL7YJ-0006Ur-VR
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 11:19:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59492)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1iL7YJ-0006Ua-MS
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 11:18:59 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DE21218CB91B
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 15:18:58 +0000 (UTC)
Received: from [10.36.117.42] (ovpn-117-42.ams2.redhat.com [10.36.117.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A30C60BE1;
 Thu, 17 Oct 2019 15:18:57 +0000 (UTC)
Subject: Re: Default CPU models on s390x and ppc64
To: Jiri Denemark <jdenemar@redhat.com>, qemu-devel@nongnu.org,
 David Hildenbrand <dhildenb@redhat.com>, David Gibson <dgibson@redhat.com>
References: <20191017151606.GA1880840@orkuz.int.mamuti.net>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <82ea23ea-be23-c374-3f10-65d8f6e79432@redhat.com>
Date: Thu, 17 Oct 2019 17:18:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191017151606.GA1880840@orkuz.int.mamuti.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Thu, 17 Oct 2019 15:18:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.10.19 17:16, Jiri Denemark wrote:
> Hi David and David,
> 
> I'm working on libvirt's support [1] for query-machines'
> default-cpu-type, which is supposed to return the type of the default
> CPU model that QEMU uses for each machine type. Rather than hard coding
> the default in libvirt (which we currently do on x86), we ask QEMU for
> the default CPU model and use it unless a user asks for a specific CPU
> model explicitly.
> 
> We use query-cpu-definitions for translating the default CPU type to the
> actual CPU model we need to pass to -cpu by looking up the CPU model
> with matching typename.
> 
> However, all this seems to work only with TCG on both s390x and ppc64.
> The issues I met with KVM on each architecture are described below.
> 
> On ppc64 the default CPU type reported by query-machines is
> power*-powerpc64-cpu, while IIUC QEMU would effectively use -cpu host by
> default. In fact -cpu power8 is mostly just a fancy alias to -cpu host
> on a Power8 machine. But QEMU even rewrites typename of the current host
> CPU model to host-powerpc64-cpu. Which means on a Power8 host the power8
> CPU model would have typename=host-powerpc64-cpu while the default CPU
> type would still use power8*-powerpc64-cpu. Thus we may just fail to
> find any CPU model corresponding to the default CPU model.
> 
> And to make it even worse, the default CPU model changes with machine
> type. E.g., pseries-3.1 uses power8_v2.0-powerpc64-cpu while pseries-4.2
> uses power9_v2.0-powerpc64-cpu. However, starting QEMU with pseries-4.2
> machine type and the reported default -cpu power9 fails on any
> non-Power9 host. That said QEMU just lies about the default CPU model.
> 
> So for all combinations of (pseries-3.1, pseries-4.2) machine types and
> (Power8, Power9) hosts, one will get the following mixed results:
> 
> - pseries-3.1 on Power8: no default CPU model will be detected, QEMU
>    starts fine with it's own default
> - pseries-4.2 on Power9: same as above
> - pseries-3.1 on Power9: -cpu power8 (not sure if this works, though)
> - pseries-4.2 on Power8: -cpu power9, QEMU doesn't start
> 
> 
> This situation on s390x is not so complicated, but not really better.
> The default CPU is said to be "qemu" for all machine types, which works
> fine for TCG domains, but it doesn't work on KVM because QEMU complains
> that some features requested in the CPU model are not available. In
> other words the "qemu" CPU model is not runnable on KVM. This a bit
> similar to what happens on x86_64, but QEMU just ignores missing
> features and starts happily there.

The default model under KVM is "host", under TCG it's "qemu". We should 
not use "qemu" under KVM, although it might work on some setups ...

Where/how is this default model detected?

> 
> 
> So what do you suggest we should do? Currently I just restricted all the
> default CPU model staff to TCG on both s390x and ppc64. So either we can
> be happy with the current state or we need to come up with a solution
> that would allow us to enable this even for KVM.
> 
> Thanks,
> Jirka
> 
> [1] https://www.redhat.com/archives/libvir-list/2019-October/msg00872.html
> 


-- 

Thanks,

David / dhildenb

