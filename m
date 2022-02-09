Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3F24AF485
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 15:55:37 +0100 (CET)
Received: from localhost ([::1]:41920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHoNc-0003bB-Gg
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 09:55:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nHnNX-0002kg-Oj
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 08:51:39 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:35239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nHnN3-0005me-Fc
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 08:51:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Wov2ilQTTEgdzAYfT36mOwuh/4ExfwJpZz+ZtSvsXoI=; b=Oft8Re6z1QCf2M0x5eahGjnpIa
 F3ek9zqDNSkBHGMa24Cimio9w/APQBtSvB7yUnWUAXxTZq3SRmZCCerFa45avVM+lEridffXnjoH3
 VcYGB47R2vUKQ6XSKS5zEkJrXKH/fVpc717erInfeOFmPby2WY68xaq/ZvWFJbCm/Vd9PRRO8Cyva
 Lee8rdz/FtXx+Yv7lRs9tc3wMF1rIQHcUxNoAByteU4gzwVPRvOdavQOfpt7YOpWU/Azndj8h4T64
 cxokJqOGQEtaGSufbmLInhJ4/LbWrveDVeKInDYJUTbu4iI89oKXEUXF/F34+aSiYIO2/68S7k/n5
 oHPTaqh3/IvzM0EeDIsqHBy0XspCe2iT9Q/SPBCxmKH7Ji8ErHJTNNB+z9HRBWTMb8XcYAKDjONcp
 Z6KwpJW6mdLYNKdvk9RvbOZvJyM+o/W8vyIhcZshOqcmZIrIiJol0JZLmCOl32JXJGWsnuNWH6TfG
 RaOXV5Xw/WWJJieITvvDkXisMqK3EfrY8r5CRxY71vkbC9VVi4Sd3khy0QGocO/x7F40d+dxmtf7b
 eF42ZrjXmjpVcbED5AFn9pGpcxK4tqf7jxgzHdmOBvbPF8r45G5QL/nIFmxJE+sks4MeoSYmN4r1Q
 x8TnsepqSgw281UFN9tkmB4Fnk0LJA8sHi37hDg8k=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>
Subject: Re: [PATCH v5 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Wed, 09 Feb 2022 14:50:53 +0100
Message-ID: <2916980.GZRxgfQXSf@silver>
In-Reply-To: <CAB26zV1VMZOjyn1h3fLd7N0rGWxLihv3tJDtRYn3P7muO-ehiw@mail.gmail.com>
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <4999355.dprqNvMIp6@silver>
 <CAB26zV1VMZOjyn1h3fLd7N0rGWxLihv3tJDtRYn3P7muO-ehiw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Dienstag, 8. Februar 2022 23:57:32 CET Will Cohen wrote:
> > On a second thought: this case a bit special. Are we worried that
> > pthread_fchdir_np() is "not yet" available on macOS, or "no longer"
> > available.
> > Probably both, right?
> > 
> > So maybe it would make sense to replace the API_AVAILABLE() attribute
> > directly
> > with a __attribute__((weak)) attribute. Then the runtime check with the
> > proposed error message would also trigger if a bleeding edge macOS version
> > no
> > longer has pthread_fchdir_np().
> > 
> > Also keep in mind: there are always also the MAC_OS_X_VERSION_MIN_REQUIRED
> > and
> > MAC_OS_X_VERSION_MAX_ALLOWED macros to query the deployment target at
> > compile
> > time to wrap deployment target dependent code accordingly.
> > 
> > On doubt you could just make some tests there by simply "inventing" a non-
> > existent function.
> > 
> > Best regards,
> > Christian Schoenebeck
> 
> I like the idea of switching it to __attribute__((weak)). I should note
> that I'm not sure that I can actually fully test this out since I'm getting
> stuck with the linker noting my undefined fake function during the build,
> but the idea does make logical sense to me for the future fail case and the
> happy case builds again when implemented with actual pthread_fchdir_np:
> 
> [1075/2909] Linking target qemu-nbd
> FAILED: qemu-nbd
> cc -m64 -mcx16  -o qemu-nbd qemu-nbd.p/qemu-nbd.c.o -Wl,-dead_strip_dylibs
> -Wl,-headerpad_max_install_names -Wl,-undefined,error -Wl,-force_load
> libblockdev.fa -Wl,-force_load libblock.fa -Wl,-force_load libcrypto.fa
> -Wl,-force_load libauthz.fa -Wl,-force_load libqom.fa -Wl,-force_load
> libio.fa -fstack-protector-strong
> -Wl,-rpath,/usr/local/Cellar/gnutls/3.7.3/lib
> -Wl,-rpath,/usr/local/Cellar/pixman/0.40.0/lib libqemuutil.a libblockdev.fa
> libblock.fa libcrypto.fa libauthz.fa libqom.fa libio.fa @block.syms
> /usr/local/Cellar/gnutls/3.7.3/lib/libgnutls.dylib -lutil
> -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib -lgio-2.0
> -lgobject-2.0 -lglib-2.0 -lintl -L/usr/local/Cellar/glib/2.70.3/lib
> -L/usr/local/opt/gettext/lib -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lintl -lm
> -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib
> -lgmodule-2.0 -lglib-2.0 -lintl
> /usr/local/Cellar/pixman/0.40.0/lib/libpixman-1.dylib -lz -lxml2 -framework
> CoreFoundation -framework IOKit -lcurl -L/usr/local/Cellar/glib/2.70.3/lib
> -L/usr/local/opt/gettext/lib -lgmodule-2.0 -lglib-2.0 -lintl -lbz2
> /usr/local/Cellar/libssh/0.9.6/lib/libssh.dylib -lpam
> Undefined symbols for architecture x86_64:
>   "_pthread_fchdir_npfoo", referenced from:
>       _qemu_mknodat in libblockdev.fa(os-posix.c.o)
> ld: symbol(s) not found for architecture x86_64
> clang: error: linker command failed with exit code 1 (use -v to see

Even when "weak" linking, the respective symbol must still at least exist at 
compile time. To make this more clear, the following test works for me:

$ cat a.c
#include <stdio.h>

void aaa(void) {
    printf("aaa\n");
}
$ cat ab.c
#include <stdio.h>

void aaa(void) {
    printf("aaa\n");
}

void bbb(void) {
    printf("bbb\n");
}
$ cat main.c
#include <stdio.h>

void aaa(void);
void bbb(void) __attribute__((weak));

int main() {
    aaa();
    if (bbb)
        bbb();
    else
        printf("bbb() not supported\n");
    return 0;
}
$ clang -dynamiclib ab.c -o foo.1.dylib
$ clang main.c -o weaktest foo.1.dylib
$ ./weaktest
aaa
bbb
$ clang -dynamiclib a.c -o foo.1.dylib
$ ./weaktest
aaa
bbb() not supported
$

> With that caveat re testing in mind, unless there's another recommended
> path forward, I think it makes sense to stick with __attribute__((weak))
> and prepare v6 which incorporates this and all the other feedback from this
> round.

Just make this clear with an appropriate comment why it is weakly linked: to 
guard that function pthread_fchdir_np might simply disappear in future macOS 
versions, as it is simply a private API.

Best regards,
Christian Schoenebeck



