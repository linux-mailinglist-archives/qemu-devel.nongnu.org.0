Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D486FF20B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 15:02:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px5um-0003vF-Ly; Thu, 11 May 2023 09:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1px5uc-0003t6-Ee
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:00:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1px5ua-0005mN-Jb
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:00:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683810046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PGUQM5AA4/dgABJHgnIm/DiKCjtSflFk9udf1OU6MgA=;
 b=DVd96/+MKkbUQ+NM+RHRVNLqWiY2/3CRlqAlOP0OjpvcMv2brqZbkmLuv4MrNebmdZmotG
 +KprdjJTn8AYu6FU38gGzgPyBx7vwE/bxM5hquu5glIP/hj2J5oAcxYNKUhRVOPJ5NU5pV
 H7E1uR3vhJTJdpuGlLLHMf9WcnOwrvw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-80cun280Mte4g-o5Yk-gaA-1; Thu, 11 May 2023 09:00:44 -0400
X-MC-Unique: 80cun280Mte4g-o5Yk-gaA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-306362a1607so5218150f8f.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 06:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683810041; x=1686402041;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PGUQM5AA4/dgABJHgnIm/DiKCjtSflFk9udf1OU6MgA=;
 b=TImFwkqADz7hvw7jZanroiPoNsqqqXuZYytFCHLdErrL7wcKXj0x2fVj/jALRXbDzf
 oIWEHa1e0WcZ6/T7JQvQR96FcvSuxP16sovq0bZzFpDo5Fiok9oCAgwyoWg7vcR+qP/Z
 Psj8OkiDJdvwnGbUr9hEQbjLyCfUpug9qldpYrf32/FXc20F5kLME/QLNC71wLozUpEk
 op6HPgeTcp09nZxuP0Lms3xVJ8WMSo8dvDz++U5654+fLKqDedqS5W0eVtsQcbzG+nmt
 LqSSwL6GKeWeH+o+Z+IGJJqU9AHZVnnVYwBK/OCPswmEizIJrguWrzv2MZbXHzPQBZWG
 B9KA==
X-Gm-Message-State: AC+VfDzWUYrgoPr19k2ZJjLa1M6devA9uxNflLapggSkaqXkfsqgELD3
 FmaQ/qyXr4kGDD+fDgjeE1KuBUWfYsBCl6bYfbi2XSL3JIc0wVWAQ/GJBFUP7aiH3EHma/GW+V3
 rKCT0bOzVp9fldG0=
X-Received: by 2002:adf:e351:0:b0:306:2eab:fb8c with SMTP id
 n17-20020adfe351000000b003062eabfb8cmr14807378wrj.42.1683810040847; 
 Thu, 11 May 2023 06:00:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7MEDoqQU+omsDnpK0p28KCtlP0WXyvYKW8nf56PXekDCOYt91V3/ZrdU1TODQLPuLMKFzRGw==
X-Received: by 2002:adf:e351:0:b0:306:2eab:fb8c with SMTP id
 n17-20020adfe351000000b003062eabfb8cmr14807326wrj.42.1683810039794; 
 Thu, 11 May 2023 06:00:39 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-67.web.vodafone.de.
 [109.43.177.67]) by smtp.gmail.com with ESMTPSA id
 z13-20020adfd0cd000000b0030631a599a0sm20306202wrh.24.2023.05.11.06.00.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 06:00:39 -0700 (PDT)
Message-ID: <99eeb315-c4ba-3615-d630-e79c8afba7cc@redhat.com>
Date: Thu, 11 May 2023 15:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1] tests/avocado: Add LoongArch machine start test
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 philmd@linaro.org, pbonzini@redhat.com, alex.bennee@linaro.org,
 maobibo@loongson.cn, yangxiaojuan@loongson.cn, lvivier@redhat.com,
 atar4qemu@gmail.com, edgar.iglesias@gmail.com, wainersm@redhat.com,
 quic_llindhol@quicinc.com, kraxel@redhat.com, deller@gmx.de,
 stefanha@redhat.com, crosa@redhat.com, eduardo@habkost.net,
 quintela@redhat.com, jsnow@redhat.com, ysato@users.sourceforge.jp,
 clg@kaod.org, iii@linux.ibm.com, pavel.dovgaluk@ispras.ru, andrew@aj.id.au,
 kbastian@mail.uni-paderborn.de, bleal@redhat.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, mark.cave-ayland@ilande.co.uk,
 rad@semihalf.com, aurelien@aurel32.net, david@redhat.com, armbru@redhat.com,
 joel@jms.id.au, berrange@redhat.com
References: <20230511122136.1601475-1-gaosong@loongson.cn>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230511122136.1601475-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.124, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 11/05/2023 14.21, Song Gao wrote:
> Add a new test in tests/avocado to check LoongArch virt machine start.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   MAINTAINERS                              |  1 +
>   tests/avocado/machine_loongarch_start.py | 68 ++++++++++++++++++++++++
>   2 files changed, 69 insertions(+)
>   create mode 100644 tests/avocado/machine_loongarch_start.py
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f757369373..d3b11ac056 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -245,6 +245,7 @@ M: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>   S: Maintained
>   F: target/loongarch/
>   F: tests/tcg/loongarch64/
> +F: tests/avocado/machine_loongarch_start.py

I'd maybe just name it machine_loongarch.py, without the "start", in case 
you add some more tests later.

Anyway, thanks for tackling this!

Reviewed-by: Thomas Huth <thuth@redhat.com>


