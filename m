Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF77C6D8ADF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 01:03:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkC9E-0004dm-Mu; Wed, 05 Apr 2023 19:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkC9C-0004ct-Vc
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 19:02:35 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkC9B-00008z-F9
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 19:02:34 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 p3-20020a17090a74c300b0023f69bc7a68so38813933pjl.4
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 16:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680735751;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gt2AItQi0LG1v4doXk7jelTlu/x7nY4KW2ok2fqrLGI=;
 b=lL8KjvVoplkEj5WsKYgVLCcnafHgfXs4RfiOEreblv+v76rJ4/sVy05UhVd/JQBM4V
 fc7WyadBZ8oJaw0lh/UAyWLdCy9EjDy31Gud1MQmeKn3cnR/43ZzrApkiEMxwEdtVLPT
 nXt0d+YnFt2qUADn702fhMf9IbwS4A9KLSp71KqBbd4z3U9qvObTKhdfUTUub+VyVcZW
 +cgGMgkPOiCIGI81q0S2ydV4KIV9wAy6IgzKJG32TZPWWST1bz1TshENi3+5bqoApMiN
 GhoHLTAKYtH3Tg6T7plG6mWU4BRztvO3J9O22EZ/C/n501Ipp/TeMWIJyNhOXE0PP/6i
 TNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680735751;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gt2AItQi0LG1v4doXk7jelTlu/x7nY4KW2ok2fqrLGI=;
 b=YinB76xNutJCyEQMGd8GEd8PtQQ98Lwcmzw6/BMjxkUMPBQPDIKA0bFfIuuSFpfPZK
 ooDH95htobNcnpx/Wb8upcsgHZK85LlESO6fGtc1vDqzz2Yyrf1unS4uXkzGKzGl5DCi
 ISWN8yk09Hp56XUttyBFtJrSRyku0H0rqaOmLRnfxmQ8Qfwz20/kNLQbqEjZZvwvvrLS
 zyzpvjv0pB4eoPsSECwwTGhdZrM1xmHmuCxd1UB8LeHuq/nsyl+NyCZoX/8ZCJTdsg0P
 aueASZNdEsE2FJLB2h6CldEi8Cm3b44xWo3G4RII2VpSVuZiFVpsZTuxDzz0F1uG6Yg3
 w3Kw==
X-Gm-Message-State: AAQBX9e8hz8T8IaB8xIFtpfAlYPv+d97iL29nrza/miOJjHxN6//rSNJ
 ZlZtBgknIBhn26mZVUs3MT6lxg==
X-Google-Smtp-Source: AKy350ZAH5+yDnSyltAgkaO+xsXR3W5u1+F2HxWn5E+lHh4wGEmywrdyuGdxpHnON6FocAJAgwJe7w==
X-Received: by 2002:a17:902:f1cd:b0:19a:945d:e31 with SMTP id
 e13-20020a170902f1cd00b0019a945d0e31mr6903366plc.13.1680735751403; 
 Wed, 05 Apr 2023 16:02:31 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:ce11:4532:7f18:7c59?
 ([2602:ae:1541:f901:ce11:4532:7f18:7c59])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a1709026b0300b0019f27fd7cecsm39770plk.197.2023.04.05.16.02.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 16:02:30 -0700 (PDT)
Message-ID: <ead60c98-802a-766c-2130-12246092a56b@linaro.org>
Date: Wed, 5 Apr 2023 16:02:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.1] target/sparc: Use tcg_gen_lookup_and_goto_ptr
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20230405185922.2122668-1-richard.henderson@linaro.org>
 <36923eb7-9e6f-a4a7-7e2b-e14df9e63dcb@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <36923eb7-9e6f-a4a7-7e2b-e14df9e63dcb@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.355,
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

On 4/5/23 14:09, Mark Cave-Ayland wrote:
> I can certainly give this an R-B, however I'm fairly sure I tried this a couple of years 
> back and found that it introduced random hangs on qemu-system-sparc64 :/. Have you seen 
> any issues in the relevant avocado tests with this patch applied?

No issues.

I suspect the last time this was tried all tcg_gen_exit_tb were replaced, including the 
one after changing psr.  That would mean we wouldn't see exceptions after enabling.


r~


