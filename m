Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D63236CAAC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:54:31 +0200 (CEST)
Received: from localhost ([::1]:60252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRuo-00077G-8z
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRqA-00039i-5x
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:49:42 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRq8-0002WP-Du
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:49:41 -0400
Received: by mail-pg1-x52d.google.com with SMTP id j7so33469007pgi.3
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 10:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=86o9lakqk0H3lzCDbCwo/zrGKFeKPyw/HLVhGDHpQos=;
 b=Hu22VWGnMsnnGl9c2Z1dJnP2WplVFqeu+4OrWXDpYjvLLdcdbav1GyDmUool2y47x6
 DcPIoMkQGbb2yg/GGZAJilzu/oCyMWyrpdXB6ouR/I+iu58F6h4+WPrawnPAN3s93I6u
 sMVAeOQd0PPdGHO2Ps9xdLyazphI2VD9YEToowQVLP+B+vjn3QOSFzkYBIw2D43KLfqu
 5+gJesyDbMAaLoTPPZABC4Y4nrDMybw7tlyoqjTkRvPJbZ/QEsiJRjgXSMPOd/enOAv8
 kbjiXLEYMPAmbJ52v2HYDC/gMKHzFXc7uTnhviBSGRN7HFcgdVQmCq6pNawztPi0I5pG
 /6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=86o9lakqk0H3lzCDbCwo/zrGKFeKPyw/HLVhGDHpQos=;
 b=HfjFGjnXyF1hCcfPEIeZc1631b5pb8VJ9/xLkn3KYxZWf9niL1DeRRqVH/81C0T4EM
 XdUWtb5EXOBEt2kQPb+BiZYcRq9H8JhBKVCEePBYL/DdRq2H+9FwmBUW8XbFxxv/Etex
 hVRbij9iBTeQ8AIqEKXyCwDQj+zi42bJN+u4RincF/6/9hyASNH+ny8Ak4AMxlbHJNhd
 DY59T1dmSrp19B/FYMB32DjBbf0v3NcMCUb3vbgYHS7cwEZba86nPMVVCsx09BOZlD5J
 yCMKAPAT/5Uh6U2j93EOwN1x5R+XL4TYp0hWWaYC/xgzT6+6rbOUzadG1ZAPXUYpztBz
 aMnQ==
X-Gm-Message-State: AOAM530yddBWnwZ3XkXGlqzR2gbto6htiCE8gWsLZW6zGuAiZXWXY2vN
 0xWUqPThcbRnJgIHD89R1f+zzA==
X-Google-Smtp-Source: ABdhPJwTAfPHLPCcOeJ3ACvpEMl4jVzM0vKy1jTd1ih9GJpjF6v+vR3Yvom2oPXD2RaF4w2ud2Im/g==
X-Received: by 2002:a62:1510:0:b029:278:4e81:ab54 with SMTP id
 16-20020a6215100000b02902784e81ab54mr8571679pfv.3.1619545778879; 
 Tue, 27 Apr 2021 10:49:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t19sm333370pgv.75.2021.04.27.10.49.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 10:49:38 -0700 (PDT)
Subject: Re: [PATCH] Set the correct env->fpip for x86 float instructions
 [cleaned]
To: Ziqiao Kong <ziqiaokong@gmail.com>, qemu-devel@nongnu.org
References: <20210416153430.92187-1-ziqiaokong@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dcca83eb-40e7-91a2-c8dc-73a5a51d23db@linaro.org>
Date: Tue, 27 Apr 2021 10:49:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416153430.92187-1-ziqiaokong@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 8:34 AM, Ziqiao Kong wrote:
> +++ b/target/i386/tcg/translate.c
> @@ -6337,7 +6337,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                   goto unknown_op;
>               }
>           }
> +        tcg_gen_movi_tl(s->tmp0, pc_start - s->cs_base);
> +        tcg_gen_st_tl(s->tmp0, cpu_env, offsetof(CPUX86State, fpip));

This placement is wrong because it catches instructions that should not modify 
FIP, like FINIT.

It might be best to set a flag around this case like

   bool update_fip;

   case 0xd8 .. 0xdf:
     ...
     update_fip = true;
     if (mod != 3) {
         ...
     } else {
         ...
     }
     if (update_fip) {
         ...
     }
     break;

and set update_fip to false for the set of insns that either do not update FIP 
or clear it (8.1.8 x87 fpu instruction and data (operand) pointers).

I notice you're not saving FCS to go along with this, at least for 
CPUID.(EAX=07H,ECX=0H):EBX[bit 13] = 0.

And if you're going to this trouble, you might want to think about FDP+FDS as 
well.  It should be about the same amount of effort.


r~

