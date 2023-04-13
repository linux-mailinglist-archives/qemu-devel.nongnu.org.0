Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 229E76E0CD9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 13:42:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmvKl-0004Mb-Ka; Thu, 13 Apr 2023 07:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmvKa-0004M4-2V
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 07:41:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmvKX-0003KE-Kc
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 07:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681386091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SauiwSHmWBRlWWR61KVa/PEGaYPE+tkws0PskuLjAi8=;
 b=Le/N/3ThPLtsJQ58ApEyMTg/GJo0rq97ODVyrGMue0QEUdHwl7Zd9bGbA7Tb9xfX2dT9hO
 4slx/oHTKL8WDO4dH79HpQeL3yVFyuSW4qvx8v+Y5VcS5VioqyLKALNAoNzyOJBVDneM4g
 h1MotsME9nOjWElLGbGVamyRhdn/Z4k=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-P-24F2tSMuKRyzrA1IB0VA-1; Thu, 13 Apr 2023 07:41:30 -0400
X-MC-Unique: P-24F2tSMuKRyzrA1IB0VA-1
Received: by mail-qv1-f72.google.com with SMTP id
 i8-20020a0cd848000000b005e819d53af0so8477797qvj.20
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 04:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681386090; x=1683978090;
 h=content-transfer-encoding:in-reply-to:subject:from:references:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SauiwSHmWBRlWWR61KVa/PEGaYPE+tkws0PskuLjAi8=;
 b=WCtXo8tFFVhMPOtRbDbTODfevstOPDkSGXVRPZ19vcNqaVZYgeWLbFyxWgYiupAye/
 AT5FwEhaA5DQ93q6LMZd62yE/XZtzruIC/gUEN+AhQ1BPs2iuhmiquQ9Q5duadiTpAyp
 RrJD9I1CzBCii9O5/L+y9udHRmaJN5R5TjXZnAPyvb7U/pxFctMnfHBpoDwqhYp7mRal
 SulNuw2+oUJ7w3VQZW8ZVHQLkwGlnS80Pj9tRIzB0WLXfyiab4pXdma3VG/js+HdOv11
 VBkzXNxTClHoebwR4oK+DzcIh8ieaEP8V/4DaVhmr0Gez+WQ8zitfeKbj/ap1k8wu7rJ
 wI2A==
X-Gm-Message-State: AAQBX9dWGQef6D9cZcCD+0gGGjckGdQqIIiuryRD9tCtjgc5B9Otidnk
 MuDayUSZtx836vzsdS/ypZij5i5HMvTri9RSrh4GKQteZYhMM5gAqDSC7R22k8I5fGns5gHhAhw
 5XI4fevA5weRqkBzcJKheAbA=
X-Received: by 2002:ad4:5c44:0:b0:5b0:67f3:d91b with SMTP id
 a4-20020ad45c44000000b005b067f3d91bmr3106026qva.35.1681386089911; 
 Thu, 13 Apr 2023 04:41:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350arAapierAHZ+9JcGDw5/L9INA3pihdmhbT1GcHayIVSNTj1KZGwgVL1yl7QyeykL+lc03uVg==
X-Received: by 2002:ad4:5c44:0:b0:5b0:67f3:d91b with SMTP id
 a4-20020ad45c44000000b005b067f3d91bmr3106003qva.35.1681386089644; 
 Thu, 13 Apr 2023 04:41:29 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-153.web.vodafone.de.
 [109.43.179.153]) by smtp.gmail.com with ESMTPSA id
 z22-20020ac87cb6000000b003e394714c07sm434852qtv.10.2023.04.13.04.41.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 04:41:29 -0700 (PDT)
Message-ID: <5caa18b7-9920-7867-77aa-5d9770cbde14@redhat.com>
Date: Thu, 13 Apr 2023 13:41:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Steven Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <bafc456e-34be-f2a4-71fc-e52ed964484e@oracle.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: clean after distclean gobbles source files
In-Reply-To: <bafc456e-34be-f2a4-71fc-e52ed964484e@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07/04/2023 17.44, Steven Sistare wrote:
> Run 'make distclean', and GNUmakefile is removed.
> But, GNUmakefile is where we cd to build/.
> Run 'make distclean' or 'make clean' again, and Makefile applies
> the clean actions, such as this one, at the top level of the tree:
> 
>      find . \( -name '*.so' -o -name '*.dll' -o \
>            -name '*.[oda]' -o -name '*.gcno' \) -type f \
>          ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-aarch64.a \
>          ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-arm.a \
>          -exec rm {} +
> 
> For example, it removes the .d source files in 'meson/test cases/d/*/*.d'.
> The damage could be worse in the future if more suffixes are cleaned.
> 
> I don't have a suggested fix.  Recursion and the GNUmakefile bootstrap
> make it non-trivial.

That's somewhat ugly, indeed.

We could maybe disallow make [dist]clean if running in-tree? Something like that:

diff a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -26,7 +26,7 @@ quiet-command-run = $(if $(V),,$(if $2,printf "  %-7s %s\n" $2 $3 && ))$1
  quiet-@ = $(if $(V),,@)
  quiet-command = $(quiet-@)$(call quiet-command-run,$1,$2,$3)
  
-UNCHECKED_GOALS := %clean TAGS cscope ctags dist \
+UNCHECKED_GOALS := TAGS cscope ctags dist \
      help check-help print-% \
      docker docker-% vm-help vm-test vm-build-%
  
@@ -201,7 +201,7 @@ recurse-distclean: $(addsuffix /distclean, $(ROMS))
  
  ######################################################################
  
-clean: recurse-clean
+clean: config-host.mak recurse-clean
         -$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean || :
         -$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) clean-ctlist || :
         find . \( -name '*.so' -o -name '*.dll' -o \


... or if we still want to allow that, maybe just make an exception for the *.d files:

diff --git a/Makefile b/Makefile
index e421f8a1f4..0cb2a7aa98 100644
--- a/Makefile
+++ b/Makefile
@@ -208,6 +208,7 @@ clean: recurse-clean
                   -name '*.[oda]' -o -name '*.gcno' \) -type f \
                 ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-aarch64.a \
                 ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-arm.a \
+               ! -path './meson/test cases/d/*/*.d' \
                 -exec rm {} +
         rm -f TAGS cscope.* *~ */*~
  

What do you think?

  Thomas


