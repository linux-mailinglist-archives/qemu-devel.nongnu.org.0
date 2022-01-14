Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B6A48ED66
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:48:41 +0100 (CET)
Received: from localhost ([::1]:48348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Ooi-0002os-Ps
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:48:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n8OmW-0000Yp-DX
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:46:25 -0500
Received: from [2607:f8b0:4864:20::42e] (port=36455
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n8OmU-0001qP-P1
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:46:24 -0500
Received: by mail-pf1-x42e.google.com with SMTP id m21so3077646pfd.3
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 07:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gy2bAwiJ2PQbEkV70foMpE/aYUDRbqxBeQXFPEB1V8s=;
 b=m/aNiryvhdlrgb+KRt4H3A/URTvM48gvrzdcKSF328m1iRN1xahIovq0DMyS/QaaG9
 Z/1u0th5iOITitm/cUBRruduat43nV97GJoqiVPocjpzZssJCA9njktqsTU/bU29Bs0a
 oZenwFSKT44+VbmWjXw/iGzcLluIysHVLm5U7rSU7apmRC2DAAC9qdwvrMAFFBIYAdmu
 9vSnFFDDrbgJhkOupbKsUv0/aBtWjEdA8ZTR7tdAZ1rno5zz2exJ3Ij1mkbxH0JitiZY
 SmYioKIA+qWjslAjciXyMSb9lUXmIa2+moXxcMlvycDxfbS9Qmfp9dt6Z9ycunHF+AmG
 fCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gy2bAwiJ2PQbEkV70foMpE/aYUDRbqxBeQXFPEB1V8s=;
 b=jISV/yfnEuEmPpNe94pdPindfxwj/yneqpvhu1bmftlQUD4HpOBPyuAHMf1xMyaSLM
 IGFU+ziUtiNpHBJhr44iCFEBt9Jgsvovy4nKIUe8cM3SmO/6QhuK8hvUv5R71QsoAWTz
 BY7PqFTvxB8neNyftC5yrJ+aSydKP8hDfqJXi9SSA0RdwCVdYEhzTe+jP50CwU/SrN38
 Eu21PYtakO5GgN3G4lgiYa+qGzbKRlxXxI8Q/XlhYO+g+v/7h9SdjKUI7odEDnjhMiOw
 5d8S2otN2RoLSGXLM+A4DPRtY0syc3E3xfiQ0Jwi3nCPWRSx36lxMmG1ACLU/RZkxY55
 549w==
X-Gm-Message-State: AOAM530BF90iBBQOcO/GE+lQgVMz8EHaT58nGqfmCOUYkTI8TPpD/Pnk
 +GuPfrZxpPB8rdcn5lTopJo=
X-Google-Smtp-Source: ABdhPJxUH6GY/ata+fHoUoCQWr2T2B1deJhic/yOi4aSXjeORvP1EWzfHRWe7JzDUdvZGKQuk+sggQ==
X-Received: by 2002:a05:6a00:a18:b0:4bb:9f3e:94c8 with SMTP id
 p24-20020a056a000a1800b004bb9f3e94c8mr9333745pfh.67.1642175180677; 
 Fri, 14 Jan 2022 07:46:20 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec40:49e0:48b5:8fce:b44b:d951?
 ([2a01:e34:ec40:49e0:48b5:8fce:b44b:d951])
 by smtp.gmail.com with ESMTPSA id d3sm4767160pfh.47.2022.01.14.07.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 07:46:20 -0800 (PST)
Message-ID: <611fff2f-7aad-4e2c-5f48-5225748f963d@amsat.org>
Date: Fri, 14 Jan 2022 16:46:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] linux-user: Rename user_force_sig tracepoint to match
 function name
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
References: <20220114153732.3767229-1-peter.maydell@linaro.org>
 <20220114153732.3767229-3-peter.maydell@linaro.org>
In-Reply-To: <20220114153732.3767229-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 14/1/22 16:37, Peter Maydell wrote:
> In commit c599d4d6d6e9bfdb64 in 2016 we renamed the old force_sig()
> function to dump_core_and_abort(), but we forgot to rename the
> associated tracepoint.  Rename the tracepoint to to match the
> function it's called from.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   linux-user/signal.c     | 2 +-
>   linux-user/trace-events | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

