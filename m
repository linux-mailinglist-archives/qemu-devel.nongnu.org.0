Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD266C34BF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 15:50:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pedHp-00034C-6G; Tue, 21 Mar 2023 10:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pedHg-00033e-8x
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:48:20 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pedHd-00075i-My
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:48:19 -0400
Received: by mail-ed1-x536.google.com with SMTP id t5so23883358edd.7
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 07:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679410095;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5VgPnsYeEqMcjcYRu5VFz63Q6TpHMINQNeNM09BeHaA=;
 b=R88Z6k7SVFN4oBVR8V1lhVHt7NApG2QmR/YTwzncmRSYyNGjXJsQN9bSj09S7R33Oh
 uK/UvrdNluP3UNzRncGzsyaAxuQTdoYhCtht1ktIGayWgvTwfQ62TIP0qoglg2U6HD07
 6CcKPvuwRckqYEW/mxB4LOFLgoDSPJsDdLbTJSswHxfvZBfUXle1M4XwxLqbYEI3JqpC
 Rt5/ZaRKttMokGn5QOAixF/ot3pCW4p62OxSFvLVgCjQ7NkmSD6oHsqC7cY+6UCJQtGT
 SF/2JwlUTlRxoJpAzCM6cYWgePYImGL7hGPnBo0HatPbegxHDkGRvo019pu3e7PCu//Y
 LWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679410095;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5VgPnsYeEqMcjcYRu5VFz63Q6TpHMINQNeNM09BeHaA=;
 b=mbOrh6A24f6e+ESY+h3AApOcwIFQWv3fV31cL/zLoHLZ710ACJZg9dwM9KDWAYCfic
 eMf/7cHfJk1N5FRRTBVs6dOX/F/7Gmbu7l9KRlHphrlr7jtEwlQb/MYcfNj8PVODKSex
 WAI8tq67QyMmog59XyrRIRqJhSXK2RhgsPrLDfg+SP7xBcZGdfFZByB941m3n26l2kcB
 F+5gbmOLBHuYxs29luox3FjCV2alYcQ33EFeZPXeR2feVxLPnttIwrfYHtirCkrABlwK
 vW/clAurV7dpUkoCabEE1zkt3ksEAzQUnRQ2SOAx43dqlvp/BIVf3yKEMZKkFZOHySKM
 w9eQ==
X-Gm-Message-State: AO0yUKV8w1R0a2b6JBz0O5QGAQgVUvDgkm25WG6irfInbCJLj3NoDmFs
 TPH8B7jIIgLGiIcF8b4l0hheAg==
X-Google-Smtp-Source: AK7set9X8Z+wvrulJaTGZCpSO2vpraKHKM4Num2KzFKGjvCwe9IoQivBmONX+irOpwM4RK0kVh+aXg==
X-Received: by 2002:aa7:cb9a:0:b0:4fa:57bf:141a with SMTP id
 r26-20020aa7cb9a000000b004fa57bf141amr3618573edt.32.1679410095724; 
 Tue, 21 Mar 2023 07:48:15 -0700 (PDT)
Received: from [192.168.69.115] (did75-h03-176-184-22-219.dsl.sta.abo.bbox.fr.
 [176.184.22.219]) by smtp.gmail.com with ESMTPSA id
 v19-20020a1709067d9300b008cff300cf47sm5879741ejo.72.2023.03.21.07.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 07:48:15 -0700 (PDT)
Message-ID: <d312145c-8af2-c8ca-ec45-4f6f060b3b07@linaro.org>
Date: Tue, 21 Mar 2023 15:48:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/3] qapi: Do not generate empty enum
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20230315112811.22355-1-philmd@linaro.org>
 <20230315112811.22355-3-philmd@linaro.org> <87cz58ubcn.fsf@pond.sub.org>
 <ZBMfosr0JDyfjhqs@redhat.com> <873564spze.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <873564spze.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 16/3/23 15:57, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:


> But all of this falls apart with conditional members!
> 
> Example 1 (taken from qapi/block-core.json):
> 
>      { 'enum': 'BlockdevAioOptions',
>        'data': [ 'threads', 'native',
>                  { 'name': 'io_uring', 'if': 'CONFIG_LINUX_IO_URING' } ] }
> 
> Generates now:
> 
>      typedef enum BlockdevAioOptions {
>          BLOCKDEV_AIO_OPTIONS_THREADS,
>          BLOCKDEV_AIO_OPTIONS_NATIVE,
>      #if defined(CONFIG_LINUX_IO_URING)
>          BLOCKDEV_AIO_OPTIONS_IO_URING,
>      #endif /* defined(CONFIG_LINUX_IO_URING) */
>          BLOCKDEV_AIO_OPTIONS__MAX,
>      } BlockdevAioOptions;
> 
> BLOCKDEV_AIO_OPTIONS__MAX is 3 if defined(CONFIG_LINUX_IO_URING), else
> 2.
> 
> After the next patch:
> 
>      typedef enum BlockdevAioOptions {
>          BLOCKDEV_AIO_OPTIONS_THREADS,
>          BLOCKDEV_AIO_OPTIONS_NATIVE,
>      #if defined(CONFIG_LINUX_IO_URING)
>          BLOCKDEV_AIO_OPTIONS_IO_URING,
>      #endif /* defined(CONFIG_LINUX_IO_URING) */
>      #define BLOCKDEV_AIO_OPTIONS__MAX 3
>      } BlockdevAioOptions;
> 
> Now it's always 3.
> 
> Example 2 (same with members reordered):
> 
>      { 'enum': 'BlockdevAioOptions',
>        'data': [ { 'name': 'io_uring', 'if': 'CONFIG_LINUX_IO_URING' },
>                  'threads', 'native' ] }
> 
> Same problem for __MAX, additional problem for __DUMMY:
> 
>      typedef enum BlockdevAioOptions {
>          BLOCKDEV_AIO_OPTIONS__DUMMY = 0,
>      #if defined(CONFIG_LINUX_IO_URING)
>          BLOCKDEV_AIO_OPTIONS_IO_URING = 0,
>      #endif /* defined(CONFIG_LINUX_IO_URING) */
>          BLOCKDEV_AIO_OPTIONS_THREADS,
>          BLOCKDEV_AIO_OPTIONS_NATIVE,
>      #define BLOCKDEV_AIO_OPTIONS__MAX 3
>      } BlockdevAioOptions;
> 
> If CONFIG_LINUX_IO_URING is off, the enum starts at 1 instead of 0.
> 
> Arrays indexed by the enum start with a hole.  Code using them is
> probably not prepared for holes.

Can we meet half-way only generating the MAX definitions for
unconditional enums, keeping the conditional ones as is?

-- >8 --
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
@@ -88,16 +88,18 @@ def gen_enum(name: str,
               members: List[QAPISchemaEnumMember],
               prefix: Optional[str] = None) -> str:
      assert members
-    # append automatically generated _MAX value
-    enum_members = members + [QAPISchemaEnumMember('_MAX', None)]
-
      ret = mcgen('''

  typedef enum %(c_name)s {
  ''',
                  c_name=c_name(name))

-    for memb in enum_members:
+    has_cond = any(memb.ifcond.is_present() for memb in members)
+    if has_cond:
+        # append automatically generated _MAX value
+        members += [QAPISchemaEnumMember('_MAX', None)]
+
+    for memb in members:
          ret += memb.ifcond.gen_if()
          ret += mcgen('''
      %(c_enum)s,
@@ -105,6 +107,13 @@ def gen_enum(name: str,
                       c_enum=c_enum_const(name, memb.name, prefix))
          ret += memb.ifcond.gen_endif()

+    if not has_cond:
+        ret += mcgen('''
+#define %(c_name)s %(c_length)s
+''',
+                     c_name=c_enum_const(name, '_MAX', prefix),
+                     c_length=len(members))
+
      ret += mcgen('''
  } %(c_name)s;
  ''',
---

