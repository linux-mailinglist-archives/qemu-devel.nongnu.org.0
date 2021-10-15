Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452C242EF00
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 12:43:36 +0200 (CEST)
Received: from localhost ([::1]:42242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbKgZ-00030R-CP
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 06:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mbKeq-00014D-RU
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:41:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mbKeo-0002pF-Rf
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:41:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634294506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3lPCuvU4pcaAo4O2/BpqZT2ZDw5Uh62bK5g8CAqQdI=;
 b=HqM9WNhXY19Tt1cr4kUnO0hBnhhAi40kOtjd313t78Btu6+FhbsgPUEck3ZKuVUzhFlgyr
 nV4f0dtRIU3rDpoLSW45h98Kq3Rtz+3D4g9EWJTaGeA25VSutqGk6lcnl/DzkstRQgp8rl
 6BVMK1dQIaaR6ArcIkebHL9Vv6ahy5A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-X8dYz57mM_CjUKDE43Fi9A-1; Fri, 15 Oct 2021 06:41:39 -0400
X-MC-Unique: X8dYz57mM_CjUKDE43Fi9A-1
Received: by mail-ed1-f69.google.com with SMTP id
 r11-20020aa7cfcb000000b003d4fbd652b9so7835206edy.14
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 03:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b3lPCuvU4pcaAo4O2/BpqZT2ZDw5Uh62bK5g8CAqQdI=;
 b=dHSbk8EEo+ti5qak55daVyrqn8npU2HAZ2EgI12itplNuyeO2A/ebVWJxCBjhw3LFd
 f7F1NQIxpGgg3lpjglhOiF95x/waTVJVaBedJGNs0h1cfFPGvLutAsEey0GTc1ns01jT
 CLm7J36EWZeVpa1f7JuKLbbZlOavJTsek8k6wStQcX34ns7q+z15qchd4my8U2B2M5Oe
 k96mrx2URf8hrHwrtyeF9iY45grTRQLw6IEe8HgdWMAMzzNu4wQcaO5RNQj82PvkC7PL
 J14iwqDYl/84ivHNVPtvDCC5cLqd6gkG38W+7PcIPk1OQd3pVBoRkvr2hdlUyEUI8ohj
 4R/Q==
X-Gm-Message-State: AOAM530BN1D5YK03nucrtw5GqrHURLY8apchFap3ynCh83DFEObPsWxq
 LV3dkIa79Ga2iZLuBWU2i62/m131N9sf8/piqMkBDQHJd/sUvPLHnsTE+ZFtomxAJTGUUBBkQ8T
 av31QOUVSxot9F9c=
X-Received: by 2002:a17:907:d8c:: with SMTP id
 go12mr6088884ejc.472.1634294498438; 
 Fri, 15 Oct 2021 03:41:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiuJiHGstG5gT7/Ein8nb/tWqtdC/iiPe7JUR5/cC0DFLn4Zfu7+rv0ZgNv9SGrlHsoCLcAA==
X-Received: by 2002:a17:907:d8c:: with SMTP id
 go12mr6088868ejc.472.1634294498273; 
 Fri, 15 Oct 2021 03:41:38 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z8sm3860626ejd.94.2021.10.15.03.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 03:41:37 -0700 (PDT)
Message-ID: <c1f1a655-5cb4-9df5-0f60-e0e8848c31dd@redhat.com>
Date: Fri, 15 Oct 2021 12:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] MAINTAINERS: update location of microvm docs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211012151447.4147923-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211012151447.4147923-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 17:14, Alex Bennée wrote:
> Fixes: e8eee8d3d9 ("docs: Move microvm.rst into the system manual")
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 50435b8d2f..aa8188f87a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1609,7 +1609,7 @@ microvm
>   M: Sergio Lopez <slp@redhat.com>
>   M: Paolo Bonzini <pbonzini@redhat.com>
>   S: Maintained
> -F: docs/microvm.rst
> +F: docs/system/i386/microvm.rst
>   F: hw/i386/microvm.c
>   F: include/hw/i386/microvm.h
>   F: pc-bios/bios-microvm.bin
> 

Queued, thanks.

Paolo


