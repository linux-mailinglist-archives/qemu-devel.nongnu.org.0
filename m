Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13863BC1ED
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:58:36 +0200 (CEST)
Received: from localhost ([::1]:37826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0RvX-00035D-RS
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0Rtu-0001vQ-T0
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:56:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0Rts-0005Vy-IO
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:56:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625504211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=furDfpEL/cGF6IYBFucqVBd3FZ+jhFpEqUA9uyVW3x8=;
 b=axUivKL7cdy1gYAvru97f/Pd67Gwxqj7dNFEsH0uiB8qcn8MqAUJCjJsXtj/YF3jOs9HV4
 B1iPzWUnVQGKqgDPjP0s56psabqlsXo5LZ7yIxOJD5LeD3MzSCmETzfSmU92fxzCQLpsrr
 Gqv19ESs08CMl6H79UJnLEKIwf2OqEM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-t_PV12y4Pfy6MUehS24M7w-1; Mon, 05 Jul 2021 12:56:49 -0400
X-MC-Unique: t_PV12y4Pfy6MUehS24M7w-1
Received: by mail-wr1-f69.google.com with SMTP id
 y5-20020adfe6c50000b02901258bf1d760so6384844wrm.14
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=furDfpEL/cGF6IYBFucqVBd3FZ+jhFpEqUA9uyVW3x8=;
 b=Vn1ezBamrlJPXKAoRoAzao+SiCekASiK3RZm9UtrcOyu0hG75pZhUIevG/27m7cDJ0
 hSGST9wDACjukXKVkTWXUIy0f2RIiU1o+X+A7C4IhQtMFvsNg+tn2ZhOgWakIbhc2Ug1
 lsrPzG4zxknsCKLu28KgZrg2ZGiuL62KPYwVwUVoZxXDKSh+yR4OQ9JhNodS/5TqPcsC
 0/oDJdy5nPvFnITmtehoUUUX7DpmqASSfBqbaiZkPq+5hlAJYJ/Xlqu/Y6F6aTNmii0V
 r4MK+ImEuM60ARsruNvmVgozXCQKZ9lZebn8UPBiWr+KSGhg6kPQZtjr6eYHs+63jBgu
 vDZA==
X-Gm-Message-State: AOAM530bnsjKJxSTHv1eA7ae5eubjNp+uJsPn2YPXlVglrdkbK85SaGo
 y6Q/VPITKwoFCOrzmPBbA9MW87B2ovrXBrVl4UzWTV0L7TzQ3088MB20X4k1s8HzobQzl+yfb0q
 nufHQJ7NtczrvHP0P5B9FrQDvlcT8FCAAZ7Bszr1FlPOovzGsycJVPB5eVjmSdss9dKw=
X-Received: by 2002:a5d:4846:: with SMTP id n6mr16980543wrs.72.1625504208535; 
 Mon, 05 Jul 2021 09:56:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBlZ3rLUSQzhv5fIUe7BcRv5Urjr++5f3Bcx4k9+slTqSKdezhPZ5oYnPYtBhy3QhqQoNJeA==
X-Received: by 2002:a5d:4846:: with SMTP id n6mr16980524wrs.72.1625504208272; 
 Mon, 05 Jul 2021 09:56:48 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x18sm13532595wrw.19.2021.07.05.09.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 09:56:47 -0700 (PDT)
To: Programmingkid <programmingkidx@gmail.com>,
 QEMU devel list <qemu-devel@nongnu.org>
References: <325BA2AF-B4F5-4134-BF90-63282E0B2A46@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] Set icon for QEMU binary on Mac OS
Message-ID: <f03b750f-819c-4ea0-c5fa-889afab71d17@redhat.com>
Date: Mon, 5 Jul 2021 18:56:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <325BA2AF-B4F5-4134-BF90-63282E0B2A46@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/21 15:54, Programmingkid wrote:
> Hi Paolo, I was told you were the one who I should send this patch to. Please let me know if you feel otherwise.

Absolutely, thanks.  Removing the icon was mostly done out of lack of
a machine to test it on, and it's nice to add it back.

> +# set QEMU's icon on Mac OS
> +if targetos == 'darwin'
> +    newiconpart1 = custom_target('Icon for ' + exe_name + ' - part 1',
> +          depends : emulator,
> +          input : emulator,
> +          output : 'new icon for ' + exe_name + ' - 1',
> +          command : ['Rez', '-append',
> +           meson.source_root() + '/pc-bios/qemu.rsrc', '-o',
> +           meson.current_build_dir() / exe['name']],
> +          build_by_default : true)

I think having a command that never actually creates the "new icon for
... - 1" file will cause the command to be run over and over.

We already have scripts/entitlement.sh to do (possibly) in-place changes
to the executable on Darwin.  I suggest something like this:

diff --git a/meson.build b/meson.build
index 380b40ba07..5313cf4a32 100644
--- a/meson.build
+++ b/meson.build
@@ -2505,8 +2505,7 @@ foreach target : target_dirs
    endif
    foreach exe: execs
      exe_name = exe['name']
-    exe_sign = 'CONFIG_HVF' in config_target
-    if exe_sign
+    if targetos == 'darwin'
        exe_name += '-unsigned'
      endif
  
@@ -2520,7 +2519,13 @@ foreach target : target_dirs
                 link_args: link_args,
                 win_subsystem: exe['win_subsystem'])
  
-    if exe_sign
+    if 'CONFIG_HVF' in config_target
+      entitlement = meson.current_source_dir() / 'accel/hvf/entitlements.plist'
+    else
+      entitlement = '/dev/null'
+    endif
+    if targetos == 'darwin'
+      icon = '...'
        emulators += {exe['name'] : custom_target(exe['name'],
                     depends: emulator,
                     output: exe['name'],
@@ -2528,14 +2534,14 @@ foreach target : target_dirs
                       meson.current_source_dir() / 'scripts/entitlement.sh',
                       meson.current_build_dir() / exe_name,
                       meson.current_build_dir() / exe['name'],
-                     meson.current_source_dir() / 'accel/hvf/entitlements.plist'
+                     entitlements, icon
                     ])
        }
  
        meson.add_install_script('scripts/entitlement.sh', '--install',
                                 get_option('bindir') / exe_name,
                                 get_option('bindir') / exe['name'],
-                               meson.current_source_dir() / 'accel/hvf/entitlements.plist')
+                               entitlements, icon)
      else
        emulators += {exe['name']: emulator}
      endif
diff --git a/scripts/entitlement.sh b/scripts/entitlement.sh
index f7aaaf2766..573bed0c2f 100755
--- a/scripts/entitlement.sh
+++ b/scripts/entitlement.sh
@@ -11,6 +11,7 @@ fi
  SRC="$1"
  DST="$2"
  ENTITLEMENT="$3"
+ICON="$4"
  
  if $in_place; then
    trap 'rm "$DST.tmp"' exit
@@ -20,6 +21,9 @@ else
    cd "$MESON_INSTALL_DESTDIR_PREFIX"
  fi
  
-codesign --entitlements "$ENTITLEMENT" --force -s - "$SRC"
+if test "$ENTITLEMENT" != '/dev/null'; then
+  codesign --entitlements "$ENTITLEMENT" --force -s - "$SRC"
+fi
+# icon stuff here
  mv -f "$SRC" "$DST"
  trap '' exit

Paolo


