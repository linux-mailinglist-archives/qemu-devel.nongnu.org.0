Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BE733E293
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 01:21:41 +0100 (CET)
Received: from localhost ([::1]:48732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJwS-0003en-JW
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 20:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJuY-0002iA-F1
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:19:42 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:44561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJuW-0003YB-Tc
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:19:42 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so315053wmi.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 17:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JppPbXV8R0j3gCfnDaOCPnDSuV0ex5VfiklBcZZWgJ8=;
 b=ilny+WB5VBw3t4bjXiKm1JH8YGHKuF+xzcy2CpnjUygjn5yjmzhtGXP+QqnCiUFlHS
 WjEF650zF43uJ75jVHa8xe0jYlpzh2MMP0W+ulXhUa/LZCp5vYnF1sOGTd+X78/uYIuG
 8EGp/fRE+1zwA+6+GEt4JuzRhcf+DlcDoQwIZmoGhIz43qJwP4pvXBvg+K68NpOhlNzx
 wJ/vEmSDTnHsP02taDEs/Y+5koyxo49ekKiDU74ZOo1v9BdrQ6Xu+KSA6Mgx6DIiz9ec
 nfAatmLW+/FCVFoWmbaiTp5nTGKgzZ1fTMOaqvlzP9/KmYZShZX0Ar53TBM2IDrF0CYY
 UvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JppPbXV8R0j3gCfnDaOCPnDSuV0ex5VfiklBcZZWgJ8=;
 b=iP9rB6K8NrupfN/wOxRPmBYX+t9d7ANBJTNW0YhCLlINxx0qRB6UvFEDyWJfXoHHiL
 VoG/nC2g9FJX/FEJf2tIkMtE3EmkvRiT0nbFWpEID2WwvR3Ht0h2AyrfB/pHhNCIxmLV
 ISDhJcGpWC5IEDmDj2JVRvxQhwsNw2oMARzc67hwKEdeuuk0AwlgoeH+3tMcaql6/sAJ
 ZA1kt3NIy0zstNJzcUsS0DW88WzOzpjtJ1PPlfDAwsrbXv4yJoAlz5rB2sI49mhqL5C5
 XRKzpJrq7WcTMullV0Y99m69rl76enTjgWaeL08xueeQdMGsLon52xyQvfgTnwmaO0mS
 ipfQ==
X-Gm-Message-State: AOAM5328ijK2462etZWQ3LLVb+LJXYgg4/smifzg8GGc0UivLL3lPqcx
 YCIaLASzqzab/+uCdM/LGrc=
X-Google-Smtp-Source: ABdhPJwjjXKSY0sSj/16SYDRQsXaFSTxlnev0874SOe01cOY4vQA5YCKqhKtXvqrU5s9AI1qS2+yFw==
X-Received: by 2002:a1c:5416:: with SMTP id i22mr1120622wmb.146.1615940379614; 
 Tue, 16 Mar 2021 17:19:39 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id e18sm11439705wru.73.2021.03.16.17.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 17:19:38 -0700 (PDT)
Subject: Re: [PATCH 2/4] esp: don't overflow cmdfifo if TC is larger than the
 cmdfifo size
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu
References: <20210316233024.13560-1-mark.cave-ayland@ilande.co.uk>
 <20210316233024.13560-3-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9016460d-0965-2f62-b14f-d9b8886c8115@amsat.org>
Date: Wed, 17 Mar 2021 01:19:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316233024.13560-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
> If a guest transfers the message out/command phase data using DMA with a TC
> that is larger than the cmdfifo size then the cmdfifo overflows triggering
> an assert. Limit the size of the transfer to the free space available in
> cmdfifo.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1919036
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

