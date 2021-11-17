Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782E9454503
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 11:32:06 +0100 (CET)
Received: from localhost ([::1]:59136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnIEX-0003Cz-EP
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 05:32:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mnICn-0002R6-JG
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:30:17 -0500
Received: from [2a00:1450:4864:20::32e] (port=37531
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mnICl-00020J-IJ
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:30:17 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso4340105wms.2
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 02:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xn9KT/7h8qTRrsGBRM+fWtURYB3i4EyzYFaszKILkfk=;
 b=ED4IaIJvOAcdzJiSRvXVC/5XLFjpCpXvKoZ/5rbOKZ/ULLrSXq3A4I8SqzwcAvbxeO
 xJmb1niFA10TyCdMtw5gV6Aa5FSTTKz4sz+kqpRMCSm9/ol/LE8snLYF504dF2Dv99rj
 dnP9ezMF/gaifADQcR/CCCC2zfWPQphvvTLWh8LbWvT8MHUzeUt1AIDj5Ia5XpvSAx4l
 iR9PcS2jiXv3P5sUaQHvnYrbSgU0SyQNv+sgDvOGNYEs5AGU9JMpDRezs9kxsFOpeu7L
 FV/HavqtzzWwX5xlOG/FHbDTiQlTSuQPYotf7do0jQNGMq86vot8+MeiUR0JBUsGmL/y
 Ob8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xn9KT/7h8qTRrsGBRM+fWtURYB3i4EyzYFaszKILkfk=;
 b=ujqHBluBH57xpzEYBwRq31AHfLSDNQKbf7UZ5UiCEBrhf3IIgrr7QIJsCvp8+I8JXz
 Svn5fzipSREzTbCKepdZimBPDTRl8+KU/zXfirUchFzcf4G0rtf/ngnXN4qaBhMhWFAl
 7GN5xoGEj6OJP1Af4+mLhV7yEIw57b8TxdIzg6iFnQaOtOtKzU5PQgZCfheT8ynUg/5C
 CVfP1gn9fR/A7BE/qScHoDKgvQWO0uE+nxHArPqlBlPPGTm1fWxZcHZ2js/UPXteJLqj
 s4JjF15XVSsRejT08QNgShyKQGFr3rELZgISMtcC/FGft/MKLyivRJDdM43HmYfsGZMv
 EP+g==
X-Gm-Message-State: AOAM532OckidtEONq8GxYb3YYaXD+F6fAsNPY3WqkBZw7WHvgk+OP486
 9kZ8HKsSrG/GTHxZTNN1E7AJwA==
X-Google-Smtp-Source: ABdhPJyGmp84VaI8oqaXD8+SYmQAN8OLob8c9rMpLXgzTAFQDCpzCTAvncPtgMW9LV/bYKxYs6LAUA==
X-Received: by 2002:a1c:9842:: with SMTP id a63mr78142326wme.102.1637145013873; 
 Wed, 17 Nov 2021 02:30:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c11sm7266626wmq.27.2021.11.17.02.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 02:30:13 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 789F11FF96;
 Wed, 17 Nov 2021 10:30:12 +0000 (GMT)
References: <163662450348.125458.5494710452733592356.stgit@pasha-ThinkPad-X280>
 <163662450891.125458.6706022775465303586.stgit@pasha-ThinkPad-X280>
 <87h7cbw1tx.fsf@linaro.org>
 <207105cf-bb82-55c5-ff30-e29517c970f5@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 1/3] icount: preserve cflags when custom tb is about
 to execute
Date: Wed, 17 Nov 2021 10:29:37 +0000
In-reply-to: <207105cf-bb82-55c5-ff30-e29517c970f5@linaro.org>
Message-ID: <87czmzvzuz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 qemu-devel@nongnu.org, peterx@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 11/17/21 10:47 AM, Alex Benn=C3=A9e wrote:
>> -    gen_set_label(tcg_ctx->exitreq_label);
>> +    if (tcg_ctx->exitreq_label) {
>> +        gen_set_label(tcg_ctx->exitreq_label);
>> +    }
>>       tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);
>
> The exit_tb is also not reachable, and should go in with the label.

ok

>
>>   }
>>   modified   accel/tcg/cpu-exec.c
>> @@ -954,11 +954,16 @@ int cpu_exec(CPUState *cpu)
>>                * after-access watchpoints.  Since this request should ne=
ver
>>                * have CF_INVALID set, -1 is a convenient invalid value t=
hat
>>                * does not require tcg headers for cpu_common_reset.
>> +             *
>> +             * As we don't want this special TB being interrupted by
>> +             * some sort of asynchronous event we apply CF_NOIRQ to
>> +             * disable the usual event checking.
>>                */
>>               cflags =3D cpu->cflags_next_tb;
>>               if (cflags =3D=3D -1) {
>>                   cflags =3D curr_cflags(cpu);
>>               } else {
>> +                cflags |=3D CF_NOIRQ;
>>                   cpu->cflags_next_tb =3D -1;
>>               }
>
> Still missing something to avoid cpu_handle_interrupt firing?

Something as simple as:

--8<---------------cut here---------------start------------->8---
modified   accel/tcg/cpu-exec.c
@@ -721,6 +721,15 @@ static inline bool need_replay_interrupt(int interrupt=
_request)
 static inline bool cpu_handle_interrupt(CPUState *cpu,
                                         TranslationBlock **last_tb)
 {
+    /*
+     * If we have special cflags lets not get distracted with IRQs. We
+     * shall exit the loop as soon as the next TB completes what it
+     * needs to do.
+     */
+    if (cpu->cflags_next_tb !=3D -1) {
+        return false;
+    }
+
     /* Clear the interrupt flag now since we're processing
      * cpu->interrupt_request and cpu->exit_request.
--8<---------------cut here---------------end--------------->8---

?

>
>
> r~


--=20
Alex Benn=C3=A9e

