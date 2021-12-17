Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3A1479711
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 23:27:40 +0100 (CET)
Received: from localhost ([::1]:45634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myLhT-0002PU-FM
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 17:27:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myLfi-0001XC-Uh
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 17:25:50 -0500
Received: from [2607:f8b0:4864:20::1036] (port=35336
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myLfh-0006RH-EM
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 17:25:50 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso6996754pji.0
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 14:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a9s7CCIp60N2a7s3249PWEz3dwO2KJkRkk1WeBQzWQ8=;
 b=ahAg94liaOafVdDZT4eMer5922IfYdGODiSBB0aVUq3BnmRRwwb6L8v1Iq1gzhkMBc
 SnVJn3VmpkEgMYUzWS9BE+3/P7fSsFUvJj54PVrMSA958clorZd3eBY8e/0QADUqqZhS
 76j4cAQl7yPZt/2VQ4309Yhi536dKNjgY0H1QX8RrObYLw41YITSjYCEexLRx57ozzt+
 LGEYobxVqpQetY9ybkZi9X8kS4Fz9xXYZ/8GAms65wCPi8ueIvzsdjQlp6dj+Wz/Rc+M
 bXROUtcRQ68w5BRMUFdq/2n0wVDD4vwdMDvXWODT5yZqZBpX2NLwJKUm6PaJLeSTxd8/
 pZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a9s7CCIp60N2a7s3249PWEz3dwO2KJkRkk1WeBQzWQ8=;
 b=57MECwTIxTlJvTJ9zWWQi4aSruRxU02mkbUpaRraindWKlJkFCgMcLMe1l4LgYmqUb
 TJSMFAP7GJZrjYSPuvE4PwERTqTyHdX+a3EJ+hKRpknoMjL+SM/8TWXqE31N4cW1xq1G
 NKKGGaja6WbL5VJjBS6OlzGR5sO5u2CpOQmFIUdGylRzLD2K1ZajgFR312JpyaXVIAr9
 SJsv+JqJwBHQEkzDc7UYzhBMMNCQeelo/k9KTNQ+8zGoAGE0U/hx/t3o7IyZA+rajQuz
 097cGiiy4t5aNmOXWHw0ayLplU88a6hY+WUTn9jUEHxRBUR+MqhDVpUVkFtOFqzpw3uo
 SlZA==
X-Gm-Message-State: AOAM532jiDu/pxRUaDOgHXe6weYohFhBH7l5PDxZzAdHDwFZZL4euLIU
 2G1XYlEl7vOBNKZcZNeWUNt0cA==
X-Google-Smtp-Source: ABdhPJygmio20Xp1cTglukwJq7O4RCIaDRK0XjAEOYMFb1IEbgVIEPRJwJJV9ROjwks3rm7mfgnfRw==
X-Received: by 2002:a17:902:ab1a:b0:148:b34f:5bee with SMTP id
 ik26-20020a170902ab1a00b00148b34f5beemr5256630plb.157.1639779948100; 
 Fri, 17 Dec 2021 14:25:48 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g66sm3750265pfb.64.2021.12.17.14.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 14:25:47 -0800 (PST)
Subject: Re: [PATCH v2 2/2] hw/net: Move MV88W8618 network device out of
 hw/arm/ directory
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211216125647.805544-1-f4bug@amsat.org>
 <20211216125647.805544-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac288aa7-b78a-d564-329a-07267f2d4cc3@linaro.org>
Date: Fri, 17 Dec 2021 14:25:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216125647.805544-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 4:56 AM, Philippe Mathieu-Daudé wrote:
> +softmmu_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('mv88w8618_eth.c'))

So... there's currently a MARVELL_88W8618 define for the audio component of the same chip. 
  Should we re-use that here?

Otherwise,
Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

