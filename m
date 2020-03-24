Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C321905A0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 07:18:09 +0100 (CET)
Received: from localhost ([::1]:43598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGct6-0001Gd-1n
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 02:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45842)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shannon.zhaosl@gmail.com>) id 1jGcs5-0000lV-1U
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 02:17:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shannon.zhaosl@gmail.com>) id 1jGcs4-0007Yl-4T
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 02:17:04 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:36602)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <shannon.zhaosl@gmail.com>)
 id 1jGcs2-0007VT-0c; Tue, 24 Mar 2020 02:17:02 -0400
Received: by mail-oi1-x242.google.com with SMTP id k18so17484524oib.3;
 Mon, 23 Mar 2020 23:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ntwu0iNk5SxCHAsBwOrQKWEafoKA9mB3OGWLeaqo74s=;
 b=ArxcFgzP4sznUBhNmRg2O6o4lVtFtUn0x/Tz3s6yChWB05s3YDIlNrx1081JchJ+BA
 qmGPzVlJ6YYVYdm11rXSyk4WMMUc8juLKSr2esDvElBzSnCq0YBAif2u8W2nF/G/un/r
 WMk8DGR0QDF604XADy/37yhQ7c9hFIyKlg7lxhw5liis5BILbsbIu+F/rLAtRw1onoU9
 GhzOJwNOZJXq8msaLHfPAyCONMyJ4QTivprAEDtIEEhTEeNVu7s1Omlom8r1kIjQJ2K9
 odIG62vHCzo1VEPzI71ZwH8Qbn1nkzfwLdZoaSfUUF99Leb3Axl4ACUJovuLWL1TTDqF
 Y6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ntwu0iNk5SxCHAsBwOrQKWEafoKA9mB3OGWLeaqo74s=;
 b=ZYBSzoXYO7Gs+3nX68xgiaZQV2GCHrG8iPKdsvTcQfm/Z5R5o12NEZfeAjLL4p3MLF
 HLfYr9UtEoXoUSqotcbgGG3LjGgUl4cRa8Y8jCpR0YAKL5uTOR9gICIPeG0RVuOUT6SP
 7zUcGq6+APipEu/c3Y8+6dU/Pg1EJG6mC3T4N+zrJ42nbqmKoOethU9EBo3q1XpyIo19
 qbrZsJTEKNl2hRj32/Whr+ck7CC0rANYE5Bq73f40DsiOw6lr4SFOgVL75dUgruukrz9
 tTYpGbLcor9wP8XkQdPQuIAdWkIArPyxGbOYL/JGAl5o6uV0oCDoB12jMTnzbFz5VYJ1
 kGiA==
X-Gm-Message-State: ANhLgQ2hmpds4ERJNA+R4GwSIBWEICYQiD3ylzwNgF8f9w/tqh7ZLPx3
 EGX1SoZKqJoPpxUdZI3B3PU=
X-Google-Smtp-Source: ADFU+vseYXZS49aKQ9OW9Wpd4/BsiO/cnQIfMmooRrDJzBuPDknxv5PAP+PWIn/i3C0CTvO3UA2X3w==
X-Received: by 2002:aca:3a83:: with SMTP id h125mr2236038oia.64.1585030620674; 
 Mon, 23 Mar 2020 23:17:00 -0700 (PDT)
Received: from [30.43.122.30] ([47.89.83.57])
 by smtp.gmail.com with ESMTPSA id f3sm2815282oto.42.2020.03.23.23.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 23:16:59 -0700 (PDT)
Subject: Re: [PATCH v3 07/10] hw/arm/virt: Add nvdimm hotplug support
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
 <20200311172014.33052-8-shameerali.kolothum.thodi@huawei.com>
From: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-ID: <079d4ae2-4be1-feef-4729-d94c85431a6f@gmail.com>
Date: Tue, 24 Mar 2020 14:16:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200311172014.33052-8-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, mst@redhat.com,
 david@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/3/12 1:20, Shameer Kolothum wrote:
> diff --git a/docs/specs/acpi_hw_reduced_hotplug.rst b/docs/specs/acpi_hw_reduced_hotplug.rst
> index 911a98255b..e3abe975bf 100644
> --- a/docs/specs/acpi_hw_reduced_hotplug.rst
> +++ b/docs/specs/acpi_hw_reduced_hotplug.rst
> @@ -63,6 +63,7 @@ GED IO interface (4 byte access)
>       bits:
>          0: Memory hotplug event
>          1: System power down event
> +       2: NVDIMM hotplug event
>       2-31: Reserved
should modify "2-31: Reserved"

Thanks,
Shannon

