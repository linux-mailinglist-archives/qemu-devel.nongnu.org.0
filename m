Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A625942BEC1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 13:15:00 +0200 (CEST)
Received: from localhost ([::1]:40298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1macDr-000297-Qi
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 07:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1macAN-0007A4-Gx
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 07:11:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1macAL-0000cd-03
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 07:11:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634123480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MQgrU+dITBkDIP0iLphGWBlh1Yqpszu+PWjoWDCybI0=;
 b=V3A9x3curtt2M1MoTcjXvN54jj33b0yBeCobswZUIciPFwGmqYrJJvc8wdD7BpVBCsp99V
 liGKezIYmUCvEtGIXArSrig1aW1Wd4oeETny7lZXw5A9U34OHqvy17xw0cOehPTwmfbj9v
 b4pr4MCFI9iPa51Jn3Pd+QgvoZdR7ck=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-vD_8VdNhPYmLwQU4k79zSQ-1; Wed, 13 Oct 2021 07:11:17 -0400
X-MC-Unique: vD_8VdNhPYmLwQU4k79zSQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so1741995wrh.0
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 04:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=MQgrU+dITBkDIP0iLphGWBlh1Yqpszu+PWjoWDCybI0=;
 b=VDTht6+zDjPmTtAuYd1TdSM8dm5sFRcSUlfylK61cCQbuaj7zWEDu8p58VgaLSH/Mk
 zDIlHqB3juY6QGF07Qoewb4XvHzFkhATjRS2XgdkWZVT8gFDBIaVixQADE/7TU/nLNcJ
 8ENxwpMQZl4h4teWYduZ1APoZovPpIetWnX8libwzdJnCe2LY5jhTNUiC9Q9IzoSlrxh
 57dk8BOmI8sixAB8MroIQa3pxD8lyXWkYc65oARLnzlc9O0fnCrGooHrVuhIq9Mr9gDk
 sMnB/MactZRrcOOA4rNWe/PdEmVTNDUwrl5l1yNVhjxUSmX1v8kvF6oQ/dxh9Kzq+q4F
 43Ow==
X-Gm-Message-State: AOAM5334ldLLCvGNVjK3YysU0tCM9ZPmo0Rf9uQQ71V5a5keVmMwNEwI
 56tf2ZxjORHsoGhJ8yXEyOP28WSh1XFFm19zUHJMRmeEMeI3vMrOI+etRvxuaSm8VBMmzJVYBh5
 gNfyt12w0C9KJ+KQ=
X-Received: by 2002:adf:a413:: with SMTP id d19mr39801931wra.246.1634123476556; 
 Wed, 13 Oct 2021 04:11:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPKsQQ9r/VHfTdjDL2pikzCXrPoEXm3m8ECb0q58tXZoy4UxNsJ1b5tvEKYNO90znNAbywQA==
X-Received: by 2002:adf:a413:: with SMTP id d19mr39801898wra.246.1634123476286; 
 Wed, 13 Oct 2021 04:11:16 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z79sm5065299wmc.17.2021.10.13.04.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 04:11:15 -0700 (PDT)
Message-ID: <16181a8b-4676-24c9-796d-56207731d4c2@redhat.com>
Date: Wed, 13 Oct 2021 13:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 24/24] configure: automatically parse command line for
 meson -D options
From: Paolo Bonzini <pbonzini@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211012111302.246627-1-pbonzini@redhat.com>
 <20211012111302.246627-25-pbonzini@redhat.com>
 <de0d99d9-8375-5f01-c0a6-8174b6f57b49@redhat.com>
 <9f0d78be-b840-4ec1-f61c-11765650285f@redhat.com>
In-Reply-To: <9f0d78be-b840-4ec1-f61c-11765650285f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/10/21 09:43, Paolo Bonzini wrote:
> On 12/10/21 20:15, Thomas Huth wrote:
>>
>> Old output with --help:
>>
>>   --enable-trace-backend=B Set trace backend
>>                             Available backends: nop, dtrace, ftrace, 
>> simple, stderr, ust
>>
>> New output:
>>
>>    --enable-trace-backends=CHOICE
>>                             Set available tracing backends [log]
>>
>> Why does it fail to list the choices here? ... it works for the other
>> options like "--enable-malloc"?
> 
> Oh, that's a pity: array options don't include the choices in their 
> introspection data.  I'll fix it up ad hoc and submit a patch to Meson.

---------------- 8< ----------------
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] meson-buildoptions: restore list of tracing backends

Manually patch the introspection data to include the tracing backends.

This works around a deficiency in Meson that will be fixed by
https://github.com/mesonbuild/meson/pull/9395.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
  scripts/meson-buildoptions.py | 18 +++++++++++++++++-
  scripts/meson-buildoptions.sh |  3 ++-
  2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index 54b591d8a4..256523c09d 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -66,7 +66,7 @@ def sh_print(line=""):
  
  
  def help_line(left, opt, indent, long):
-    right = f"{opt['description']}"
+    right = f'{opt["description"]}'
      if long:
          value = value_to_help(opt["value"])
          if value != "auto":
@@ -150,7 +150,23 @@ def print_parse(options):
      print("}")
  
  
+def fixup_options(options):
+    # Meson <= 0.60 does not include the choices in array options, fix that up
+    for opt in options:
+        if opt["name"] == "trace_backends":
+            opt["choices"] = [
+                "dtrace",
+                "ftrace",
+                "log",
+                "nop",
+                "simple",
+                "syslog",
+                "ust",
+            ]
+
+
  options = load_options(json.load(sys.stdin))
+fixup_options(options)
  print("# This file is generated by meson-buildoptions.py, do not edit!")
  print_help(options)
  print_parse(options)
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 12188c2530..c795a13020 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -16,7 +16,8 @@ meson_options_help() {
    printf "%s\n" '  --enable-tcg-interpreter TCG with bytecode interpreter (experimental and'
    printf "%s\n" '                           slow)'
    printf "%s\n" '  --enable-trace-backends=CHOICE'
-  printf "%s\n" '                           Set available tracing backends [log]'
+  printf "%s\n" '                           Set available tracing backends [log] (choices:'
+  printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
    printf "%s\n" ''
    printf "%s\n" 'Optional features, enabled with --enable-FEATURE and'
    printf "%s\n" 'disabled with --disable-FEATURE, default is enabled if available'
-- 
2.31.1




