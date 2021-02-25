Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B843249BA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 05:21:52 +0100 (CET)
Received: from localhost ([::1]:39298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF89v-0008RP-4V
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 23:21:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF88B-0007Yy-Se
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 23:20:03 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:45083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF889-0001Cl-6F
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 23:20:03 -0500
Received: by mail-pl1-x62e.google.com with SMTP id w18so2476192plc.12
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 20:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FBlPBSHTD3oDVy6UtSoo3pRjHBZ6f8ROVECONZ7l7cY=;
 b=UegsG8C3D/iKSzplKlyULqsxqDjlQzW8kOxrQsfcM/SSarDgxJz0y+NDqC4kq9UtxL
 eA+Z+Rak93GWgZpeUHVWP/sh2A8o1lcJrXTeBTNYB/mNu2sw6dN8fDiMzqB7wgTayIdH
 cezJbJqBZFPN3ex1o/RC7q9MLT4B0/U/ZUdUTZ1O89r8hMUJP0Ol10K4yH7rJBmZj/Gg
 DcdW26gbZQY7lwU8TxkTvVhHaL2XKTU+atNru2/SLIVsqSwzMw0+58jpB1GIiLwBEzIG
 5+5x7KVAyoZgVzFasCtrBGM2NU519rZQUuUj2tl35lAleV0aoYQszjEwpZ+XmojGT54r
 zZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FBlPBSHTD3oDVy6UtSoo3pRjHBZ6f8ROVECONZ7l7cY=;
 b=m0riROgaNcjfNWY+Z9XUg5V9iPfJTxKRroeQzWGKRUw8h/5FWPlu/LRMEG1wZRR4gV
 YS5fM8dMktdiLJabw1YESw+zZ5m3SD53uwcfOYyOCmOrLzgyQVBOM7N7SPk2/cdIj7mX
 WmWDqhtJTn5bzU6sS1f1M/u5atiiZ6u/UNk/fwrTOW5Y4sOPCT/9/nU9FwIPNzpi93OD
 cBjdYWyFSC1YmCIo30AtlduPtNRFOCeud1gZbPZt95q5FlQbAjvLvK+dXS2wD9uEcfAe
 ZsSopQDCyPJJA0sM+18RfKnRm311iUxqTBO68Fdlqi3Vnw3elc5xfAwa1I20aDUyEZNA
 JuiA==
X-Gm-Message-State: AOAM531CFMrszK7TqKlHNh9qvyTvbxFztmTg8AI1owTKomiJwyS7WbHP
 DA8P/Sf10U/1hIKGD7zppeAVs1RssaTJ+A==
X-Google-Smtp-Source: ABdhPJwpTGBIVMb7drHIU/XBxnTY9Ey/ejiLWcfGlKIAp48rDoV046G2ofWmx2i+GpLrPvZM4DjPmw==
X-Received: by 2002:a17:90a:8405:: with SMTP id
 j5mr1322155pjn.152.1614226799479; 
 Wed, 24 Feb 2021 20:19:59 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 6sm3944088pgv.70.2021.02.24.20.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 20:19:59 -0800 (PST)
Subject: Re: [PATCH v22 16/17] i386: gdbstub: only write CR0/CR2/CR3/EFER for
 SOFTMMU
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-17-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c7a4c597-6864-1ce6-b759-d7ec531eea67@linaro.org>
Date: Wed, 24 Feb 2021 20:19:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224133428.14071-17-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 5:34 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target/i386/gdbstub.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
> index 41e265fc67..9f505d6ee3 100644
> --- a/target/i386/gdbstub.c
> +++ b/target/i386/gdbstub.c
> @@ -383,26 +383,38 @@ int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>  
>          case IDX_CTL_CR0_REG:
>              if (env->hflags & HF_CS64_MASK) {
> +#ifdef CONFIG_SOFTMMU
>                  cpu_x86_update_cr0(env, ldq_p(mem_buf));
> +#endif
>                  return 8;
>              }
> +#ifdef CONFIG_SOFTMMU
>              cpu_x86_update_cr0(env, ldl_p(mem_buf));
> +#endif
>              return 4;

It would be nice to do all these with rather less ifdefs.
And let's correctly use !CONFIG_USER_ONLY.

Without adding more stubs, may I suggest a new helper:

static target_ulong read_long_cs64(env, buf, len)
{
#ifdef TARGET_X86_64
    if (env->hflags & HF_CS64_MASK) {
        *len = 8;
        return ldq_p(buf);
    }
#endif
    *len = 4;
    return ldl_p(buf);
}

which, even by itself allows some cleanup in this function.
Then:

    case IDX_CTL_CR2_REG:
       tmp = read_long_cs64(env, mem_buf, &len);
#ifndef CONFIG_USER_ONLY
       env->cr[2] = tmp;
#endif
       return len;

which still has one ifdef, but not 2.


r~

