Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70CF667182
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:01:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFwGZ-00063t-7r; Thu, 12 Jan 2023 07:01:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFwGN-0005tY-2F
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:00:58 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFwGK-0002hl-TK
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:00:54 -0500
Received: by mail-wr1-x433.google.com with SMTP id e3so8629384wru.13
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 04:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vWCBoN1tig9rDoLu1qChhdC47CL3yTNGaKaRXcrtWY8=;
 b=THGd1c9U9nbzBShK00Cai9+zdD2m9M3KKgT/G5Pq5js3SJ2yFFdNARDxCwQxngI30p
 lvgIAlE1mJiAcJj9ffLLvZRlixmH21vYZqJLbCyYrUYAstEVvQ8YbH4XZToVMJyN8wci
 IugOrNgnu4dXaQhrgJx9w4L0E3SOKIKSlVigoWKqra1f2Z0+GyHwcGj0HYJoc6kePaww
 F5y7Paj18PmYVGeN6iAfS9+fDtMaId0zLJQZq+48YuzWs7jp1wlI+PgEeyTrhbscoCDx
 smgt/X24EGXrGPK9Epyenz0vrppdyJeDDlyfAcoiVTYtxxYms9OBiw2SgyPO4QAqllpn
 5tcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vWCBoN1tig9rDoLu1qChhdC47CL3yTNGaKaRXcrtWY8=;
 b=lBAy1mKfRWZ1u7RQEaTsOu51OLEaO2VUkdAbFD8gNpD9TUhWQUpSFNYTunG1fJF3r7
 p0KILoqXYw5QBXqfYCEjUnvUaD1MzdS/MCk8WSCuoKicgrjsrWo4LY1jGylSboiwWEQu
 NOL/dGVeTF+GAzhAorOunUlwzh6baJ2X+gqB/qCXRpEjgl5kAWF3UE6RzY1BVsHgGB4o
 k6YyMr/VVYJ7tpwhSh8zQVf3uGm0mabuXvS5ZZekhrEyxBD/cG3YH0ziVti5s62p/tO9
 CjWePsuEDTHXrucd3DtnZsR/DXyoc2VJTFAxF653izOVESNJkKHJj39Tm0vb8ZGedOKv
 ib0w==
X-Gm-Message-State: AFqh2kqVsfcJ1hf2q5tZYHye/rm1hpNh/A84OOTxKfCt2yRJCb16Lq4h
 iLk7j4s7O9PgopDMmRcCR+oXqzcJvM+yy550
X-Google-Smtp-Source: AMrXdXt0g77GekBkZUh8CELTnmTdnDR7VxO7/I2ezNdmKYAFEetecwycg7tk4AOJkj3KWQmZCTcWcg==
X-Received: by 2002:a05:6000:694:b0:26c:e7a9:97a9 with SMTP id
 bo20-20020a056000069400b0026ce7a997a9mr56956928wrb.60.1673524851130; 
 Thu, 12 Jan 2023 04:00:51 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f3-20020adfdb43000000b00236883f2f5csm16506517wrj.94.2023.01.12.04.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 04:00:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 243661FFB7;
 Thu, 12 Jan 2023 12:00:50 +0000 (GMT)
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-26-alex.bennee@linaro.org>
 <8f016b06-5f09-b14c-a3a1-6d2b93f516e7@linaro.org>
 <87o7r4m63g.fsf@linaro.org>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>
Subject: Re: [PATCH 25/26] tcg: exclude lookup_tb_ptr from helper
 instrumentation
Date: Thu, 12 Jan 2023 11:59:59 +0000
In-reply-to: <87o7r4m63g.fsf@linaro.org>
Message-ID: <87fscgm07h.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Richard Henderson <richard.henderson@linaro.org> writes:
>
>> On 1/10/23 09:39, Alex Benn=C3=A9e wrote:
>>> From: Emilio Cota <cota@braap.org>
>>> It is internal to TCG and therefore we know it does not
>>> access guest memory.
>>> Related: #1381
>>> Signed-off-by: Emilio Cota <cota@braap.org>
>>> Message-Id: <20230108164731.61469-4-cota@braap.org>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> ---
>>>   tcg/tcg.c | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>> diff --git a/tcg/tcg.c b/tcg/tcg.c
>>> index da91779890..ee67eefc0c 100644
>>> --- a/tcg/tcg.c
>>> +++ b/tcg/tcg.c
>>> @@ -1652,8 +1652,10 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int=
 nargs, TCGTemp **args)
>>>       op =3D tcg_op_alloc(INDEX_op_call, total_args);
>>>     #ifdef CONFIG_PLUGIN
>>> -    /* detect non-plugin helpers */
>>> -    if (tcg_ctx->plugin_insn && unlikely(strncmp(info->name, "plugin_"=
, 7))) {
>>> +    /* flag helpers that are not internal to TCG */
>>> +    if (tcg_ctx->plugin_insn &&
>>> +        strncmp(info->name, "plugin_", 7) &&
>>> +        strcmp(info->name, "lookup_tb_ptr")) {
>>>           tcg_ctx->plugin_insn->calls_helpers =3D true;
>>>       }
>>>   #endif
>>
>> I think this should be detected with
>>
>>   !(info->flags & TCG_CALL_NO_SIDE_EFFECTS)
>>
>> i.e., side-effects, which in this case is the possibility of a fault.
>
> That implies that:
>
> DEF_HELPER_FLAGS_2(plugin_vcpu_udata_cb, TCG_CALL_NO_RWG, void, i32, ptr)
> DEF_HELPER_FLAGS_4(plugin_vcpu_mem_cb, TCG_CALL_NO_RWG, void, i32, i32, i=
64, ptr)
>
> should be the _SE variants as well right? They do have side-effects but
> not in guest state and they shouldn't cause a fault.

Hmm but we don't want them to go away. Maybe something like:

3 files changed, 7 insertions(+), 5 deletions(-)
accel/tcg/plugin-helpers.h | 4 ++--
include/tcg/tcg.h          | 2 ++
tcg/tcg.c                  | 6 +++---

modified   accel/tcg/plugin-helpers.h
@@ -1,4 +1,4 @@
 #ifdef CONFIG_PLUGIN
-DEF_HELPER_FLAGS_2(plugin_vcpu_udata_cb, TCG_CALL_NO_RWG, void, i32, ptr)
-DEF_HELPER_FLAGS_4(plugin_vcpu_mem_cb, TCG_CALL_NO_RWG, void, i32, i32, i6=
4, ptr)
+DEF_HELPER_FLAGS_2(plugin_vcpu_udata_cb, TCG_CALL_NO_RWG | TCG_CALL_PLUGIN=
, void, i32, ptr)
+DEF_HELPER_FLAGS_4(plugin_vcpu_mem_cb, TCG_CALL_NO_RWG | TCG_CALL_PLUGIN, =
void, i32, i32, i64, ptr)
 #endif
modified   include/tcg/tcg.h
@@ -405,6 +405,8 @@ typedef TCGv_ptr TCGv_env;
 #define TCG_CALL_NO_SIDE_EFFECTS    0x0004
 /* Helper is G_NORETURN.  */
 #define TCG_CALL_NO_RETURN          0x0008
+/* Helper is part of Plugins.  */
+#define TCG_CALL_PLUGIN             0x0010
=20
 /* convenience version of most used call flags */
 #define TCG_CALL_NO_RWG         TCG_CALL_NO_READ_GLOBALS
modified   tcg/tcg.c
@@ -1652,10 +1652,10 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int na=
rgs, TCGTemp **args)
     op =3D tcg_op_alloc(INDEX_op_call, total_args);
=20
 #ifdef CONFIG_PLUGIN
-    /* flag helpers that are not internal to TCG */
+    /* Flag helpers that may affect guest state */
     if (tcg_ctx->plugin_insn &&
-        strncmp(info->name, "plugin_", 7) &&
-        strcmp(info->name, "lookup_tb_ptr")) {
+        !(info->flags & TCG_CALL_PLUGIN) &&
+        !(info->flags & TCG_CALL_NO_SIDE_EFFECTS)) {
         tcg_ctx->plugin_insn->calls_helpers =3D true;
     }
 #endif

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

