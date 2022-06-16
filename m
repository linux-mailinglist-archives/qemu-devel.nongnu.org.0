Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B84554DE22
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 11:24:52 +0200 (CEST)
Received: from localhost ([::1]:54848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1lkA-0003Cb-U9
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 05:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1led-0000t9-Bz
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 05:19:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1lea-00005Z-Js
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 05:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655371143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JmDVgu9IvH7StoRfU1J1nHV48gY2stRT0AAVyfpwgic=;
 b=OzL0Km2J4rm74UQSL/YeBx/k6hyoAvsHIEdvrPUYXfIXNeifL6n+od9qGB/EFMYG1Ht5ue
 pHbz9Bu8n0Eld+8NMqG7wDs5ZHgUURjfZf01LlaJSXWdVkVZSyCGi5SHoTLjg3jvPLFSoO
 NCOak+Zyv40c/pVr+3yxKrOaV2CbA60=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-ZAVLfM3yOHeIHGFmJpYeJw-1; Thu, 16 Jun 2022 05:19:02 -0400
X-MC-Unique: ZAVLfM3yOHeIHGFmJpYeJw-1
Received: by mail-ej1-f71.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso365526ejs.12
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 02:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=JmDVgu9IvH7StoRfU1J1nHV48gY2stRT0AAVyfpwgic=;
 b=YRPeDgGf4CJtWby3Xv8qojiB+uyiSLiBOU8glsIYf6DvUuT+eva+c+8L/0094SDOk2
 ZZDQet1d65PL5avcj5AUcN/gKg3zwIpL3S1mLXoQKAV+SZBOJIi5wUE+yhhKrsBpYqci
 D4Q/wzN3FEVrHhIiPVjQkj4luDF+CEMUdPatYDIqOGg1s8hnUogpyNwa1iiAlk0zxi20
 x+Sm2dKMeSxHlljgAobJvnIXgS84yb7AU8hgnrbeAR3UT32m/0osqpSdUUv7xQF+XiSM
 n2Zkl6XGLAEZ7EbIpGIjljxFqj+LRU9D3JbgfTSWymIm00TMozANrK5CP7w2+RpZYJOq
 fIQw==
X-Gm-Message-State: AJIora/p2uRC8TrdSQeMF463N9PIQEMSt+h5Feky2rVWv1hlsLRDe6bz
 vaUbujAxCzsKrM2QylDwkgC1RtckICnmCty74i03gM9mHoKHziQ6nlScP09lYCUszsJaYeh+hnE
 8j0cnsLZOMeVOPcE=
X-Received: by 2002:a17:906:db:b0:718:e9e7:e704 with SMTP id
 27-20020a17090600db00b00718e9e7e704mr3671352eji.718.1655371140664; 
 Thu, 16 Jun 2022 02:19:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t0s9VPdD1YyW02kmwlTcwgAMeKo6aajhCmZMFHKGtfyDhNQbk1rfrLZ4Hx+Yzv6fct+fPONg==
X-Received: by 2002:a17:906:db:b0:718:e9e7:e704 with SMTP id
 27-20020a17090600db00b00718e9e7e704mr3671324eji.718.1655371140142; 
 Thu, 16 Jun 2022 02:19:00 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 lg21-20020a170906f89500b006fe960c5c5asm526817ejb.126.2022.06.16.02.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 02:18:58 -0700 (PDT)
Message-ID: <00e86718-b1b9-1622-79aa-a6f44623df09@redhat.com>
Date: Thu, 16 Jun 2022 11:18:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 0/7] cutils: Introduce bundle mechanism
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20220615155634.578-1-akihiko.odaki@gmail.com>
 <6edab96b-9585-5a37-d992-68d717be2c63@redhat.com>
In-Reply-To: <6edab96b-9585-5a37-d992-68d717be2c63@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 6/15/22 21:27, Paolo Bonzini wrote:
> 
> Thanks for prototyping this, I think this is appealing.  I'll take a 
> look later at using meson introspection info to build the preinstall 
> layout.

Something like this:

diff --git a/meson.build b/meson.build
index 0458b69cdf..17023d511a 100644
--- a/meson.build
+++ b/meson.build
@@ -3612,6 +3612,21 @@ if host_machine.system() == 'windows'
    alias_target('installer', nsis)
  endif

+#####################
+# Preinstalled data #
+#####################
+
+qemu_bundle_sources_stamp = configure_file(
+  output: 'qemu-bundle-sources.stamp',
+  command: ['touch', '@OUTPUT'])
+custom_target('tree with preinstalled data files',
+              build_by_default: true,
+              output: 'qemu-bundle.stamp',
+              input: qemu_bundle_sources_stamp,
+              env: {'MESON': config_host['MESON']},
+              command: files('symlink-install-tree.py'),
+              capture: true)
+
  #########################
  # Configuration summary #
  #########################
diff --git a/scripts/symlink-install-tree.py 
b/scripts/symlink-install-tree.py
new file mode 100644
index 0000000000..cd66dc06cd
--- /dev/null
+++ b/scripts/symlink-install-tree.py
@@ -0,0 +1,34 @@
+#! /usr/bin/env python3
+
+import json
+import os
+import subprocess
+
+def destdir_join(d1: str, d2: str) -> str:
+    if not d1:
+        return d2
+    if not os.path.isabs(d2):
+        return os.path.join(d1, d2)
+
+    # c:\destdir + c:\prefix must produce c:\destdir\prefix
+    if len(d2) > 1 and d2[1] == ':':
+        return d1 + d2[2:]
+    return d1 + d2
+
+meson = os.environ.get("MESON")
+out = subprocess.run([meson, 'introspect', '--installed'],
+                     stdout=subprocess.PIPE, check=True).stdout
+for source, dest in json.loads(out).items():
+    assert os.path.isabs(source)
+    bundle_dest = destdir_join('qemu-bundle', dest)
+    path = os.path.dirname(bundle_dest)
+    try:
+        os.makedirs(path, exist_ok=True)
+    except e:
+        print('error making directory {path}', file=sys.stderr)
+        raise e
+    try:
+        os.symlink(source, bundle_dest)
+    except e:
+        print('error making symbolic link {dest}', file=sys.stderr)
+        raise e


