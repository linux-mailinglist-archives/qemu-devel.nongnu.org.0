Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70DA48DAB7
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:34:45 +0100 (CET)
Received: from localhost ([::1]:50404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n827f-0001NB-HF
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:34:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n826C-0008UH-D8
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:33:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n8267-0000t1-Cc
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642087986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LcynngfN+ekbO9xVA7rhu8LC6n2ERkwlsoKtqNU7/No=;
 b=emTXczKV126IsPzVlg8bjjFusaNCwzs6EqiCO+L0hlbvkha7551eNZlBJGF/rxmc45euUL
 mlB+oZ9r9VwqG7B7gXYTamg7BkupXamsqhjC8lsXEvKpDjMqfZSDidNzdGenf49FQx7hvI
 VsqVppSAOL6QomfcG8GGxx15B91XLvM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-TKH9DpWSNgGCYsuDL1Bs9g-1; Thu, 13 Jan 2022 10:33:04 -0500
X-MC-Unique: TKH9DpWSNgGCYsuDL1Bs9g-1
Received: by mail-ed1-f72.google.com with SMTP id
 v18-20020a056402349200b003f8d3b7ee8dso5652009edc.23
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 07:33:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LcynngfN+ekbO9xVA7rhu8LC6n2ERkwlsoKtqNU7/No=;
 b=1MnXUqnY7aT5wauE2b9vCn3N+PGkWqALgZoukHrnqOjnKUXWzQkqC2xpmk37ClRVQa
 R7dk7AzUz5DIeSLZyG3A/qqatI03skTsk30aIn7j4fVL/2XLVURDSigDzaAEGfEDN8Id
 jBrUiIRJ4kidv0idaYHUCpz7MDtQJ7Y7bpSyDGkoQdRfq8+Niq3LC4hciAkw+kiqp1RR
 3VkKulkCduhfzpmu/gj/LXHOxmWJTTiEy4Sr/SFDMPH5xuwgnk9o80NMX22g/owDDWD0
 CQSxCOgfbwH+q+jWcpDw36R2VCLR79PYNHcWPViXRULi8LHI33IsV+4G/t3ik26E9dXe
 R2kQ==
X-Gm-Message-State: AOAM530CFYYR5dfJC/GAXMuB+es3ZfW57Q+UgfZ5rnKwHCYXyP3+80xg
 TqtRaStiI0lD71Jxjjy+nX1ikFjvy5y3PY6Y73Mdmz0Bg75BYvqdRG00nGC0mScKHDkVOFC0kIB
 l9g5QDxIHnSRCnKk=
X-Received: by 2002:aa7:c1c1:: with SMTP id d1mr4637612edp.416.1642087983717; 
 Thu, 13 Jan 2022 07:33:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfxgHPEeqpr/jqSnt5+FQvDKQKaxDppzsl8Zsc9rxxj363dokXjZI8oDLAcNGMS1PKurVbUQ==
X-Received: by 2002:aa7:c1c1:: with SMTP id d1mr4637586edp.416.1642087983516; 
 Thu, 13 Jan 2022 07:33:03 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:e200:8511:ed0f:ac2c:42f7?
 (p200300cbc703e2008511ed0fac2c42f7.dip0.t-ipconnect.de.
 [2003:cb:c703:e200:8511:ed0f:ac2c:42f7])
 by smtp.gmail.com with ESMTPSA id gs9sm1000297ejc.30.2022.01.13.07.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 07:33:03 -0800 (PST)
Message-ID: <d0675c2b-0077-535f-482c-ad9820640704@redhat.com>
Date: Thu, 13 Jan 2022 16:33:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 2/5] target/s390x: Fix SRDA CC calculation
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220112165016.226996-1-iii@linux.ibm.com>
 <20220112165016.226996-3-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220112165016.226996-3-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.01.22 17:50, Ilya Leoshkevich wrote:
> SRDA uses r1_D32 for binding the first operand and s64 for setting CC.
> cout_s64() relies on o->out being the shift result, however,
> wout_r1_D32() clobbers it.
> 
> Fix by using a temporary.
> 
> Fixes: a79ba3398a0a ("target-s390: Convert SHIFT DOUBLE")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  target/s390x/tcg/translate.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index f180853e7a..766b4c87b2 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -5420,9 +5420,11 @@ static void wout_r1_P32(DisasContext *s, DisasOps *o)
>  static void wout_r1_D32(DisasContext *s, DisasOps *o)
>  {
>      int r1 = get_field(s, r1);
> +    TCGv_i64 t = tcg_temp_new_i64();
>      store_reg32_i64(r1 + 1, o->out);
> -    tcg_gen_shri_i64(o->out, o->out, 32);
> -    store_reg32_i64(r1, o->out);
> +    tcg_gen_shri_i64(t, o->out, 32);
> +    store_reg32_i64(r1, t);
> +    tcg_temp_free_i64(t);
>  }
>  #define SPEC_wout_r1_D32 SPEC_r1_even
>  

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


