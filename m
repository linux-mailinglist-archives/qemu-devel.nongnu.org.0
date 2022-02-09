Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99384AF52E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:26:43 +0100 (CET)
Received: from localhost ([::1]:54666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHori-0007zx-GB
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:26:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nHneJ-0004kR-LT
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:08:47 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:34501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nHneH-0003m2-P3
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:08:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=WUoApMU0xyceyEAS6n6K0MFuNgwzFseLF26IiGqQmfU=; b=fnWCTYp9cHRVTl++efaJ1zy0bL
 vTNpmMZlW9iUk0m9ya6k0WqkjVtpuFIwKtW+U8x6rAi2XGskmlPjPLGcow9/iDoJ64LvjBGrmHWNx
 2uW8m9rrlcNGuAf699CN0QOqzf4GUYoMAyTvMGxy7j+YGDWuTaHRhPkZV77BX0e1Eu5gx8+CKjUmR
 U1Vj9JBpI2cktezKK/egFiV14kLwsSkfLf0AnNaiTJ1T+KkhB55EKACH2JScTZpZ9NFr1M2wsivJr
 UpDHDxxFIW/eX4qdzasiHVVwy2ftzO9pTKOnqh+F4Y7iW+ga/h33rfuqeCNIpzejNTbyAr/ZPbNKS
 X5ccHTTrwtBZ3xBUJnf+9gZVYgLTSAmsj7r/J/U1BhhhLFbexUBtG7sm5Q+aQD4P65g6DYzXc0KJI
 jx+HyAT7Kzw9cGD5/xie/vL6wY51gpCXZLAl6Y5ZC6V3BhpXcJwxRk/qM3NbfezXcfzft2uClcK3D
 bTdfBxPBTaYPyBNUpWvcNWwys4proiK63uSYaWMDQwVPaFBNr60KJ5HzNSrRmjCDNrkv1qGn1jfFm
 sEWCEKxnGUsyQBZ5V+EM6+eJwyZNg3kwjA0yvNX7i7rep7q/6lfSUaD4WJr3Ae2Y6YA71PDDq04KJ
 sOu3VTZYD+y7a+RNbwBrGVAf+2oy39BJUUZIyD1G4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>, Will Cohen <wwcohen@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Subject: Re: [PATCH v5 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Wed, 09 Feb 2022 15:08:35 +0100
Message-ID: <7028769.ONZ7M9ntUb@silver>
In-Reply-To: <CAMVc7JXB4KUFbMDekXiVTVqT_UQVpy-y6C+Z8caaSC3FRwPjWg@mail.gmail.com>
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <CAB26zV1VMZOjyn1h3fLd7N0rGWxLihv3tJDtRYn3P7muO-ehiw@mail.gmail.com>
 <CAMVc7JXB4KUFbMDekXiVTVqT_UQVpy-y6C+Z8caaSC3FRwPjWg@mail.gmail.com>
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

On Mittwoch, 9. Februar 2022 14:33:25 CET Akihiko Odaki wrote:
> > I like the idea of switching it to __attribute__((weak)). I should note
> > that I'm not sure that I can actually fully test this out since I'm
> > getting stuck with the linker noting my undefined fake function during
> > the build, but the idea does make logical sense to me for the future fail
> > case and the happy case builds again when implemented with actual
> > pthread_fchdir_np:
> > 
> > [1075/2909] Linking target qemu-nbd
> > FAILED: qemu-nbd
> > cc -m64 -mcx16  -o qemu-nbd qemu-nbd.p/qemu-nbd.c.o -Wl,-dead_strip_dylibs
> > -Wl,-headerpad_max_install_names -Wl,-undefined,error -Wl,-force_load
> > libblockdev.fa -Wl,-force_load libblock.fa -Wl,-force_load libcrypto.fa
> > -Wl,-force_load libauthz.fa -Wl,-force_load libqom.fa -Wl,-force_load
> > libio.fa -fstack-protector-strong
> > -Wl,-rpath,/usr/local/Cellar/gnutls/3.7.3/lib
> > -Wl,-rpath,/usr/local/Cellar/pixman/0.40.0/lib libqemuutil.a
> > libblockdev.fa libblock.fa libcrypto.fa libauthz.fa libqom.fa libio.fa
> > @block.syms /usr/local/Cellar/gnutls/3.7.3/lib/libgnutls.dylib -lutil
> > -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib
> > -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lintl
> > -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib
> > -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lintl -lm
> > -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib
> > -lgmodule-2.0 -lglib-2.0 -lintl
> > /usr/local/Cellar/pixman/0.40.0/lib/libpixman-1.dylib -lz -lxml2
> > -framework CoreFoundation -framework IOKit -lcurl
> > -L/usr/local/Cellar/glib/2.70.3/lib -L/usr/local/opt/gettext/lib
> > -lgmodule-2.0 -lglib-2.0 -lintl -lbz2
> > /usr/local/Cellar/libssh/0.9.6/lib/libssh.dylib -lpam> 
> > Undefined symbols for architecture x86_64:
> >   "_pthread_fchdir_npfoo", referenced from:
> >       _qemu_mknodat in libblockdev.fa(os-posix.c.o)
> > 
> > ld: symbol(s) not found for architecture x86_64
> > clang: error: linker command failed with exit code 1 (use -v to see
> > invocation) ninja: build stopped: subcommand failed.
> > make[1]: *** [run-ninja] Error 1
> > make: *** [all] Error 2
> > 
> > With that caveat re testing in mind, unless there's another recommended
> > path forward, I think it makes sense to stick with __attribute__((weak))
> > and prepare v6 which incorporates this and all the other feedback from
> > this round.
> __attribute__((weak_import)), which explicitly marks the function as
> external, is more appropriate here. It is feature-equivalent with the
> availability attribute when the minimum deployment target is lower
> than the version which introduced the function.

Thanks for chiming in on this macOS issue Akihiko!

Are you sure that "weak_import" is still the preferred way? From behaviour PoV 
I do not see any difference at all. I can't even tell what the intended 
difference was, and QEMU currently only seems to use "weak" in the entire code 
base.

Googling around, "weak_import" seems to be required on ancient OS X versions 
only and that it's now deprecated in favour of the more common "weak", no?

Best regards,
Christian Schoenebeck



