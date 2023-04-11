Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A796DD8E0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 13:06:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmBof-0001B6-5w; Tue, 11 Apr 2023 07:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pmBod-0001Av-22
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 07:05:35 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pmBob-0005sB-55
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 07:05:34 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 ie17-20020a17090b401100b00246d4b282eeso2685053pjb.2
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 04:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1681211131; x=1683803131;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lWksgQw56IIsEUqcstC3DiAO2f/AxHftfgxgwB8EjGk=;
 b=og/ZbT8mPus9l7fxgADUAHOJEWhiRVb6bSUliptdi+JyrYEUb2u5VEnDRghzurzFtm
 b9ZGNXMKhsu3MJqsbTlxM3B1mUGdxqUXGsY6oUUGZu5AfrSXF/3lV4FvnPRcyC4Si63o
 tphw1fKbURSU38EURsV1KRAmba+kYiHbKR2hCx4WbSX73a+2aJ08LJWeWgjkExTySdYF
 0momNZRu/we85hpOeTHqllFFwuyxuGSnmAFSDstpOd8ZHi3jla2ZGuuBYkXrEI9IXnE5
 nzQrk6IT8yIcOQCsvPaNMPqvlpeWngDgdF2YJtoQ85DSWXcw6GThQf3LJ5O4QsG5f/bp
 n9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681211131; x=1683803131;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lWksgQw56IIsEUqcstC3DiAO2f/AxHftfgxgwB8EjGk=;
 b=kjWacPJi2Z1x4RCPzczfxCQ0LPXwJcU79LkWbQI9QkW6kNCDaoyoir0ulrDlT8dZvb
 O7EUS6qS+BxCNfuJc7Xa6IG+RGGlb6qfgx2F8cDH4s2bJCnSQpBPZE98D+lNABqGJCfy
 l5F23IJQ3cDfeJBsONQ3yYTpOM47fIY93gMy22/u5+eoqCbxSkUn/TKNWX10fmDUAp7U
 K29ue1vtwRs5vwuLlo+A62XVMABcyKk7bMAeAhfEgke3J246VtyQk5yAQR9utc9AjSKX
 UsJMc06gyJ1CFjsCPzE7kbd/H23LPKrOPyjj/MoOdHcmdzFZY2EeVur5HsbbU79MMmXw
 Oq9Q==
X-Gm-Message-State: AAQBX9dIc+Uq0gDWUDIZqNP+u6ikurEKbptUXLYH67bmYXOMSjl3y3zg
 SUeJx+VFoYIscebvYqKqNI/8aA==
X-Google-Smtp-Source: AKy350YCv2RhYKpuo6Hp7sj9RydoavHq0ahdt7I48wc04Kxu8YLUuopCybrxgcV/TDkCHOOOTm/saQ==
X-Received: by 2002:a17:90b:17c9:b0:23d:35d9:d065 with SMTP id
 me9-20020a17090b17c900b0023d35d9d065mr16185040pjb.48.1681211131230; 
 Tue, 11 Apr 2023 04:05:31 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a17090aae0900b00240aff612f0sm8992339pjq.5.2023.04.11.04.05.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 04:05:30 -0700 (PDT)
Message-ID: <3f1c3aeb-22fb-1349-08a6-a6fa55019e37@daynix.com>
Date: Tue, 11 Apr 2023 20:05:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] pcie: Release references of virtual functions
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20230411090408.48366-1-akihiko.odaki@daynix.com>
 <44853d32-38cc-eec0-c96f-31c898104e7d@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <44853d32-38cc-eec0-c96f-31c898104e7d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-2.17, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/04/11 19:11, Philippe Mathieu-Daudé wrote:
> On 11/4/23 11:04, Akihiko Odaki wrote:
>> pci_new() automatically retains a reference to a virtual function when
>> registering it so we need to release the reference when unregistering.
>>
>> Fixes: 7c0fa8dff8 ("pcie: Add support for Single Root I/O 
>> Virtualization (SR/IOV)")
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   hw/pci/pcie_sriov.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
>> index aa5a757b11..76a3b6917e 100644
>> --- a/hw/pci/pcie_sriov.c
>> +++ b/hw/pci/pcie_sriov.c
>> @@ -211,6 +211,7 @@ static void unregister_vfs(PCIDevice *dev)
>>               error_free(local_err);
>>           }
>>           object_unparent(OBJECT(vf));
>> +        object_unref(OBJECT(vf));
>>       }
>>       g_free(dev->exp.sriov_pf.vf);
>>       dev->exp.sriov_pf.vf = NULL;
> 
> It feels the issue is at the device creation.

I added object_unref() to unregister_vfs() because dev->exp.sriov_pf.vf 
actually holds the reference. Practically there should be no difference 
as the parent bus also keeps the reference until unregister_vfs() calls 
object_unparent(), but I think it is semantically more correct to 
object_unref() in unregister_vfs().

> 
> [/me looking at the code]
> 
> What about:
> 
> -- >8 --
> diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
> index aa5a757b11..fca3bf6e72 100644
> --- a/hw/pci/pcie_sriov.c
> +++ b/hw/pci/pcie_sriov.c
> @@ -150,7 +150,7 @@ static PCIDevice *register_vf(PCIDevice *pf, int 
> devfn, const char *name,
>       PCIBus *bus = pci_get_bus(pf);
>       Error *local_err = NULL;
> 
> -    qdev_realize(&dev->qdev, &bus->qbus, &local_err);
> +    pci_realize_and_unref(dev, bus, &local_err);
>       if (local_err) {
>           error_report_err(local_err);
>           return NULL;
> ---

