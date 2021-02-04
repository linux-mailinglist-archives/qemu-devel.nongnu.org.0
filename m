Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB1630F472
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:01:44 +0100 (CET)
Received: from localhost ([::1]:57008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fCZ-0002yg-B0
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:01:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7fAH-0002VZ-DV
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 08:59:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7fAF-0007Y0-Qj
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 08:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612447158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CWo+ryjaex5nr1sh3WKPghdJWBA3F7ZcTx3gNogqPRk=;
 b=MoIHMuqzBmsEBDnPaonbVPRRkPSf5tv4uM6z4si4AsWEPFju/bMVqo57WYz/3jELgzstYb
 R1I4AIFlSIU1rBeNqkQY7dmFqjxmwm5sDgkz71AcUmf0XomrF8YlZ7sexDFy90TYQO/AZ4
 LaFihB3y6YvOWXkIflcDnC/Mv5jWL2U=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-4vAzhG8qNWiCOzBjJpLCYQ-1; Thu, 04 Feb 2021 08:59:16 -0500
X-MC-Unique: 4vAzhG8qNWiCOzBjJpLCYQ-1
Received: by mail-ej1-f69.google.com with SMTP id yh28so2577221ejb.11
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 05:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CWo+ryjaex5nr1sh3WKPghdJWBA3F7ZcTx3gNogqPRk=;
 b=nRD6SoVfECjvQIJLDDSubxtFAPOW/CZMZAyhRwwkxY+SBV5DxK5jNQ4bGY7iEmNbgi
 n5YxOcmRJQrVRf8oaTymZzbx97FGsALG+IKA4XXYlLSzz4hSKpa9nAzAGZu5HxdTxhdw
 h3D7GnE7zlSBvwHt8iBHuaWQHrJQCajxgAiqdVFHkrJAvAislzrHvQh0PLYfHFEpp+Ap
 ba1JFfetgTfHiJFhXzgENI24p9Dl8TPTFvkHkjUYCcHUuTFT76UdRlsYHkvhlwX0PMPw
 s9iTEV2zCAfGEftiXcb5cn540EJf0VLIdMhqVFpmM0synzwBmpEQEIKp/0sOPbzsbYxt
 ilsg==
X-Gm-Message-State: AOAM532OLqOeYu1hiyWg9IZcz1DtfJxVfuFlEcF6b3FuJDQ+MewiBgoH
 aRg16UOjlNcMSbA+JNIVwXRCfjaaq6HrEIitELxW4UP1FHiDiYfkhgCabDxy5UIRSHXBI494Fm4
 PFLcYkQBfFfdzpNM=
X-Received: by 2002:aa7:cdc8:: with SMTP id h8mr8093449edw.244.1612447154819; 
 Thu, 04 Feb 2021 05:59:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9twVRLIIUYH3XXZBPAeB+LfRTsLaGZF+cnBGHUjlHUNWi/H/z4yG8DfppvSYHcFNgmsF3xg==
X-Received: by 2002:aa7:cdc8:: with SMTP id h8mr8093432edw.244.1612447154654; 
 Thu, 04 Feb 2021 05:59:14 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id l1sm2481764eje.12.2021.02.04.05.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 05:59:14 -0800 (PST)
Subject: Re: [PATCH v2] MAINTAINERS: Fix the location of tools manuals
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20210204135425.1380280-1-wainersm@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <516694bd-42fe-7929-811b-545f257c58bf@redhat.com>
Date: Thu, 4 Feb 2021 14:59:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204135425.1380280-1-wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: peter.maydell@linaro.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 2:54 PM, Wainer dos Santos Moschetta wrote:
> The qemu-img.rst, qemu-nbd.rst, virtfs-proxy-helper.rst, qemu-trace-stap.rst,
> and virtiofsd.rst manuals were moved to docs/tools, so this update MAINTAINERS
> accordingly.
> 
> Fixes: a08b4a9fe6c ("docs: Move tools documentation to tools manual")
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
> v1: was "MAINTAINERS: Fix the location of virtiofsd.rst"
> v2: Fixed the location of all files [philmd]
> 
>  MAINTAINERS | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 00626941f1..174425a941 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1829,7 +1829,7 @@ S: Odd Fixes
>  F: hw/9pfs/
>  X: hw/9pfs/xen-9p*
>  F: fsdev/
> -F: docs/interop/virtfs-proxy-helper.rst
> +F: docs/tools/virtfs-proxy-helper.rst

Unrelated, but Paolo once said helpers are not tools.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


