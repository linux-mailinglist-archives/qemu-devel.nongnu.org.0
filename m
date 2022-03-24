Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062774E6562
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 15:36:16 +0100 (CET)
Received: from localhost ([::1]:39442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXOZT-0002g5-4q
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 10:36:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nXOXo-00020K-0R
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 10:34:32 -0400
Received: from [2a00:1450:4864:20::434] (port=34485
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nXOXm-0001AN-AF
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 10:34:31 -0400
Received: by mail-wr1-x434.google.com with SMTP id m30so6940058wrb.1
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 07:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=N4Zc3pWy/c5LD7OtNPFcCbfctP0uBPQQTBHUXEIaVCA=;
 b=zG2ndXeSzrxeeI4DEYMoC4gHnLw6+W+jh9chcd7KDtfdL2iNLwj94DHw3OxUBfTwUr
 lIne/rFDA6DSaIKbVtHPV8nCd/r5f1ARkCF1z6adV9eTG6SQthvbFby1Gi8PZfrijzno
 jxOmzep6idPwfeQLbOQCtVWYewFOfjhnnkFtSfF9a+UTaWggh18RrUyW6BvzioxUUczY
 Ep/DEOxbQ2NO0dgmL1reWXeRKG0nHpqooRdzBTIri5wb9f+QqK/ZFhT08R7Ew7K6pA2b
 EgAyPvv5wK9pG8dILaq5MX+UnL8nt3jmescxhLk8zUw/q960rD+E+76yNjFytIbISPEe
 s2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=N4Zc3pWy/c5LD7OtNPFcCbfctP0uBPQQTBHUXEIaVCA=;
 b=6N/rrlR0HCCeceOjHRy1oNAOJK8JfnHmMSEPElZ+aeKnZmSHIz2hR5oWXFsQ7AyHZA
 Tv35klpq/fnTadeOMWmCz7k0cdxSv0Rm4py3ZhAyrUP0Z+eq1wA1zRw9lGBFMg+/x0Bb
 dL9PqyiZ8QqSG9xcDWJBi0hY65vx8L/Q/2d/rg8JAKPEYws6LueeXIiK3Grpod7N0kGd
 fop9nGtME9ng7X8xdNFnd8fMu8gSKRuQ1HkalNn3Rc/tZbKVTIOmH2Wy+bU3W55yziOe
 NOD/VrIKUiizvnH7whpO1FxpquN87+fiKFG89kqlIG+ntFJq5Hus49/mjWF+2COgwZ1L
 FYpA==
X-Gm-Message-State: AOAM531RaeD7Y8cB+T40aXNtUn/ngsdCzyUrg8Gf7zaZ4+q8vPb4AA1/
 h0Grv6c+g/RjqUZ9JlRA5sTKUw==
X-Google-Smtp-Source: ABdhPJxLcMpsnprJS9GzgCZmAD2KbPvkAlTBd8z3PZXDwoPuLCR7bG2RsOVLpkyCqrpTd8NkxwOIkw==
X-Received: by 2002:adf:e987:0:b0:203:d6f6:71f3 with SMTP id
 h7-20020adfe987000000b00203d6f671f3mr5189242wrm.82.1648132468127; 
 Thu, 24 Mar 2022 07:34:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm2750231wmb.3.2022.03.24.07.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 07:34:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 287571FFB7;
 Thu, 24 Mar 2022 14:34:26 +0000 (GMT)
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-9-richard.henderson@linaro.org>
 <87a6dg4m2h.fsf@linaro.org>
 <3df76126-e4ab-7821-831a-c1a21e31fbc5@linaro.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL for-7.1 08/36] *: Use fprintf between qemu_log_lock/unlock
Date: Thu, 24 Mar 2022 14:30:00 +0000
In-reply-to: <3df76126-e4ab-7821-831a-c1a21e31fbc5@linaro.org>
Message-ID: <87sfr72zd9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 3/23/22 10:22, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> Inside qemu_log, we perform qemu_log_lock/unlock, which need
>>> not be done if we have already performed the lock beforehand.
>>>
>>> Always check the result of qemu_log_lock -- only checking
>>> qemu_loglevel_mask races with the acquisition of the lock
>>> on the logfile.
>> I'm not sure I like introducing all these raw fprintfs over
>> introducing
>> a function like qemu_log__locked().
>
> There's no way to implement qemu_log__locked with rcu.  The lookup
> itself is what needs the locking; the return value of the FILE* is
> then valid until the unlock.  To lookup the FILE* again would require
> more atomic operations.

That's not what I'm suggesting. qemu_log__locked would be a fairly
simple wrapper around the fprintf:

modified   include/qemu/log.h
@@ -70,6 +70,25 @@ void qemu_log_unlock(FILE *fd);
         }                                               \
     } while (0)
=20
+/**
+ * qemu_log__locked() - log to a locked file
+ * @logfile: FILE handle from qemu_log_lock()
+ * @fmt: printf format
+ * ...: varargs
+ */
+static inline void G_GNUC_PRINTF(2, 3)
+    qemu_log__locked(FILE *logfile, const char *fmt, ...)
+{
+    if (logfile) {
+        va_list ap;
+
+        va_start(ap, fmt);
+        vfprintf(logfile, fmt, ap);
+        va_end(ap);
+    }
+}
+
+
 /* Maintenance: */
=20
 /* define log items */
modified   accel/tcg/translate-all.c
@@ -1546,10 +1546,10 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
             }
=20
             /* Dump header and the first instruction */
-            fprintf(logfile, "OUT: [size=3D%d]\n", gen_code_size);
-            fprintf(logfile,
-                    "  -- guest addr 0x" TARGET_FMT_lx " + tb prologue\n",
-                    tcg_ctx->gen_insn_data[insn][0]);
+            qemu_log__locked(logfile, "OUT: [size=3D%d]\n", gen_code_size);
+            qemu_log__locked(logfile,
+                             "  -- guest addr 0x" TARGET_FMT_lx " + tb pro=
logue\n",
+                             tcg_ctx->gen_insn_data[insn][0]);
             chunk_start =3D tcg_ctx->gen_insn_end_off[insn];
             disas(logfile, tb->tc.ptr, chunk_start);
=20
@@ -1561,8 +1561,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
             while (insn < tb->icount) {
                 size_t chunk_end =3D tcg_ctx->gen_insn_end_off[insn];
                 if (chunk_end > chunk_start) {
-                    fprintf(logfile, "  -- guest addr 0x" TARGET_FMT_lx "\=
n",
-                            tcg_ctx->gen_insn_data[insn][0]);
+                    qemu_log__locked(logfile, "  -- guest addr 0x" TARGET_=
FMT_lx "\n",
+                                     tcg_ctx->gen_insn_data[insn][0]);
                     disas(logfile, tb->tc.ptr + chunk_start,
                           chunk_end - chunk_start);

I would home the inline would mean the compiler could do a semi-decent
job of eliding the multiple logfile checks. The _locked suffix is simply
to indicate it expects a pre-locked file.

> And I do prefer the printfs over repeated qemu_log.

The main benefit from my point of view is it keeps qemu_log operations
grouped together and easier to fix if we for example want to tweak how
we deal with log files in the future.

>
>
> r~


--=20
Alex Benn=C3=A9e

