Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB704BCD3D
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 09:30:24 +0100 (CET)
Received: from localhost ([::1]:34920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLhbq-0001Bo-IH
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 03:30:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nLhYi-0007uB-Ht
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 03:27:08 -0500
Received: from [2a00:1450:4864:20::632] (port=42885
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nLhYg-000623-DW
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 03:27:08 -0500
Received: by mail-ej1-x632.google.com with SMTP id hw13so25245798ejc.9
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 00:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=prpL2QE+XJfCu8Qk+I4mlYb/cVmtOjjhpu1Xupt8Wp8=;
 b=Chv3WpKCgQQ88k3LwAmeAxRxodDxPhbV1s7syCg7n4nK+EQiaBTElEsr1KLM+/J4D+
 6hMVN2Mf+qNU/sxkA6JYgeIi5vgykSLInUwu3tQP4IqZwkuYX/J5Ibi5m8iOQyFGa418
 62zWznuwsnfEGt7SOmin4wIbmekwttnjd44a/04HzM0TQVqKRM5TQqDl1lftd8rKDjOf
 q8LwvC4scCuwOcKZthZFhIrFlgSwY8Tw7mDza58tm1PEDtLlL+TEkQ//y4ICIilx1lGJ
 NwKS8c1yDaW8XY7IMJjQ4RuwvNk8rFtKsl+iz+FbP1RaSvcDSPv+rEWVt6iXQk54h7nd
 CZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=prpL2QE+XJfCu8Qk+I4mlYb/cVmtOjjhpu1Xupt8Wp8=;
 b=z36qj1RKX8uS0VUdRBr3vx6EvZGqFHC/G6ZnfeYHcv4w9NFUI7DgNMbpdxWBbZFOUg
 m/O/VdfZOA/THirkmOhS7u6RGrQdpTht8nD9Ncsr2mvaNqJxn4ScyRrnpWW4hP7JS4cR
 NhE6BZToA/z+yM9xVgwS6NwifCwiIY2efJABg+SEptvAezwRlf5wk2hyFap6BkIEMB2I
 aoNzIRzK5qWtVaN/w7hGIvzDr2qiHsYKSGb4otGFvIQO+mfUBT+0ILxW3dKEXBTFB5T6
 +aLRkxL4klnIAKnADAZcRz8JTaFlerNWWsW3fApHEc2t55TZB6yJFq/YOLEiL+3KshCI
 lffQ==
X-Gm-Message-State: AOAM530qgrnAeWF2Op4qKrx3o7/0YUbiOQZjtFhjfiM6h5RcpEIiGQYa
 pI1clPSEYTeRY91VZ7jkTK4=
X-Google-Smtp-Source: ABdhPJwWt7GhbinmvVtK4SNDv79wpf1h+7Hzuxfe0OmxpMpaI4IlkoQPehiljEfyuN77AgVcMo9HLw==
X-Received: by 2002:a17:906:b5b:b0:6b9:70ac:231b with SMTP id
 v27-20020a1709060b5b00b006b970ac231bmr11907009ejg.132.1645345624530; 
 Sun, 20 Feb 2022 00:27:04 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id z8sm3881652ejc.151.2022.02.20.00.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 00:27:03 -0800 (PST)
Message-ID: <054f4b14-b523-35fc-acdc-024bbb2c13fd@redhat.com>
Date: Sun, 20 Feb 2022 09:27:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Content-Language: en-US
To: Jag Raman <jag.raman@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <4bef7bdd7309e128eca140a2324a126346c9f1f1.1645079934.git.jag.raman@oracle.com>
 <CAFEAcA9JW0OyAyCk0zbnMMQbo=Q6vr7P4EhEHjrc=i0spCSGLw@mail.gmail.com>
 <496E5796-7071-4C9E-B2AB-3C59CB3D50B5@oracle.com>
 <fa4739f2-d6ab-9d01-6a4a-ab511bf0f89c@redhat.com>
 <43467806-DBE0-4EAB-A7D0-46F46BE45958@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <43467806-DBE0-4EAB-A7D0-46F46BE45958@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 John Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Levon <john.levon@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Eric Blake <eblake@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/22 15:49, Jag Raman wrote:
> 
> Concerning the generated files, I see the following in CMakeMesonToolchainFile.cmake:
> Without patch: set(CMAKE_C_COMPILER "/opt/rh/devtoolset-9/root/usr/bin/cc" "-m64" "-mcx16”)
> With patch: set(CMAKE_C_COMPILER "cc" "-m64" "-mcx16")

I don't understand why it works at all with the latter, but the right solution
could be

set(CMAKE_C_COMPILER "/opt/rh/devtoolset-9/root/usr/bin/cc")
set(CMAKE_C_COMPILER_ARG1 "-m64")
set(CMAKE_C_COMPILER_ARG2 "-mcx16")

Perhaps you can try the following patch to meson (patch it in qemu's build
directory and make sure to use --meson=internal):

diff --git a/mesonbuild/cmake/toolchain.py b/mesonbuild/cmake/toolchain.py
index 316f57cb5..9756864ee 100644
--- a/mesonbuild/cmake/toolchain.py
+++ b/mesonbuild/cmake/toolchain.py
@@ -191,11 +191,14 @@ class CMakeToolchain:
                  continue
  
              if len(exe_list) >= 2 and not self.is_cmdline_option(comp_obj, exe_list[1]):
-                defaults[prefix + 'COMPILER_LAUNCHER'] = [make_abs(exe_list[0])]
+                defaults[f'{prefix}COMPILER_LAUNCHER'] = [make_abs(exe_list[0])]
                  exe_list = exe_list[1:]
  
              exe_list[0] = make_abs(exe_list[0])
-            defaults[prefix + 'COMPILER'] = exe_list
+            defaults[f'{prefix}COMPILER'] = [exe_list[0]]
+            for i in range(1, len(exe_list)):
+                defaults[f'{prefix}COMPILER_ARG{i}'] = [exe_list[i]]
+
              if comp_obj.get_id() == 'clang-cl':
                  defaults['CMAKE_LINKER'] = comp_obj.get_linker_exelist()
  


Thanks,

Paolo

