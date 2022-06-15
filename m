Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C136854C366
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 10:22:26 +0200 (CEST)
Received: from localhost ([::1]:41000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1OIC-0003sJ-Tx
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 04:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1OCm-00034S-5A
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:16:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1OCi-0007nr-4W
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:16:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655281003;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=TKXKNJwlug8BQBi2b2SOUmTznSVI0NEf9aEXRwCG43U=;
 b=AFV9Yx/Zc0DUx5P9jPEiKwEnxCEtAuH/QRfwY+W2euaK3ETx14JbdUYwMSybSbhie9pkUj
 6lglXKBadPY7FsjcwpP/pPae/uSb2UDWNMIc7r2U3zqQdTWE6XyzFHXvKyHfeda37TKCMk
 bkjf08qovzb3W0CYuHDLasMRve6DGN4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-eCRb5hjYNviXk2n8bcFKHA-1; Wed, 15 Jun 2022 04:16:39 -0400
X-MC-Unique: eCRb5hjYNviXk2n8bcFKHA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72BCA101E98A;
 Wed, 15 Jun 2022 08:16:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4108040334F;
 Wed, 15 Jun 2022 08:16:38 +0000 (UTC)
Date: Wed, 15 Jun 2022 09:16:36 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 2/4] datadir: Use bundle mechanism
Message-ID: <YqmVZI57dTeZvJTP@redhat.com>
References: <20220614210746.78911-1-akihiko.odaki@gmail.com>
 <20220614210746.78911-3-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220614210746.78911-3-akihiko.odaki@gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 15, 2022 at 06:07:44AM +0900, Akihiko Odaki wrote:
> softmmu/datadir.c had its own implementation to find files in the
> build tree, but now bundle mechanism provides the unified
> implementation which works for datadir and the other files.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  .travis.yml                 |  2 +-
>  meson.build                 |  3 ++-
>  pc-bios/keymaps/meson.build |  3 +++
>  pc-bios/meson.build         | 17 +++++++++--------
>  scripts/oss-fuzz/build.sh   |  2 +-
>  softmmu/datadir.c           | 35 ++++++++++++-----------------------
>  tests/qtest/fuzz/fuzz.c     | 15 ---------------
>  tests/vm/fedora             |  2 +-
>  tests/vm/freebsd            |  2 +-
>  tests/vm/netbsd             |  2 +-
>  tests/vm/openbsd            |  2 +-
>  11 files changed, 32 insertions(+), 53 deletions(-)
> 
> diff --git a/.travis.yml b/.travis.yml
> index 9afc4a54b8f..9fee2167b95 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -223,7 +223,7 @@ jobs:
>          - BUILD_RC=0 && make -j${JOBS} || BUILD_RC=$?
>          - |
>            if [ "$BUILD_RC" -eq 0 ] ; then
> -              mv pc-bios/s390-ccw/*.img pc-bios/ ;
> +              mv pc-bios/s390-ccw/*.img qemu-bundle/share/qemu ;
>                ${TEST_CMD} ;
>            else
>                $(exit $BUILD_RC);
> diff --git a/meson.build b/meson.build
> index 0c2e11ff071..c573815813f 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -32,6 +32,7 @@ if get_option('qemu_suffix').startswith('/')
>    error('qemu_suffix cannot start with a /')
>  endif
>  
> +qemu_bundledir = meson.project_build_root() / 'qemu-bundle'
>  qemu_confdir = get_option('sysconfdir') / get_option('qemu_suffix')
>  qemu_datadir = get_option('datadir') / get_option('qemu_suffix')
>  qemu_docdir = get_option('docdir') / get_option('qemu_suffix')
> @@ -1682,7 +1683,7 @@ endif
>  config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') / get_option('bindir'))
>  config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
>  config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_confdir)
> -config_host_data.set_quoted('CONFIG_QEMU_DATADIR', get_option('prefix') / qemu_datadir)
> +config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_DATADIR', qemu_datadir)
>  config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
>  config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('prefix') / get_option('qemu_firmwarepath'))
>  config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('prefix') / get_option('libexecdir'))
> diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
> index 44247a12b54..b8bac138756 100644
> --- a/pc-bios/keymaps/meson.build
> +++ b/pc-bios/keymaps/meson.build
> @@ -67,3 +67,6 @@ if native_qemu_keymap.found()
>  endif
>  
>  install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
> +
> +run_command('ln', '-sf', '../../../pc-bios/keymaps', qemu_bundledir / qemu_datadir,
> +            check: true)
> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index 41ba1c0ec7b..d1ff75b0b13 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -1,3 +1,5 @@
> +run_command('mkdir', '-p', qemu_bundledir / qemu_datadir, check: true)
> +
>  roms = []
>  if unpack_edk2_blobs
>    fds = [
> @@ -20,6 +22,9 @@ if unpack_edk2_blobs
>                    install: get_option('install_blobs'),
>                    install_dir: qemu_datadir,
>                    command: [ bzip2, '-dc', '@INPUT0@' ])
> +
> +    run_command('ln', '-sf', '../../../pc-bios' / f, qemu_bundledir / qemu_datadir,
> +                check: true)
>    endforeach
>  endif
>  
> @@ -85,15 +90,11 @@ blobs = [
>    'vof-nvram.bin',
>  ]
>  
> -ln_s = [find_program('ln', required: true), '-sf']
> +install_data(blobs, install_dir: qemu_datadir)
> +
>  foreach f : blobs
> -  roms += custom_target(f,
> -                build_by_default: have_system,
> -                output: f,
> -                input: files('meson.build'),            # dummy input
> -                install: get_option('install_blobs'),
> -                install_dir: qemu_datadir,
> -                command: [ ln_s, meson.project_source_root() / 'pc-bios' / f, '@OUTPUT@' ])
> +  run_command('ln', '-sf', meson.current_source_dir() / f, qemu_bundledir / qemu_datadir,
> +              check: true)
>  endforeach
>  
>  subdir('descriptors')
> diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
> index 98b56e05210..cbf8b3080e9 100755
> --- a/scripts/oss-fuzz/build.sh
> +++ b/scripts/oss-fuzz/build.sh
> @@ -88,7 +88,7 @@ if [ "$GITLAB_CI" != "true" ]; then
>  fi
>  
>  # Copy over the datadir
> -cp  -r ../pc-bios/ "$DEST_DIR/pc-bios"
> +cp  -r ../pc-bios/ "$DEST_DIR/qemu-bundle/share/qemu"
>  
>  targets=$(./qemu-fuzz-i386 | awk '$1 ~ /\*/  {print $2}')
>  base_copy="$DEST_DIR/qemu-fuzz-i386-target-$(echo "$targets" | head -n 1)"
> diff --git a/softmmu/datadir.c b/softmmu/datadir.c
> index 160cac999a6..4dadf0e010c 100644
> --- a/softmmu/datadir.c
> +++ b/softmmu/datadir.c
> @@ -35,6 +35,7 @@ char *qemu_find_file(int type, const char *name)
>      int i;
>      const char *subdir;
>      char *buf;
> +    char *bundle;
>  
>      /* Try the name as a straight path first */
>      if (access(name, R_OK) == 0) {
> @@ -61,6 +62,16 @@ char *qemu_find_file(int type, const char *name)
>          }
>          g_free(buf);
>      }
> +
> +    bundle = g_strdup_printf("%s/%s%s",
> +                             CONFIG_QEMU_BUNDLE_DATADIR, subdir, name);
> +    buf = find_bundle(bundle);
> +    g_free(bundle);
> +    if (buf) {
> +        trace_load_file(name, buf);
> +        return buf;
> +    }
> +
>      return NULL;
>  }

This is flawed because it looks at the installed paths first, and
falls back to uninstalled paths afterwards. So if you're building
and running QEMU 7.1.0 from git, and have QEMU 5.0.0 installed,
your QEMU 7.1.0 will end up finding files from the 5.0.0 install.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


