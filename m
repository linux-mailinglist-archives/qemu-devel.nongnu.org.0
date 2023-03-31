Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1CB6D1A8F
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 10:41:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piAJP-000625-6Z; Fri, 31 Mar 2023 04:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1piAJN-00061t-Aq
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 04:40:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1piAJL-0008C0-99
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 04:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680252037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TNjkqYcb0wAAgQPh43AbrgIuRUewu7oYSZiItdK/eoI=;
 b=TN7d3qLm9CK5aVFQYz0nijDdgUTWNkh8hccACcxp1xDvkef5QUAj4PBzpOZT5Q4dVOZzJO
 b1IoNTrHdLuM+1oF0k+UNP1u+Ooi+6sLYudLT83974JoWbROYon7cuD49qVb6SseeFFJKw
 84lcv7LK7d3RquIospdCbYB7aazgb5Y=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-n9k2-HKzNyG_WbR4exZEoA-1; Fri, 31 Mar 2023 04:40:34 -0400
X-MC-Unique: n9k2-HKzNyG_WbR4exZEoA-1
Received: by mail-ed1-f71.google.com with SMTP id
 a27-20020a50c31b000000b0050047ecf4bfso30930682edb.19
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 01:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680252033; x=1682844033;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TNjkqYcb0wAAgQPh43AbrgIuRUewu7oYSZiItdK/eoI=;
 b=cIt+1Xz5xqh/bNbHeJ0YO2Pemt/53ocQjx6e/rZmMqAULqYKyPyMyA1iw6f69/sC3e
 bkcoh1RpiEkwSrff6nRFwmGKUqpSPUzNVioxftQohLMq4uLV1purAqYVzhuWByoa/iIL
 +R3Bwrlr/fOYuevQVsSdJzirEyJ+nRYcaXQYGSEiFC05gh7KBiLH/iBulRGf1otV+L3D
 qJFmMeA5lgGBouHueg4V2yomv6MGzNBeBAPMCV8JFExEywHbD5bWZYhvBEI1zwSyZZxi
 VgGj/y+OkfyFPwUfRjzlbP5kUOGOovvetBVph7X8gn390R2qYRoRaBe8EqR9SwWLLIax
 dBcA==
X-Gm-Message-State: AAQBX9fnJTw7tHd4wJbMaMyGCypVPndGMGh8E9eEULqNXpjply+f/jEt
 +B0d9AUxHoh5hUyGBVGECk/tjTO42VvqP1CaCOaRNz0XWuNnNsNzfXPc6j6ED8zz9dK9DgH4xVI
 XpZRGPgQQDGcaqOc=
X-Received: by 2002:a17:906:b849:b0:93d:c570:5b3a with SMTP id
 ga9-20020a170906b84900b0093dc5705b3amr28016760ejb.67.1680252033550; 
 Fri, 31 Mar 2023 01:40:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350aWYhTrMJDSQGN+Aokz24B7OKzBAc9Of/Al28VaxgWiNV+zVC83fjelGV/AMYnfSpJJCWrZdQ==
X-Received: by 2002:a17:906:b849:b0:93d:c570:5b3a with SMTP id
 ga9-20020a170906b84900b0093dc5705b3amr28016745ejb.67.1680252033239; 
 Fri, 31 Mar 2023 01:40:33 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 g4-20020a17090669c400b0093341746105sm736025ejs.117.2023.03.31.01.40.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 01:40:32 -0700 (PDT)
Message-ID: <e99b9f37-d8ab-5858-e9c3-5c99a63e8788@redhat.com>
Date: Fri, 31 Mar 2023 10:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 0/3] configure: create a python venv and install meson
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
References: <20230328211119.2748442-1-jsnow@redhat.com>
 <44ed710a-f897-2be6-4f07-928ba4cb535e@redhat.com>
 <CAFn=p-YC8rdv2QsU=aNcfDHvYGEtrze6CgSwJ-=9T6xaoAGoiA@mail.gmail.com>
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFn=p-YC8rdv2QsU=aNcfDHvYGEtrze6CgSwJ-=9T6xaoAGoiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/30/23 16:11, John Snow wrote:
>     * undo the meson parts from PATCH 3; make patch 3 create the venv +
>     subsume the MKVENV parts of the Makefiles + always set
>     explicit_python=yes (so that at this point the in-tree meson is always
>     used).
> 
>     * add a patch that starts rejecting --meson=/path/to/meson and drops
>     explicit_python (instead using pyvenv/bin/meson to check whether a
>     system meson is usable)
> 
>     * make Meson use a sphinx-build binary from the virtual environment
>     (i.e. pass -Dsphinx_build=$PWD/pyvenv/bin/sphinx-build)
> 
> 
> Yep, let's talk about this part in particular.

Oh, wait, for this one I already have a patch from my experiment that
used importlib.metadata to look up the entry point dynamically[1] (and
that's where the shim idea developed from).  All I need to do is change
the path passed to find_program() and rewrite the commit message.

Paolo

[1] https://lore.kernel.org/qemu-devel/2c63f79d-b46d-841b-bed3-0dca33eab2c0@redhat.com/

--------------------------- 8< --------------------------------
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] meson: pick sphinx-build from virtual environment

configure is now creating a virtual environment and populating it
with shim binaries that always refer to the correct Python runtime.
docs/meson.build can rely on this, and stop using a sphinx_build
option that may or may not refer to the same version of Python that
is used for the rest of the build.

In the long term, it may actually make sense for Meson's Python
module to include the logic to build such shims, so that other
programs can do the same without needing a full-blown virtual
environment.  However, in the context of QEMU there is no need to
wait for that; QEMU's meson.build already relies on config-host.mak
and on the target list that configure prepares, i.e. it is not
standalone.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


diff --git a/docs/conf.py b/docs/conf.py
index 7e215aa9a5c6..c687ff266301 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -32,15 +32,6 @@
  from distutils.version import LooseVersion
  from sphinx.errors import ConfigError
  
-# Make Sphinx fail cleanly if using an old Python, rather than obscurely
-# failing because some code in one of our extensions doesn't work there.
-# In newer versions of Sphinx this will display nicely; in older versions
-# Sphinx will also produce a Python backtrace but at least the information
-# gets printed...
-if sys.version_info < (3,7):
-    raise ConfigError(
-        "QEMU requires a Sphinx that uses Python 3.7 or better\n")
-
  # The per-manual conf.py will set qemu_docdir for a single-manual build;
  # otherwise set it here if this is an entire-manual-set build.
  # This is always the absolute path of the docs/ directory in the source tree.
diff --git a/docs/meson.build b/docs/meson.build
index f220800e3e59..1c5fd66bfa7f 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -1,5 +1,6 @@
-sphinx_build = find_program(get_option('sphinx_build'),
# This assumes that Python is inside the venv that configure prepares
+sphinx_build = find_program(fs.parent(python.full_path()) / 'sphinx-build',
                              required: get_option('docs'))
  
  # Check if tools are available to build documentation.
diff --git a/meson_options.txt b/meson_options.txt
index b541ab2851dd..8dedec0cf91a 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -12,8 +12,6 @@ option('pkgversion', type : 'string', value : '',
         description: 'use specified string as sub-version of the package')
  option('smbd', type : 'string', value : '',
         description: 'Path to smbd for slirp networking')
-option('sphinx_build', type : 'string', value : 'sphinx-build',
-       description: 'Use specified sphinx-build for building document')
  option('iasl', type : 'string', value : '',
         description: 'Path to ACPI disassembler')
  option('tls_priority', type : 'string', value : 'NORMAL',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index bf852f4b957e..6a71c3bad296 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -58,8 +58,6 @@ meson_options_help() {
    printf "%s\n" '  --localedir=VALUE        Locale data directory [share/locale]'
    printf "%s\n" '  --localstatedir=VALUE    Localstate data directory [/var/local]'
    printf "%s\n" '  --mandir=VALUE           Manual page directory [share/man]'
-  printf "%s\n" '  --sphinx-build=VALUE     Use specified sphinx-build for building document'
-  printf "%s\n" '                           [sphinx-build]'
    printf "%s\n" '  --sysconfdir=VALUE       Sysconf data directory [etc]'
    printf "%s\n" '  --tls-priority=VALUE     Default TLS protocol/cipher priority string'
    printf "%s\n" '                           [NORMAL]'
@@ -429,7 +427,6 @@ _meson_option_parse() {
      --disable-sndio) printf "%s" -Dsndio=disabled ;;
      --enable-sparse) printf "%s" -Dsparse=enabled ;;
      --disable-sparse) printf "%s" -Dsparse=disabled ;;
-    --sphinx-build=*) quote_sh "-Dsphinx_build=$2" ;;
      --enable-spice) printf "%s" -Dspice=enabled ;;
      --disable-spice) printf "%s" -Dspice=disabled ;;
      --enable-spice-protocol) printf "%s" -Dspice_protocol=enabled ;;
-- 
2.39.2




