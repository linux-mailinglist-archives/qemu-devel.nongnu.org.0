Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6C0407DE3
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 17:18:08 +0200 (CEST)
Received: from localhost ([::1]:59646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPRF9-0001kz-NY
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 11:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRDK-0000Nv-M9
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:16:14 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRDG-0002kn-C6
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:16:14 -0400
Received: by mail-wr1-x434.google.com with SMTP id x6so10532582wrv.13
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FYB7/BVyzLvLNkN/DC9cK4tspdVAX9pqW1tZ+SuXYaI=;
 b=nZEShKBI4S5w3wjxbI8LTlbct+QIbkP6xs0NUDrIGZ937xSHPVcmAXeuDEKpc5Ts2D
 hhA3hhQBk23eJsPkuxFqZh3ta+RT6AEUcASHB8Sau2M9t53+lA+kihkVsHkHhUDSUjib
 BEkYsHbAPOeYEycYJ9GS7BpvdQnlrc1BfrbhZVTYZYWJ3xTClRIp9N95SNONtw9QXQj/
 dbdRjZq7FSoyXvdNu7lPFLCEUcjiKcGys3gJFixq5374L+P4na53uRJq5QCfD1EgLMHX
 omH6ZaVzIL1f12SSoToMcrdg34X/l4oXEghuvKcHVKN3HY6OxkiSLpAftgeYbM0tevHU
 oOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FYB7/BVyzLvLNkN/DC9cK4tspdVAX9pqW1tZ+SuXYaI=;
 b=xjw7tPSUlHo6b1pGN2TzxWkG4KW4DnmTveJXeq0AhHf/T5RdtfYOZTa5306Vs8gdu1
 2UpA5fJbqDqcBhtddnWPrhuQlO9fVfXiAHW+8MnIwn1RjTilEdMuHC2zoeqGEVnwTPPk
 T2HIwM23tRp3PZYiKZu5J1cx1QuoY8KXJbGj15RKCBG6A4WWuqwHSJ/LqKYDdBVEgy6X
 1bORVp7HdQiu8rbhdauEzDkkJtXNfGc2QXOLrOhnpLFDKbv0wcggnxAIchJnfrs/jpeH
 S9lx4Fm0IFD9IpgooCt+C8V+3V3UJdJ65HfuV2V1hu3YtGjQns6RWn3WGf7VRkMp5yrL
 QdtQ==
X-Gm-Message-State: AOAM533C54Pt/lrjogT45njOM9492SgJ9eQLrbSKYyg6iHOJjQo19Cic
 A43wI3xbNH7DBChc9MCHu1E=
X-Google-Smtp-Source: ABdhPJyXE63VY6/oBtFGBhkj9TxWgki0watqWobr4mp7KPohXwH3IrYtxdNJGY2xE+qIz1m39sZ3Yw==
X-Received: by 2002:adf:e44f:: with SMTP id t15mr7971119wrm.394.1631459768765; 
 Sun, 12 Sep 2021 08:16:08 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id h7sm2474520wrq.30.2021.09.12.08.16.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 08:16:08 -0700 (PDT)
Subject: Re: [PATCH 06/20] nubus: implement BusClass get_dev_path()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-7-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c71bfe30-f2de-7bec-f277-0af5dcf1204f@amsat.org>
Date: Sun, 12 Sep 2021 17:16:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912074914.22048-7-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.584,
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

On 9/12/21 9:49 AM, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-bus.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

