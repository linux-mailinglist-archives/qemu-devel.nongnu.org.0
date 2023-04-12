Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5356DF4B6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 14:09:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmZH6-0004yG-WA; Wed, 12 Apr 2023 08:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmZH1-0004x5-I1
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:08:28 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmZGy-0007c0-8n
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:08:27 -0400
Received: by mail-wm1-x32a.google.com with SMTP id s8so6414663wmo.0
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 05:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681301301; x=1683893301;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9ZMwieaoL0fHiXhoMduvkbhEKzr5BJXsW4T8Vb1fRs=;
 b=D0XuXIMRiuezlM19q9FsfWmyTvNwPd83eevxP3eZaF5K+OFAHF7KjnZlCUpZLw4SAa
 /VPULQHtKHS0kB/ITSRufDqiVYAhpn3XszcQfqIR025rcWr4hE0eZYIdrj4NvvH5mMIg
 YdbX9aUt0MheslghZkWqA4Bn1bTQdm9gxFPYhrd2XKfNmOcG5H96AXdQ7+0CG249M8Y/
 bUYclJovcpoGQIn3A/fA4c7a4/sD+t3XS4M/CNm3YTEBVy31FL5C9N6Tzb8COiaDujxU
 2crl49ztnmDya+2zygYUbLZyKallxQxW7w0aKprgnIYlJabkG6T/eOpBz8CTRuDZauB2
 F4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681301301; x=1683893301;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=W9ZMwieaoL0fHiXhoMduvkbhEKzr5BJXsW4T8Vb1fRs=;
 b=Rzfu3BI9Vvls0UnU7mfXPUStklvRV+bDoAOITFsWoMec0ztRTuvkO7bY2qsDt3ENFz
 eJQCCADlxfir+qvD/JLZ3p7J2Q4979EvAt663Ma7JIaJzpJQCzDeurjItRk7yuF/XrcM
 pTLNq4nIZ6+sVGs+8kHl/g1JD4Q8k06KEW1sqkjOQh9BY8gxxjrkLQ2k/1WwO7VOkob5
 amv0p1TbhJLPf/aKKYN0dYa0D7dZ03JWFRm5v61REL4T8URNymGQaoQwibp5BPcgCpqL
 jZX9P01DTpBFd3tLnTTMc34h0gf3UYJeTT4c5Y3HjRVMtmt8UIYNAcJotlFRfb6jEfFg
 LLeg==
X-Gm-Message-State: AAQBX9etNhl6V8cOjb87gWXXiifn4zVzebYJB5xLFS/RBTL07Dx9CAfX
 M62Iqul8Z2HsnS79XPF7dxDJSA==
X-Google-Smtp-Source: AKy350ajoapcQC6sOv4vXutEjP5qI46V8ZsEIJbq2WIsebxW5+kAJ1l3VrQt0jGNCX5gyWSpKUgdJQ==
X-Received: by 2002:a1c:7215:0:b0:3f0:9a3f:c8b6 with SMTP id
 n21-20020a1c7215000000b003f09a3fc8b6mr1854939wmc.2.1681301301612; 
 Wed, 12 Apr 2023 05:08:21 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c350a00b003f082388117sm2231333wmq.32.2023.04.12.05.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 05:08:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D02A1FFB7;
 Wed, 12 Apr 2023 13:08:20 +0100 (BST)
References: <20230412125842.573dc418.olaf@aepfle.de>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: qemu-devel@nongnu.org, David Woodhouse <dwmw@amazon.co.uk>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony Perard
 <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: qemu v8.0-rc3 fails to compile with Xen
Date: Wed, 12 Apr 2023 12:46:23 +0100
In-reply-to: <20230412125842.573dc418.olaf@aepfle.de>
Message-ID: <873555pakr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Olaf Hering <olaf@aepfle.de> writes:

> [[PGP Signed Part:Undecided]]
> Qemu v7.2.1 can be compiled with Xen 4.6, but v8.0.0-rc3 needs now at
> least Xen 4.7.

Was this caused by the addition of the KVM Xen target support or some
other churn since?

>
> Is Xen older than 4.7 still a supported target? There is a lot compat
> code, and the meson checks go back to 4.2.

We should certainly update that because currently the Xen support pages:

  https://xenbits.xen.org/docs/unstable/support-matrix.html

only list 4.14 and above as still being in security support. The list
only goes back to 4.10 so I would assume anything earlier is out of
scope.

We don't currently document anything about minimum versions of the
hypervisors supported in:

  https://qemu.readthedocs.io/en/latest/about/build-platforms.html

I don't know if we want to make specific statements about hypervisor
versions or just go for the oldest version shipping on the oldest LTS we
support?

Debian Buster 4.11.4
Debian Bullseye 4.14.5
Debian Bookwork (dev) 4.17
Ubuntu 22.04 4.16.0
OpenSUSE 15.4 4.16.0

I couldn't find the RHEL data on repology.org

>
> Olaf
>
>
> FAILED: libcommon.fa.p/hw_xen_xen-operations.c.o=20
> /usr/bin/gcc-7 -m64 -mcx16 -Ilibcommon.fa.p -I/usr/include/pixman-1 -I/us=
r/include/libpng16 -I/usr/include/spice-server -I/usr/include/cacard -I/usr=
/include/nss3 -I/usr/include/nspr4 -I/usr/include/glib-2.0 -I/usr/lib64/gli=
b-2.0/include -I/usr/include/spice-1 -I/usr/include/p11-kit-1 -I/usr/includ=
e/libusb-1.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/gi=
o-unix-2.0 -I/usr/include/ncursesw -fdiagnostics-color=3Dauto -Wall -Winval=
id-pch -std=3Dgnu11 -O2 -isystem /Qc6f3cbca32/linux-headers -isystem linux-=
headers -iquote . -iquote /Qc6f3cbca32 -iquote /Qc6f3cbca32/include -iquote=
 /Qc6f3cbca32/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_GNU_SOURCE -D_FILE_OFF=
SET_BITS=3D64 -D_LARGEFILE_SOURCE -fno-strict-aliasing -fno-common -fwrapv =
-Wundef -Wwrite-strings -Wmissing-prototypes -Wstrict-prototypes -Wredundan=
t-decls -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wform=
at-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wne=
sted-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=
=3D2 -Wmissing-format-attribute -Wno-missing-include-dirs -Wno-shift-negati=
ve-value -Wno-psabi -fstack-protector-strong -fmessage-length=3D0 -grecord-=
gcc-switches -O2 -Wall -D_FORTIFY_SOURCE=3D2 -fstack-protector-strong -funw=
ind-tables -fasynchronous-unwind-tables -fstack-clash-protection -fPIE -DOP=
ENSSL_LOAD_CONF -MD -MQ libcommon.fa.p/hw_xen_xen-operations.c.o -MF libcom=
mon.fa.p/hw_xen_xen-operations.c.o.d -o libcommon.fa.p/hw_xen_xen-operation=
s.c.o -c ../hw/xen/xen-operations.c
> In file included from ../hw/xen/xen-operations.c:16:0:
> /Qc6f3cbca32/include/hw/xen/xen_native.h: In function 'xenforeignmemory_m=
ap2':
> /Qc6f3cbca32/include/hw/xen/xen_native.h:121:12: warning: implicit declar=
ation of function 'xenforeignmemory_map'; did you mean 'xenforeignmemory_ma=
p2'? [-Wimplicit-function-declaration]
>      return xenforeignmemory_map(h, dom, prot, pages, arr, err);
>             ^~~~~~~~~~~~~~~~~~~~
>             xenforeignmemory_map2
> /Qc6f3cbca32/include/hw/xen/xen_native.h:121:12: warning: nested extern d=
eclaration of 'xenforeignmemory_map' [-Wnested-externs]
> /Qc6f3cbca32/include/hw/xen/xen_native.h:121:12: warning: return makes po=
inter from integer without a cast [-Wint-conversion]
>      return xenforeignmemory_map(h, dom, prot, pages, arr, err);
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../hw/xen/xen-operations.c: At top level:
> ../hw/xen/xen-operations.c:37:19: error: conflicting types for 'xenevtchn=
_handle'
>  typedef xc_evtchn xenevtchn_handle;
>                    ^~~~~~~~~~~~~~~~
> In file included from ../hw/xen/xen-operations.c:17:0:
> /Qc6f3cbca32/include/hw/xen/xen_backend_ops.h:33:33: note: previous decla=
ration of 'xenevtchn_handle' was here
>  typedef struct xenevtchn_handle xenevtchn_handle;
>                                  ^~~~~~~~~~~~~~~~
> ../hw/xen/xen-operations.c:49:19: error: conflicting types for 'xengnttab=
_handle'
>  typedef xc_gnttab xengnttab_handle;
>                    ^~~~~~~~~~~~~~~~
> In file included from ../hw/xen/xen-operations.c:17:0:
> /Qc6f3cbca32/include/hw/xen/xen_backend_ops.h:136:33: note: previous decl=
aration of 'xengnttab_handle' was here
>  typedef struct xengntdev_handle xengnttab_handle;
>                                  ^~~~~~~~~~~~~~~~
> ../hw/xen/xen-operations.c:193:13: warning: initialization from incompati=
ble pointer type [-Wincompatible-pointer-types]
>      .open =3D libxenevtchn_backend_open,
>              ^~~~~~~~~~~~~~~~~~~~~~~~~
> ../hw/xen/xen-operations.c:193:13: note: (near initialization for 'libxen=
evtchn_backend_ops.open')
> ../hw/xen/xen-operations.c:194:14: error: 'xenevtchn_close' undeclared he=
re (not in a function); did you mean 'xc_evtchn_close'?
>      .close =3D xenevtchn_close,
>               ^~~~~~~~~~~~~~~
>               xc_evtchn_close
> ../hw/xen/xen-operations.c:195:25: error: 'xenevtchn_bind_interdomain' un=
declared here (not in a function); did you mean 'xc_evtchn_bind_interdomain=
'?
>      .bind_interdomain =3D xenevtchn_bind_interdomain,
>                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
>                          xc_evtchn_bind_interdomain
> ../hw/xen/xen-operations.c:196:15: error: 'xenevtchn_unbind' undeclared h=
ere (not in a function); did you mean 'xc_evtchn_unbind'?
>      .unbind =3D xenevtchn_unbind,
>                ^~~~~~~~~~~~~~~~
>                xc_evtchn_unbind
> ../hw/xen/xen-operations.c:197:15: error: 'xenevtchn_fd' undeclared here =
(not in a function); did you mean 'xc_evtchn_fd'?
>      .get_fd =3D xenevtchn_fd,
>                ^~~~~~~~~~~~
>                xc_evtchn_fd
> ../hw/xen/xen-operations.c:198:15: error: 'xenevtchn_notify' undeclared h=
ere (not in a function); did you mean 'xc_evtchn_notify'?
>      .notify =3D xenevtchn_notify,
>                ^~~~~~~~~~~~~~~~
>                xc_evtchn_notify
> ../hw/xen/xen-operations.c:199:15: error: 'xenevtchn_unmask' undeclared h=
ere (not in a function); did you mean 'xc_evtchn_unmask'?
>      .unmask =3D xenevtchn_unmask,
>                ^~~~~~~~~~~~~~~~
>                xc_evtchn_unmask
> ../hw/xen/xen-operations.c:200:16: error: 'xenevtchn_pending' undeclared =
here (not in a function); did you mean 'xc_evtchn_pending'?
>      .pending =3D xenevtchn_pending,
>                 ^~~~~~~~~~~~~~~~~
>                 xc_evtchn_pending
> ../hw/xen/xen-operations.c:218:13: warning: initialization from incompati=
ble pointer type [-Wincompatible-pointer-types]
>      .open =3D libxengnttab_backend_open,
>              ^~~~~~~~~~~~~~~~~~~~~~~~~
> ../hw/xen/xen-operations.c:218:13: note: (near initialization for 'libxen=
gnttab_backend_ops.open')
> ../hw/xen/xen-operations.c:219:14: error: 'xengnttab_close' undeclared he=
re (not in a function); did you mean 'xc_gnttab_close'?
>      .close =3D xengnttab_close,
>               ^~~~~~~~~~~~~~~
>               xc_gnttab_close
> ../hw/xen/xen-operations.c:220:19: warning: initialization from incompati=
ble pointer type [-Wincompatible-pointer-types]
>      .grant_copy =3D libxengnttab_fallback_grant_copy,
>                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../hw/xen/xen-operations.c:220:19: note: (near initialization for 'libxen=
gnttab_backend_ops.grant_copy')
> ../hw/xen/xen-operations.c:221:23: error: 'xengnttab_set_max_grants' unde=
clared here (not in a function); did you mean 'xc_gnttab_set_max_grants'?
>      .set_max_grants =3D xengnttab_set_max_grants,
>                        ^~~~~~~~~~~~~~~~~~~~~~~~
>                        xc_gnttab_set_max_grants
> ../hw/xen/xen-operations.c:222:17: error: 'xengnttab_map_domain_grant_ref=
s' undeclared here (not in a function); did you mean 'xc_gnttab_map_domain_=
grant_refs'?
>      .map_refs =3D xengnttab_map_domain_grant_refs,
>                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                  xc_gnttab_map_domain_grant_refs
> ../hw/xen/xen-operations.c:223:14: warning: initialization from incompati=
ble pointer type [-Wincompatible-pointer-types]
>      .unmap =3D libxengnttab_backend_unmap,
>               ^~~~~~~~~~~~~~~~~~~~~~~~~~
> ../hw/xen/xen-operations.c:223:14: note: (near initialization for 'libxen=
gnttab_backend_ops.unmap')
> ../hw/xen/xen-operations.c:229:57: error: unknown type name 'xfn_pfn_t'; =
did you mean 'xen_pfn_t'?
>                                            size_t pages, xfn_pfn_t *pfns,
>                                                          ^~~~~~~~~
>                                                          xen_pfn_t
> ../hw/xen/xen-operations.c:262:12: error: 'libxenforeignmem_backend_map' =
undeclared here (not in a function); did you mean 'libxenforeignmem_backend=
_unmap'?
>      .map =3D libxenforeignmem_backend_map,
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>             libxenforeignmem_backend_unmap
> ninja: build stopped: subcommand failed.
> make[1]: *** [Makefile:165: run-ninja] Error 1
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

