Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA5F30115E
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 01:08:01 +0100 (CET)
Received: from localhost ([::1]:47270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l36TA-0004oh-Br
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 19:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l36S3-0004O5-UO
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 19:06:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l36Rz-0001jo-Bl
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 19:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611360405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQ/lSwCa7sNQw0okvoEoyma9IPWziHaKlXmOCMI30V0=;
 b=i9/+wNsWZdzSkTbstMQBFjxihNjWL4ogKKkSKONG1xGJ3fBqCxaiSKhi2H6fpDxO8qeTlH
 rG1G5Du88sVQueaHsVLJZxi64USM7ziZ/K0kWeXKKOKUYvkhcI5KOtYnRgchjf537Ci0sn
 oUZZZFc8exOakv7pArlYgX7p6U0ltks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-YOHGSdGvNbCEa_8z1-7IeA-1; Fri, 22 Jan 2021 19:06:42 -0500
X-MC-Unique: YOHGSdGvNbCEa_8z1-7IeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E99610054FF;
 Sat, 23 Jan 2021 00:06:41 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-81.ams2.redhat.com
 [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EB815DA2D;
 Sat, 23 Jan 2021 00:06:36 +0000 (UTC)
Subject: Re: Thread safety of coroutine-sigaltstack
To: Peter Maydell <peter.maydell@linaro.org>, Max Reitz <mreitz@redhat.com>
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
 <445268c9-d91f-af5a-3d7e-f4c6f014ca52@redhat.com>
 <fc35da77-a5c2-08dd-05f2-0ebe781b338c@redhat.com>
 <CAFEAcA8GWMh=Cbrnw4+mzbG7gkHLkeQKXCTGxev6iYu8Q8TkxQ@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <bd4c2b77-11f5-88aa-ff9b-63f5782e99cd@redhat.com>
Date: Sat, 23 Jan 2021 01:06:35 +0100
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8GWMh=Cbrnw4+mzbG7gkHLkeQKXCTGxev6iYu8Q8TkxQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/22/21 11:14, Peter Maydell wrote:
> On Fri, 22 Jan 2021 at 08:50, Max Reitz <mreitz@redhat.com> wrote:
>>
>> On 20.01.21 18:25, Laszlo Ersek wrote:
>>
>> [...]
>>
>>> A simple grep for SIGUSR2 seems to indicate that SIGUSR2 is not used by
>>> system emulation for anything else, in practice. Is it possible to
>>> dedicate SIGUSR2 explicitly to coroutine-sigaltstack, and set up the
>>> action beforehand, from some init function that executes on a "central"
>>> thread, before qemu_coroutine_new() is ever called?
>>
>> I wrote a patch to that effect, but just before sending I wondered
>> whether SIGUSR2 cannot be registered by the “guest” in user-mode
>> emulation, and whether that would then break coroutines from there on.
>>
>> (I have no experience dealing with user-mode emulation, but it does look
>> like the guest can just register handlers for any signal but SIGSEGV and
>> SIGBUS.)
> 
> Yes, SIGUSR2 is for the guest in user-emulation mode. OTOH do we
> even use the coroutine code in user-emulation mode? Looking at
> the meson.build files, we only add the coroutine_*.c to util_ss
> if 'have_block', and we set have_block = have_system or have_tools.
> I think (but have not checked) that that means we will build and
> link the object file into the user-mode binaries if you happen
> to build them in the same run as system-mode binaries,

I did that, first running

 ./configure \
    --enable-debug \
    --target-list==x86_64-softmmu,x86_64-linux-user \
    --with-coroutine=sigaltstack

Then I checked the "qemu-system-x86_64" and "qemu-x86_64" binaries with
"nm". Only the former contains "coroutine_init":

00000000009725e4 t coroutine_init

So I believe the coroutine object file(s) are not even linked into the
user-mode emulators. (coroutine_init() is a constructor function, so I
think it would be preserved otherwise, even if it had no explicit caller.)

I tried a different approach too: an #error in
"coroutine-sigaltstack.c", if CONFIG_LINUX_USER were #defined. But that
aborted the build, due to CONFIG_LINUX_USER being poisoned in the first
place. Maybe that result was already enough to answer the question, but
I wasn't sure, hence the check with "nm".

Thanks,
Laszlo

> but won't
> build them in if you built the user-mode binaries as a separate
> build. Which is odd and probably worth fixing, but does mean we
> know that we aren't actually using coroutines in user-mode.
> (Also user-mode really means Linux or BSD and I think both of
> those have working ucontext.)
> 
> thanks
> -- PMM
> 


