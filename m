Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB157302EC5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 23:17:16 +0100 (CET)
Received: from localhost ([::1]:56638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4AAd-0003e7-Vc
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 17:17:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l4A9H-0002pk-QO
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 17:15:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l4A9E-0000On-EW
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 17:15:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611612945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBuQWutFpm3tdqBUd150fLTSm6Qouw2WTLZgXSjiuOI=;
 b=EehhPd2vlQO/gy8TOPX2ug46XJPUDNGQZD/Mgcj0tuqPbAzdYxCblCVzRpO38buAHprILw
 nptcq+8G38aTd62x8LBjS9S2C9ATWLNA4jiFGdWkCC1GC3yzqlzZM9jwAPbBr/u9yo87jT
 OOH6U8C82NzYO/snIzLOlWuwSgZFTUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-pRD1rPybPGeHI065Pbg2QQ-1; Mon, 25 Jan 2021 17:15:42 -0500
X-MC-Unique: pRD1rPybPGeHI065Pbg2QQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C259AFA80;
 Mon, 25 Jan 2021 22:15:41 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00C136F978;
 Mon, 25 Jan 2021 22:15:36 +0000 (UTC)
Subject: Re: Thread safety of coroutine-sigaltstack
To: Peter Maydell <peter.maydell@linaro.org>
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
 <445268c9-d91f-af5a-3d7e-f4c6f014ca52@redhat.com>
 <fc35da77-a5c2-08dd-05f2-0ebe781b338c@redhat.com>
 <CAFEAcA8GWMh=Cbrnw4+mzbG7gkHLkeQKXCTGxev6iYu8Q8TkxQ@mail.gmail.com>
 <bd4c2b77-11f5-88aa-ff9b-63f5782e99cd@redhat.com>
 <CAFEAcA_ZtJAQDiGRNeBzcmJ8mvrR-nDVGr=7ECHJmEogY-_T_Q@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d797d8fd-5f50-89b2-d858-85573372ffb4@redhat.com>
Date: Mon, 25 Jan 2021 23:15:36 +0100
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ZtJAQDiGRNeBzcmJ8mvrR-nDVGr=7ECHJmEogY-_T_Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/23/21 14:35, Peter Maydell wrote:
> On Sat, 23 Jan 2021 at 00:06, Laszlo Ersek <lersek@redhat.com> wrote:
>> On 01/22/21 11:14, Peter Maydell wrote:
>>> I think (but have not checked) that that means we will build and
>>> link the object file into the user-mode binaries if you happen
>>> to build them in the same run as system-mode binaries,
>>
>> I did that, first running
>>
>>  ./configure \
>>     --enable-debug \
>>     --target-list==x86_64-softmmu,x86_64-linux-user \
>>     --with-coroutine=sigaltstack
>>
>> Then I checked the "qemu-system-x86_64" and "qemu-x86_64" binaries with
>> "nm". Only the former contains "coroutine_init":
>>
>> 00000000009725e4 t coroutine_init
>>
>> So I believe the coroutine object file(s) are not even linked into the
>> user-mode emulators. (coroutine_init() is a constructor function, so I
>> think it would be preserved otherwise, even if it had no explicit caller.)
> 
> I think the linker will only pull in a .o file from a static
> library (for us, libqemuutil.a) if there's an explicit reference
> to a real function that it needs; it won't pull it in merely because
> it has a constructor function in it. I can't offhand find an official
> docs reference for this, but here's a stack overflow question:
> https://stackoverflow.com/questions/6589772/gcc-functions-with-constructor-attribute-are-not-being-linked
> 
> You can also touch the coroutine source file and watch the
> build system rebuild the usermode binary. If you do a complete build,
> then touch util/coroutine-ucontext.c, then do 'make -C builddir qemu-arm'
> (or whatever usermode emulator you've configured) then:
>  * we build coroutine-ucontext.c into
> libqemuutil.a.p/util_coroutine-ucontext.c.o
>  * we blow away libqemuutil.a and then run 'ar' to put a lot of .o
>    files into it, including libqemuutil.a.p/util_coroutine-ucontext.c.o
>  * we do some things with scripts/undefsym.py that aren't important here
>  * we re-link qemu-arm with all its directly used objects and also with
>    libqemuutil.a
> 
> So right now we aren't actually using the coroutine functions, but
> if you did put in a call to one in code used by the usermode
> emulator then that code would only fail to compile if you
> were building the usermode emulators without either the tools
> or the system emulators.

Two thoughts (apart from the original topic):

- Should we file an LP ticket about this, perhaps? It looks moderately
risky.

- How does this case differ from the registration of types? type_init()
is a constructor function, and it generally ends up adding some
structures with function pointers (I reckon) via type_table_add(). The
main executable doesn't call into the device code directly -- only the
constructor function calls another function from the same module. The
main executable only goes through the registered type interfaces. How
does the linker know in that case to preserve the whole object?

Thanks!
Laszlo


