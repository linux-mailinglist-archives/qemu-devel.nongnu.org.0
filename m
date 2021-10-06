Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D644242D1
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:37:47 +0200 (CEST)
Received: from localhost ([::1]:60416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY9vO-0005bf-6v
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mY9gP-0007bE-S6
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:22:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mY9gJ-0006Bj-EJ
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:22:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633537329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=peD/WCm4SIC6DdmubN291Vz7Y3hwBkgf8RktEJTYE4Y=;
 b=JIYODqNN0COIQblhMwfJ1ouFPdbKf42Z5erRK0hx7VS0fiRIcyPgA5rkB2W9ikK6h9rq5R
 ek8F2IBrIbVF27i4psKsc5RaCor2zs8DUy64KppMxGp5xWA8L8g1xvBWV/8nGchOOvJ2C3
 1Fh1qrVFKj0HA6eglmOAzsbCjFcUDK8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-k7AfoH3FNu-H-7qsIrhxjg-1; Wed, 06 Oct 2021 12:22:08 -0400
X-MC-Unique: k7AfoH3FNu-H-7qsIrhxjg-1
Received: by mail-wr1-f72.google.com with SMTP id
 x14-20020a5d60ce000000b00160b27b5fd1so2487086wrt.5
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 09:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=peD/WCm4SIC6DdmubN291Vz7Y3hwBkgf8RktEJTYE4Y=;
 b=Ac2Av715l43Af6lnabdnCSEt/+TSD182GyEdPHBMWMUvQgfuYf0pELG1i0d99RjoH0
 ptuJyNaxNxZKvDa5xTiq6UDW8vfL6UBit6Lj6DfpYxRZJArN2seG2HGfVTjMHdVoDDc6
 z0yS9RcnFlS1Qvzh2qGeGh6t6YbOtrEzyrRrTnZFIpIGNb8FvZuZmXCZtlz+dGRseBb5
 Dwm4ntM8yki9w1+C/EkFQ94odGQ6SY1ncacpUHZyeLczp3qCbOSzg+4pALM/2MF8yBQz
 5pY70dkNYBQWZYmcmJJV//io00H8C7EvcXJEPQDIQaNoHDVYlknb0gVEhouk8gNovSfa
 9B9g==
X-Gm-Message-State: AOAM530DBOiV4QNy6N7ua0S30R31gBXKbwkUbOWJ0MapqoBh4Skp0DJh
 dGoHagv1OwJGcbiBNSb4Z6qY3syi/fWCr9LMpsPAqpjiPeQMQMg1McuGHH/Ih3Gb08d3nJVMDRk
 QOcUp9TUH9fZkXPU=
X-Received: by 2002:a1c:1f8a:: with SMTP id
 f132mr10779762wmf.186.1633537327378; 
 Wed, 06 Oct 2021 09:22:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh4InyDd/9fXhujo80/kAa18f9z3iK8mtZdQZQRHvvf4enOn0C66fTbAFtqwfZIvAV/fp+1Q==
X-Received: by 2002:a1c:1f8a:: with SMTP id
 f132mr10779714wmf.186.1633537326990; 
 Wed, 06 Oct 2021 09:22:06 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id b13sm5016430wrv.68.2021.10.06.09.22.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 09:22:06 -0700 (PDT)
Message-ID: <2fe71843-bcbe-cbc7-dfed-d9beb60e9f2b@redhat.com>
Date: Wed, 6 Oct 2021 18:22:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 12/12] meson: show library versions in the summary
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211005164408.288128-1-pbonzini@redhat.com>
 <20211005164408.288128-13-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211005164408.288128-13-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/5/21 18:44, Paolo Bonzini wrote:
> Meson 0.57 allows passing external programs and dependency objects
> to summary().  Use this to show library versions and paths in the
> summary.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  meson.build | 112 +++++++++++++++++++++++++---------------------------
>  1 file changed, 54 insertions(+), 58 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 17e77fe4ef..7b596fdcd9 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2859,13 +2859,13 @@ summary_info = {}
>  summary_info += {'git':               config_host['GIT']}
>  summary_info += {'make':              config_host['MAKE']}
>  summary_info += {'python':            '@0@ (version: @1@)'.format(python.full_path(), python.language_version())}
> -summary_info += {'sphinx-build':      sphinx_build.found()}
> +summary_info += {'sphinx-build':      sphinx_build}
>  if config_host.has_key('HAVE_GDB_BIN')
>    summary_info += {'gdb':             config_host['HAVE_GDB_BIN']}
>  endif
>  summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
>  if targetos == 'windows' and config_host.has_key('CONFIG_GUEST_AGENT')
> -  summary_info += {'wixl':            wixl.found() ? wixl.full_path() : false}
> +  summary_info += {'wixl':            wixl}
>  endif
>  if slirp_opt != 'disabled' and 'CONFIG_SLIRP_SMBD' in config_host
>    summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
> @@ -2956,7 +2956,7 @@ if get_option('cfi')
>    summary_info += {'CFI debug support': get_option('cfi_debug')}
>  endif
>  summary_info += {'strip binaries':    get_option('strip')}
> -summary_info += {'sparse':            sparse.found() ? sparse.full_path() : false}
> +summary_info += {'sparse':            sparse}
>  summary_info += {'mingw32 support':   targetos == 'windows'}
>  
>  # snarf the cross-compilation information for tests
> @@ -3028,19 +3028,19 @@ if have_block
>    summary_info += {'vvfat support':     config_host.has_key('CONFIG_VVFAT')}
>    summary_info += {'qed support':       config_host.has_key('CONFIG_QED')}
>    summary_info += {'parallels support': config_host.has_key('CONFIG_PARALLELS')}
> -  summary_info += {'FUSE exports':      fuse.found()}
> +  summary_info += {'FUSE exports':      fuse}
>  endif
>  summary(summary_info, bool_yn: true, section: 'Block layer support')
>  
>  # Crypto
>  summary_info = {}
>  summary_info += {'TLS priority':      config_host['CONFIG_TLS_PRIORITY']}
> -summary_info += {'GNUTLS support':    gnutls.found()}
> -summary_info += {'GNUTLS crypto':     gnutls_crypto.found()}
> -# TODO: add back version
> -summary_info += {'libgcrypt':         gcrypt.found()}
> -# TODO: add back version
> -summary_info += {'nettle':            nettle.found()}
> +summary_info += {'GNUTLS support':    gnutls}
> +if gnutls.found()
> +  summary_info += {'  GNUTLS crypto':   gnutls_crypto.found()}
> +endif
> +summary_info += {'libgcrypt':         gcrypt}
> +summary_info += {'nettle':            nettle}
>  if nettle.found()
>     summary_info += {'  XTS':             xts != 'private'}
>  endif
> @@ -3052,76 +3052,72 @@ summary(summary_info, bool_yn: true, section: 'Crypto')
>  # Libraries
>  summary_info = {}
>  if targetos == 'darwin'
> -  summary_info += {'Cocoa support':   cocoa.found()}
> +  summary_info += {'Cocoa support':   cocoa}
>  endif
> -# TODO: add back version
> -summary_info += {'SDL support':       sdl.found()}
> -summary_info += {'SDL image support': sdl_image.found()}
> -# TODO: add back version
> -summary_info += {'GTK support':       gtk.found()}
> -summary_info += {'pixman':            pixman.found()}
> -# TODO: add back version
> -summary_info += {'VTE support':       vte.found()}
> -# TODO: add back version
> -summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
> -summary_info += {'libtasn1':          tasn1.found()}
> -summary_info += {'PAM':               pam.found()}
> -summary_info += {'iconv support':     iconv.found()}
> -summary_info += {'curses support':    curses.found()}
> -# TODO: add back version
> -summary_info += {'virgl support':     virgl.found()}
> -summary_info += {'curl support':      curl.found()}
> -summary_info += {'Multipath support': mpathpersist.found()}
> -summary_info += {'VNC support':       vnc.found()}
> +summary_info += {'SDL support':       sdl}
> +summary_info += {'SDL image support': sdl_image}
> +summary_info += {'GTK support':       gtk}
> +summary_info += {'pixman':            pixman}
> +summary_info += {'VTE support':       vte}
> +summary_info += {'slirp support':     slirp_opt == 'internal' ? slirp_opt : slirp}
> +summary_info += {'libtasn1':          tasn1}
> +summary_info += {'PAM':               pam}
> +summary_info += {'iconv support':     iconv}
> +summary_info += {'curses support':    curses}
> +summary_info += {'virgl support':     virgl}
> +summary_info += {'curl support':      curl}
> +summary_info += {'Multipath support': mpathpersist}
> +summary_info += {'VNC support':       vnc}
>  if vnc.found()
> -  summary_info += {'VNC SASL support':  sasl.found()}
> -  summary_info += {'VNC JPEG support':  jpeg.found()}
> -  summary_info += {'VNC PNG support':   png.found()}
> +  summary_info += {'VNC SASL support':  sasl}
> +  summary_info += {'VNC JPEG support':  jpeg}
> +  summary_info += {'VNC PNG support':   png}
>  endif
> -summary_info += {'brlapi support':    brlapi.found()}
> +summary_info += {'brlapi support':    brlapi}
>  summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
>  summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
>  summary_info += {'Linux AIO support': config_host.has_key('CONFIG_LINUX_AIO')}
> -summary_info += {'Linux io_uring support': linux_io_uring.found()}
> -summary_info += {'ATTR/XATTR support': libattr.found()}
> +summary_info += {'Linux io_uring support': linux_io_uring}
> +summary_info += {'ATTR/XATTR support': libattr}
>  summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
>  summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
>  summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
> -summary_info += {'libcap-ng support': libcap_ng.found()}
> -summary_info += {'bpf support': libbpf.found()}
> +summary_info += {'libcap-ng support': libcap_ng}
> +summary_info += {'bpf support':       libbpf}
>  # TODO: add back protocol and server version
>  summary_info += {'spice support':     config_host.has_key('CONFIG_SPICE')}
> -summary_info += {'rbd support':       rbd.found()}
> +summary_info += {'rbd support':       rbd}
>  summary_info += {'xfsctl support':    config_host.has_key('CONFIG_XFS')}
> -summary_info += {'smartcard support': cacard.found()}
> -summary_info += {'U2F support':       u2f.found()}
> -summary_info += {'libusb':            libusb.found()}
> -summary_info += {'usb net redir':     usbredir.found()}
> +summary_info += {'smartcard support': cacard}
> +summary_info += {'U2F support':       u2f}
> +summary_info += {'libusb':            libusb}
> +summary_info += {'usb net redir':     usbredir}
>  summary_info += {'OpenGL support':    config_host.has_key('CONFIG_OPENGL')}
> -summary_info += {'GBM':               gbm.found()}
> -summary_info += {'libiscsi support':  libiscsi.found()}
> -summary_info += {'libnfs support':    libnfs.found()}
> +summary_info += {'GBM':               gbm}
> +summary_info += {'libiscsi support':  libiscsi}
> +summary_info += {'libnfs support':    libnfs}
>  if targetos == 'windows'
>    if config_host.has_key('CONFIG_GUEST_AGENT')
>      summary_info += {'QGA VSS support':   config_host.has_key('CONFIG_QGA_VSS')}
>      summary_info += {'QGA w32 disk info': config_host.has_key('CONFIG_QGA_NTDDSCSI')}
>    endif
>  endif
> -summary_info += {'seccomp support':   seccomp.found()}
> -summary_info += {'GlusterFS support': glusterfs.found()}
> +summary_info += {'seccomp support':   seccomp}
> +summary_info += {'GlusterFS support': glusterfs}
>  summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
>  summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
> -summary_info += {'lzo support':       lzo.found()}
> -summary_info += {'snappy support':    snappy.found()}
> -summary_info += {'bzip2 support':     libbzip2.found()}
> -summary_info += {'lzfse support':     liblzfse.found()}
> -summary_info += {'zstd support':      zstd.found()}
> +summary_info += {'lzo support':       lzo}
> +summary_info += {'snappy support':    snappy}
> +summary_info += {'bzip2 support':     libbzip2}
> +summary_info += {'lzfse support':     liblzfse}
> +summary_info += {'zstd support':      zstd}
>  summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
> -summary_info += {'libxml2':           libxml2.found()}
> -summary_info += {'capstone':          capstone_opt == 'disabled' ? false : capstone_opt}
> -summary_info += {'libpmem support':   libpmem.found()}
> -summary_info += {'libdaxctl support': libdaxctl.found()}
> -summary_info += {'libudev':           libudev.found()}
> +summary_info += {'libxml2':           libxml2}
> +summary_info += {'capstone':          capstone_opt == 'internal' ? capstone_opt : capstone}
> +summary_info += {'libpmem support':   libpmem}
> +summary_info += {'libdaxctl support': libdaxctl}
> +summary_info += {'libudev':           libudev}
> +# Dummy dependency, keep .found()
>  summary_info += {'FUSE lseek':        fuse_lseek.found()}
>  summary(summary_info, bool_yn: true, section: 'Dependencies')

There seems to be something wrong here:

The Meson build system
Version: 0.59.1
[..]
    rbd support                  : YES
    xfsctl support               : NO
    smartcard support            : [<mesonbuild.mlog.AnsiDecorator
object at 0x7f00880538e0>, ' ', <mesonbuild.mlog.AnsiDecorator object at
0x7f0087ee6850>]
    U2F support                  : NO
    libusb                       : [<mesonbuild.mlog.AnsiDecorator
object at 0x7f0087cda910>, ' ', <mesonbuild.mlog.AnsiDecorator object at
0x7f0087cdaf40>]
    usb net redir                : [<mesonbuild.mlog.AnsiDecorator
object at 0x7f0087e3d730>, ' ', <mesonbuild.mlog.AnsiDecorator object at
0x7f0087e3d700>]
    OpenGL support               : YES
    GBM                          : [<mesonbuild.mlog.AnsiDecorator
object at 0x7f0087e3d970>, ' ', <mesonbuild.mlog.AnsiDecorator object at
0x7f0087db3c70>]
    libiscsi support             : [<mesonbuild.mlog.AnsiDecorator
object at 0x7f0087db9dc0>, ' ', <mesonbuild.mlog.AnsiDecorator object at
0x7f0087db9400>]
    libnfs support               : NO
    seccomp support              : [<mesonbuild.mlog.AnsiDecorator
object at 0x7f0087db9a60>, ' ', <mesonbuild.mlog.AnsiDecorator object at
0x7f00879eeb50>]
    GlusterFS support            : [<mesonbuild.mlog.AnsiDecorator
object at 0x7f00879eef40>, ' ', <mesonbuild.mlog.AnsiDecorator object at
0x7f00879ee850>]
    TPM support                  : YES
    libssh support               : YES
    lzo support                  : YES
    snappy support               : YES
    bzip2 support                : YES
    lzfse support                : NO
    zstd support                 : [<mesonbuild.mlog.AnsiDecorator
object at 0x7f0087c914f0>, ' ', <mesonbuild.mlog.AnsiDecorator object at
0x7f0087c912e0>]
    NUMA host support            : YES
    libxml2                      : [<mesonbuild.mlog.AnsiDecorator
object at 0x7f0087c91700>, ' ', <mesonbuild.mlog.AnsiDecorator object at
0x7f0087deaf40>]
    capstone                     : [<mesonbuild.mlog.AnsiDecorator
object at 0x7f0087ffba00>, ' ', <mesonbuild.mlog.AnsiDecorator object at
0x7f0087c7cbb0>]
    libpmem support              : [<mesonbuild.mlog.AnsiDecorator
object at 0x7f0087d16100>, ' ', <mesonbuild.mlog.AnsiDecorator object at
0x7f0087d169a0>]
    libdaxctl support            : NO
    libudev                      : [<mesonbuild.mlog.AnsiDecorator
object at 0x7f0087e66a30>, ' ', <mesonbuild.mlog.AnsiDecorator object at
0x7f0087ad0670>]
    FUSE lseek                   : NO


