Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0237B300F1E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 22:45:42 +0100 (CET)
Received: from localhost ([::1]:35708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l34FR-0006kZ-1U
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 16:45:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l34Dv-0006Ir-Dz
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:44:07 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l34Ds-0003Ut-6v
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:44:07 -0500
Received: by mail-ej1-x62c.google.com with SMTP id w1so9693015ejf.11
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 13:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2WvuqwBGcXFxWRPVV0AeaMx1ipDeukZI4alQV0le7PA=;
 b=Ale3VWnht3U2RLUKCGxsQLWhSZakhOoKvmQ3nCN7TPd2c+QEbGRG0OIqnQ33h7RAop
 pOaiZCOQLzpEp5wXsnksqvwXK5AbppAZmJ2kBpWU9f3Jw3piFmEeyXDmngXT/G0b9rT/
 X1+8kAj0XMLKfXmWaVVcX0Lf3Jv4sjzQxfHBW0+B03BsPmMm8TwdCeAJwizxn/ArZuft
 p/2vZEJXksTEk0vTNIacGJL7PmYV8Gqq4q4lob2wyobBdqxSOC94X1QNFE0KbVUosBrz
 oAPCVvEtndaf5Zd2J61iZI/g/WaTPMoxcLPledo681tqIClWK9/zhY7l40681xRBQWTp
 +g4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2WvuqwBGcXFxWRPVV0AeaMx1ipDeukZI4alQV0le7PA=;
 b=ZUuykA1XvVzoICjK3YhUo6UniHkT7fMCaSeG5X9uonP/yjCIhlxxPKhpFeCaWdxngv
 r/kUAim682gf2fP9uiIrVdjJut1A6HkEvVrY45VssgVJraPR9tQVISM3kIH5pp5JrG23
 b6cJy+XfQZ0JJ6xhnXX6ST+JJ7kX0AtkYR70508xslLEMhoh5YQvJbqbbNxmczXXLUSs
 pvkTDN1hIjDeUbu3k2JoPiOItlmLXjT2Z4XUhy42+JsoF8idMgyMhosvT08BnU1ZB9mc
 XGC7I2ElfbF7H52cR+ul/Miqn2zIeCaWfLqZDURxGIc4X14FwhbSLNY0hiAqmoppykPp
 Jewg==
X-Gm-Message-State: AOAM5321aqsa/eR3/pWLphuntsBuXOHgCVu2EY8+S9jnJh/Sb/EewHjF
 hU1sw2ckkhnj+zVjkdBTAqU=
X-Google-Smtp-Source: ABdhPJxk2n3pSXOr8iSWSzFLlL49Tp782JRuj9fc6jBwjdLcg95LX3UceWQ8YeUClNhlOYtbWBlTtQ==
X-Received: by 2002:a17:906:9381:: with SMTP id
 l1mr4504411ejx.433.1611351842703; 
 Fri, 22 Jan 2021 13:44:02 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k16sm5254661ejd.78.2021.01.22.13.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 13:44:01 -0800 (PST)
Subject: Re: [PATCH v7 07/35] Hexagon (target/hexagon) scalar core helpers
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-8-git-send-email-tsimpson@quicinc.com>
 <ae9949ca-aa0c-8917-8498-2b0dc5161465@amsat.org>
Message-ID: <4f52f867-6f88-0f6c-844d-5ef8d4c0c12b@amsat.org>
Date: Fri, 22 Jan 2021 22:44:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <ae9949ca-aa0c-8917-8498-2b0dc5161465@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.221,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ale@rev.ng, richard.henderson@linaro.org, alex.bennee@linaro.org,
 laurent@vivier.eu, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 9:30 PM, Philippe Mathieu-Daudé wrote:
> Hi Taylor,
> 
> On 1/20/21 4:28 AM, Taylor Simpson wrote:
>> The majority of helpers are generated.  Define the helper functions needed
>> then include the generated file
>>
>> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
>> ---
>>  target/hexagon/helper.h    |   85 ++++
>>  target/hexagon/op_helper.c | 1066 ++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 1151 insertions(+)
>>  create mode 100644 target/hexagon/helper.h
>>  create mode 100644 target/hexagon/op_helper.c
> ...

> I'm getting:
> 
> In file included from ../target/hexagon/op_helper.c:23:
> ../target/hexagon/op_helper.c: In function ‘log_reg_write_pair’:
> ../target/hexagon/op_helper.c:74:19: error: format ‘%ld’ expects
> argument of type ‘long int’, but argument 4 has type ‘int64_t’ {aka
> ‘long long int’} [-Werror=format=]
>    74 |     HEX_DEBUG_LOG("log_reg_write_pair[%d:%d] = %ld\n", rnum + 1,
> rnum, val);
>       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>        ~~~
>       |
>        |
>       |
>        int64_t {aka long long int}
> ../target/hexagon/internal.h:28:22: note: in definition of macro
> ‘HEX_DEBUG_LOG’
>    28 |             qemu_log(__VA_ARGS__); \
>       |                      ^~~~~~~~~~~
> ../target/hexagon/op_helper.c:74:50: note: format string is defined here
>    74 |     HEX_DEBUG_LOG("log_reg_write_pair[%d:%d] = %ld\n", rnum + 1,
> rnum, val);
>       |                                                ~~^
>       |                                                  |
>       |                                                  long int
>       |                                                %lld
> In file included from ../target/hexagon/op_helper.c:23:
> ../target/hexagon/op_helper.c: In function ‘log_store64’:
> ../target/hexagon/op_helper.c:109:19: error: format ‘%ld’ expects
> argument of type ‘long int’, but argument 4 has type ‘int64_t’ {aka
> ‘long long int’} [-Werror=format=]
>   109 |     HEX_DEBUG_LOG("log_store%d(0x" TARGET_FMT_lx ", %ld [0x%lx])\n",
>       |                   ^~~~~~~~~~~~~~~~
>   110 |                    width, addr, val, val);
>       |                                 ~~~
>       |                                 |
>       |                                 int64_t {aka long long int}
> ../target/hexagon/internal.h:28:22: note: in definition of macro
> ‘HEX_DEBUG_LOG’
>    28 |             qemu_log(__VA_ARGS__); \
>       |                      ^~~~~~~~~~~
> ../target/hexagon/op_helper.c:109:19: error: format ‘%lx’ expects
> argument of type ‘long unsigned int’, but argument 5 has type ‘int64_t’
> {aka ‘long long int’} [-Werror=format=]
>   109 |     HEX_DEBUG_LOG("log_store%d(0x" TARGET_FMT_lx ", %ld [0x%lx])\n",
>       |                   ^~~~~~~~~~~~~~~~
>   110 |                    width, addr, val, val);
>       |                                      ~~~
>       |                                      |
>       |                                      int64_t {aka long long int}
> ../target/hexagon/internal.h:28:22: note: in definition of macro
> ‘HEX_DEBUG_LOG’
>    28 |             qemu_log(__VA_ARGS__); \
>       |                      ^~~~~~~~~~~
> ../target/hexagon/op_helper.c: In function ‘print_store’:
> ../target/hexagon/op_helper.c:201:27: error: format ‘%lu’ expects
> argument of type ‘long unsigned int’, but argument 3 has type ‘uint64_t’
> {aka ‘long long unsigned int’} [-Werror=format=]
>   201 |             HEX_DEBUG_LOG("\tmemd[0x" TARGET_FMT_lx "] = %lu
> (0x%016lx)\n",
>       |                           ^~~~~~~~~~~
>   202 |                           env->mem_log_stores[slot].va,
>   203 |                           env->mem_log_stores[slot].data64,
>       |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                                    |
>       |                                                    uint64_t {aka
> long long unsigned int}
> ../target/hexagon/internal.h:28:22: note: in definition of macro
> ‘HEX_DEBUG_LOG’
>    28 |             qemu_log(__VA_ARGS__); \
>       |                      ^~~~~~~~~~~
> ../target/hexagon/op_helper.c:201:27: error: format ‘%lx’ expects
> argument of type ‘long unsigned int’, but argument 4 has type ‘uint64_t’
> {aka ‘long long unsigned int’} [-Werror=format=]
>   201 |             HEX_DEBUG_LOG("\tmemd[0x" TARGET_FMT_lx "] = %lu
> (0x%016lx)\n",
>       |                           ^~~~~~~~~~~
> ......
>   204 |                           env->mem_log_stores[slot].data64);
>       |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                                    |
>       |                                                    uint64_t {aka
> long long unsigned int}
> ../target/hexagon/internal.h:28:22: note: in definition of macro
> ‘HEX_DEBUG_LOG’
>    28 |             qemu_log(__VA_ARGS__); \
>       |                      ^~~~~~~~~~~
> 

Fixed with:

-- >8 --
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 5186dd142d5..9153d7a28ef 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -71,7 +71,7 @@ static __attribute__((unused))
 inline void log_reg_write_pair(CPUHexagonState *env, int rnum,
                                       int64_t val, uint32_t slot)
 {
-    HEX_DEBUG_LOG("log_reg_write_pair[%d:%d] = %ld\n", rnum + 1, rnum,
val);
+    HEX_DEBUG_LOG("log_reg_write_pair[%d:%d] = %"PRId64"\n", rnum + 1,
rnum, val);
     log_reg_write(env, rnum, val & 0xFFFFFFFF, slot);
     log_reg_write(env, rnum + 1, (val >> 32) & 0xFFFFFFFF, slot);
 }
@@ -106,7 +106,7 @@ static inline void log_store32(CPUHexagonState *env,
target_ulong addr,
 static inline void log_store64(CPUHexagonState *env, target_ulong addr,
                                int64_t val, int width, int slot)
 {
-    HEX_DEBUG_LOG("log_store%d(0x" TARGET_FMT_lx ", %ld [0x%lx])\n",
+    HEX_DEBUG_LOG("log_store%d(0x" TARGET_FMT_lx ", %"PRId64"
[0x%"PRIx64"])\n",
                    width, addr, val, val);
     env->mem_log_stores[slot].va = addr;
     env->mem_log_stores[slot].width = width;
@@ -198,7 +198,7 @@ static void print_store(CPUHexagonState *env, int slot)
             HEX_DEBUG_LOG("\tmemw[0x" TARGET_FMT_lx "] = %d (0x%08x)\n",
                           env->mem_log_stores[slot].va, data, data);
         } else if (width == 8) {
-            HEX_DEBUG_LOG("\tmemd[0x" TARGET_FMT_lx "] = %lu (0x%016lx)\n",
+            HEX_DEBUG_LOG("\tmemd[0x" TARGET_FMT_lx "] = %"PRIu64"
(0x%016"PRIx64")\n",
                           env->mem_log_stores[slot].va,
                           env->mem_log_stores[slot].data64,
                           env->mem_log_stores[slot].data64);
---

