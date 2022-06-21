Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C06D552CFB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 10:29:03 +0200 (CEST)
Received: from localhost ([::1]:45236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ZFt-0002UY-UM
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 04:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o3ZE1-0001Zd-0f
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 04:27:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o3ZDw-0004Nc-O7
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 04:27:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655800019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T4CAXybHbUiszyhK0/zt6gDnPP7cy49tTSf1preu+tI=;
 b=GE6Wv8TUXsCL/+z4jpXmhFyIXiV8c/wu/C7qxcOHyUHDvscgJHKYP/G1XL5mzhitL9rgwG
 gdysl4lzz5ITVIuCURcgzUI3eYF5Q78XYz4kPQAe2Y9pXClGmDCOxNHNTQZvVtXe7G0LTp
 ulzjod0Ng+ZcBJNNYu4UVNROIF3Xv30=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-BXAQZNoeMyGWmAhGsf_HMQ-1; Tue, 21 Jun 2022 04:26:57 -0400
X-MC-Unique: BXAQZNoeMyGWmAhGsf_HMQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 o23-20020a05600c511700b0039743cd8093so6059474wms.6
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 01:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T4CAXybHbUiszyhK0/zt6gDnPP7cy49tTSf1preu+tI=;
 b=n9w6BLWvO2oaRR23IEWluw7VPHZ/Oa67JjGzpnrM++PuKjO8S6v87WGa1jIqJtN1NS
 s6ab56XGbwxzrTk2mgWqPF2F0fg87haO/jBwePSgvgUWUAfskK4epVHcr3U3aXmDVHeZ
 3OPM4WjBJZSq0ABlr7TMVZ5PAmkCFXu/cRIOPkTr3kQyLjx0pKWuU0LFhHr90YD72huM
 OaKDWzDfphyD/Rguof7H6ka1AS1WqMmwZWVWjtxTXyNAzjQbl1CkpFXRfppJvJk8M6SH
 AUnaCSeTWiNJqa3laqpj23lfCyHN+X62bQDgtsWxEs7e8nkmaDQztI1GhgDrabm4LYE7
 222A==
X-Gm-Message-State: AJIora/sDrSuHovmNz80AvgjOA1clgC1b2toOElEGoVBC2CIob30vcQW
 jMuhZFG1pxVOmLFoC68n//nnQCoqUIg+91B8/lSv409WBIpSKbtRIiuqDst3o9njEZJN05Tdiam
 GK3ozFyfuq5i99H4=
X-Received: by 2002:a1c:4604:0:b0:39c:4769:3bb7 with SMTP id
 t4-20020a1c4604000000b0039c47693bb7mr28890992wma.115.1655800016222; 
 Tue, 21 Jun 2022 01:26:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sOFHP1wtZXnXtA05ehcX8LpKKUkwczY/Z/YT6v7wPsz//QodWFcPJRVYO4jeg4yi2qeW+zqQ==
X-Received: by 2002:a1c:4604:0:b0:39c:4769:3bb7 with SMTP id
 t4-20020a1c4604000000b0039c47693bb7mr28890972wma.115.1655800015974; 
 Tue, 21 Jun 2022 01:26:55 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-127.web.vodafone.de.
 [109.43.177.127]) by smtp.gmail.com with ESMTPSA id
 z6-20020a5d4d06000000b0021a3dd1c5d5sm12970891wrt.96.2022.06.21.01.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 01:26:55 -0700 (PDT)
Message-ID: <ea8d25a8-7026-5506-9a4b-b4b9cf4fed96@redhat.com>
Date: Tue, 21 Jun 2022 10:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/6] configure, pc-bios/s390-ccw: pass cross CFLAGS
 correctly
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220621075147.36297-1-pbonzini@redhat.com>
 <20220621075147.36297-4-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220621075147.36297-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/06/2022 09.51, Paolo Bonzini wrote:
> QEMU_CFLAGS is not available in pc-bios/s390-ccw/netboot.mak, but the Makefile
> needs to access the flags passed to the configure script for the s390x
> cross compiler.  Fix everything and rename QEMU_CFLAGS to EXTRA_CFLAGS for
> consistency with tests/tcg.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure                    |  1 +
>   pc-bios/s390-ccw/Makefile    | 20 ++++++++++----------
>   pc-bios/s390-ccw/netboot.mak |  6 +++---
>   3 files changed, 14 insertions(+), 13 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


