Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F302454ECC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 21:52:11 +0100 (CET)
Received: from localhost ([::1]:40644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnRuc-000351-6y
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 15:52:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnRt6-0001cq-AW
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 15:50:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnRt4-0000cS-Is
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 15:50:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637182234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dxLPrVCVKEmFPQEGXhcAEQreK6qq4KdexhzAZazzwOU=;
 b=DeoIs0imyPwzzUqGYsoOVLQ5QTBMcaCY6NmHiIb9J9lgtvpshfhmzXoXIuPkz34AvESzDQ
 iZ2F9WZOzjS25IVweU9isH8oUfk9jwMjvMt6Yf/xY0xHjOMC/OBb+5jGL33rmcp+vLPhFt
 3kt2zP+gwAuK4fywShnNuFx90Mi1Zeg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-orDa_bzcPoiVu4zjXAY1Vw-1; Wed, 17 Nov 2021 15:50:32 -0500
X-MC-Unique: orDa_bzcPoiVu4zjXAY1Vw-1
Received: by mail-wm1-f69.google.com with SMTP id
 g80-20020a1c2053000000b003331a764709so3337389wmg.2
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 12:50:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dxLPrVCVKEmFPQEGXhcAEQreK6qq4KdexhzAZazzwOU=;
 b=stDfTG5LorBm4+i9OqYzwKGlBUVnF5LVcV6oK3zFCI496OT6qvnV9Dwf+r2bEXLQCa
 kkNs7rEMQA8nnEgbfw5WEcfvSGJcsFI4q57VnPGrkItpNs8aI2/nf/WfQofyo7kXPM5Q
 lb9xjsfqvDNQxAx6ECbAI+9RQA10cdEbixBGO6BRBCygGA7Vf3DiDQuPFM1jhaXUl+ia
 fTUzysyZ5KW0rn71Dr/8e9JJaevBzoZfNaciK2G3wm1zPZkg280Ir7x/W51+mGIH/EN0
 z6pKMpB0/CgYFSwzkAdNl3itEhSjx0LTUMTcwW21d1vq9iO+8JqvZBRd303o0YqO4DIt
 QGlg==
X-Gm-Message-State: AOAM531aRrr0uxX2rw5soL2ocjyUv5IpyOV59LZftI3ZjmnguvXbuZ/G
 6B8udLNSvQyqeKOwW8EnUQOXAh/fpIUELzKI2LcStkZ3ucr2nvJCpBsCX2K5FFF1ms3WQvTCHAe
 C4vSv0GH3Tdbkv9M=
X-Received: by 2002:a05:600c:202:: with SMTP id
 2mr3224584wmi.134.1637182231786; 
 Wed, 17 Nov 2021 12:50:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3VwdqcOq1A4Gr4zJBkta4PESXlMEagE6Bq2NXXOgKfBE5d+ELjl1rD8u18HGgmt/L6yUr1A==
X-Received: by 2002:a05:600c:202:: with SMTP id
 2mr3224526wmi.134.1637182231393; 
 Wed, 17 Nov 2021 12:50:31 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f133sm719451wmf.31.2021.11.17.12.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 12:50:31 -0800 (PST)
Message-ID: <b09a1550-3dbe-b8a7-2979-65e8307cdba2@redhat.com>
Date: Wed, 17 Nov 2021 21:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH for-6.2] hw/nvme: fix buffer overrun in
 nvme_changed_nslist (CVE-2021-3947)
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20211117132335.41850-1-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211117132335.41850-1-its@irrelevant.dk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Gaurav Kamathe <gkamathe@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-stable@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 14:23, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Fix missing offset verification.
> 
> Cc: qemu-stable@nongnu.org
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> Fixes: f432fdfa121 ("support changed namespace asynchronous event")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Gaurav Kamathe <gkamathe@redhat.com>

> ---
> 
> Note: Since its so easy to mess this fix up, the log pages code could
> probably use a refactor - there is a lot of duplicated code as well and
> it's easy to miss a check like this. However, defer that for 7.0.
> 
>  hw/nvme/ctrl.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 6a571d18cfae..5f573c417b3d 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -4168,6 +4168,11 @@ static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
>      int i = 0;
>      uint32_t nsid;
>  
> +    if (off >= sizeof(nslist)) {
> +        trace_pci_nvme_err_invalid_log_page_offset(off, sizeof(nslist));
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
>      memset(nslist, 0x0, sizeof(nslist));
>      trans_len = MIN(sizeof(nslist) - off, buf_len);
>  
> 


