Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3D31F334A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 07:17:22 +0200 (CEST)
Received: from localhost ([::1]:42708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiWdV-0003u9-Fs
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 01:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jiWbE-0002uV-LZ
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 01:15:00 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:32925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jiWbE-0001oy-1I
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 01:15:00 -0400
Received: by mail-wr1-x443.google.com with SMTP id l11so19764840wru.0
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 22:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XKksqD31+YZKRVWb0kwkJFchID29LbuHoamfPkE6VUk=;
 b=qjqc38/Pk7o2Mhi3CCsjlsAgZhbrqpZmpXQ1h98K2kR8M2xCA6IVg6QdJtHe2Kl9aV
 HKXFmrA67lC1+A+IBNABxPC3sNZyrXqA1RKORHHk0ZWD/NPco6nyVbWx/i7w7BmABJ5g
 CEmNO1PI+zL1S499jm2ndJa5BvPUAkxbs63TfNE7znNhaz21R/Qy9VE5j5DAklnNRNPU
 4rv8NslUcARTr0y70AAqKT6TzxHwb9/qMxGRxphHM8Z54OvId+PKdN221YMaqBEEHfYu
 YjUfyOgHCvfxplJyPfnXDC02C6kDI77ayy/i8JN+LdIocamdseIIMQotJhjR5SIN4tpr
 4isQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XKksqD31+YZKRVWb0kwkJFchID29LbuHoamfPkE6VUk=;
 b=bxVPRWtXnNrxFOE59BSHOAZ6D9Bgx97dKF3e42DEVypzrmWzJbMdd98E9KQ3xCcHCG
 UuX5bSACiNqwBi/XJ+o0Lj0QzdLKFOeNMTs5YkA+8k81smbtrQPsCNEUS5P//g7P3PGZ
 rIegR1hP9K1sTEl+Cgt5MlkOPClrv878CF/L8Hz3gu7tMFs+j4ZRp8bbcYpYV4hQXRE5
 q7J187WH3iyraeONj1JgEwpV/KDGfaie4icoYHNqMLs01rN7nllDeKsg5kg7bX9Io4f5
 zAxdL8zK/JY4e9NcnOr2Q8xppFXxFQqpx5+Dbfkz2bG90Ndg08a38PewQxfKsqXJ6Yf3
 FSQw==
X-Gm-Message-State: AOAM532+hHkC1tCbHp4wuvCNtGI2CRJTwuJ8khSz+N2NJmVEDU1Ot8gm
 qEnD3nc5Npdn2+xmWSIfk94=
X-Google-Smtp-Source: ABdhPJwO6YUix32rsnew6XpX/4XenqfymfCKUOpCPfLkeVtBm37H9/jBfS49BRA/sUo4TL0Ocmdv4A==
X-Received: by 2002:adf:f2cd:: with SMTP id d13mr2273809wrp.378.1591679698528; 
 Mon, 08 Jun 2020 22:14:58 -0700 (PDT)
Received: from [192.168.1.43] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id a15sm1962344wra.86.2020.06.08.22.14.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 22:14:57 -0700 (PDT)
Subject: Re: [PATCH 0/3] hw/sparc: Map the UART devices unconditionally
To: qemu-devel@nongnu.org
References: <20200608172144.20461-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <db0c562f-6cf5-1112-e725-ef8b71a323db@amsat.org>
Date: Tue, 9 Jun 2020 07:14:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200608172144.20461-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Fabien Chouteau <chouteau@adacore.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/20 7:21 PM, Philippe Mathieu-Daudé wrote:
> Few more SPARC patches.
> 
> Mark/Artyom/Frederic if you Ack them I'll simply add them
> to the current trivial SPARC patch queue I prepared.
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (3):
>   hw/sparc/leon3: Map the UART device unconditionally
>   hw/sparc64/niagara: Remove duplicated NIAGARA_UART_BASE definition
>   hw/sparc64/niagara: Map the UART device unconditionally
> 
>  hw/sparc/leon3.c     | 18 ++++++++----------
>  hw/sparc64/niagara.c |  7 ++-----
>  2 files changed, 10 insertions(+), 15 deletions(-)
> 

Thanks, series applied to for the next (temporary) sparc-next pull request.

