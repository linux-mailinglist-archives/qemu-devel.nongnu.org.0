Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F004E253A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 12:29:31 +0100 (CET)
Received: from localhost ([::1]:52508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWGE6-0001hf-4t
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 07:29:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWGCy-0000hC-Cq
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 07:28:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWGCw-0007DA-Td
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 07:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647862098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P5amlBZW3X+yNMnJ/NkMmxe295usa1mtz3obSQUrlzc=;
 b=jSEJTK4uNAEXVAY+NirqN+DHgJs5bFn0m/LRsDoYqgsKp1AjYze3Fd6jj0WhSMTtYUauH9
 OQZxa344rlVJ/05jCjmGItu2AL5YL1tqJfRg13aoTXM9MxM4c/LrJl9a33ahlMO/9bMfp/
 SPU7TDIt6UDf566OyYIza5eSqmZMAnY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-ujb0dEIBOa23aLiYOqz-7A-1; Mon, 21 Mar 2022 07:28:17 -0400
X-MC-Unique: ujb0dEIBOa23aLiYOqz-7A-1
Received: by mail-wm1-f71.google.com with SMTP id
 m123-20020a1c2681000000b0038c9e1197f6so1417526wmm.4
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 04:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=P5amlBZW3X+yNMnJ/NkMmxe295usa1mtz3obSQUrlzc=;
 b=G1QYd7RVYBFTawe9L3DP8khmKZroRCmnxOolWQOkZGKN4+zQVFc31f2FZfukxybWEt
 xEScwWcf/FA3vO6gupzW8SDNukyVif2zNYAEpNFlPck44Xhpfi3+k8ZB0k4sUFdCqQoG
 6b9EFEs4vlKUIZD4zM87ikSR4TtT7Agm8qDPoZ4E9xvku0z+QVLyVvfJqP1q0Lr30b38
 Toha/isiM/Avt7eDbjAFHxKz836po7YkNZzO78npMTSd7lJqiScjr9/hvEllKD57g6Il
 tZt8VHNkcGjL+pTns9tlUj2/PEZLKTaUi9QzWlLN3/au8iIR8TsN1PjJTngw/dfhu6Px
 v/Vg==
X-Gm-Message-State: AOAM532+IfeflJGE86puN84fvNoRFwtj0wyOsrgHHBbAlOcpICKdWUgr
 5d7GKLvzNCz8vfWXcrDEA4DXpXBh/1J5wvErN6MVJKhE5J5HzXg/aARrQMBOuzCZ6L1P2NQvMNL
 Q07ir8ewtON7927c=
X-Received: by 2002:adf:fbcf:0:b0:204:61b:2c4b with SMTP id
 d15-20020adffbcf000000b00204061b2c4bmr6816314wrs.125.1647862095706; 
 Mon, 21 Mar 2022 04:28:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYllUV2rg61FVCfNKQX8LwDdyQBIy042ixCkFE1hIRJgjyeLlfB9m+xXkj9sPkXImgBq6ehg==
X-Received: by 2002:adf:fbcf:0:b0:204:61b:2c4b with SMTP id
 d15-20020adffbcf000000b00204061b2c4bmr6816299wrs.125.1647862095440; 
 Mon, 21 Mar 2022 04:28:15 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:4900:849b:f76e:5e1f:ff95?
 (p200300cbc7044900849bf76e5e1fff95.dip0.t-ipconnect.de.
 [2003:cb:c704:4900:849b:f76e:5e1f:ff95])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a056000188100b002041a652dfdsm1557633wri.25.2022.03.21.04.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 04:28:15 -0700 (PDT)
Message-ID: <279b6c0b-fa2c-79fb-5171-c00997d86efa@redhat.com>
Date: Mon, 21 Mar 2022 12:28:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 09/11] target/s390x: add S390_FEAT_VECTOR_ENH2 to cpu
 max
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220308015358.188499-1-richard.henderson@linaro.org>
 <20220308015358.188499-10-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220308015358.188499-10-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.03.22 02:53, Richard Henderson wrote:
> From: David Miller <dmiller423@gmail.com>

QEMU is in soft freeze now. We'll have to perform that change for the
new 7.1 machine only, so we have to fixup the qemu model for the 7.0
machine.

Subject should be "... to qemu CPU model"

> 
> Signed-off-by: David Miller <dmiller423@gmail.com>
> Message-Id: <20220307020327.3003-7-dmiller423@gmail.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/gen-features.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index 22846121c4..499a3b10a8 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -740,7 +740,9 @@ static uint16_t qemu_V6_2[] = {
>  
>  static uint16_t qemu_LATEST[] = {
>      S390_FEAT_MISC_INSTRUCTION_EXT3,
> +    S390_FEAT_VECTOR_ENH2,
>  };
> +
>  /* add all new definitions before this point */
>  static uint16_t qemu_MAX[] = {
>      /* generates a dependency warning, leave it out for now */


-- 
Thanks,

David / dhildenb


