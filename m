Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7D72E8453
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 17:57:52 +0100 (CET)
Received: from localhost ([::1]:41854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvNkN-0004Jb-L5
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 11:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvNi1-000245-Ad
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 11:55:25 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvNhz-00026T-7y
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 11:55:25 -0500
Received: by mail-wr1-x432.google.com with SMTP id t30so22337715wrb.0
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 08:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m5rsANnFEsf9QQ9fbYSsaS7JclZrcJkUCGtd4ZxwyII=;
 b=t3zHE9wmvGv835OSR2WomFZyzOp3AC44Zyw1GxS2eYs39IK46Y1clW6vidX53oMJqc
 wHh+bCdZJPDy5VLDtgCYBX9uCPVnHFeqaJ/g/SZ0xgbM90C0mQVRBaWtWJyRZYDJ8Wyj
 RlHVj0WEmiI5++ngTA+SqFoh5GIPWD4uOsOeBaGXNMR8U9iqc/FuZ3u2hrGVl73S31nw
 PMaeKJ6JKZbsbdX5/e//T/Rfy0bkYqQqh3Kh0eSkK7ExBrkdezynfFSXDMzLnoSpWmw2
 X+fU71ToTw8I6pf1ntrfsefIEQX5Fg1TRDryOWtpTd849PfWbYc9Xa0aUaDGXkola0Fq
 cGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m5rsANnFEsf9QQ9fbYSsaS7JclZrcJkUCGtd4ZxwyII=;
 b=p62fflBKfo1SI1jikAXn5i6sytoKWUGhkd9WEp5YZkmaKoQZr/63Z2YjXxv00QtTsS
 EQ5W9Z3Ooc8d5ffdJSb8USgLJ/l/89qSp+jlkU4LLvQbGvIzi2arvdwS4811awt1y3jx
 COjoscoQH3ZIXR8jNhq1VshHcjZUwUg/7s8g1ffTytfBOD9njTmT5vWc0Gqi75A3oEZc
 FEbrxe4GrAQ7rQHIEFykgWvqG+XavUB8DNqOsAVXY3I2AxDrxvkU0FxAjL3zLl2jw2Dg
 HBZxjGMAsGyg7kjHmOZOMmwWL1fbsQ2l1he/C2TzxjKybdJlWjuG/8PoPA9DZ5cFPLq6
 18QQ==
X-Gm-Message-State: AOAM5337/+Sha7iALMbJgXSj9SpObq3qQPOGVmWD6MWyIEXh9qIMSoql
 BG0JE+UP3Pll9gZNrkSfF60=
X-Google-Smtp-Source: ABdhPJySqZVdlfzRDBZyqwxicOI6IHWcCFuR95mPk3UozQ5qqe6QJKb5eS7N4XgFSUCGaz/qphb2Dg==
X-Received: by 2002:a5d:43ce:: with SMTP id v14mr69190119wrr.342.1609520121892; 
 Fri, 01 Jan 2021 08:55:21 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id p8sm73532308wru.50.2021.01.01.08.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 08:55:21 -0800 (PST)
Subject: Re: [PATCH 04/25] esp: add PDMA trace events
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
 <20201230153745.30241-5-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f88d07ba-1cab-1b4b-09d9-9959f25e958e@amsat.org>
Date: Fri, 1 Jan 2021 17:55:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201230153745.30241-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
> This will become more useful later when trying to debug mixed FIFO and PDMA
> requests.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c        | 6 ++++++
>  hw/scsi/trace-events | 4 ++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

