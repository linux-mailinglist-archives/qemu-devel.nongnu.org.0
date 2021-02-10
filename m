Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0329831738F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:43:17 +0100 (CET)
Received: from localhost ([::1]:56034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9yCZ-0001GJ-So
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:43:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9y3e-0002rS-GO
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:34:04 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9y3c-0003bA-DT
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:34:01 -0500
Received: by mail-ej1-x635.google.com with SMTP id y9so6925192ejp.10
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=57/OnEKPnHGhHIOyatkN53tHr0pMNsAkOd/N1lF/owQ=;
 b=CuzPVAIlfhFsx9Y9AuPliJFAaiC/mB2Nwuhv43nZ77skC7fhFaM9MTuKOAxz30YBtp
 0mc2Sgi0Hy/5LJT3fVKYC1E1M5FaKPkXWUC0vc/ypRzThN/KGziE3DSh4pbCL2Y9eFKJ
 YG7X1CDmW+J/jmpipjL+bLfnXXKPxaBswI5rREZC2qa7K2rsIKAiDMTvwIDTfES2bn23
 +A3u/fWNQn/uyVctbrzx0YYX+bDFqMUid+SktEyKBvgUN+wL7UIhPCr/a7lNoyUWSVZF
 bEVetoOBJlDtez+HcMl4zlEyztthn3udHbXk4cufAvz13eQKMGK2mMFeFiRNv0ARFCGo
 bJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=57/OnEKPnHGhHIOyatkN53tHr0pMNsAkOd/N1lF/owQ=;
 b=H9+w4z6Vr8G3+lqRH+8m8/XoUh3UeEiIQV7XVA59Z2G2oFInTUt3phY0enKxU1ORpT
 yXmrqrIQwuRi6ZBoIURQBzvYocpVG9F1s+/yGZe6jvtde3wmsd0YEao3mtQ92lQG/EhO
 b0pXFWnnYNC/K19fGtBpBnuk9o8qAkwgFGM+qVSPz5vwhQ2mUamhu2rhM5oZCLuLHmf+
 Lm2PCKJkOnYb0jK8D/N3vJrP5OJVS6+5OG6BaqUpuO7anq1WBslKbP+hWZbte7+BFPXP
 /nr9H4nFo2bQZx2uOdOO8VxqfSTY9XDyOTtCsZDkp1BdYdZ5mYtlLj2cy1VoOEQdKW5E
 hvoA==
X-Gm-Message-State: AOAM531ybfjVu70bcTxs8y4Va6MS17HtHNfpTtd2KuJi4X5uGIMLi0z/
 SLIlZZ5ColOAzt2TWJ32T8s=
X-Google-Smtp-Source: ABdhPJyVYcuOwykJHjlcv68DaAdQRci1E+9C7tkAHTndyK4ogBazJZp5+OittYb5kpxWUSUGtOvyRQ==
X-Received: by 2002:a17:906:24ca:: with SMTP id
 f10mr5083387ejb.96.1612996436799; 
 Wed, 10 Feb 2021 14:33:56 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id er1sm2381478ejc.69.2021.02.10.14.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 14:33:56 -0800 (PST)
Subject: Re: [PATCH v2 10/42] esp: introduce esp_get_stc()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-11-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6e1d5061-422e-797e-f96f-d0e78890fde2@amsat.org>
Date: Wed, 10 Feb 2021 23:33:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-11-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
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

On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
> This simplifies reading the STC register value without having to manually shift
> each individual 8-bit value.

If possible repeat the subject so the sentence is easier to understand.

> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

