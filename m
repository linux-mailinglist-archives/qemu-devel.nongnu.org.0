Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6936E407DEB
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 17:25:59 +0200 (CEST)
Received: from localhost ([::1]:42624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPRMk-00010S-GE
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 11:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRKO-0007QV-K4
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:23:32 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRKM-0000UB-WF
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:23:32 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w29so9834639wra.8
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FJ0v5X1ko5yppX3I6QAFT83OHhxW3UVmG8y+sWl1S7g=;
 b=Hv8RLplyd4N7Tc7Zy35ZSlcBsPTTyZqpSMsG5/MKO7mIeIQHoOzsOPZS7tfe/c1xDQ
 DQsC9leiktp9wbP9+kcIagor//FiehOeD5cjAwVXU3wFSjgmQSZ5axawDvMaNsjgZfx6
 UJzK8RlLOiNi74iVIw0dWH3A6DVL5bC7i6wZjQLMO6oU2KCDUovVvfGLvJVzHLl/YRL0
 g7qa74VYBE4fnv5aIxof26i951E1HXZk3Q40HcH2fkaHpav83CfWcLYEm5qrVuC45xxy
 IEvs9XjfYlBnAZy+yIP04THWutn65q7v8tN8YNenxtlPtY4gFsSiPXY8acaLb8f350qC
 8j8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FJ0v5X1ko5yppX3I6QAFT83OHhxW3UVmG8y+sWl1S7g=;
 b=7L8SMU0sU3IC2OWs+cmbGj7zpc6MzbQ4a+mj52gvoKaeqeHIGaW135xFTLtXkRbC0V
 BqM37eou3TRnnGuLEEsoZWvOJd0nokj9AZV1GFW8iaULP6aP3CCvZK3fNNfLLLOfTvm/
 IsNORHd1Aa/3UEYHQ7oqMUtQqg8Sdr7l1BkVf6hiFbxR7hk+Gg2RXNSz2OgjgSwkpPQh
 tQRZ2vOJSdD2iuNw3IKgtQ2IEGzV7DfhDIqjdp3jqm96AZwzBB/R/RXalenSWGfF+kUg
 fqEfEB0QWlXtH4QrdDCcnPbA/MN794XP5e+nGbH5vD6CY6qcny4oseaOGsvv9vdBbAdO
 KevQ==
X-Gm-Message-State: AOAM5339AI4fg/8ln8ajVeUHADyYIOSrXGupOOlh5dp5TZdCizj77P7y
 s3STH1WQDb8aB5QteWN01Ls=
X-Google-Smtp-Source: ABdhPJzY8h3HBztQonrdNVjG92rEisA0gFUL7dSg1Fjr7jjeXNCMnLQaeMMkK4JX1D2vMLl/H2mwnA==
X-Received: by 2002:adf:f183:: with SMTP id h3mr2767352wro.32.1631460205935;
 Sun, 12 Sep 2021 08:23:25 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id s14sm4207620wmc.25.2021.09.12.08.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 08:23:25 -0700 (PDT)
Subject: Re: [PATCH 13/20] nubus-bridge: introduce separate NubusBridge
 structure
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-14-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d93fbaf7-1ec0-231d-5a5a-0a4f2eb847f2@amsat.org>
Date: Sun, 12 Sep 2021 17:23:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912074914.22048-14-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
> This is to allow the Nubus bridge to store its own additional state. Also update
> the comment in the file header to reflect that nubus-bridge is not specific to
> the Macintosh.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-bridge.c             | 4 ++--
>  include/hw/nubus/mac-nubus-bridge.h | 2 +-
>  include/hw/nubus/nubus.h            | 6 ++++++
>  3 files changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

