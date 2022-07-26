Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F14D581B46
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:43:54 +0200 (CEST)
Received: from localhost ([::1]:49264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGRPF-00010J-78
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oGQjV-00073s-Oa
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 16:00:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oGQjS-0007na-Qh
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 16:00:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658865638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9T3rrj1zmlSKPObmZQWQLjys5eCM0SaeazF7TlkOX8=;
 b=USm9NCo/3hZocugr1fCIyxhhL2tVf3pTb+BQKAtvJCtYI9dg7H2LLfLPvYHXkzC7fEtvts
 XPo3+TnXeBOfRqkND2ueMtW/uRPUIGUIJlqWjpfRvAfnxx/v0cDfAF/CsFpWnW0RZn6TTx
 +4Q6scJU7bwdMiL3kAjtdvCQKtNLlO4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-rLm7tHO-OZ2QtJ1CdHaZvw-1; Tue, 26 Jul 2022 16:00:37 -0400
X-MC-Unique: rLm7tHO-OZ2QtJ1CdHaZvw-1
Received: by mail-wr1-f72.google.com with SMTP id
 o8-20020adfa108000000b0021e903fb612so1068448wro.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 13:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=O9T3rrj1zmlSKPObmZQWQLjys5eCM0SaeazF7TlkOX8=;
 b=eCzYQNlYRFmA5AMuaAoqV/LR9AjLNWhXXOFeqCl3dwXni27qBOLqCT6qSwLgm4vtp+
 iMLNPqu1cgENOBuKmbcYbWN7V+Twyhe5CPyHIfY1kEa7MnVDfpIDljDTHykoS2NQbtxH
 22bjwolTAYyfx1jaW9HtkjmIcpOpPiSGBLo0uxZ3fsFWnRxdopRB+9WtSCHeIXNtqHyu
 wf3lgVbXySXkVA9ryBbHUoT7p8uwTbtkCYsSAZThdu/g/3TtmKCbU5jLT8uyeiphKUUV
 10mTSSL2JKeKQVhxdjfcU3jYr2Y08H3Rnkc5fZMsgpEX00ryMzPQhPfBjSyOZBY8oQJP
 6rRg==
X-Gm-Message-State: AJIora9eIDL/gmtCrYRj8d1mhz5dygr+YxMcsEzux5OLX/366YScc0qC
 cf9qKCeCW/3/hEqGrZkldAuSw2WniXwGgh4nsStaJDx0ccf9tNCZVH0lWz0MHcZSsIOLphAnUXR
 2I6tOODqGpCQdFLY=
X-Received: by 2002:a1c:27c4:0:b0:3a3:365d:10a2 with SMTP id
 n187-20020a1c27c4000000b003a3365d10a2mr531998wmn.61.1658865636093; 
 Tue, 26 Jul 2022 13:00:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tuaG2OIeMczuNGdsQ0JcSQ5aoHzgVsAkFKRC7N1G1sFVVOfU9FpIkJ8monnznJl0SzszmhtA==
X-Received: by 2002:a1c:27c4:0:b0:3a3:365d:10a2 with SMTP id
 n187-20020a1c27c4000000b003a3365d10a2mr531981wmn.61.1658865635571; 
 Tue, 26 Jul 2022 13:00:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:fe00:8ba4:5871:abc3:8a75?
 (p200300cbc708fe008ba45871abc38a75.dip0.t-ipconnect.de.
 [2003:cb:c708:fe00:8ba4:5871:abc3:8a75])
 by smtp.gmail.com with ESMTPSA id
 l35-20020a05600c1d2300b003a2fc754313sm20871179wms.10.2022.07.26.13.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 13:00:35 -0700 (PDT)
Message-ID: <acee8628-7bfa-2f62-6ccb-e58f78bd56c2@redhat.com>
Date: Tue, 26 Jul 2022 22:00:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] s390x/cpumodel: add stfl197
 processor-activity-instrumentation extension 1
Content-Language: en-US
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220726194852.171039-1-borntraeger@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220726194852.171039-1-borntraeger@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.07.22 21:48, Christian Borntraeger wrote:
> Add stfle 197 (processor-activity-instrumentation extension 1) to the
> gen16 default model and fence it off for 7.0 and older.

QEMU is already in soft-freeze. I assume you want to get this still into
7.1. (decision not in my hands :) )

Anyhow, if a re-target to the next release is required or not

Reviewed-by: David Hildenbrand <david@redhat.com>

> 
> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> ---
>  hw/s390x/s390-virtio-ccw.c          | 1 +
>  target/s390x/cpu_features_def.h.inc | 1 +
>  target/s390x/gen-features.c         | 2 ++
>  3 files changed, 4 insertions(+)
> 
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index cc3097bfee80..6268aa5d0888 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -806,6 +806,7 @@ static void ccw_machine_7_0_instance_options(MachineState *machine)
>      static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V7_0 };
>  
>      ccw_machine_7_1_instance_options(machine);
> +    s390_cpudef_featoff_greater(16, 1, S390_FEAT_PAIE);
>      s390_set_qemu_cpu_model(0x8561, 15, 1, qemu_cpu_feat);
>  }
>  
> diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
> index 3603e5fb12c6..e3cfe637354b 100644
> --- a/target/s390x/cpu_features_def.h.inc
> +++ b/target/s390x/cpu_features_def.h.inc
> @@ -114,6 +114,7 @@ DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH2, "vxpdeh2", STFL, 192, "Vector-Packed-Decima
>  DEF_FEAT(BEAR_ENH, "beareh", STFL, 193, "BEAR-enhancement facility")
>  DEF_FEAT(RDP, "rdp", STFL, 194, "Reset-DAT-protection facility")
>  DEF_FEAT(PAI, "pai", STFL, 196, "Processor-Activity-Instrumentation facility")
> +DEF_FEAT(PAIE, "paie", STFL, 197, "Processor-Activity-Instrumentation extension-1")
>  
>  /* Features exposed via SCLP SCCB Byte 80 - 98  (bit numbers relative to byte-80) */
>  DEF_FEAT(SIE_GSLS, "gsls", SCLP_CONF_CHAR, 40, "SIE: Guest-storage-limit-suppression facility")
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index ad140184b903..1558c5262616 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -575,6 +575,7 @@ static uint16_t full_GEN16_GA1[] = {
>      S390_FEAT_BEAR_ENH,
>      S390_FEAT_RDP,
>      S390_FEAT_PAI,
> +    S390_FEAT_PAIE,
>  };
>  
>  
> @@ -669,6 +670,7 @@ static uint16_t default_GEN16_GA1[] = {
>      S390_FEAT_BEAR_ENH,
>      S390_FEAT_RDP,
>      S390_FEAT_PAI,
> +    S390_FEAT_PAIE,
>  };
>  
>  /* QEMU (CPU model) features */


-- 
Thanks,

David / dhildenb


