Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E984B649E25
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 12:49:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4hGl-00070Z-J8; Mon, 12 Dec 2022 06:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4hGQ-0006yV-2G
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 06:46:31 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4hGN-000534-5f
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 06:46:28 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso4880082wme.5
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 03:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H9bUusv80zjpCwJ8icqDiD5n4RyV6nPKD7KvVR4XEJU=;
 b=wRSfToyCCmS2fzzYHsWccWFEeRoBspAVEbe5d6UR4SKdbL+pQzfnncWIiP+o94Jo7F
 8Zd6DdzoAYIYS7Ty5TLJiR4uBpwpKeDHPRpbpVSomoV0xBwbVrKQNuNovBn2AZKeUoVl
 BAlQvEK/msjdYYP3niRYHvx1e4/tQEl1nSE0XWQw8nnmR9FfYcZTDQ58NGPxVfCnzwnM
 pOH9xKrs+Z1PyZxhwIF3IPR3HHaYEzVLi8wKGlSbgfIaP99EolJqkcx419q2rLBS+R/t
 opEseoqQXUBaGNb8ZoRh/H1xabYcl2nJpOfEfir2HL/oy8LJbpDZuU6WeDTTINRuR0xV
 C4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H9bUusv80zjpCwJ8icqDiD5n4RyV6nPKD7KvVR4XEJU=;
 b=bwPm24YucHrdle7cYu3MLHSSjxgCuHXq8WIc5ZSJ2E960+K751ZWsjsZRH/bM3+rE8
 LfXsRIAkGEybFcatkplGSSzaOoXYxuMXbIw3YoUmIW4Qyn9y/u+lbBkqnZuM+p5VZHro
 9XO2g8znhkTTWw9kPxMW40ny3Td0/DlDWc3HkZJIR7aMWP48lMdij+MKUUilwv36lbZu
 4UagiJOBedVLPHBqhgMk2DMuKNlImtaRb6tO2nt7FAEt5h3hbBYqaQjSfcFwBurhKPW7
 lvQ+OnGmQ4RaTzU7SrzE0Wp8H8uJJAxOIT2Cf4GXjqy2EqVwWeEdD2DvXqT6+mNL5jCo
 Am/Q==
X-Gm-Message-State: ANoB5pnEHgOojL+4GmqsVi84EXOKp4W0UJZfilZk2qhTxaKWGZr1UsXz
 uTl7C+/yzpUUB8SJqZ0PGkshoSadORhUjqpgd/g=
X-Google-Smtp-Source: AA0mqf7FD15lWSS/ybUuMMbIvEWO+R/ccPqm0vlsLA6/bXSydkcAztdWLIrM3c6g+ZqlnuIU87u1Sw==
X-Received: by 2002:a05:600c:600c:b0:3d0:8c7:65dc with SMTP id
 az12-20020a05600c600c00b003d008c765dcmr11786201wmb.0.1670845585817; 
 Mon, 12 Dec 2022 03:46:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g23-20020a05600c4c9700b003cf4ec90938sm8673695wmp.21.2022.12.12.03.46.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 03:46:25 -0800 (PST)
Message-ID: <b44cbf94-051c-6e3a-9d6e-af60d817e222@linaro.org>
Date: Mon, 12 Dec 2022 12:46:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v1 06/24] vfio-user: Define type vfio_user_pci_dev_info
Content-Language: en-US
To: John Levon <levon@movementarian.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>
Cc: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <957361f0e497e0b95f10a3caf617fe04d9c6fb72.1667542066.git.john.g.johnson@oracle.com>
 <78476e9d-0d40-12e8-075c-ec4ac84aab32@redhat.com>
 <Y5cKhIY/F4/BwORD@movementarian.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y5cKhIY/F4/BwORD@movementarian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 12/12/22 12:03, John Levon wrote:
> On Mon, Dec 12, 2022 at 10:01:33AM +0100, Cédric Le Goater wrote:
> 
>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>> index 80b03a2..dc19869 100644
>>> --- a/hw/vfio/pci.c
>>> +++ b/hw/vfio/pci.c
>>> @@ -19,6 +19,7 @@
>>>     */
>>>    #include "qemu/osdep.h"
>>> +#include CONFIG_DEVICES
>>>    #include <linux/vfio.h>
>>>    #include <sys/ioctl.h>
>>> @@ -3421,3 +3422,91 @@ static void register_vfio_pci_dev_type(void)
>>>    }
>>>    type_init(register_vfio_pci_dev_type)
>>> +
>>> +
>>> +#ifdef CONFIG_VFIO_USER_PCI
>>
>> Why not introduce a new file hw/vfio/user.c file ? It would be
>> cleaner.
> 
> user.c is in this series, and holds the vfio-user implementation - it's not a
> PCI specific thing. So it would have to be hw/vfio/user_pci.c or something

Or hw/vfio/pci-user.c

