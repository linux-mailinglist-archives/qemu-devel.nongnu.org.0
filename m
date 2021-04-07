Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF7F3576C6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 23:27:06 +0200 (CEST)
Received: from localhost ([::1]:48806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUFha-0000Xs-1w
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 17:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUFfV-0007dd-TP
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 17:24:57 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:43783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUFfT-00009s-Rv
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 17:24:57 -0400
Received: by mail-ed1-x533.google.com with SMTP id e7so22546109edu.10
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 14:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=suQpkkjdZaJXLqF9QfrTL61Kob7IBQh1pNSLl5LSbwI=;
 b=hnOWjKVikVrK/uvbEQKV9i61ejmso2UT3snzG91Ai6UE+fmOaEaoRqjik3jdJfGTxr
 jIWl0wSqFgTT0nERAXk2ImrMvlTLim5CLhAt4FM6spOx6E2RluCvIzP/LsjHPO2wNmqw
 x4oQalX4Sa2H/TpZ3qXj4m7EM34qJMG0k+/6gLJIpCObf9iNE3LCyqaBP+bGkidxaJ2O
 5o5jpqKOwtFDmD4EGSJNPjnr5WmFzxOCHORBGm/5yDXu0sUzucTmusjtJIWkhoAcYSU8
 k0yF0z6bRcSHqPVE0KvR2bj8OSfshp2JlG9Pk+j1QuR1gqF1C5BgCCEq0/y/Rfj2Lywz
 /uLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=suQpkkjdZaJXLqF9QfrTL61Kob7IBQh1pNSLl5LSbwI=;
 b=lojiGD4dpy/lI/pyFQwSs8cgLRGuUbwd9vO9xnhdEzTs9wQEazCWwm/x0aQyMRUM/k
 jxmqD6tbKI+XYJLgZaB56vKFSN+j4ahzOkTVnwtPknEwfZ3YhhqFkIdS5pHvBy957MJV
 /QEgC1ETQ/c346voAEvu2wQY17fzRNSAhK1JaB46pePNr3cFtvtaobsYq8EARfMTg+o5
 GpPXa+fn2HagNqKbxmLd8heJIL1ETNwblsdXeMdqlsPxT0fgwlxV2i4tc7VwZYrxkxoL
 Yhh71Okzpdm7/2ACyoJMwq3lELg/0BOWhdoxkhZq9rkugfbuImdE+d1OpjWChgBlOT44
 LN0A==
X-Gm-Message-State: AOAM533MogwsGaCemrslYlMgzxUcWwqkPWwA02pLYU6Qj4yWBPXw4/CR
 04vQXlOkXzX8GqAndtn2Xe0=
X-Google-Smtp-Source: ABdhPJye/5sehFGxKYpCQgy+11dsVkkcb0usYBCHEefhcgQyeSdU45eokXXhRwZTpVlXBHzx4Cf15A==
X-Received: by 2002:a05:6402:3495:: with SMTP id
 v21mr6910460edc.117.1617830693559; 
 Wed, 07 Apr 2021 14:24:53 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id df8sm6915478edb.4.2021.04.07.14.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 14:24:53 -0700 (PDT)
Subject: Re: [PATCH v4 for-6.0 11/12] esp: ensure that do_cmd is set to zero
 before submitting an ESP select command
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu, laurent@vivier.eu, pbonzini@redhat.com
References: <20210407195801.685-1-mark.cave-ayland@ilande.co.uk>
 <20210407195801.685-12-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c74859b1-e791-eca3-64c5-c1b766e59ed7@amsat.org>
Date: Wed, 7 Apr 2021 23:24:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210407195801.685-12-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/21 9:58 PM, Mark Cave-Ayland wrote:
> When a CDB has been received and is about to be submitted to the SCSI layer
> via one of the ESP select commands, ensure that do_cmd is set to zero before
> executing the command.
> 
> Otherwise a guest executing 2 valid CDBs in quick sequence can invoke the SCSI
> .transfer_data callback again before do_cmd is set to zero by the callback
> function triggering an assert at the start of esp_transfer_data().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

