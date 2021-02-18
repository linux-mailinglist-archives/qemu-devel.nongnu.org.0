Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F58C31EB2F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 15:59:11 +0100 (CET)
Received: from localhost ([::1]:54108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCklq-00056r-9o
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 09:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCkka-0004P9-VZ
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:57:53 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCkkY-0008Ja-MP
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:57:52 -0500
Received: by mail-wr1-x42d.google.com with SMTP id t15so3246943wrx.13
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 06:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8Ux0GjB7BxHsG/qKS/EBUL4qVz63Yeqpz7zkqx6+7DU=;
 b=KGeyxTohZUpTPqnGpAbVjzqHw1nD3oxWngrVRRtiaK3qAj4iITetUsmy3akixoS1By
 Y1RdeQ+AWIH2eWjJEWnxMf1gnw8kGeIDtOB1WJBqOUaGvr+B8/lKKF5yw2OQFIyhO526
 5Zwm2csj6lW++dzDFss1PsRF20HhmucgprYxpQSR/eKwzuMzrEcYUZzHqjpUi/ocXzBz
 IbKEX9Zt6Leak29PnN096QpprmL5mh1nkVrJGwqWWL1GAInP/hZm0EhnSyhOeDTH8F5R
 4zlr8jBJgA6Dd/sGv/bgt7mWKwInpxgtmm0hCSG2xSbK/VNM8EDSZWkKrT9Kvprq39lm
 pdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8Ux0GjB7BxHsG/qKS/EBUL4qVz63Yeqpz7zkqx6+7DU=;
 b=YyJYwolz4v05o+L68vb5AmdXHyk35WMvN+G/EzCjK/pFiFWk/IEaj3c3JBQcGAMkBA
 vCX7jvkjK2hN/+rMQcxkA4pIohY0Br3h5sCkYx5pxIJaBwZCzlTfc6x3TWqohV17WiCZ
 wgm7JRhYzBjQ1MVWOF5ZZ3q2ZVbkAROipX/nK/FYqSyzsYzuq+0oIdMYZhehNPIxH3/c
 xyG6zzql5tj3t2zguLz5sJDKTFDNTofX4RLEQ2UBqil0iIGoJ06pHpJ/T7OFHj2SyfWk
 K1SJeI/vJkdxwnxvy2EVJSU4lzYRaJzER3rY0/989YfP6rLAocY2je32aNO39MAmr5vg
 k1cA==
X-Gm-Message-State: AOAM532AT81c9iltWz4Z/Uxp9ehptEZIXR/hCEl63kLrV+zz6u0DrjrV
 FNp+MGvePUpcunlWrZb2jGIKiw4NtlM=
X-Google-Smtp-Source: ABdhPJwMvcP/DD1pNbkSYU0bpy1qsz7vl8TDYWsCPSAJvwfnb+fnXHftRFSBPst6IB6ChuPiuTu5Aw==
X-Received: by 2002:adf:d4d0:: with SMTP id w16mr4737623wrk.262.1613660268705; 
 Thu, 18 Feb 2021 06:57:48 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 6sm12348119wra.63.2021.02.18.06.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 06:57:48 -0800 (PST)
Subject: Re: [PATCH] Correct CRIS TCG register lifetime management
To: =?UTF-8?Q?Stefan_Sandstr=c3=b6m?= <Stefan.Sandstrom@axis.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <A13A6E43-EEAF-4781-87E1-3295F698A85C@axis.com>
 <20210218102400.GP477672@toto>
 <94BD91ED-EFD4-4576-97CA-3BEECE85E904@axis.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4129485c-d626-a60f-c6fe-ae5312da1686@amsat.org>
Date: Thu, 18 Feb 2021 15:57:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <94BD91ED-EFD4-4576-97CA-3BEECE85E904@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 2/18/21 1:16 PM, Stefan Sandström wrote:
> Hi Edgar,
> 
> Yes, it seems like our mail-server messed it up.
> 
> I’ve tried to resend it, but I’m not sure if mails directly from sendmail are let through to outside addresses.  Please let me know if you’ve got the last mail (sent a few minutes ago).

You might try adding:

[format]
    headers = "Content-Transfer-Encoding: 8bit\n"

or:

[format]
    headers = "Content-Type: text/plain;
charset=\"utf-8\"\nContent-Transfer-Encoding: 8bit\n"

in your ~/.gitconfig

Then you can check if your patch can be applied properly checking
on patchew: https://patchew.org/QEMU/

For example for this post, as Edgar mentioned:
https://patchew.org/QEMU/A13A6E43-EEAF-4781-87E1-3295F698A85C@axis.com/

Switched to a new branch 'A13A6E43-EEAF-4781-87E1-3295F698A85C@axis.com'
Applying: Correct CRIS TCG register lifetime management
error: corrupt patch at line 11
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 Correct CRIS TCG register lifetime management
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Failed to apply patch:
[PATCH] Correct CRIS TCG register lifetime management

Regards,

Phil.

