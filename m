Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF33D425E4A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:57:28 +0200 (CEST)
Received: from localhost ([::1]:40152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaSF-0006uC-O4
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDg-0005so-Mw
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:24 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDa-0006De-AQ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:23 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v25so22813856wra.2
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 13:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3GtPQVYcQZHGNLfsgJ3bCr4rjeI68iTGsX5LONJQOf8=;
 b=nHxnAGVyGCieDrPJQzwCvr6ta00wrolIMJKNSRJbOOJOSAD01BrYJy8W0T5RxEGD0G
 ya6exdjAOdec2rZwld9Tqyicq3vwbVfECU5liPbjESLDCDslt1SMLeOj8+xg+ouPjD57
 mvLE7n42152Dj5FcvSNPomMxX38cMGWaWMLzEOE4mjPY8meOfLXsd2R4kDc+th0hobTP
 +aAB4B9Nvtq3yy2qqvouyK1Lx1YDGVIMS9HXzIt8xQ/SI9ogOoVQ9OeAExaBwYM2/5UG
 g0sF98swABCn1dCbDJrN3xPRVeo1OQONHbHPEbiH/ZD0dkopvX0P45GdXb4B44j1RM0f
 lOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3GtPQVYcQZHGNLfsgJ3bCr4rjeI68iTGsX5LONJQOf8=;
 b=64d6/D54IquJmESvBkQYgTnpyiZyIV1O3RCq5N1tm0AcG4ARBrVSnLWzZvsaHKdfI6
 TRb1OGzE7XAS6iInuWtSsQVDoolVtIqrNSehiKWGKQ7QQLQMTaVIAP7ae3AzVwvvsqPI
 /bX8+gMRzg8MqIZ/w6JqIeRl/ZNJqlEr6PgV0RoR3cI6vOoWAde/tsP1bN3VYerFkUgh
 0u9XvBRM67S7xqHrEKLCTdGgUmF4FlCMSmONTMnYNacfpGJ7XkPLAP/IWGxW0UP9yhN6
 UwtDE7VUyXWrik1AkfqO+3XZKI72l1YUNByDqTNdJdmuOX1DEEY4Ph9Zv3vSdUYqRVNs
 1NAA==
X-Gm-Message-State: AOAM5304QauvMD/1wdpTibXqIKJGxNn65ombVYMgXV2h3SLEzZ9EFgt0
 5ZZT43Jp0gsycQWGzLS84tCC0MAePBTB4/KuI1AiAArz
X-Google-Smtp-Source: ABdhPJyi5YNqVCQh8jKljeRAlqIaCLjlTzYeIOYGA1anWYs35TJ2wDDOn6JW7nSnQXH0H0PO8fR6pREeBYxp/YOmAtc=
X-Received: by 2002:a1c:a5cd:: with SMTP id o196mr7233146wme.96.1633639335900; 
 Thu, 07 Oct 2021 13:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-4-pbonzini@redhat.com>
In-Reply-To: <20211007130829.632254-4-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 00:41:59 +0400
Message-ID: <CAJ+F1CJSKBqhVxMS4qqD5MCq+qMzhvCW-xZ=Y=g5Sg1BQ34UoQ@mail.gmail.com>
Subject: Re: [PATCH 09/24] trace: move configuration from configure to Meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004eb92f05cdc94cd2"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004eb92f05cdc94cd2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2021 at 5:17 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  configure           | 91 +--------------------------------------------
>  docs/meson.build    |  2 +-
>  meson.build         | 51 +++++++++++++++++++++----
>  meson_options.txt   |  6 +++
>  scripts/meson.build |  2 +-
>  trace/meson.build   | 15 +++++---
>  6 files changed, 61 insertions(+), 106 deletions(-)
>
> diff --git a/configure b/configure
> index 98723db0cd..4bfc5e350d 100755
> --- a/configure
> +++ b/configure
> @@ -216,10 +216,6 @@ version_ge () {
>      done
>  }
>
> -have_backend () {
> -    echo "$trace_backends" | grep "$1" >/dev/null
> -}
> -
>  glob() {
>      eval test -z '"${1#'"$2"'}"'
>  }
> @@ -3512,56 +3508,6 @@ case "$capstone" in
>      ;;
>  esac
>
> -##########################################
> -# check if we have posix_syslog
> -
> -posix_syslog=3Dno
> -cat > $TMPC << EOF
> -#include <syslog.h>
> -int main(void) { openlog("qemu", LOG_PID, LOG_DAEMON); syslog(LOG_INFO,
> "configure"); return 0; }
> -EOF
> -if compile_prog "" "" ; then
> -    posix_syslog=3Dyes
> -fi
> -
> -##########################################
> -# check if trace backend exists
> -
> -$python "$source_path/scripts/tracetool.py" "--backends=3D$trace_backend=
s"
> --check-backends  > /dev/null 2> /dev/null
> -if test "$?" -ne 0 ; then
> -  error_exit "invalid trace backends" \
> -      "Please choose supported trace backends."
> -fi
> -
> -##########################################
> -# For 'ust' backend, test if ust headers are present
> -if have_backend "ust"; then
> -  if $pkg_config lttng-ust --exists; then
> -    lttng_ust_libs=3D$($pkg_config --libs lttng-ust)
> -  else
> -    error_exit "Trace backend 'ust' missing lttng-ust header files"
> -  fi
> -fi
> -
> -##########################################
> -# For 'dtrace' backend, test if 'dtrace' command is present
> -if have_backend "dtrace"; then
> -  if ! has 'dtrace' ; then
> -    error_exit "dtrace command is not found in PATH $PATH"
> -  fi
> -  trace_backend_stap=3D"no"
> -  if has 'stap' ; then
> -    trace_backend_stap=3D"yes"
> -
> -    # Workaround to avoid dtrace(1) producing a file with 'hidden' symbo=
l
> -    # visibility. Define STAP_SDT_V2 to produce 'default' symbol
> visibility
> -    # instead. QEMU --enable-modules depends on this because the SystemT=
ap
> -    # semaphores are linked into the main binary and not the module's
> shared
> -    # object.
> -    QEMU_CFLAGS=3D"$QEMU_CFLAGS -DSTAP_SDT_V2"
> -  fi
> -fi
> -
>  ##########################################
>  # check and set a backend for coroutine
>
> @@ -4572,42 +4518,6 @@ if test "$tpm" =3D "yes"; then
>    echo 'CONFIG_TPM=3Dy' >> $config_host_mak
>  fi
>
> -echo "TRACE_BACKENDS=3D$trace_backends" >> $config_host_mak
> -if have_backend "nop"; then
> -  echo "CONFIG_TRACE_NOP=3Dy" >> $config_host_mak
> -fi
> -if have_backend "simple"; then
> -  echo "CONFIG_TRACE_SIMPLE=3Dy" >> $config_host_mak
> -fi
> -if have_backend "log"; then
> -  echo "CONFIG_TRACE_LOG=3Dy" >> $config_host_mak
> -fi
> -if have_backend "ust"; then
> -  echo "CONFIG_TRACE_UST=3Dy" >> $config_host_mak
> -  echo "LTTNG_UST_LIBS=3D$lttng_ust_libs" >> $config_host_mak
> -fi
> -if have_backend "dtrace"; then
> -  echo "CONFIG_TRACE_DTRACE=3Dy" >> $config_host_mak
> -  if test "$trace_backend_stap" =3D "yes" ; then
> -    echo "CONFIG_TRACE_SYSTEMTAP=3Dy" >> $config_host_mak
> -  fi
> -fi
> -if have_backend "ftrace"; then
> -  if test "$linux" =3D "yes" ; then
> -    echo "CONFIG_TRACE_FTRACE=3Dy" >> $config_host_mak
> -  else
> -    feature_not_found "ftrace(trace backend)" "ftrace requires Linux"
> -  fi
> -fi
> -if have_backend "syslog"; then
> -  if test "$posix_syslog" =3D "yes" ; then
> -    echo "CONFIG_TRACE_SYSLOG=3Dy" >> $config_host_mak
> -  else
> -    feature_not_found "syslog(trace backend)" "syslog not available"
> -  fi
> -fi
> -echo "CONFIG_TRACE_FILE=3D$trace_file" >> $config_host_mak
> -
>  if test "$rdma" =3D "yes" ; then
>    echo "CONFIG_RDMA=3Dy" >> $config_host_mak
>    echo "RDMA_LIBS=3D$rdma_libs" >> $config_host_mak
> @@ -4990,6 +4900,7 @@ if test "$skip_meson" =3D no; then
>          $(if test "$default_feature" =3D no; then echo
> "-Dauto_features=3Ddisabled"; fi) \
>          -Dalsa=3D$alsa -Dcoreaudio=3D$coreaudio -Ddsound=3D$dsound -Djac=
k=3D$jack
> -Doss=3D$oss \
>          -Dpa=3D$pa -Daudio_drv_list=3D$audio_drv_list
> -Dtcg_interpreter=3D$tcg_interpreter \
> +        -Dtrace_backends=3D$trace_backends -Dtrace_file=3D$trace_file \
>          $cross_arg \
>          "$PWD" "$source_path"
>
> diff --git a/docs/meson.build b/docs/meson.build
> index be4dc30f39..19cce670a2 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -57,7 +57,7 @@ if build_docs
>          'qemu-nbd.8': (have_tools ? 'man8' : ''),
>          'qemu-pr-helper.8': (have_tools ? 'man8' : ''),
>          'qemu-storage-daemon.1': (have_tools ? 'man1' : ''),
> -        'qemu-trace-stap.1':
> (config_host.has_key('CONFIG_TRACE_SYSTEMTAP') ? 'man1' : ''),
> +        'qemu-trace-stap.1': (stap.found() ? 'man1' : ''),
>          'virtfs-proxy-helper.1': (have_virtfs_proxy_helper ? 'man1' : ''=
),
>          'virtiofsd.1': (have_virtiofsd ? 'man1' : ''),
>          'qemu.1': 'man1',
> diff --git a/meson.build b/meson.build
> index 8752b757cc..98fa4b68d9 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -111,6 +111,22 @@ foreach target : edk2_targets
>    endif
>  endforeach
>
> +dtrace =3D not_found
> +stap =3D not_found
> +if 'dtrace' in get_option('trace_backends')
> +  dtrace =3D find_program('dtrace', required: true)
> +  stap =3D find_program('stap', required: false)
> +  if stap.found()
> +    # Workaround to avoid dtrace(1) producing a file with 'hidden' symbo=
l
> +    # visibility. Define STAP_SDT_V2 to produce 'default' symbol
> visibility
> +    # instead. QEMU --enable-modules depends on this because the SystemT=
ap
> +    # semaphores are linked into the main binary and not the module's
> shared
> +    # object.
> +    add_global_arguments('-DSTAP_SDT_V2',
> +                         native: false, language: ['c', 'cpp', 'objc'])
> +  endif
> +endif
> +
>  ##################
>  # Compiler flags #
>  ##################
> @@ -201,6 +217,19 @@ if get_option('fuzzing') and
> get_option('fuzzing_engine') =3D=3D '' and \
>    error('Your compiler does not support -fsanitize=3Dfuzzer')
>  endif
>
> +if 'ftrace' in get_option('trace_backends') and targetos !=3D 'linux'
> +  error('ftrace is supported only on Linux')
> +endif
> +if 'syslog' in get_option('trace_backends') and not cc.compiles('''
> +    #include <syslog.h>
> +    int main(void) {
> +        openlog("qemu", LOG_PID, LOG_DAEMON);
> +        syslog(LOG_INFO, "configure");
> +        return 0;
> +    }''')
> +  error('syslog is not supported on this system')
> +endif
> +
>  if targetos !=3D 'linux' and get_option('mpath').enabled()
>    error('Multipath is supported only on Linux')
>  endif
> @@ -361,8 +390,9 @@ if 'CONFIG_GIO' in config_host
>                             link_args: config_host['GIO_LIBS'].split())
>  endif
>  lttng =3D not_found
> -if 'CONFIG_TRACE_UST' in config_host
> -  lttng =3D declare_dependency(link_args:
> config_host['LTTNG_UST_LIBS'].split())
> +if 'ust' in get_option('trace_backends')
> +  lttng =3D dependency('lttng-ust', required: true, method: 'pkg-config'=
,
> +                     kwargs: static_kwargs)
>  endif
>  pixman =3D not_found
>  if have_system or have_tools
> @@ -1349,6 +1379,11 @@ elif get_option('virtfs').disabled()
>    have_virtfs =3D false
>  endif
>
> +foreach k : get_option('trace_backends')
> +  config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)
> +endforeach
> +config_host_data.set_quoted('CONFIG_TRACE_FILE', get_option('trace_file'=
))
> +
>  config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') /
> get_option('bindir'))
>  config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
>  config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') =
/
> qemu_confdir)
> @@ -1574,7 +1609,7 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not
> cc.compiles('''
>
>  ignored =3D ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
>  arrays =3D ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
> -strings =3D ['HOST_DSOSUF', 'CONFIG_IASL', 'CONFIG_TRACE_FILE']
> +strings =3D ['HOST_DSOSUF', 'CONFIG_IASL']
>  foreach k, v: config_host
>    if ignored.contains(k)
>      # do nothing
> @@ -2112,7 +2147,7 @@ qapi_gen_depends =3D [ meson.current_source_dir() /
> 'scripts/qapi/__init__.py',
>
>  tracetool =3D [
>    python, files('scripts/tracetool.py'),
> -   '--backend=3D' + config_host['TRACE_BACKENDS']
> +   '--backend=3D' + ','.join(get_option('trace_backends'))
>  ]
>  tracetool_depends =3D files(
>    'scripts/tracetool/backend/log.py',
> @@ -2831,7 +2866,7 @@ foreach target : target_dirs
>        emulators +=3D {exe['name']: emulator}
>      endif
>
> -    if 'CONFIG_TRACE_SYSTEMTAP' in config_host
> +    if stap.found()
>        foreach stp: [
>          {'ext': '.stp-build', 'fmt': 'stap', 'bin':
> meson.current_build_dir() / exe['name'], 'install': false},
>          {'ext': '.stp', 'fmt': 'stap', 'bin': get_option('prefix') /
> get_option('bindir') / exe['name'], 'install': true},
> @@ -3012,9 +3047,9 @@ summary_info +=3D {'fuzzing support':
>  get_option('fuzzing')}
>  if have_system
>    summary_info +=3D {'Audio drivers':     ' '.join(audio_drivers_selecte=
d)}
>  endif
> -summary_info +=3D {'Trace backends':    config_host['TRACE_BACKENDS']}
> -if config_host['TRACE_BACKENDS'].split().contains('simple')
> -  summary_info +=3D {'Trace output file': config_host['CONFIG_TRACE_FILE=
']
> + '-<pid>'}
> +summary_info +=3D {'Trace backends':
> ','.join(get_option('trace_backends'))}
> +if 'simple' in get_option('trace_backends')
> +  summary_info +=3D {'Trace output file': get_option('trace_file') +
> '-<pid>'}
>  endif
>  summary_info +=3D {'QOM debugging':
>  config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
>  summary_info +=3D {'vhost-kernel support':
> config_host.has_key('CONFIG_VHOST_KERNEL')}
> diff --git a/meson_options.txt b/meson_options.txt
> index 100c30e967..8f9c3b5b17 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -13,6 +13,8 @@ option('audio_drv_list', type: 'array', value:
> ['default'],
>         description: 'Set audio driver list')
>  option('fuzzing_engine', type : 'string', value : '',
>         description: 'fuzzing engine library for OSS-Fuzz')
> +option('trace_file', type: 'string', value: 'trace',
> +       description: 'Trace file prefix for simple backend')
>
>  option('docs', type : 'feature', value : 'auto',
>         description: 'Documentations build support')
> @@ -146,6 +148,10 @@ option('fuse', type: 'feature', value: 'auto',
>  option('fuse_lseek', type : 'feature', value : 'auto',
>         description: 'SEEK_HOLE/SEEK_DATA support for FUSE exports')
>
> +option('trace_backends', type: 'array', value: ['log'],
> +       choices: ['dtrace', 'ftrace', 'log', 'nop', 'simple', 'syslog',
> 'ust'],
> +       description: 'Set available tracing backends')
> +
>  option('alsa', type: 'feature', value: 'auto',
>         description: 'ALSA sound support')
>  option('coreaudio', type: 'feature', value: 'auto',
> diff --git a/scripts/meson.build b/scripts/meson.build
> index e8cc63896d..1c89e10a76 100644
> --- a/scripts/meson.build
> +++ b/scripts/meson.build
> @@ -1,3 +1,3 @@
> -if 'CONFIG_TRACE_SYSTEMTAP' in config_host
> +if stap.found()
>    install_data('qemu-trace-stap', install_dir: get_option('bindir'))
>  endif
> diff --git a/trace/meson.build b/trace/meson.build
> index b8f95de200..573dd699c6 100644
> --- a/trace/meson.build
> +++ b/trace/meson.build
> @@ -2,7 +2,6 @@
>  specific_ss.add(files('control-target.c'))
>
>  trace_events_files =3D []
> -dtrace =3D find_program('dtrace', required: 'CONFIG_TRACE_DTRACE' in
> config_host)
>  foreach dir : [ '.' ] + trace_events_subdirs
>    trace_events_file =3D meson.project_source_root() / dir / 'trace-event=
s'
>    trace_events_files +=3D [ trace_events_file ]
> @@ -21,7 +20,7 @@ foreach dir : [ '.' ] + trace_events_subdirs
>                            input: trace_events_file,
>                            command: [ tracetool, group, '--format=3Dc',
> '@INPUT@', '@OUTPUT@' ],
>                            depend_files: tracetool_depends)
> -  if 'CONFIG_TRACE_UST' in config_host
> +  if 'ust' in get_option('trace_backends')
>      trace_ust_h =3D custom_target(fmt.format('trace-ust', 'h'),
>                                  output: fmt.format('trace-ust', 'h'),
>                                  input: trace_events_file,
> @@ -31,7 +30,7 @@ foreach dir : [ '.' ] + trace_events_subdirs
>      genh +=3D trace_ust_h
>    endif
>    trace_ss.add(trace_h, trace_c)
> -  if 'CONFIG_TRACE_DTRACE' in config_host
> +  if 'dtrace' in get_option('trace_backends')
>      trace_dtrace =3D custom_target(fmt.format('trace-dtrace', 'dtrace'),
>                                   output: fmt.format('trace-dtrace',
> 'dtrace'),
>                                   input: trace_events_file,
> @@ -76,7 +75,7 @@ foreach d : [
>    specific_ss.add(when: 'CONFIG_TCG', if_true: gen)
>  endforeach
>
> -if 'CONFIG_TRACE_UST' in config_host
> +if 'ust' in get_option('trace_backends')
>    trace_ust_all_h =3D custom_target('trace-ust-all.h',
>                                    output: 'trace-ust-all.h',
>                                    input: trace_events_files,
> @@ -91,7 +90,11 @@ if 'CONFIG_TRACE_UST' in config_host
>    genh +=3D trace_ust_all_h
>  endif
>
> -trace_ss.add(when: 'CONFIG_TRACE_SIMPLE', if_true: files('simple.c'))
> -trace_ss.add(when: 'CONFIG_TRACE_FTRACE', if_true: files('ftrace.c'))
> +if 'simple' in get_option('trace_backends')
> +  trace_ss.add(files('simple.c'))
> +endif
> +if 'ftrace' in get_option('trace_backends')
> +  trace_ss.add(files('ftrace.c'))
> +endif
>  trace_ss.add(files('control.c'))
>  trace_ss.add(files('qmp.c'))
> --
> 2.31.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000004eb92f05cdc94cd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 5:17 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Cc: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com"=
 target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><div>lgtm<br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=
=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@=
redhat.com</a>&gt;</div><div><br></div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 91 +-------------=
-------------------------------<br>
=C2=A0docs/meson.build=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 51 +++++++++++++++++++=
++----<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0|=C2=A0 6 +++<br>
=C2=A0scripts/meson.build |=C2=A0 2 +-<br>
=C2=A0trace/meson.build=C2=A0 =C2=A0| 15 +++++---<br>
=C2=A06 files changed, 61 insertions(+), 106 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 98723db0cd..4bfc5e350d 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -216,10 +216,6 @@ version_ge () {<br>
=C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0}<br>
<br>
-have_backend () {<br>
-=C2=A0 =C2=A0 echo &quot;$trace_backends&quot; | grep &quot;$1&quot; &gt;/=
dev/null<br>
-}<br>
-<br>
=C2=A0glob() {<br>
=C2=A0 =C2=A0 =C2=A0eval test -z &#39;&quot;${1#&#39;&quot;$2&quot;&#39;}&q=
uot;&#39;<br>
=C2=A0}<br>
@@ -3512,56 +3508,6 @@ case &quot;$capstone&quot; in<br>
=C2=A0 =C2=A0 =C2=A0;;<br>
=C2=A0esac<br>
<br>
-##########################################<br>
-# check if we have posix_syslog<br>
-<br>
-posix_syslog=3Dno<br>
-cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;syslog.h&gt;<br>
-int main(void) { openlog(&quot;qemu&quot;, LOG_PID, LOG_DAEMON); syslog(LO=
G_INFO, &quot;configure&quot;); return 0; }<br>
-EOF<br>
-if compile_prog &quot;&quot; &quot;&quot; ; then<br>
-=C2=A0 =C2=A0 posix_syslog=3Dyes<br>
-fi<br>
-<br>
-##########################################<br>
-# check if trace backend exists<br>
-<br>
-$python &quot;$source_path/scripts/tracetool.py&quot; &quot;--backends=3D$=
trace_backends&quot; --check-backends=C2=A0 &gt; /dev/null 2&gt; /dev/null<=
br>
-if test &quot;$?&quot; -ne 0 ; then<br>
-=C2=A0 error_exit &quot;invalid trace backends&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 &quot;Please choose supported trace backends.&quot;<b=
r>
-fi<br>
-<br>
-##########################################<br>
-# For &#39;ust&#39; backend, test if ust headers are present<br>
-if have_backend &quot;ust&quot;; then<br>
-=C2=A0 if $pkg_config lttng-ust --exists; then<br>
-=C2=A0 =C2=A0 lttng_ust_libs=3D$($pkg_config --libs lttng-ust)<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 error_exit &quot;Trace backend &#39;ust&#39; missing lttng-u=
st header files&quot;<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
-##########################################<br>
-# For &#39;dtrace&#39; backend, test if &#39;dtrace&#39; command is presen=
t<br>
-if have_backend &quot;dtrace&quot;; then<br>
-=C2=A0 if ! has &#39;dtrace&#39; ; then<br>
-=C2=A0 =C2=A0 error_exit &quot;dtrace command is not found in PATH $PATH&q=
uot;<br>
-=C2=A0 fi<br>
-=C2=A0 trace_backend_stap=3D&quot;no&quot;<br>
-=C2=A0 if has &#39;stap&#39; ; then<br>
-=C2=A0 =C2=A0 trace_backend_stap=3D&quot;yes&quot;<br>
-<br>
-=C2=A0 =C2=A0 # Workaround to avoid dtrace(1) producing a file with &#39;h=
idden&#39; symbol<br>
-=C2=A0 =C2=A0 # visibility. Define STAP_SDT_V2 to produce &#39;default&#39=
; symbol visibility<br>
-=C2=A0 =C2=A0 # instead. QEMU --enable-modules depends on this because the=
 SystemTap<br>
-=C2=A0 =C2=A0 # semaphores are linked into the main binary and not the mod=
ule&#39;s shared<br>
-=C2=A0 =C2=A0 # object.<br>
-=C2=A0 =C2=A0 QEMU_CFLAGS=3D&quot;$QEMU_CFLAGS -DSTAP_SDT_V2&quot;<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# check and set a backend for coroutine<br>
<br>
@@ -4572,42 +4518,6 @@ if test &quot;$tpm&quot; =3D &quot;yes&quot;; then<b=
r>
=C2=A0 =C2=A0echo &#39;CONFIG_TPM=3Dy&#39; &gt;&gt; $config_host_mak<br>
=C2=A0fi<br>
<br>
-echo &quot;TRACE_BACKENDS=3D$trace_backends&quot; &gt;&gt; $config_host_ma=
k<br>
-if have_backend &quot;nop&quot;; then<br>
-=C2=A0 echo &quot;CONFIG_TRACE_NOP=3Dy&quot; &gt;&gt; $config_host_mak<br>
-fi<br>
-if have_backend &quot;simple&quot;; then<br>
-=C2=A0 echo &quot;CONFIG_TRACE_SIMPLE=3Dy&quot; &gt;&gt; $config_host_mak<=
br>
-fi<br>
-if have_backend &quot;log&quot;; then<br>
-=C2=A0 echo &quot;CONFIG_TRACE_LOG=3Dy&quot; &gt;&gt; $config_host_mak<br>
-fi<br>
-if have_backend &quot;ust&quot;; then<br>
-=C2=A0 echo &quot;CONFIG_TRACE_UST=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;LTTNG_UST_LIBS=3D$lttng_ust_libs&quot; &gt;&gt; $config_=
host_mak<br>
-fi<br>
-if have_backend &quot;dtrace&quot;; then<br>
-=C2=A0 echo &quot;CONFIG_TRACE_DTRACE=3Dy&quot; &gt;&gt; $config_host_mak<=
br>
-=C2=A0 if test &quot;$trace_backend_stap&quot; =3D &quot;yes&quot; ; then<=
br>
-=C2=A0 =C2=A0 echo &quot;CONFIG_TRACE_SYSTEMTAP=3Dy&quot; &gt;&gt; $config=
_host_mak<br>
-=C2=A0 fi<br>
-fi<br>
-if have_backend &quot;ftrace&quot;; then<br>
-=C2=A0 if test &quot;$linux&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 echo &quot;CONFIG_TRACE_FTRACE=3Dy&quot; &gt;&gt; $config_ho=
st_mak<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 feature_not_found &quot;ftrace(trace backend)&quot; &quot;ft=
race requires Linux&quot;<br>
-=C2=A0 fi<br>
-fi<br>
-if have_backend &quot;syslog&quot;; then<br>
-=C2=A0 if test &quot;$posix_syslog&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 echo &quot;CONFIG_TRACE_SYSLOG=3Dy&quot; &gt;&gt; $config_ho=
st_mak<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 feature_not_found &quot;syslog(trace backend)&quot; &quot;sy=
slog not available&quot;<br>
-=C2=A0 fi<br>
-fi<br>
-echo &quot;CONFIG_TRACE_FILE=3D$trace_file&quot; &gt;&gt; $config_host_mak=
<br>
-<br>
=C2=A0if test &quot;$rdma&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_RDMA=3Dy&quot; &gt;&gt; $config_host_mak<br>
=C2=A0 =C2=A0echo &quot;RDMA_LIBS=3D$rdma_libs&quot; &gt;&gt; $config_host_=
mak<br>
@@ -4990,6 +4900,7 @@ if test &quot;$skip_meson&quot; =3D no; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(if test &quot;$default_feature&quot; =
=3D no; then echo &quot;-Dauto_features=3Ddisabled&quot;; fi) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dalsa=3D$alsa -Dcoreaudio=3D$coreaudio -=
Ddsound=3D$dsound -Djack=3D$jack -Doss=3D$oss \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dpa=3D$pa -Daudio_drv_list=3D$audio_drv_=
list -Dtcg_interpreter=3D$tcg_interpreter \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dtrace_backends=3D$trace_backends -Dtrace_fil=
e=3D$trace_file \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$cross_arg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PWD&quot; &quot;$source_path&quot;=
<br>
<br>
diff --git a/docs/meson.build b/docs/meson.build<br>
index be4dc30f39..19cce670a2 100644<br>
--- a/docs/meson.build<br>
+++ b/docs/meson.build<br>
@@ -57,7 +57,7 @@ if build_docs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;qemu-nbd.8&#39;: (have_tools ? &#39;=
man8&#39; : &#39;&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;qemu-pr-helper.8&#39;: (have_tools ?=
 &#39;man8&#39; : &#39;&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;qemu-storage-daemon.1&#39;: (have_to=
ols ? &#39;man1&#39; : &#39;&#39;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;qemu-trace-stap.1&#39;: (config_host.has_=
key(&#39;CONFIG_TRACE_SYSTEMTAP&#39;) ? &#39;man1&#39; : &#39;&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;qemu-trace-stap.1&#39;: (stap.found() ? &=
#39;man1&#39; : &#39;&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;virtfs-proxy-helper.1&#39;: (have_vi=
rtfs_proxy_helper ? &#39;man1&#39; : &#39;&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;virtiofsd.1&#39;: (have_virtiofsd ? =
&#39;man1&#39; : &#39;&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;qemu.1&#39;: &#39;man1&#39;,<br>
diff --git a/meson.build b/meson.build<br>
index 8752b757cc..98fa4b68d9 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -111,6 +111,22 @@ foreach target : edk2_targets<br>
=C2=A0 =C2=A0endif<br>
=C2=A0endforeach<br>
<br>
+dtrace =3D not_found<br>
+stap =3D not_found<br>
+if &#39;dtrace&#39; in get_option(&#39;trace_backends&#39;)<br>
+=C2=A0 dtrace =3D find_program(&#39;dtrace&#39;, required: true)<br>
+=C2=A0 stap =3D find_program(&#39;stap&#39;, required: false)<br>
+=C2=A0 if stap.found()<br>
+=C2=A0 =C2=A0 # Workaround to avoid dtrace(1) producing a file with &#39;h=
idden&#39; symbol<br>
+=C2=A0 =C2=A0 # visibility. Define STAP_SDT_V2 to produce &#39;default&#39=
; symbol visibility<br>
+=C2=A0 =C2=A0 # instead. QEMU --enable-modules depends on this because the=
 SystemTap<br>
+=C2=A0 =C2=A0 # semaphores are linked into the main binary and not the mod=
ule&#39;s shared<br>
+=C2=A0 =C2=A0 # object.<br>
+=C2=A0 =C2=A0 add_global_arguments(&#39;-DSTAP_SDT_V2&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0native: false, language: [&#39;c&#39;, &#39;cpp&#39;, &#39=
;objc&#39;])<br>
+=C2=A0 endif<br>
+endif<br>
+<br>
=C2=A0##################<br>
=C2=A0# Compiler flags #<br>
=C2=A0##################<br>
@@ -201,6 +217,19 @@ if get_option(&#39;fuzzing&#39;) and get_option(&#39;f=
uzzing_engine&#39;) =3D=3D &#39;&#39; and \<br>
=C2=A0 =C2=A0error(&#39;Your compiler does not support -fsanitize=3Dfuzzer&=
#39;)<br>
=C2=A0endif<br>
<br>
+if &#39;ftrace&#39; in get_option(&#39;trace_backends&#39;) and targetos !=
=3D &#39;linux&#39;<br>
+=C2=A0 error(&#39;ftrace is supported only on Linux&#39;)<br>
+endif<br>
+if &#39;syslog&#39; in get_option(&#39;trace_backends&#39;) and not cc.com=
piles(&#39;&#39;&#39;<br>
+=C2=A0 =C2=A0 #include &lt;syslog.h&gt;<br>
+=C2=A0 =C2=A0 int main(void) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 openlog(&quot;qemu&quot;, LOG_PID, LOG_DAEMON)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 syslog(LOG_INFO, &quot;configure&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }&#39;&#39;&#39;)<br>
+=C2=A0 error(&#39;syslog is not supported on this system&#39;)<br>
+endif<br>
+<br>
=C2=A0if targetos !=3D &#39;linux&#39; and get_option(&#39;mpath&#39;).enab=
led()<br>
=C2=A0 =C2=A0error(&#39;Multipath is supported only on Linux&#39;)<br>
=C2=A0endif<br>
@@ -361,8 +390,9 @@ if &#39;CONFIG_GIO&#39; in config_host<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 link_args: config_host[&#39;GIO_LIBS&#39;].split()=
)<br>
=C2=A0endif<br>
=C2=A0lttng =3D not_found<br>
-if &#39;CONFIG_TRACE_UST&#39; in config_host<br>
-=C2=A0 lttng =3D declare_dependency(link_args: config_host[&#39;LTTNG_UST_=
LIBS&#39;].split())<br>
+if &#39;ust&#39; in get_option(&#39;trace_backends&#39;)<br>
+=C2=A0 lttng =3D dependency(&#39;lttng-ust&#39;, required: true, method: &=
#39;pkg-config&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0kwargs: static_kwargs)<br>
=C2=A0endif<br>
=C2=A0pixman =3D not_found<br>
=C2=A0if have_system or have_tools<br>
@@ -1349,6 +1379,11 @@ elif get_option(&#39;virtfs&#39;).disabled()<br>
=C2=A0 =C2=A0have_virtfs =3D false<br>
=C2=A0endif<br>
<br>
+foreach k : get_option(&#39;trace_backends&#39;)<br>
+=C2=A0 config_host_data.set(&#39;CONFIG_TRACE_&#39; + k.to_upper(), true)<=
br>
+endforeach<br>
+config_host_data.set_quoted(&#39;CONFIG_TRACE_FILE&#39;, get_option(&#39;t=
race_file&#39;))<br>
+<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_BINDIR&#39;, get_option(&#39;=
prefix&#39;) / get_option(&#39;bindir&#39;))<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_PREFIX&#39;, get_option(&#39;=
prefix&#39;))<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_QEMU_CONFDIR&#39;, get_option=
(&#39;prefix&#39;) / qemu_confdir)<br>
@@ -1574,7 +1609,7 @@ config_host_data.set(&#39;HAVE_BROKEN_SIZE_MAX&#39;, =
not cc.compiles(&#39;&#39;&#39;<br>
<br>
=C2=A0ignored =3D [&#39;CONFIG_QEMU_INTERP_PREFIX&#39;] # actually per-targ=
et<br>
=C2=A0arrays =3D [&#39;CONFIG_BDRV_RW_WHITELIST&#39;, &#39;CONFIG_BDRV_RO_W=
HITELIST&#39;]<br>
-strings =3D [&#39;HOST_DSOSUF&#39;, &#39;CONFIG_IASL&#39;, &#39;CONFIG_TRA=
CE_FILE&#39;]<br>
+strings =3D [&#39;HOST_DSOSUF&#39;, &#39;CONFIG_IASL&#39;]<br>
=C2=A0foreach k, v: config_host<br>
=C2=A0 =C2=A0if ignored.contains(k)<br>
=C2=A0 =C2=A0 =C2=A0# do nothing<br>
@@ -2112,7 +2147,7 @@ qapi_gen_depends =3D [ meson.current_source_dir() / &=
#39;scripts/qapi/__init__.py&#39;,<br>
<br>
=C2=A0tracetool =3D [<br>
=C2=A0 =C2=A0python, files(&#39;scripts/tracetool.py&#39;),<br>
-=C2=A0 =C2=A0&#39;--backend=3D&#39; + config_host[&#39;TRACE_BACKENDS&#39;=
]<br>
+=C2=A0 =C2=A0&#39;--backend=3D&#39; + &#39;,&#39;.join(get_option(&#39;tra=
ce_backends&#39;))<br>
=C2=A0]<br>
=C2=A0tracetool_depends =3D files(<br>
=C2=A0 =C2=A0&#39;scripts/tracetool/backend/log.py&#39;,<br>
@@ -2831,7 +2866,7 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0emulators +=3D {exe[&#39;name&#39;]: emulator}<b=
r>
=C2=A0 =C2=A0 =C2=A0endif<br>
<br>
-=C2=A0 =C2=A0 if &#39;CONFIG_TRACE_SYSTEMTAP&#39; in config_host<br>
+=C2=A0 =C2=A0 if stap.found()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0foreach stp: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&#39;ext&#39;: &#39;.stp-build&#39;, &#3=
9;fmt&#39;: &#39;stap&#39;, &#39;bin&#39;: meson.current_build_dir() / exe[=
&#39;name&#39;], &#39;install&#39;: false},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&#39;ext&#39;: &#39;.stp&#39;, &#39;fmt&=
#39;: &#39;stap&#39;, &#39;bin&#39;: get_option(&#39;prefix&#39;) / get_opt=
ion(&#39;bindir&#39;) / exe[&#39;name&#39;], &#39;install&#39;: true},<br>
@@ -3012,9 +3047,9 @@ summary_info +=3D {&#39;fuzzing support&#39;:=C2=A0 =
=C2=A0get_option(&#39;fuzzing&#39;)}<br>
=C2=A0if have_system<br>
=C2=A0 =C2=A0summary_info +=3D {&#39;Audio drivers&#39;:=C2=A0 =C2=A0 =C2=
=A0&#39; &#39;.join(audio_drivers_selected)}<br>
=C2=A0endif<br>
-summary_info +=3D {&#39;Trace backends&#39;:=C2=A0 =C2=A0 config_host[&#39=
;TRACE_BACKENDS&#39;]}<br>
-if config_host[&#39;TRACE_BACKENDS&#39;].split().contains(&#39;simple&#39;=
)<br>
-=C2=A0 summary_info +=3D {&#39;Trace output file&#39;: config_host[&#39;CO=
NFIG_TRACE_FILE&#39;] + &#39;-&lt;pid&gt;&#39;}<br>
+summary_info +=3D {&#39;Trace backends&#39;:=C2=A0 =C2=A0 &#39;,&#39;.join=
(get_option(&#39;trace_backends&#39;))}<br>
+if &#39;simple&#39; in get_option(&#39;trace_backends&#39;)<br>
+=C2=A0 summary_info +=3D {&#39;Trace output file&#39;: get_option(&#39;tra=
ce_file&#39;) + &#39;-&lt;pid&gt;&#39;}<br>
=C2=A0endif<br>
=C2=A0summary_info +=3D {&#39;QOM debugging&#39;:=C2=A0 =C2=A0 =C2=A0config=
_host.has_key(&#39;CONFIG_QOM_CAST_DEBUG&#39;)}<br>
=C2=A0summary_info +=3D {&#39;vhost-kernel support&#39;: config_host.has_ke=
y(&#39;CONFIG_VHOST_KERNEL&#39;)}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 100c30e967..8f9c3b5b17 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -13,6 +13,8 @@ option(&#39;audio_drv_list&#39;, type: &#39;array&#39;, v=
alue: [&#39;default&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Set audio driver list&#39;)<b=
r>
=C2=A0option(&#39;fuzzing_engine&#39;, type : &#39;string&#39;, value : &#3=
9;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;fuzzing engine library for OS=
S-Fuzz&#39;)<br>
+option(&#39;trace_file&#39;, type: &#39;string&#39;, value: &#39;trace&#39=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Trace file prefix for simple =
backend&#39;)<br>
<br>
=C2=A0option(&#39;docs&#39;, type : &#39;feature&#39;, value : &#39;auto&#3=
9;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Documentations build support&=
#39;)<br>
@@ -146,6 +148,10 @@ option(&#39;fuse&#39;, type: &#39;feature&#39;, value:=
 &#39;auto&#39;,<br>
=C2=A0option(&#39;fuse_lseek&#39;, type : &#39;feature&#39;, value : &#39;a=
uto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;SEEK_HOLE/SEEK_DATA support f=
or FUSE exports&#39;)<br>
<br>
+option(&#39;trace_backends&#39;, type: &#39;array&#39;, value: [&#39;log&#=
39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0choices: [&#39;dtrace&#39;, &#39;ftrace&#39;, &=
#39;log&#39;, &#39;nop&#39;, &#39;simple&#39;, &#39;syslog&#39;, &#39;ust&#=
39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Set available tracing backend=
s&#39;)<br>
+<br>
=C2=A0option(&#39;alsa&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;ALSA sound support&#39;)<br>
=C2=A0option(&#39;coreaudio&#39;, type: &#39;feature&#39;, value: &#39;auto=
&#39;,<br>
diff --git a/scripts/meson.build b/scripts/meson.build<br>
index e8cc63896d..1c89e10a76 100644<br>
--- a/scripts/meson.build<br>
+++ b/scripts/meson.build<br>
@@ -1,3 +1,3 @@<br>
-if &#39;CONFIG_TRACE_SYSTEMTAP&#39; in config_host<br>
+if stap.found()<br>
=C2=A0 =C2=A0install_data(&#39;qemu-trace-stap&#39;, install_dir: get_optio=
n(&#39;bindir&#39;))<br>
=C2=A0endif<br>
diff --git a/trace/meson.build b/trace/meson.build<br>
index b8f95de200..573dd699c6 100644<br>
--- a/trace/meson.build<br>
+++ b/trace/meson.build<br>
@@ -2,7 +2,6 @@<br>
=C2=A0specific_ss.add(files(&#39;control-target.c&#39;))<br>
<br>
=C2=A0trace_events_files =3D []<br>
-dtrace =3D find_program(&#39;dtrace&#39;, required: &#39;CONFIG_TRACE_DTRA=
CE&#39; in config_host)<br>
=C2=A0foreach dir : [ &#39;.&#39; ] + trace_events_subdirs<br>
=C2=A0 =C2=A0trace_events_file =3D meson.project_source_root() / dir / &#39=
;trace-events&#39;<br>
=C2=A0 =C2=A0trace_events_files +=3D [ trace_events_file ]<br>
@@ -21,7 +20,7 @@ foreach dir : [ &#39;.&#39; ] + trace_events_subdirs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0input: trace_events_file,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0command: [ tracetool, group, &#39;--format=3Dc&#39;=
, &#39;@INPUT@&#39;, &#39;@OUTPUT@&#39; ],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0depend_files: tracetool_depends)<br>
-=C2=A0 if &#39;CONFIG_TRACE_UST&#39; in config_host<br>
+=C2=A0 if &#39;ust&#39; in get_option(&#39;trace_backends&#39;)<br>
=C2=A0 =C2=A0 =C2=A0trace_ust_h =3D custom_target(fmt.format(&#39;trace-ust=
&#39;, &#39;h&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output: fmt.format(&#39;trace-=
ust&#39;, &#39;h&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input: trace_events_file,<br>
@@ -31,7 +30,7 @@ foreach dir : [ &#39;.&#39; ] + trace_events_subdirs<br>
=C2=A0 =C2=A0 =C2=A0genh +=3D trace_ust_h<br>
=C2=A0 =C2=A0endif<br>
=C2=A0 =C2=A0trace_ss.add(trace_h, trace_c)<br>
-=C2=A0 if &#39;CONFIG_TRACE_DTRACE&#39; in config_host<br>
+=C2=A0 if &#39;dtrace&#39; in get_option(&#39;trace_backends&#39;)<br>
=C2=A0 =C2=A0 =C2=A0trace_dtrace =3D custom_target(fmt.format(&#39;trace-dt=
race&#39;, &#39;dtrace&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output: fmt.format(&#39;trace=
-dtrace&#39;, &#39;dtrace&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input: trace_events_file,<br>
@@ -76,7 +75,7 @@ foreach d : [<br>
=C2=A0 =C2=A0specific_ss.add(when: &#39;CONFIG_TCG&#39;, if_true: gen)<br>
=C2=A0endforeach<br>
<br>
-if &#39;CONFIG_TRACE_UST&#39; in config_host<br>
+if &#39;ust&#39; in get_option(&#39;trace_backends&#39;)<br>
=C2=A0 =C2=A0trace_ust_all_h =3D custom_target(&#39;trace-ust-all.h&#39;,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output: &#39;trace-ust-=
all.h&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input: trace_events_fil=
es,<br>
@@ -91,7 +90,11 @@ if &#39;CONFIG_TRACE_UST&#39; in config_host<br>
=C2=A0 =C2=A0genh +=3D trace_ust_all_h<br>
=C2=A0endif<br>
<br>
-trace_ss.add(when: &#39;CONFIG_TRACE_SIMPLE&#39;, if_true: files(&#39;simp=
le.c&#39;))<br>
-trace_ss.add(when: &#39;CONFIG_TRACE_FTRACE&#39;, if_true: files(&#39;ftra=
ce.c&#39;))<br>
+if &#39;simple&#39; in get_option(&#39;trace_backends&#39;)<br>
+=C2=A0 trace_ss.add(files(&#39;simple.c&#39;))<br>
+endif<br>
+if &#39;ftrace&#39; in get_option(&#39;trace_backends&#39;)<br>
+=C2=A0 trace_ss.add(files(&#39;ftrace.c&#39;))<br>
+endif<br>
=C2=A0trace_ss.add(files(&#39;control.c&#39;))<br>
=C2=A0trace_ss.add(files(&#39;qmp.c&#39;))<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000004eb92f05cdc94cd2--

