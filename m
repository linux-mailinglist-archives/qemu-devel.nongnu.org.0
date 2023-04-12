Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A10D6DF17C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 12:03:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmXJY-00038h-HX; Wed, 12 Apr 2023 06:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmXJW-000384-Qo
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:02:54 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmXJU-0004w5-8F
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:02:54 -0400
Received: by mail-wm1-x334.google.com with SMTP id he13so11167666wmb.2
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 03:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681293769; x=1683885769;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LGhz/nLhs64LvkJVZpBjPfH+lZxEKoOq/JSeXzG1XI8=;
 b=VU8j6jYevPvS7gSYF9yYRtaFtYZu2kxrFb8gTPMuPbsYLYU2X6VVF2Ay9MUbApLdTQ
 F2qlq0xRBFiJpUc0saoNVjVm6vkBh6Fvkp3qN4NjOcmxYEVL9WsGFf958soZSAG07HkZ
 6Djm39bd9ycw/FQdMoeP7k6gLNQz+PlHt5rXOJSG2nspzKutnApib5J16bPnzwwRhQSF
 J5YzedVthe/a9YQsJVdy0iKXvhGTN03vvdA6XY/bV49dzBuFgqh9IvTDMWhbHNHwNBt1
 tIGOMvsBThPo7lDoPqK8Tgau/VW2tFqlF2kWfYJJ0bMEDVMjY+advUozimmgMOBEnRDh
 XcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681293769; x=1683885769;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LGhz/nLhs64LvkJVZpBjPfH+lZxEKoOq/JSeXzG1XI8=;
 b=NTluEMd+610dXrOx5Mw4o/T+BPFe9oulM1PKZj5J2tqntXTmD3s+eK+AFxZeUnBGqm
 DTUtZYyY/EkzkfNteHdVb6o+/lzFBiB2yaJj6VrZk2PxitXLKztVGnhWGxUEdzDLkfeH
 13zB4RZL+QTRwSBm3R8f5INMM50/6h4qjq1fcxh1wZTwbuNDhDm7V6dnNo6T+Zag2EyF
 K6VtTL7n5spo/SGUgXDEISIhpvkZqIPYGCqfrv1OQpMPcRDxh1wcBW674DdMJFLVdYyf
 Ghn+2HuK54pB6cU8xbhhCpLAxRjyB/TVok1cjGumVLFz9CIyRLAJHSetLfzMRnGmWs88
 GRFQ==
X-Gm-Message-State: AAQBX9dJ7SfD889qh6ttbmg+ogy94FsHtHE7r9ibUDPSCYm3mVg4DeW1
 a5jv8EcwsY6xu6WFgPcg89gaIg==
X-Google-Smtp-Source: AKy350b78+rKyNQGn90T0rMgYpxkT5tyOX2D+usrDIaibA16SQRjZR8C3lTATtb1PJmuTW30e5v3qA==
X-Received: by 2002:a1c:4b16:0:b0:3ee:ed5:6115 with SMTP id
 y22-20020a1c4b16000000b003ee0ed56115mr1558670wma.19.1681293769434; 
 Wed, 12 Apr 2023 03:02:49 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.216.226])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a05600c218200b003ede06f3178sm1798005wme.31.2023.04.12.03.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 03:02:49 -0700 (PDT)
Message-ID: <07ab950e-7ee4-2476-9032-4638fe6eed1f@linaro.org>
Date: Wed, 12 Apr 2023 12:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/2] cxl-cdat:Fix the check on the return value of
 fread()
Content-Language: en-US
To: Hao Zeng <zenghao@kylinos.cn>, jonathan.cameron@huawei.com,
 fan.ni@samsung.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
References: <20230412071633.2660412-1-zenghao@kylinos.cn>
 <20230412071633.2660412-3-zenghao@kylinos.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230412071633.2660412-3-zenghao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/4/23 09:16, Hao Zeng wrote:
> The bug in this code (CID 1507822) is that the
> check on the return value of fread() is wrong. fread()
> returns the number of items read or written, so
> checking for == 0 only catches "no data read at all",
> not "only read half the data".
> 
> Signed-off-by: Zeng Hao <zenghao@kylinos.cn>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/cxl/cxl-cdat.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
> index ba7ed1aafd..130531a9cd 100644
> --- a/hw/cxl/cxl-cdat.c
> +++ b/hw/cxl/cxl-cdat.c
> @@ -126,7 +126,7 @@ static void ct3_load_cdat(CDATObject *cdat, Error **errp)
>       fseek(fp, 0, SEEK_SET);
>       cdat->buf = g_malloc0(file_size);

Pointless bzero in g_malloc0, however this code would be
simplified using g_file_get_contents().

>   
> -    if (fread(cdat->buf, file_size, 1, fp) == 0) {
> +    if (fread(cdat->buf, file_size, 1, fp) != file_size) {
>           error_setg(errp, "CDAT: File read failed");
>           fclose(fp);
>           return;


