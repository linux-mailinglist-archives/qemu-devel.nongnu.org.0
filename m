Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838F54C2B2D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 12:48:36 +0100 (CET)
Received: from localhost ([::1]:33952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNCbq-0006b5-Lo
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 06:48:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNCa0-0005hp-9W
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:46:41 -0500
Received: from [2607:f8b0:4864:20::1035] (port=34369
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNCZy-0006Qs-Mj
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:46:39 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 gl14-20020a17090b120e00b001bc2182c3d5so5367598pjb.1
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 03:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=N9ldm/mo/CsimIzJctL9tg/YS6qkYPsV20rd2gEUUt8=;
 b=Uv9fEEaEr+ivV+BFVeIhZgH5blnTMu6zDI4jh+hLPZt6ptTBtVq/3K0VWNY4znveca
 Sb4PM4TUyllJ1cBkXWruJATw9lAqYNCwYsfU5wvDTlyYwWjz4ws82IZIbPlwJ7Vmr6W2
 05qc1406V3Mi075kP0/wQcGelGRSQVNo00cROCPyZHHX1IsO0VdgdalF73V4/F+fD1m4
 DY/nBtZWi22xDyWbiIHppg7aJxQVHMPqAWXnLPG5ODk2ZbZ3utzwjZCcjzIz7LQQKLrq
 dRY1c5ercaRbcLf1TpY7tSag66EOy4sTGs216YAAN8zk5/gP/39QtEeAPByeuSPD8+qP
 45gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N9ldm/mo/CsimIzJctL9tg/YS6qkYPsV20rd2gEUUt8=;
 b=RNsvg/oSV/rsS+bZC77y5sI68IbHEQceo5r5P2niWiyCKtbM4+HhLz968EaKse6y4f
 y/L0mJvbJMfF7WhuZ4rkB5bZrscTjMSBbYFd5hD+y1r2+D3CnbczOxGxdv7K/PwmcZMC
 u8er3j2HCwjAb0/SNpLA5IEhZ84s+FmFFlceJig1VcB8D3v8kuyxwWjfwhJsr7LN3jqO
 EqVagIJXJHU+cVzz8wiOr51BDhiGY02rvUf+nFKCipBNH5gGJBuxN8w3Qw6gTeg0ZvCJ
 /ghaLvu45NgATXSxZM+n9/o+J0rfBLdRJqQb+krSNvFIcAtGHravDjH+eNlZ0/zsKAV1
 0Flw==
X-Gm-Message-State: AOAM532qZXc92WAo19hhoEJuMsT6g7wXl/zyAQOnLLYLVs/KG6hXCBQY
 MHAAbF1sFkEoNCL7rs7UrNA=
X-Google-Smtp-Source: ABdhPJyQe88aUF0rZasCdXvtB0vzyI/jCfOX02zblnO/2+1X0NAYHV7PvmH04fE7KMjhMV0KQt/yyg==
X-Received: by 2002:a17:902:d64b:b0:14f:1636:b2c3 with SMTP id
 y11-20020a170902d64b00b0014f1636b2c3mr2255674plh.100.1645703195945; 
 Thu, 24 Feb 2022 03:46:35 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 k18sm3220576pfi.10.2022.02.24.03.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 03:46:35 -0800 (PST)
Message-ID: <4d2134d6-91e2-11ed-8d9e-873705a050d9@gmail.com>
Date: Thu, 24 Feb 2022 20:46:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/2] ui/cocoa: updateUIInfo threading, autorelease pools
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220224101330.967429-1-peter.maydell@linaro.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220224101330.967429-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On 2022/02/24 19:13, Peter Maydell wrote:
> This patchset was originally provoked by Akihiko Odaki noting
> that we have some unnecessary creation and deletion of autorelease
> pools in the Cocoa UI code. Patch 2 deletes them; but to get there
> we need to do a bit of cleanup of the updateUIInfo support,
> which wasn't considering threads.
> 
> Tested only very lightly.
> 
> v1->v2 changes:
>   * name method updateUIInfoLocked, to match existing handleEventLocked
>   * don't call updateUIInfo in cocoa_display_init() -- this happens
>     indirectly as a result of register_displaychangelistener()
> 
> thanks
> -- PMM
> 
> Peter Maydell (2):
>    ui/cocoa.m: Fix updateUIInfo threading issues
>    ui/cocoa.m: Remove unnecessary NSAutoreleasePools
> 
>   ui/cocoa.m | 31 ++++++++++++++++++++++---------
>   1 file changed, 22 insertions(+), 9 deletions(-)
>

