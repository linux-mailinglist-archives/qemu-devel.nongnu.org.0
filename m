Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FAE3E40AB
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 09:08:08 +0200 (CEST)
Received: from localhost ([::1]:50338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCzOI-0001Ye-HT
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 03:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mCzNA-0000he-Eb
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 03:06:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mCzN7-0003mX-22
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 03:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628492810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=occnYyA0lQUpxlAKDPFhxopijqWpmKcTd4+HUGNBhfQ=;
 b=S1pkHLDbarjrTHLUB4gfD3Wg28jm+PghyY4f+6DuJAX0BPV33B2FgWp3P3U9Qsk6fEhC20
 gzu+XD0/+vym8PQDmnCTGn1TBIpYLzpShYX56HsuSLgnnfSZnWQqDFceHF912ZlI5S2unF
 Y13rzSTwWt4UI66FwFXRCtecK7gNkMA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-c5RZQv40P1ejEJiw5HkDqw-1; Mon, 09 Aug 2021 03:06:49 -0400
X-MC-Unique: c5RZQv40P1ejEJiw5HkDqw-1
Received: by mail-wm1-f72.google.com with SMTP id
 k13-20020a05600c1c8db029025018ac4f7dso4292497wms.2
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 00:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=occnYyA0lQUpxlAKDPFhxopijqWpmKcTd4+HUGNBhfQ=;
 b=QD/ghXSuN++MwMZDY1JDvjW0qhnfz2Of3joRKtj3DY7IfVKwQIAjSO6Tqrhbawi/Zr
 cEkAr+95RRgkxiDRn39yZWt0flqhPkFlGn00QNCt0HQoxfNZ2z7q0bLEYX2VquD+x67i
 r+QkUbY1Dd7IHFwjQTTE2qb1piWDst9pcavS9bmDxYVSiwlwT1LBWKHMG+rDNP8YzQod
 qpp8rXcSIBysLj3OLn3YKWpL4iuOKEvj1axfte6qeWVtl53Wcz3I8YWz+Gt7wppCNmZi
 poYgr9Q1red8wKERlCswvsssI5P0TiNCw7jbLs96b8DMU0rgh8LKb9qd4MWLfaHBAnYL
 rmqg==
X-Gm-Message-State: AOAM531LDltbxttkq5w+bOQ5uCUx8XFQM/WnCELq2ErhMTpkeozSgNie
 62Utzp1/dlHi27l2U6Msr0FwBak0oWSBmWRn7Wi6MqOcbDSfGFgLsaT1YKnCKfysOFu28aC3rQM
 gqSg4M6WsQY/PoxyrrBmMCcyV2mVfNEWTKStiSFLsWs3RwkGEEFYixRKnibu78Y0c
X-Received: by 2002:a05:6000:1106:: with SMTP id
 z6mr23725672wrw.296.1628492808233; 
 Mon, 09 Aug 2021 00:06:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTj/5HvVbtPuySuKTLnFfSuSveONKwgnkPIQOgzzPX+zDgjq5EH+6JCRdCbTsd7MxfLEYMOg==
X-Received: by 2002:a05:6000:1106:: with SMTP id
 z6mr23725642wrw.296.1628492807984; 
 Mon, 09 Aug 2021 00:06:47 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id i10sm20299580wmq.21.2021.08.09.00.06.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 00:06:47 -0700 (PDT)
Subject: Re: [PATCH] ppc/pnv: update skiboot to commit 820d43c0a775.
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210806180040.156999-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3935af0a-1fee-9a56-21ea-d4c94b886bd3@redhat.com>
Date: Mon, 9 Aug 2021 09:06:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806180040.156999-1-clg@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cédric,

On 8/6/21 8:00 PM, Cédric Le Goater wrote:
> It includes support for the POWER10 processor and the QEMU platform.

1/ Can you include the output of 'git shortlog v6.4..820d43c0' here?

> 
> Built from submodule.

2/ Could we have a CI job building this, during 6.2 cycle?
   (See .gitlab-ci.d/edk2.yml and .gitlab-ci.d/opensbi.yml)

> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  pc-bios/skiboot.lid | Bin 1667280 -> 2528128 bytes
>  roms/skiboot        |   2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/pc-bios/skiboot.lid b/pc-bios/skiboot.lid
> index 504b95e8b6611aff3a934ff10f789934680591f9..8a3c278512a428a034ed5b1ddbed017ae8c0a9d0 100644
> GIT binary patch
> literal 2528128

Consider using 'git-format-patch --no-binary' and a reference
to your repository to fetch a such big binary patch.

> diff --git a/roms/skiboot b/roms/skiboot
> index 3a6fdede6ce1..820d43c0a775 160000
> --- a/roms/skiboot
> +++ b/roms/skiboot
> @@ -1 +1 @@
> -Subproject commit 3a6fdede6ce117facec0108afe716cf5d0472c3f
> +Subproject commit 820d43c0a7751e75a8830561f35535dfffd522bd

Thanks,

Phil.


