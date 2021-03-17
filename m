Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEDA33E292
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 01:20:38 +0100 (CET)
Received: from localhost ([::1]:47050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJvQ-0002sd-0x
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 20:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJtg-0002IR-NA
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:18:48 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJtf-0003At-66
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:18:48 -0400
Received: by mail-wr1-x430.google.com with SMTP id y16so11414850wrw.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 17:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rwUENxa3LIz19U4FjDUtZj2HCeI8d2GBaf9+ogYvnJQ=;
 b=EbiGqEGRpfCTemqjZB0F00xEyGMzelMDuN67SHT7VKf94RJsu7UcpXn8rVPkHQFw9q
 z6yQSjsft/KpVzyQs/4YYlErtsCPm5LN1Vn5AOWNSQvBZLanBtPkjiLozJlcJPKY2dUk
 Jng2Q0KCTDmx8jED5WlQfBfzPYAoNzRG96sDXzpbik6T2R+JbthCVwdClc0MfAW9sKIN
 veWiZiBpGLfoesK3sgwmTr0xpf/lVKo+Vlla1gxpOUQhFpKKLplDgiaTWuXl4LvslF7G
 mrFKFYXF/w2BGYNyelblbNGzEVndW9f8RdByNp5iSO+KAW+2N8Mw/aA7hOIEPm8G6CfW
 6x5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rwUENxa3LIz19U4FjDUtZj2HCeI8d2GBaf9+ogYvnJQ=;
 b=jyAFd6YCTDVlKa/O+97pWhb7XTBAV07CejIGEFusMTs1ruUnZPUg7S+Ge3WQ1sPTir
 DJNC6cJ6//ydsAFuqRh/o8ntC+xH9bP61xcMAbSJkvm+SYcPHrKE1LGZSJQcEf4WWMCB
 bY94Yv5QR+LsaLN0y+umPqPWllQAdLkoEPv4pv+cVx3o9qVteBxLZ6rq3UVoGiVi+zJw
 0TaLKkz3yfjn9XwAt2CnKMgQ+ECvWoFFJN/IAu5tatKYMAQelNJnvDVrmSF2zoqX8Ko4
 CJrbTQcp4Lr6s13XWN/YXQ5maPiD0xw5Yd+HLOdNX4PWKmQKKF62qRg1h3u+xL/xiJDf
 rQYQ==
X-Gm-Message-State: AOAM531o0fZp5BNc//T10KyocYboRz6ai9u0SItIMIwZUa5z0MzVh/vF
 jQ/y8rodkoG0VMfcF+xE9xs=
X-Google-Smtp-Source: ABdhPJzRTpVu5XQLbu80mNPfVCqId37Ww2YdmchzklLO0NVKUU8COtzK3Ye7y+/BbbHsJoAR14YYBw==
X-Received: by 2002:a5d:6a81:: with SMTP id s1mr1462671wru.401.1615940325617; 
 Tue, 16 Mar 2021 17:18:45 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y16sm23898584wrh.3.2021.03.16.17.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 17:18:45 -0700 (PDT)
Subject: Re: [PATCH 3/4] esp: ensure cmdfifo is not empty and current_dev is
 non-NULL
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu
References: <20210316233024.13560-1-mark.cave-ayland@ilande.co.uk>
 <20210316233024.13560-4-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <97556d1d-b698-c501-8ec2-44f0bc8f52d3@amsat.org>
Date: Wed, 17 Mar 2021 01:18:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316233024.13560-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 12:30 AM, Mark Cave-Ayland wrote:
> When about to execute a SCSI command, ensure that cmdfifo is not empty and
> current_dev is non-NULL. This can happen if the guest tries to execute a TI
> (Transfer Information) command without issuing one of the select commands
> first.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1910723
> Buglink: https://bugs.launchpad.net/qemu/+bug/1909247
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

