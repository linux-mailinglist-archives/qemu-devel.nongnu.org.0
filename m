Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F482E851E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 18:04:08 +0100 (CET)
Received: from localhost ([::1]:53634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvNqQ-0001B9-S9
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 12:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvNkd-0005JA-7j
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 11:58:07 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvNka-0002LD-Nu
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 11:58:07 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 190so9299387wmz.0
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 08:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AhLdO5LMwSiCNJSVHauWx9oZPqyT4m1xFLIbGQDmnqU=;
 b=rZAkprrj080ZWK8MU5v4xrnSGjLB9ZICe3y96DKEv7f2gppT8+jE/caKBtjsZEv4zo
 jh7GgQ6q/+Mi76LkjXlVxEcjNfIXQaeKRdowH3EV5n0MFM/HkOX26Wyoe6UDqPL/4mm6
 x36qGuXih7TMSCUnT42nUhJ7Yj/M+O/usHUWOCS0F7/MfJKFI5ImI4TJ4WMSgFWGYaiI
 oEs9mt32+069zPgMpDqkhlEaVgyniVY9JxCkN+sbiYq8n7gdVU4zX2r1LcZOGX+PIvrp
 O3YhhuOmbmsSKcqyG3BP0VYjTnkHhGxixYnH5shoIcS3iMZV2aDf5Qhk7gbLTEvALUZK
 MYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AhLdO5LMwSiCNJSVHauWx9oZPqyT4m1xFLIbGQDmnqU=;
 b=G0aDWPahMFKirHMOQNtk7G58PQtdq/qLd1BiukEnNNMB0vOJm4lkeBw/C/KZQJPBTR
 qR/Qo5A0FYa3C4cL9bfgMzbwD/Bi9wIlWFSvTQ/9hmduPddn77bmtWarabU94IDXKI3c
 TqWkzHa//3xgEgNZPmItpKCRdZNVhWMPqmEhQBNWNG98yikpaBlkcKTXdxmbSAjvhffo
 nTtjR2F9SE4T4GMvAJawNYcaj8oPnixCX4WRAc0AWwDCOQdh86BEHoIWBG9obOlq9ukw
 DQj9+YxITTT8AGOHLXWGj7xDun1voiB+L9lvhJrWQuTjPEZbkUlivylzNFc6Sw4TDSLl
 mvTw==
X-Gm-Message-State: AOAM5321ETmuQjKxMmgaSY5iUqIVPnAMSZgv6NY1n2ozcFvsW+my323H
 6vTHPOK/XTtneKaf2Bcude0=
X-Google-Smtp-Source: ABdhPJyglJrP6PSGlJYMdG5HZiGd/zB8yS9sVjurpj8XtYJ3dn7O+n/OOkBTPNa1Cxo2m0FfbodA9Q==
X-Received: by 2002:a1c:c305:: with SMTP id t5mr16560055wmf.63.1609520280254; 
 Fri, 01 Jan 2021 08:58:00 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id z2sm17777991wml.23.2021.01.01.08.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 08:57:59 -0800 (PST)
Subject: Re: [PATCH 21/25] esp: rename get_cmd_cb() to esp_select()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
 <20201230153745.30241-22-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a71d5ea7-1ae7-77a1-c0f3-e9e1122227b0@amsat.org>
Date: Fri, 1 Jan 2021 17:57:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201230153745.30241-22-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
> This better describes the purpose of the function.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

