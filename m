Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED190387572
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:46:29 +0200 (CEST)
Received: from localhost ([::1]:55118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwJ3-0004wy-1D
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw79-00046Z-Tr
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:34:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw78-0003Oe-6f
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621330449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gzdMLcWmMso6rIW21/D/2WbIJQ835mPgVVSG4PbYrTk=;
 b=YQj7NTzGzeov1/LnHMRwLziYOmnTD+HItTYnFH132Imw9GxoOSACn3eaiQX5qrEKY5Jmcn
 g6949dLEG3X2qbUjnRbf0Q30CkA6rIHtL1d6R5RoUmlDl9LFnLWxJrmWUQKRfYbjan4+vB
 qnlKpHjtE6wtAWDsptets/3PRvIvBh8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-WljV9vIpO3iOMNkhoGuUSA-1; Tue, 18 May 2021 05:34:06 -0400
X-MC-Unique: WljV9vIpO3iOMNkhoGuUSA-1
Received: by mail-wr1-f71.google.com with SMTP id
 a5-20020a5d6ca50000b029011035a261adso5287084wra.17
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gzdMLcWmMso6rIW21/D/2WbIJQ835mPgVVSG4PbYrTk=;
 b=i3lCQFPwDVbFLrKLrcVYalvA6JihmXq0jYROSbwXFGKG/olItmGe63wnk3GPjrR+aB
 tyC2rr4HXCEQSbzjPInEzTsv1PqwX8IXOxSlfR6gcrKaUHy+6uHkTreJMErghCgI7b6a
 9FbTSDnPeyfv63b/b8E6VZi7Ifg/idiX2ZCDKSo39Z+sRCy3F7jVGmNS0s3G+Pgy4yk2
 GH+8VWoVhDvK2WdKrjvuVuMgnAUlIWGA5AJn6or7UfiRIgJUilBGobhKCj/ONeBcRQoA
 RQwJ3nQQPkVllVRHKGeKCchKcfvtKXxoiqBoIJn9F1KeK/oURaSykyV1ypbZ6FmNdUhg
 Orgw==
X-Gm-Message-State: AOAM532x9jzt/FIk+n4ctskzWhkA0InU1nOAY3u9f56F8+zW7yAMbMnr
 DQcDfMmyeQUOPKqbcx9lQTpK/tjM5Jgs+QVZ27isONO9TheTqWb+PBrTSD9COGc1JkUZtfjo2Ph
 A3Y4+cuzu/OAv/zw=
X-Received: by 2002:a05:600c:22d9:: with SMTP id
 25mr4460657wmg.10.1621330444932; 
 Tue, 18 May 2021 02:34:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSdeDSJh+/a2HKBKtty7TVcPo06cWYF0N2ehTeJPtaBmS0uDHlcu4U2snt4V38FBDgNswsvg==
X-Received: by 2002:a05:600c:22d9:: with SMTP id
 25mr4460636wmg.10.1621330444762; 
 Tue, 18 May 2021 02:34:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e38sm1891893wmp.21.2021.05.18.02.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:34:04 -0700 (PDT)
Subject: Re: [PATCH v2 24/50] target/i386: Reduce DisasContext popl_esp_hack
 and rip_offset to uint8_t
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-25-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b7cc04b4-59ac-7cf8-ce73-4e1f5b948b9e@redhat.com>
Date: Tue, 18 May 2021 11:34:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-25-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> Both of these fields store the size of a single memory access,
> so the range of values is 0-8.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 1367e53e4e..847502046f 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -106,8 +106,8 @@ typedef struct DisasContext {
>       int repz_opt; /* optimize jumps within repz instructions */
>       int mem_index; /* select memory access functions */
>       uint32_t flags; /* all execution flags */
> -    int popl_esp_hack; /* for correct popl with esp base handling */
> -    int rip_offset; /* only used in x86_64, but left for simplicity */
> +    uint8_t popl_esp_hack; /* for correct popl with esp base handling */
> +    uint8_t rip_offset; /* only used in x86_64, but left for simplicity */
>       int cpuid_features;
>       int cpuid_ext_features;
>       int cpuid_ext2_features;
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


