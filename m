Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C482E8435
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 17:56:05 +0100 (CET)
Received: from localhost ([::1]:36344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvNie-00022c-1I
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 11:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvNgl-0000tW-Qv
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 11:54:07 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvNgk-0001uR-FA
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 11:54:07 -0500
Received: by mail-wm1-x333.google.com with SMTP id e25so9357046wme.0
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 08:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aE7xBvlS7Eo1NVXvztT0ZcDxci7G+JLwgMOsVz/Odrk=;
 b=BR+ZgkD5zMDtbsjn+H2bpUX8hIHCgCRqoc94ElnuWNauV4B/LCsebAJoALqK+ocKk6
 IlOCUvSaxOqF7l0S2zdFE33Q6BMPlLVZW80XEZmcbT5PwIJLneqHfPht5FcP8zUsDhNr
 yjA1Syy378OIHZEv1ALCkixf3CAztChIjtCXUr+Ev9WDLevtxs3t7179PUINtLoQtb7S
 o0DUVTEZwBZ0FBgPkmUi0Eg+iCISLXMSYzjNJcfIHPgpzpq4XSG1d4VQFeb76qKQucPe
 0ycE4ByaXNkCEVrAQq9CdKFscLYe4lBkTRGSfCk66r7dbglfYoF4A+bCZl5cWWriGnxJ
 wrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aE7xBvlS7Eo1NVXvztT0ZcDxci7G+JLwgMOsVz/Odrk=;
 b=UuAe5ixz/3dSDjJ7bb/5f8LSRQTj90D3sTRsokMLaufZUkY88zkTyR7B2XekVk068b
 6hDz2mubgCNw7gT49Ylh//Tqtn04i2fESUYKjB2a1v1z4jI0rWFAwPLaFcRFR9it89O8
 LaV4YgFMDCr7jvi0W8pPFAR6x0cAh605+tHtlTSBCRzCQ25DKVP45E2EwyEXUPbsYATz
 CP0/wlqswSaxGfqXF3yR4olRFe8YgDxgcgcn9/E0OaXi79NbXZ+f2Kca4dDG1PcFxb0A
 58TRbgOj47LRV22k/zXM+0fsWg2rcXKLk0vxKY+EvtxJxUBoudCovQ9N8dhu3uDYscAb
 HS3g==
X-Gm-Message-State: AOAM5307zAunQUyGDAdyn9sk40xnxD/on2dcymLD6oE9FnwL7jkeuGpC
 MIvSLxOMMTUdRr3YUeTGhz4=
X-Google-Smtp-Source: ABdhPJz2pXwbuTf/lVUy2Y6KA/iE0ClIbpLIWELWJ8Gh8eQzP7BAOkZ7xQTfklh7TRn2a62RJ6ObjQ==
X-Received: by 2002:a1c:6741:: with SMTP id b62mr16469775wmc.21.1609520045097; 
 Fri, 01 Jan 2021 08:54:05 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id x7sm16853327wmi.11.2021.01.01.08.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 08:54:04 -0800 (PST)
Subject: Re: [PATCH 02/25] esp: add trace event when receiving a TI command
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
 <20201230153745.30241-3-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5580e8ee-6c22-e787-6fa8-15f557d000d1@amsat.org>
Date: Fri, 1 Jan 2021 17:54:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201230153745.30241-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.749,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/20 4:37 PM, Mark Cave-Ayland wrote:
> This enables us to determine whether the command being issued is for a DMA or a
> non-DMA transfer.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c        | 1 +
>  hw/scsi/trace-events | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

