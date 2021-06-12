Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CEF3A50F0
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 23:20:38 +0200 (CEST)
Received: from localhost ([::1]:54932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsB3U-0003Va-PO
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 17:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsB2N-0002qy-7T
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 17:19:28 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsB2L-00073Y-0K
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 17:19:26 -0400
Received: by mail-pl1-x635.google.com with SMTP id 11so4568243plk.12
 for <qemu-devel@nongnu.org>; Sat, 12 Jun 2021 14:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=LsBOQcyAlmV3MkQa0zjdmGfuOR4Rz1M+BHsQtGVEwkQ=;
 b=lc/C7R8UNVnnJK4myVPcwEmfGsZ0tzu6Hn+4SEprhQ7kmplem+c8SrCjJTjg+MLpSp
 21YlTKY5VYnaMu7QrwsKpSMheM0Y6wXMYF1ht+Crndv+cTkW58HwzPCU8Ff1wH4g3Top
 EKT0dvV+Rbk+R1Qotok5QzbKUupid3KiviUAVM3Gl6GunC9+JrqgL90oruEqqhMa3e60
 Ku35zkVLGQZJ/JbU8r+j7SedAii3jfErnmnI+pAd+f+clfZq0dwYVr5v2+SLJQj9XWys
 EcfHGjNALErn0A6ZcwSbxZCIsgq6K8cmempUmCPnHEpa3diVbGTTeBtccOy8wVp2BWNV
 8HSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=LsBOQcyAlmV3MkQa0zjdmGfuOR4Rz1M+BHsQtGVEwkQ=;
 b=H7w9o6DuRsD0uwTsZx+WBxlHzddnSdvQNNIEEdCqT5SUugqCGQoc1hEfBR8laj/xUj
 C56mZZg6BYWv1giLE3dsxlehxRWGPFQn0cKBp4Ftoz7v0d47p12v6n7Y1XydXJksfara
 NOYnRIA3M2/JT6Q30cygB/k354hA09EHxtAreIArpoUQz9ha2oatars/uBgZlTqEPf9r
 hm8Z2+aFhh0dqzi8XsoGk0vQbJVMH//Tr6I9X85Hk/RntzOp2dnhORrj1z7RzoLlwmBd
 Ns26eEsB35yYLdUb0fYDN3Bv3l16aREGxuTreb9+OnA+dyzvRccdK7qcv9LlRBUI1RNN
 Trxw==
X-Gm-Message-State: AOAM533uboPEPq8Viy0Ei7JXewSEHEYsViFKBzqtTECZdY1cJexq3b/X
 EzrgoJ/hrPQirtHZAsUXFiUPqQ==
X-Google-Smtp-Source: ABdhPJzzRZSf7hdt91x3/hH8LSh63C+dfixa1HFGAR1O3RvJ3nWyc+rJISCIvEqkWhVN4GYA8fiP7Q==
X-Received: by 2002:a17:902:ab95:b029:ee:f899:6fe8 with SMTP id
 f21-20020a170902ab95b02900eef8996fe8mr9912747plr.81.1623532762911; 
 Sat, 12 Jun 2021 14:19:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 c3sm8288561pfl.42.2021.06.12.14.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jun 2021 14:19:22 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Implement MTE3
To: Peter Collingbourne <pcc@google.com>
References: <20210611190653.754648-1-pcc@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08ec844b-5d44-e2dc-407b-beec56b2f4c7@linaro.org>
Date: Sat, 12 Jun 2021 14:19:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210611190653.754648-1-pcc@google.com>
Content-Type: multipart/mixed; boundary="------------01D34685099545FECC5FB42E"
Content-Language: en-US
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, qemu-devel@nongnu.org,
 Evgenii Stepanov <eugenis@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------01D34685099545FECC5FB42E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/21 12:06 PM, Peter Collingbourne wrote:
> MTE3 introduces an asymmetric tag checking mode, in which loads are
> checked synchronously and stores are checked asynchronously. Add
> support for it.
> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> ---
>   target/arm/cpu64.c      |  2 +-
>   target/arm/mte_helper.c | 83 ++++++++++++++++++++++++++---------------
>   2 files changed, 53 insertions(+), 32 deletions(-)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 1c23187d1a..c7a1626bec 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -683,7 +683,7 @@ static void aarch64_max_initfn(Object *obj)
>            * during realize if the board provides no tag memory, much like
>            * we do for EL2 with the virtualization=on property.
>            */
> -        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 2);
> +        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);
>           cpu->isar.id_aa64pfr1 = t;
>   
>           t = cpu->isar.id_aa64mmfr0;
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 166b9d260f..7b76d871ff 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -538,13 +538,51 @@ void HELPER(stzgm_tags)(CPUARMState *env, uint64_t ptr, uint64_t val)
>       }
>   }
>   
> +static void mte_sync_check_fail(CPUARMState *env, uint32_t desc,
> +                                uint64_t dirty_ptr, uintptr_t ra)
> +{
> +    int is_write, syn;
> +
> +    env->exception.vaddress = dirty_ptr;
> +
> +    is_write = FIELD_EX32(desc, MTEDESC, WRITE);
> +    syn = syn_data_abort_no_iss(arm_current_el(env) != 0, 0, 0, 0, 0, is_write,
> +                                0x11);
> +    raise_exception_ra(env, EXCP_DATA_ABORT, syn, exception_target_el(env), ra);
> +    g_assert_not_reached();
> +}
> +
> +static void mte_async_check_fail(CPUARMState *env, uint32_t desc,
> +                                 uint64_t dirty_ptr, uintptr_t ra,
> +                                 ARMMMUIdx arm_mmu_idx, int el)
> +{
> +    int select;
> +
> +    if (regime_has_2_ranges(arm_mmu_idx)) {
> +        select = extract64(dirty_ptr, 55, 1);
> +    } else {
> +        select = 0;
> +    }
> +    env->cp15.tfsr_el[el] |= 1 << select;
> +#ifdef CONFIG_USER_ONLY
> +    /*
> +     * Stand in for a timer irq, setting _TIF_MTE_ASYNC_FAULT,
> +     * which then sends a SIGSEGV when the thread is next scheduled.
> +     * This cpu will return to the main loop at the end of the TB,
> +     * which is rather sooner than "normal".  But the alternative
> +     * is waiting until the next syscall.
> +     */
> +    qemu_cpu_kick(env_cpu(env));
> +#endif
> +}

This is ok, though the desc parameter is unused for async.
I'm not adverse to using a goto, like so.

But either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

---%<
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 9e615cc513..e93603bc02 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -561,12 +561,23 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
          tcf = extract64(sctlr, 40, 2);
      }

+    is_write = FIELD_EX32(desc, MTEDESC, WRITE);
+
      switch (tcf) {
+    default: /* case 3 */
+        /*
+         * Tag check fail causes asynchronous flag set for stores,
+         * or a synchronous exception for loads.
+         */
+        if (is_write) {
+            goto fail_async;
+        }
+        /* fall through */
+
      case 1:
          /* Tag check fail causes a synchronous exception. */
          env->exception.vaddress = dirty_ptr;

-        is_write = FIELD_EX32(desc, MTEDESC, WRITE);
          syn = syn_data_abort_no_iss(arm_current_el(env) != 0, 0, 0, 0, 0,
                                      is_write, 0x11);
          raise_exception_ra(env, EXCP_DATA_ABORT, syn,
@@ -582,6 +593,7 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
          g_assert_not_reached();

      case 2:
+    fail_async:
          /* Tag check fail causes asynchronous flag set.  */
          if (regime_has_2_ranges(arm_mmu_idx)) {
              select = extract64(dirty_ptr, 55, 1);
@@ -600,14 +612,6 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
          qemu_cpu_kick(env_cpu(env));
  #endif
          break;
-
-    default:
-        /* Case 3: Reserved. */
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "Tag check failure with SCTLR_EL%d.TCF%s "
-                      "set to reserved value %d\n",
-                      reg_el, el ? "" : "0", tcf);
-        break;
      }
  }

--------------01D34685099545FECC5FB42E
Content-Type: text/plain; charset=UTF-8;
 name="z"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="z"

ZGlmZiAtLWdpdCBhL3RhcmdldC9hcm0vY3B1NjQuYyBiL3RhcmdldC9hcm0vY3B1NjQuYwpp
bmRleCAxYzIzMTg3ZDFhLi5jNGFmZWU3N2Q3IDEwMDY0NAotLS0gYS90YXJnZXQvYXJtL2Nw
dTY0LmMKKysrIGIvdGFyZ2V0L2FybS9jcHU2NC5jCkBAIC02NzksOSArNjc5LDEwIEBAIHN0
YXRpYyB2b2lkIGFhcmNoNjRfbWF4X2luaXRmbihPYmplY3QgKm9iaikKICAgICAgICAgdCA9
IEZJRUxEX0RQNjQodCwgSURfQUE2NFBGUjEsIEJULCAxKTsKICAgICAgICAgdCA9IEZJRUxE
X0RQNjQodCwgSURfQUE2NFBGUjEsIFNTQlMsIDIpOwogICAgICAgICAvKgotICAgICAgICAg
KiBCZWdpbiB3aXRoIGZ1bGwgc3VwcG9ydCBmb3IgTVRFLiBUaGlzIHdpbGwgYmUgZG93bmdy
YWRlZCB0byBNVEU9MAotICAgICAgICAgKiBkdXJpbmcgcmVhbGl6ZSBpZiB0aGUgYm9hcmQg
cHJvdmlkZXMgbm8gdGFnIG1lbW9yeSwgbXVjaCBsaWtlCi0gICAgICAgICAqIHdlIGRvIGZv
ciBFTDIgd2l0aCB0aGUgdmlydHVhbGl6YXRpb249b24gcHJvcGVydHkuCisgICAgICAgICAq
IEJlZ2luIHdpdGggZnVsbCBzdXBwb3J0IGZvciBNVEUgKEZFQVRfTVRFMykuIFRoaXMgd2ls
bCBiZQorICAgICAgICAgKiBkb3duZ3JhZGVkIHRvIE1URT0wIChubyBNVEUpIGR1cmluZyBy
ZWFsaXplIGlmIHRoZSBib2FyZAorICAgICAgICAgKiBwcm92aWRlcyBubyB0YWcgbWVtb3J5
LCBtdWNoIGxpa2Ugd2UgZG8gZm9yIEVMMiB3aXRoIHRoZQorICAgICAgICAgKiB2aXJ0dWFs
aXphdGlvbj1vbiBwcm9wZXJ0eS4KICAgICAgICAgICovCiAgICAgICAgIHQgPSBGSUVMRF9E
UDY0KHQsIElEX0FBNjRQRlIxLCBNVEUsIDIpOwogICAgICAgICBjcHUtPmlzYXIuaWRfYWE2
NHBmcjEgPSB0OwpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2FybS9tdGVfaGVscGVyLmMgYi90YXJn
ZXQvYXJtL210ZV9oZWxwZXIuYwppbmRleCA5ZTYxNWNjNTEzLi5lOTM2MDNiYzAyIDEwMDY0
NAotLS0gYS90YXJnZXQvYXJtL210ZV9oZWxwZXIuYworKysgYi90YXJnZXQvYXJtL210ZV9o
ZWxwZXIuYwpAQCAtNTYxLDEyICs1NjEsMjMgQEAgc3RhdGljIHZvaWQgbXRlX2NoZWNrX2Zh
aWwoQ1BVQVJNU3RhdGUgKmVudiwgdWludDMyX3QgZGVzYywKICAgICAgICAgdGNmID0gZXh0
cmFjdDY0KHNjdGxyLCA0MCwgMik7CiAgICAgfQogCisgICAgaXNfd3JpdGUgPSBGSUVMRF9F
WDMyKGRlc2MsIE1URURFU0MsIFdSSVRFKTsKKwogICAgIHN3aXRjaCAodGNmKSB7CisgICAg
ZGVmYXVsdDogLyogY2FzZSAzICovCisgICAgICAgIC8qCisgICAgICAgICAqIFRhZyBjaGVj
ayBmYWlsIGNhdXNlcyBhc3luY2hyb25vdXMgZmxhZyBzZXQgZm9yIHN0b3JlcywKKyAgICAg
ICAgICogb3IgYSBzeW5jaHJvbm91cyBleGNlcHRpb24gZm9yIGxvYWRzLgorICAgICAgICAg
Ki8KKyAgICAgICAgaWYgKGlzX3dyaXRlKSB7CisgICAgICAgICAgICBnb3RvIGZhaWxfYXN5
bmM7CisgICAgICAgIH0KKyAgICAgICAgLyogZmFsbCB0aHJvdWdoICovCisKICAgICBjYXNl
IDE6CiAgICAgICAgIC8qIFRhZyBjaGVjayBmYWlsIGNhdXNlcyBhIHN5bmNocm9ub3VzIGV4
Y2VwdGlvbi4gKi8KICAgICAgICAgZW52LT5leGNlcHRpb24udmFkZHJlc3MgPSBkaXJ0eV9w
dHI7CiAKLSAgICAgICAgaXNfd3JpdGUgPSBGSUVMRF9FWDMyKGRlc2MsIE1URURFU0MsIFdS
SVRFKTsKICAgICAgICAgc3luID0gc3luX2RhdGFfYWJvcnRfbm9faXNzKGFybV9jdXJyZW50
X2VsKGVudikgIT0gMCwgMCwgMCwgMCwgMCwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGlzX3dyaXRlLCAweDExKTsKICAgICAgICAgcmFpc2VfZXhjZXB0aW9uX3Jh
KGVudiwgRVhDUF9EQVRBX0FCT1JULCBzeW4sCkBAIC01ODIsNiArNTkzLDcgQEAgc3RhdGlj
IHZvaWQgbXRlX2NoZWNrX2ZhaWwoQ1BVQVJNU3RhdGUgKmVudiwgdWludDMyX3QgZGVzYywK
ICAgICAgICAgZ19hc3NlcnRfbm90X3JlYWNoZWQoKTsKIAogICAgIGNhc2UgMjoKKyAgICBm
YWlsX2FzeW5jOgogICAgICAgICAvKiBUYWcgY2hlY2sgZmFpbCBjYXVzZXMgYXN5bmNocm9u
b3VzIGZsYWcgc2V0LiAgKi8KICAgICAgICAgaWYgKHJlZ2ltZV9oYXNfMl9yYW5nZXMoYXJt
X21tdV9pZHgpKSB7CiAgICAgICAgICAgICBzZWxlY3QgPSBleHRyYWN0NjQoZGlydHlfcHRy
LCA1NSwgMSk7CkBAIC02MDAsMTQgKzYxMiw2IEBAIHN0YXRpYyB2b2lkIG10ZV9jaGVja19m
YWlsKENQVUFSTVN0YXRlICplbnYsIHVpbnQzMl90IGRlc2MsCiAgICAgICAgIHFlbXVfY3B1
X2tpY2soZW52X2NwdShlbnYpKTsKICNlbmRpZgogICAgICAgICBicmVhazsKLQotICAgIGRl
ZmF1bHQ6Ci0gICAgICAgIC8qIENhc2UgMzogUmVzZXJ2ZWQuICovCi0gICAgICAgIHFlbXVf
bG9nX21hc2soTE9HX0dVRVNUX0VSUk9SLAotICAgICAgICAgICAgICAgICAgICAgICJUYWcg
Y2hlY2sgZmFpbHVyZSB3aXRoIFNDVExSX0VMJWQuVENGJXMgIgotICAgICAgICAgICAgICAg
ICAgICAgICJzZXQgdG8gcmVzZXJ2ZWQgdmFsdWUgJWRcbiIsCi0gICAgICAgICAgICAgICAg
ICAgICAgcmVnX2VsLCBlbCA/ICIiIDogIjAiLCB0Y2YpOwotICAgICAgICBicmVhazsKICAg
ICB9CiB9CiAK
--------------01D34685099545FECC5FB42E--

