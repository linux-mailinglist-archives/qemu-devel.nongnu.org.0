Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBB155387D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 19:04:30 +0200 (CEST)
Received: from localhost ([::1]:60718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3hIj-0005Jy-LN
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 13:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o3hDE-0001xM-KL
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 12:58:48 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o3hD8-0004wk-Pn
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 12:58:44 -0400
Received: by mail-ej1-x62f.google.com with SMTP id kq6so28754722ejb.11
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 09:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6/6neoDpjGx3FMN1PSVypKgkSWu4SdJpjcwkdXXU6BI=;
 b=ccYIKVRnKMneElYyi6IAjM69uzHVnf0WlE5U+zVDI4v83eHHcYFsp2sJ70vKEYokgH
 5KzafZ+PECMe3jLxvktYJripgI+RVc9Rnao1cDPdJYmAosiqNcfr5I3A4bGBA+fSwxnf
 4a9+8b6k2dxqq1Sw1W7MA6AfLdS7f/ZpGA4K/00koSXhiiV/d8nnq7U18o6FsBd8RKYy
 +vZ8sZwyg5bTj+85VwbpFjuZ44YItiVoiNmCXCVb2TDuKcKEQLG/kVKzxh1jxFRVZ84Y
 2WyiK4NcQHLSwTaVT/Mf7P0aiwlc3WNw4Fv2nlue1Szs2ca1jNgAMfM6/ZG9B72iSGwA
 0udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6/6neoDpjGx3FMN1PSVypKgkSWu4SdJpjcwkdXXU6BI=;
 b=dASjtz8DNXNFXdHiflPscmNhlrFnbyMtvYWYuBvncQlyPWsmJ4zOqS57Ro14G0ORHM
 xX+RG9qGz8v+5C6x2bkbbdSSgviU+ylqRQ5hmwoS+NPtSVpOnCV9Y8PBzNeMOkMmWKdv
 qJafZ40lTXDpLxF5EWnSzxpCCpxJXSWVeTQ4VPzDlVOaSQYV+H7zFFO54ypSEnUd0SZy
 N6sxL99C6xoyLJKlNoONvdxzJZ5Nl9VkLlqtrK0s8mv+trOJzoUxhuv+V5jR4MKFr66W
 myUgvLMDq/Dtj4G7na1xAQZRFnkUyg9DIfXMh6dDGnQHEqNj9j8rMp9gn6xMkadxuCp5
 tlNA==
X-Gm-Message-State: AJIora8M0GygvY5mU+fv7tak+pER3a1dp2Vsi0XI932FpMkjXC9VewEF
 A05wO5GXNbMAgCycG7Qi37c=
X-Google-Smtp-Source: AGRyM1vx7beabpl66e6t33YBjLUPJNkwR+hrpsouXEN5RZBvbA5D35KiDCerEK+jKiO7x6+s7bmUTA==
X-Received: by 2002:a17:906:74d1:b0:712:2293:8f41 with SMTP id
 z17-20020a17090674d100b0071222938f41mr26270380ejl.495.1655830720248; 
 Tue, 21 Jun 2022 09:58:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 r13-20020a05640251cd00b0042ab4e20543sm13410709edd.48.2022.06.21.09.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 09:58:39 -0700 (PDT)
Message-ID: <b49f2611-55f5-ba8b-df9f-13ab13bbad09@redhat.com>
Date: Tue, 21 Jun 2022 18:58:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PULL 20/33] configure: handle host compiler in
 probe_target_compiler
Content-Language: en-US
To: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
 <20220601180537.2329566-21-alex.bennee@linaro.org>
 <c655723a-95df-82e4-2105-678cdea9e702@eldorado.org.br>
 <CABgObfYEiV_TK4BDxG6+zZ1Qq06y6GtmnP1uF__eV31XDKggDA@mail.gmail.com>
 <9273ee87-28f6-b6bb-81be-72795f0a645b@eldorado.org.br>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <9273ee87-28f6-b6bb-81be-72795f0a645b@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/20/22 18:41, Matheus Kowalczuk Ferst wrote:
> On 17/06/2022 07:12, Paolo Bonzini wrote:
>> Hi Matheus,
>>
>> could you please test the tests-tcg-next branch at
>> https://gitlab.com/bonzini/qemu?
> At be6090bcac10, it works if no BE toolchain is present. Otherwise, the
> script probes powerpc64-linux-gnu-gcc instead of the native tools for
> ppc64le-linux-user, and then do_compiler fails because the
> $target_cflags contains -mlittle-endian.
> 

So the problem in that case is that powerpc64-linux-gnu-gcc is _not_
biarch and thus does not support -mlittle-endian?  (I thought PPC
compilers were all 32/64-bit and bi-endian).

If so, I guess this would fix your case

diff --git a/configure b/configure
index 0fd2838e82..6ad888ed97 100755
--- a/configure
+++ b/configure
@@ -2041,22 +2041,6 @@ probe_target_compiler() {
      : ${container_cross_strip:=${container_cross_prefix}strip}
    done

-  eval "target_cflags=\${cross_cc_cflags_$1}"
-  if eval test -n "\"\${cross_cc_$1}\""; then
-    if eval has "\"\${cross_cc_$1}\""; then
-      eval "target_cc=\"\${cross_cc_$1}\""
-    fi
-  else
-    compute_target_variable $1 target_cc gcc
-  fi
-  target_ccas=$target_cc
-  compute_target_variable $1 target_ar ar
-  compute_target_variable $1 target_as as
-  compute_target_variable $1 target_ld ld
-  compute_target_variable $1 target_nm nm
-  compute_target_variable $1 target_objcopy objcopy
-  compute_target_variable $1 target_ranlib ranlib
-  compute_target_variable $1 target_strip strip
    case "$1:$cpu" in
      aarch64_be:aarch64 | \
      armeb:arm | \
@@ -2065,17 +2049,35 @@ probe_target_compiler() {
      ppc*:ppc64 | \
      sparc:sparc64 | \
      "$cpu:$cpu")
-      : ${target_cc:=$cc}
-      : ${target_ccas:=$ccas}
-      : ${target_as:=$as}
-      : ${target_ld:=$ld}
-      : ${target_ar:=$ar}
-      : ${target_as:=$as}
-      : ${target_ld:=$ld}
-      : ${target_nm:=$nm}
-      : ${target_objcopy:=$objcopy}
-      : ${target_ranlib:=$ranlib}
-      : ${target_strip:=$strip}
+      target_cc=$cc
+      target_ccas=$ccas
+      target_as=$as
+      target_ld=$ld
+      target_ar=$ar
+      target_as=$as
+      target_ld=$ld
+      target_nm=$nm
+      target_objcopy=$objcopy
+      target_ranlib=$ranlib
+      target_strip=$strip
+      ;;
+    *)
+      eval "target_cflags=\${cross_cc_cflags_$1}"
+      if eval test -n "\"\${cross_cc_$1}\""; then
+        if eval has "\"\${cross_cc_$1}\""; then
+          eval "target_cc=\"\${cross_cc_$1}\""
+        fi
+      else
+        compute_target_variable $1 target_cc gcc
+      fi
+      target_ccas=$target_cc
+      compute_target_variable $1 target_ar ar
+      compute_target_variable $1 target_as as
+      compute_target_variable $1 target_ld ld
+      compute_target_variable $1 target_nm nm
+      compute_target_variable $1 target_objcopy objcopy
+      compute_target_variable $1 target_ranlib ranlib
+      compute_target_variable $1 target_strip strip
        ;;
    esac
    if test -n "$target_cc"; then

but it would break the opposite of compiling tests/tcg QEMU
with a big-endian non-biarch compiler.

In any case, the series is already a step forward so I've sent it out.

Paolo

