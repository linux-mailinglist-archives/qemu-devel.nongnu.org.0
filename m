Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073ED37A468
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:14:53 +0200 (CEST)
Received: from localhost ([::1]:46880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPPg-00008l-3P
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgPNq-0006Rv-LB
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:12:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgPNm-0002Eq-6g
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620727968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UlbLHu2AF57mAPirQFQ+oAcj+uf2qcN4MmAtlrFtp3g=;
 b=HAOj2WdZDAXMs6vqor9Kd8HIZCADMZyPh2m6SOfsoVuAXeyMtfH1Mz1wtuIpdzdWrMXc22
 yAsc/3TLGtmMkQZRJuNlagr/YF43bFQmtWMwmlEnh/BHEqYbGAUDcRAcjjnCjYmqnFArdz
 TfYzoXZj983MicL254FXKghYl7UHrDQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-kG5NePBiPyKfN-67L11EwQ-1; Tue, 11 May 2021 06:12:47 -0400
X-MC-Unique: kG5NePBiPyKfN-67L11EwQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j128-20020a1c55860000b02901384b712094so858618wmb.2
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 03:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UlbLHu2AF57mAPirQFQ+oAcj+uf2qcN4MmAtlrFtp3g=;
 b=NpfuNiWaiU95e7yBB8Y6RV4uLfDWDSkZUU5+zAF1hSQ4kIvCmReQ5oGlqi/9zBbL69
 A3bpgsc23+LiuiycPZrySv44Zk4hEPqhqkzThZOcsrvWy9/PpNVmA3LmhXi/UyDSVqsO
 sdJykh/6gVCqZXSbSU+6nO9KJhQkUUafWKbOVQKdgWrKgeLnlQIbr/Xl2E7gRp7PkENx
 nTau22aepCr+tX9XUiYNIr0oMjNE4oO9cUJJwA9WIaakID2MVFA3IyXLr6kKBtZPj883
 1aQVnD94M4G+b1mJsG/5BeoMA2NucnO/xs4uDUtmPvutCuDgGEPXSOgGX/A3odsiXWog
 5G4g==
X-Gm-Message-State: AOAM531eKG6dD1XxxPDfhh0gxcqQr/UKAhZ9YeLDcpGJ363D4l4fB3na
 BLr5prwNNdImmWz14GN2HriDVJ4cmvNFSPdrvEYiV2QyKq4R5EYq2v8UdiNtMfegB8EpVC+ptk2
 e6iJ+MAJh9ZkqqOo=
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr32098307wma.17.1620727965911; 
 Tue, 11 May 2021 03:12:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIjMuCZaV1N4u52IlzeHzHCJcYyxvAfV4aeIa3gfr9WV0Dd5ajA7a4eh3yHEFGrF1FNETfEg==
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr32098294wma.17.1620727965740; 
 Tue, 11 May 2021 03:12:45 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6329.dip0.t-ipconnect.de. [91.12.99.41])
 by smtp.gmail.com with ESMTPSA id
 b129sm12832137wmh.3.2021.05.11.03.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 03:12:45 -0700 (PDT)
Subject: Re: [PATCH 12/72] softfloat: fix return_nan vs default_nan_mode
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-13-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <97458577-b2f5-fb3d-0e95-47683cd32a75@redhat.com>
Date: Tue, 11 May 2021 12:12:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-13-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.05.21 03:47, Richard Henderson wrote:
> Do not call parts_silence_nan when default_nan_mode is in
> effect.  This will avoid an assert in a later patch.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 19 +++++++------------
>   1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index b694e38522..6589f00b23 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -892,21 +892,16 @@ static float64 float64_round_pack_canonical(FloatParts p, float_status *s)
>   
>   static FloatParts return_nan(FloatParts a, float_status *s)
>   {
> -    switch (a.cls) {
> -    case float_class_snan:
> +    g_assert(is_nan(a.cls));
> +    if (is_snan(a.cls)) {
>           float_raise(float_flag_invalid, s);
> -        a = parts_silence_nan(a, s);
> -        /* fall through */
> -    case float_class_qnan:
> -        if (s->default_nan_mode) {
> -            return parts_default_nan(s);
> +        if (!s->default_nan_mode) {
> +            return parts_silence_nan(a, s);
>           }
> -        break;
> -
> -    default:
> -        g_assert_not_reached();
> +    } else if (!s->default_nan_mode) {
> +        return a;
>       }
> -    return a;
> +    return parts_default_nan(s);
>   }
>   
>   static FloatParts pick_nan(FloatParts a, FloatParts b, float_status *s)
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


