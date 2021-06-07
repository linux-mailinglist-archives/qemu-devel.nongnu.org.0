Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7204F39D64E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 09:48:28 +0200 (CEST)
Received: from localhost ([::1]:54742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq9zn-0004OM-2w
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 03:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lq9yc-0003eN-Ep
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 03:47:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lq9yZ-0006SF-TS
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 03:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623052030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zkQwu+96MwUJ8otmHUe8xFcTEBSbRMvVKMmDkvqhV3k=;
 b=Z8/UR3QMbjGgRziPvRT6yYMd7unLzsEVROvAGOEYCQVncB/11rouMHSXoh4CuZP1iXmU7T
 /fmNTuNmWRAANJzpkCHAWEMZTvpbzBk1Tei1QLHxQFMzlBohBOPkEUsoG7rC2O2JgRq8dA
 yRHcmWbSZoKVf5v+fAqIxRXsomDI4L4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-00jILtzzN_KsccFoUgiTnQ-1; Mon, 07 Jun 2021 03:47:07 -0400
X-MC-Unique: 00jILtzzN_KsccFoUgiTnQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 18-20020a05600c0252b029019a0ce35d36so6566742wmj.4
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 00:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zkQwu+96MwUJ8otmHUe8xFcTEBSbRMvVKMmDkvqhV3k=;
 b=TR+31M+hSEOld/FnqmwEovgloDEGxOjLomO/Zflze+DHQr/vcDyuBAAgplpc5A1Uom
 vY2cCEjw9AwLmiHZsda25cQhgiK/G4ECpm76+KvYAluWyRXU0Gbwis+peVgnRrFef7kO
 1+Z6AnIjhg+OTYUG5MMptHoVfUYAg7qXjikvc8rZ4DdMiUTJRkD5yBcYTZ9hFvxcTbgZ
 AtUCmxqBxiboTNwFS0a0OP9k4x1xfJzmHHpJ8fTcluC2FgFxJp9i3y6SZOGHV47cDqyT
 fY8iYudP6Scrn/iSb+PiVA+HGCl5HS5ZZkArDqy2VBRo0OPoMpzfTyUDqMyEEgFBabSz
 gcCQ==
X-Gm-Message-State: AOAM532nIjL/bR4ABE3lIoPdyvgglY/Hfhaj5CbyLAAIVg3rt7QdWtNN
 lYGCcEbG5xpftfJz+C31uKig9dd1yYv4M+LZ3fmBM1GNfw7NfTQLemDlPuQzyhj3PZ8kfVHQz+9
 pjoteZRvn+k6WXhw=
X-Received: by 2002:a05:6000:1203:: with SMTP id
 e3mr9898570wrx.107.1623052025787; 
 Mon, 07 Jun 2021 00:47:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDPt+y99z3YCQzO/LhMpWU76GL06PfC1pfJHOuoaFtJbSVyVyAQa69ivfwMakiSZKL3DP8hA==
X-Received: by 2002:a05:6000:1203:: with SMTP id
 e3mr9898544wrx.107.1623052025551; 
 Mon, 07 Jun 2021 00:47:05 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6188.dip0.t-ipconnect.de. [91.12.97.136])
 by smtp.gmail.com with ESMTPSA id
 k36sm4564573wms.30.2021.06.07.00.47.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 00:47:05 -0700 (PDT)
Subject: Re: [PATCH v2 25/26] s390x/tcg: We support Vector enhancements
 facility
To: qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-26-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <013ad9b5-8e6c-ac12-c982-d68756b7f8a9@redhat.com>
Date: Mon, 7 Jun 2021 09:47:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-26-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.05.21 16:27, David Hildenbrand wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/gen-features.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index a6ec918e90..219b1f9420 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -720,6 +720,7 @@ static uint16_t qemu_MAX[] = {
>       S390_FEAT_INSTRUCTION_EXEC_PROT,
>       S390_FEAT_MISC_INSTRUCTION_EXT2,
>       S390_FEAT_MSA_EXT_8,
> +    S390_FEAT_VECTOR_ENH,
>   };
>   
>   /****** END FEATURE DEFS ******/
> 

I'll squash the following changes:

diff --git a/include/elf.h b/include/elf.h
index 033bcc9576..0049d5a318 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -605,6 +605,7 @@ typedef struct {
  #define HWCAP_S390_HIGH_GPRS    512
  #define HWCAP_S390_TE           1024
  #define HWCAP_S390_VXRS         2048
+#define HWCAP_S390_VXRS_EXT     8192

  /* M68K specific definitions. */
  /* We use the top 24 bits to encode information about the
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 1ab97e38e0..23ccaf6df2 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1374,6 +1374,7 @@ static uint32_t get_elf_hwcap(void)
          hwcap |= HWCAP_S390_ETF3EH;
      }
      GET_FEATURE(S390_FEAT_VECTOR, HWCAP_S390_VXRS);
+    GET_FEATURE(S390_FEAT_VECTOR_ENH, HWCAP_S390_VXRS_EXT);

      return hwcap;
  }


-- 
Thanks,

David / dhildenb


