Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BFD3A97EC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 12:42:33 +0200 (CEST)
Received: from localhost ([::1]:38060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltT0C-0005Ow-68
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 06:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltSzA-0004hn-IJ
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 06:41:28 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:34569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltSz8-0008Oj-Rf
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 06:41:28 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso2978684wmc.1
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 03:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X2PIl+RRa5YhQCRYJ1Gh3kPrDCtWlc7JwLEFP3+8tb4=;
 b=Tm2Ln47Id+eMgpTeSb+H5kWK0PPinN2mqk45FAAQtW06i4GX95DR8cXCcpX6yUiTn9
 lgiGzE4fub9xhZRd0d2ZegL2Xbsl29wVFRNAzZC46gPIShuLGxyY1hcBY5bMWeIu0JQ/
 YWkx18ol2wIpuzulR3AUE2fXnZerhAjRQ/rk7+fuTUCGJvNLqgrt73BRcogo+1xIkz7/
 XUpOLoZNJXpm8B/SUA7S6fTjzqhASvYT4HFgssIo6Ab5doj9hofiFaJnf6JpQINrk6rN
 j4+BwIpsVIz1vSVURruB16pdygcSsv46RkqEbppAsNQoemQXjZs99i4FJmW/ih6JQ4AO
 ecKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X2PIl+RRa5YhQCRYJ1Gh3kPrDCtWlc7JwLEFP3+8tb4=;
 b=X17V4HhuWxssYmxUtf/CKHR5Vk24S/LBMREo46dJWgWOF+j+GaZWSkDQJ0hNGCsx2C
 RF0zWqGP3VQCBFtjjlDRFLbk2y92NhUL9xtxpTqU4L7sbzT9C4Dsw42BNHgWlOVI0WEl
 ojw2Ib9JSlLOVIJewkaKk7PnYrlCfCwxP9T/oWPcNaU1dhZUcbONYXN8ROpgcPJzGg1o
 NYiDGilMuiCmbq/nFZA22E32CAH2c3jyCoLcj9rJCT0UXovI5CQ+hKUVpRBuOg4rvDY7
 5AOshNBOUSKEMYRQYA6D1HRrRUZL1uoP9qFmU2r2bLEdypwbcwRWOZio/KwwWk+s5dPx
 v5rQ==
X-Gm-Message-State: AOAM5302iBlcYDZXNyJfSGwvcojQCuc3ZxNB5jE1g9jOAiNDQfYCJ09y
 cniTNMuLy/JN7X1SxvjiuXrOmV6Ir9xwBQ==
X-Google-Smtp-Source: ABdhPJwyHlbvgREJH5ifAfWY7XoI92n+2AO8NhZGR8HuB9s73vCZScGwAK5v8sVoDd9b8f0SiwRnnQ==
X-Received: by 2002:a05:600c:2115:: with SMTP id
 u21mr10410888wml.53.1623840085001; 
 Wed, 16 Jun 2021 03:41:25 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l16sm4429361wmq.28.2021.06.16.03.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 03:41:24 -0700 (PDT)
Subject: Re: [PATCH] hw/audio/sb16: Avoid assertion by restricting I/O
 sampling rate range
To: Gerd Hoffmann <kraxel@redhat.com>, Qiang Liu <cyruscyliu@gmail.com>
References: <20210601151813.2059996-1-f4bug@amsat.org>
 <b755adfe-5fbe-affb-cc1b-5b4cb377b715@amsat.org>
 <CAAKa2jnvoSqQhpcbgpfXHhdPkERD+92DP4zjKAYCQih-cOrxTA@mail.gmail.com>
 <7c9dcdde-2919-c8ee-bccd-91ff110454f4@amsat.org>
 <CAAKa2j=Uc=oDMLD6z+mPUcAQQ6Hbvox4AwuFGun_Ukj8EopXHA@mail.gmail.com>
 <20210616091653.f5u6ao6p3ytfpstf@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3237859f-bb6a-6d12-fbe9-142b6d988a00@amsat.org>
Date: Wed, 16 Jun 2021 12:41:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616091653.f5u6ao6p3ytfpstf@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 11:16 AM, Gerd Hoffmann wrote:
>   Hi,
> 
>> Should I send this patch with tag V2?
> 
> Yes, please.

I don't understand why. Shouldn't it be enough if
Qiang Liu replies with
"Tested-by: Qiang Liu <cyruscyliu@gmail.com>"
?

