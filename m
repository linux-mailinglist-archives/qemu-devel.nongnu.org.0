Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E11B6DF151
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 11:59:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmXFw-0000ya-Ak; Wed, 12 Apr 2023 05:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmXFq-0000yK-Ef
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 05:59:07 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmXFn-00042n-Id
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 05:59:06 -0400
Received: by mail-wm1-x331.google.com with SMTP id gw13so6157866wmb.3
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681293541; x=1683885541;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n9UKxoJCalxzWMvporGJZg98a0GKjz2TITXs3eJ/NZ8=;
 b=lMRSJZXHGclA9OSDWhvXODt05hLggqUfm+uDEya+N2YhaXSe3MpJbffiycojYhaTW0
 EnmGMlQOJyS//r0aqtb2WnHQorEIsgyaPa7nxridu7h0arW0w0eHTC15tWtrlrLcOa1i
 5YEwOAEDBsOS/FEGP8rri3uFPQ1V5g+JOYzzhkgajANYpfvwAGCex3FBEZDRYZAd13vY
 J7Mve5Lvd0qYKmyM6SazXVAwDi8JnDi2Z/c4+cZaMh/BCp6RbagQTeaG7X/aTVu1w6VJ
 AuaWIUsOOLSxC/uqOPvA0y8SDxk8nPI+97dJ8eMWMyvjux5oVaIPvV+1AbhHxYpfDPC6
 AlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681293541; x=1683885541;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n9UKxoJCalxzWMvporGJZg98a0GKjz2TITXs3eJ/NZ8=;
 b=ZQLs7nEmHEEA/c4OdQDwb8rKJu056ypeGK59svRmE0fj/5fOqXg06QrA7A/a8+FPGW
 fk9wmCqz7nJfZQ3kfB9r4OEmIrbIH5V74G4KPY9dPpp+GuSC1sE3uHI3GUdPWNnUyaa0
 /R5z4omJzjjtE5LfuTMuQuIm0tHH30pR1f/4K3Up63kO7jAKLGmrxkIKyk7PbSDCU14N
 YR0gj09C5C5moXWxebUAF3I/8KbdYEgeRh2RPjA3toVdavSdDIM6QzX/5mW2DOZXqENF
 PKKumeuI2ZieY4vaXvxaHK10I4MERKn1UNafdMlybhYVzOxTEGa9FFwgX7uhx2DGCk6A
 lkPw==
X-Gm-Message-State: AAQBX9cHpQvluXFFfFhlg0Riy8xXFAUQXK6MWhn2vzN78rzL1wBi6+8S
 p1I369Vt6IzTjbVWcSK5WuFkHw==
X-Google-Smtp-Source: AKy350a+lBO2+Dh2gTpj8J9LbHJ0ftV+vb/tEDpCTacCpU0hR8lTQ7/5bzHaU4GrnmqLbC9NWNctMQ==
X-Received: by 2002:a1c:7502:0:b0:3ef:61f7:7d34 with SMTP id
 o2-20020a1c7502000000b003ef61f77d34mr9109061wmc.1.1681293541631; 
 Wed, 12 Apr 2023 02:59:01 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.216.226])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c511200b003f0472ffc7csm1878566wms.11.2023.04.12.02.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 02:59:01 -0700 (PDT)
Message-ID: <92e890d1-5a93-821f-e256-7df3d91ad4ac@linaro.org>
Date: Wed, 12 Apr 2023 11:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/2] cxl-cdat:Fix open file not closed in ct3_load_cdat
Content-Language: en-US
To: Hao Zeng <zenghao@kylinos.cn>, jonathan.cameron@huawei.com,
 fan.ni@samsung.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: Xie Ming <xieming@kylinos.cn>
References: <20230412071633.2660412-1-zenghao@kylinos.cn>
 <20230412071633.2660412-2-zenghao@kylinos.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230412071633.2660412-2-zenghao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
> opened file processor not closed,May cause file processor leaks
> Fixes:aba578bdace5303a441f8a37aad781b5cb06f38c

Fixes: aba578bdac ("hw/cxl: CDAT Data Object Exchange implementation")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Zeng Hao <zenghao@kylinos.cn>
> Suggested-by: Xie Ming <xieming@kylinos.cn>
> ---
>   hw/cxl/cxl-cdat.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
> index 137abd0992..ba7ed1aafd 100644
> --- a/hw/cxl/cxl-cdat.c
> +++ b/hw/cxl/cxl-cdat.c
> @@ -128,6 +128,7 @@ static void ct3_load_cdat(CDATObject *cdat, Error **errp)
>   
>       if (fread(cdat->buf, file_size, 1, fp) == 0) {
>           error_setg(errp, "CDAT: File read failed");
> +        fclose(fp);
>           return;
>       }

Alternatively:

-- >8 --
diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
index 137abd0992..e014b51714 100644
--- a/hw/cxl/cxl-cdat.c
+++ b/hw/cxl/cxl-cdat.c
@@ -110,7 +110,7 @@ static void ct3_load_cdat(CDATObject *cdat, Error 
**errp)
      g_autofree CDATEntry *cdat_st = NULL;
      uint8_t sum = 0;
      int num_ent;
-    int i = 0, ent = 1, file_size = 0;
+    int i, ent = 1, file_size = 0;
      CDATSubHeader *hdr;
      FILE *fp = NULL;

@@ -126,13 +126,13 @@ static void ct3_load_cdat(CDATObject *cdat, Error 
**errp)
      fseek(fp, 0, SEEK_SET);
      cdat->buf = g_malloc0(file_size);

-    if (fread(cdat->buf, file_size, 1, fp) == 0) {
+    i = fread(cdat->buf, file_size, 1, fp);
+    fclose(fp);
+    if (i == 0) {
          error_setg(errp, "CDAT: File read failed");
          return;
      }

-    fclose(fp);
-
      if (file_size < sizeof(CDATTableHeader)) {
          error_setg(errp, "CDAT: File too short");
          return;
---


