Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D996B8AE0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 06:56:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbxdn-0007xb-8x; Tue, 14 Mar 2023 01:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbxdl-0007xT-Uq
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 01:56:05 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbxdk-00044c-Cj
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 01:56:05 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 m18-20020a05600c3b1200b003ed2a3d635eso1553191wms.4
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 22:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678773363;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jq+BADjxNsd4bj9DaOcx9VC73aVjPdRd4pMpGOJg828=;
 b=iMMuCXyxUdDgwKfSNordIftUV7uSIAxdLRSrnCzC4/qSaR4pgIZMjXuAMU5i8FJlhO
 vVmsap1+UxudplHO/PQukWRVsa3uMQKpuj5xOvntS75D2l7rkFTBwgCsYWfs/FvFPivz
 cby7bg14hB/IYQPdNTCnLtWx5FboJC2nsqb2LaI+O8qeikwSHFH4+5kmNlLcgd9t3qPG
 6rIqGkePtdyip6IFHkHw3aWyk/LdXWNpPmevxICQQdc6c0TEfN5jM7/EBYe5sGOa/QHG
 Mzqh251CZrChY/R/QudZqWt1FHqhdAEshoL3RqUS2NVEJozqHd8A9gQR9pDGrboWXPRN
 xPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678773363;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jq+BADjxNsd4bj9DaOcx9VC73aVjPdRd4pMpGOJg828=;
 b=Qdy1pFxJJyPvAjCFVXOID7iR9YX/rAlbZmXQmb+EVeFjRbGnXHxGioJWQQCGtijAPa
 LVMCKzLxTMsmkgW9BlVxYExDAWIaWPI//HWVvavoldDrXLsUgmos5esae3rDxusplUqb
 Byijb8BDWh+B5Uwno/cYwDyQDkuME3/+TVfJLaRJ9xFLqdM0b4ZITPB2ITabPxQo0PaB
 V+j/tjLKOx7F+1q86DXpNlGcsIMMSMDorpPD5afkIyhRfasnbF3id59XKHdHKZyy1qXy
 IZ+UuunRQUCaMXBQNg7w3zv1IqfkE4l1KCJ7ObrIHeMFap5CG37285Etni1wRX2dfURP
 b+ZA==
X-Gm-Message-State: AO0yUKVBhBZ7hIf6cV/Im+A1p7w4euPKYtPJxbk7FvfqjWB0msO+Ok8x
 OoPzbANwSw7eTeyKpGQZNZzB6Q==
X-Google-Smtp-Source: AK7set/BHS9bpASBAc9GSIjluC1ZyzkJlEch/DHA8tLf2Kw6ZB/HQ4Doc9vlfm32kqqWxGAhUW/5UQ==
X-Received: by 2002:a05:600c:5107:b0:3df:e1e9:201d with SMTP id
 o7-20020a05600c510700b003dfe1e9201dmr12587857wms.40.1678773362753; 
 Mon, 13 Mar 2023 22:56:02 -0700 (PDT)
Received: from [192.168.150.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c468a00b003ebf9e36cd6sm1776566wmo.26.2023.03.13.22.56.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 22:56:02 -0700 (PDT)
Message-ID: <b90c1aff-c044-9dae-3b3a-a25a4cbd24ca@linaro.org>
Date: Tue, 14 Mar 2023 06:55:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/6] hw/cxl: rename mailbox return code type from
 ret_code to CXLRetCode
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>, Fan Ni <fan.ni@samsung.com>
Cc: linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Ira Weiny <ira.weiny@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Michael Roth <michael.roth@amd.com>, Dave Jiang <dave.jiang@intel.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Mike Maslenkin <mike.maslenkin@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20230303150908.27889-1-Jonathan.Cameron@huawei.com>
 <20230303150908.27889-2-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230303150908.27889-2-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/3/23 16:09, Jonathan Cameron wrote:
> Given the increasing usage of this mailbox return code type, now
> is a good time to switch to QEMU style naming.
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Fan Ni <fan.ni@samsung.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> ---
> v8: Picked up tag from Fan Ni
> ---
>   hw/cxl/cxl-mailbox-utils.c | 64 +++++++++++++++++++-------------------
>   1 file changed, 32 insertions(+), 32 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


