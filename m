Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2243DBE41
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 20:19:45 +0200 (CEST)
Received: from localhost ([::1]:43140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9X6m-00068o-7U
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 14:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9X59-0005SG-FN
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:18:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9X57-0003Yj-Uq
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627669081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BaaOEQsIuJF+DWtOacVN1Wl5+cS57KfONEPvCAGd0gw=;
 b=EuKo3wUqSopitUPc7AkhWpkrXUN2D8OYQPcQkoRVWvZH6b4V0xHKWNWAX1B1jSUmEh5a3N
 8W4R1nFqwDnEotlaDHdl0ooGjKWJxpyvOl9fqppLf9B4NFyqJSxxbxUwUzepECCj27oZg2
 aIZtdXgIjInPbRdmcFyHRT00HaWQyPQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-tYq9T_C2NOKwVTWEjzcI7g-1; Fri, 30 Jul 2021 14:17:59 -0400
X-MC-Unique: tYq9T_C2NOKwVTWEjzcI7g-1
Received: by mail-wr1-f72.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so3498352wrl.0
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 11:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BaaOEQsIuJF+DWtOacVN1Wl5+cS57KfONEPvCAGd0gw=;
 b=n0Q7DpzhUnycIyb4OE7kYBUknrIJn68WkQAbF8xRVgZXhE57G9AWXpXzvwAVo2nIqM
 PLNb47oSuOjHOgrrEqwh7bkCtkgc25SLYjl2PG6FcXtf1pfxBkLuziOWd2hDs8z8MfYW
 zQaNpCYvIqdZv2ThpnV9hVxTKeSmFeq5lNqdsYTbuH86pwsGAQy+sWLeB85zMjVkfGjv
 bYikALzLf+3csskJvk/etsrO9O42xexntct7DhOHl/mv3P5re3egOPLunjdXd88wsAvu
 l+8dCQTnutEWvqjtqetXA0/jyD4AKxQsPb1TS+LPj1ZWh15ux6X87hqxENi7H5iILEPi
 Jb+w==
X-Gm-Message-State: AOAM533cRkDeyO2QL/OuVtoGvy8AsuaHmt3yHtUjZhvTc7MeODPQ0Lua
 7eQqqOMvguIl4RkFWnnbOhMkxRPsmIurS9hm1hq1KlmH7+f5wVUkxCzpZoIQIFTymKU3oH69xBg
 1t7rr4T2oThNVC38=
X-Received: by 2002:adf:dd89:: with SMTP id x9mr4397904wrl.401.1627669078088; 
 Fri, 30 Jul 2021 11:17:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVJ38/RVWFLpNW2W6sd+A/1aBjhpcK494NvQWoNZ7TRRFwBCXC6ncFHhShnJUMbmN2/+RMbA==
X-Received: by 2002:adf:dd89:: with SMTP id x9mr4397884wrl.401.1627669077917; 
 Fri, 30 Jul 2021 11:17:57 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id l24sm2490919wmi.30.2021.07.30.11.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 11:17:57 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Added myself as a reviewer for acpi/smbios
 subsystem
To: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org
References: <20210730175514.40147-1-ani@anisinha.ca>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f304715a-aa30-8aff-c5ac-310c751a352a@redhat.com>
Date: Fri, 30 Jul 2021 20:17:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730175514.40147-1-ani@anisinha.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 mst@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 7:55 PM, Ani Sinha wrote:
> I have developed an interest in this space and hopefully can lend some
> helping hand to Igor and Michael in reviewing simpler patches.

Help is welcome IMHO, so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4256ad1adb..1c90ea4e6b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1739,6 +1739,7 @@ F: docs/specs/*pci*
>  ACPI/SMBIOS
>  M: Michael S. Tsirkin <mst@redhat.com>
>  M: Igor Mammedov <imammedo@redhat.com>
> +R: Ani Sinha <ani@anisinha.ca>
>  S: Supported
>  F: include/hw/acpi/*
>  F: include/hw/firmware/smbios.h
> 


