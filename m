Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AFC484F7C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 09:44:11 +0100 (CET)
Received: from localhost ([::1]:37884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n51tx-0006Nl-VA
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 03:44:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n51sJ-0005fY-Mr
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 03:42:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n51sG-0000cp-91
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 03:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641372143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=praV2/1z/22+1nki57OFcbBet9OP1goUbuby8xf7oPo=;
 b=P00wuUwaSpBgeQKKapl//X4vQbES2bnU7tYEPRp2TqcXHyDbn32GTonGvcQS7PR6kQbR7x
 16L/54E27H0mavXFVcSgXDtgSmwoO6EoUWQSF3MNwr0Xuc7L7nwBDIYfS8QchOIjO8vKG4
 7LNOo9PRRbVBmYjo0lckQ0fRsiUa+5Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-G3WVn83MPZC1z7avQ17VPQ-1; Wed, 05 Jan 2022 03:42:22 -0500
X-MC-Unique: G3WVn83MPZC1z7avQ17VPQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so12342200wrd.1
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 00:42:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=praV2/1z/22+1nki57OFcbBet9OP1goUbuby8xf7oPo=;
 b=CVLBelnpa+Az4x1h3ZveJUhap5a2zwCPr7hqtRv9alz6dKbl7/z+RwauW7voMTbiR8
 mKzp2uaVcB6uYEXnncMRTNL1RsD/LQIbnleCQmokioLqdKIQVsxJrfof1j9iuLElXJUw
 JsZUdZu2dYMghAQ1ZNRgLLvRMSotXCio6xc87NmLG2zoeMHXm7+KedX0rsP7zoESotz4
 T8SfmIT09k9w1Dt2E22zBzDHlbN//XlQSl5YPVwsQ6h0tr8faSvl8A6K8mXXxtYXAftr
 Tfxfhmk/W+ngtl9Y5T4jJ8MmaoNJV8D8TPa4IgpacIC0rFTHA7ITxMMo/76XucpEUn37
 om7Q==
X-Gm-Message-State: AOAM531m0SZnGLnUxwsB4kmuGrxCG7cdNfyEaIwDTmTnXJjUj5Zlz1R0
 egv9/8Q4bjylyzMtUkebun27+uJsuhwW/xoY0wYlWCC18tWuF8CC5vokR1ySom/QQ6dzrjh6JV8
 P1URHQKqdMcd+Qco=
X-Received: by 2002:a7b:cbd4:: with SMTP id n20mr1852740wmi.125.1641372140513; 
 Wed, 05 Jan 2022 00:42:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmfg7g+sL2mf4Abc8EET7lJGW+irtZ12zfaWLb/EIwnNlGHdHd4JleQe+hvSzowulycvGq6w==
X-Received: by 2002:a7b:cbd4:: with SMTP id n20mr1852725wmi.125.1641372140295; 
 Wed, 05 Jan 2022 00:42:20 -0800 (PST)
Received: from [10.33.192.229] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id j13sm2008305wmq.11.2022.01.05.00.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 00:42:19 -0800 (PST)
Message-ID: <6f483355-8769-88c0-2056-9c767ce77bcc@redhat.com>
Date: Wed, 5 Jan 2022 09:42:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH qemu] s390x/css: fix PMCW invalid mask
To: Nico Boehr <nrb@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20211216131657.1057978-1-nrb@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211216131657.1057978-1-nrb@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: frankja@linux.ibm.com, pmorel@linux.ibm.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/12/2021 14.16, Nico Boehr wrote:
> Previously, we required bits 5, 6 and 7 to be zero (0x07 == 0b111). But,
> as per the principles of operation, bit 5 is ignored in MSCH and bits 0,
> 1, 6 and 7 need to be zero.
> 
> As both PMCW_FLAGS_MASK_INVALID and ioinst_schib_valid() are only used
> by ioinst_handle_msch(), adjust the mask accordingly.
> 
> Fixes: db1c8f53bfb1 ("s390: Channel I/O basic definitions.")
> Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
> Reviewed-by: Halil Pasic <pasic@linux.ibm.com>
> Reviewed-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>   include/hw/s390x/ioinst.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/s390x/ioinst.h b/include/hw/s390x/ioinst.h
> index 3771fff9d44d..ea8d0f244492 100644
> --- a/include/hw/s390x/ioinst.h
> +++ b/include/hw/s390x/ioinst.h
> @@ -107,7 +107,7 @@ QEMU_BUILD_BUG_MSG(sizeof(PMCW) != 28, "size of PMCW is wrong");
>   #define PMCW_FLAGS_MASK_MP 0x0004
>   #define PMCW_FLAGS_MASK_TF 0x0002
>   #define PMCW_FLAGS_MASK_DNV 0x0001
> -#define PMCW_FLAGS_MASK_INVALID 0x0700
> +#define PMCW_FLAGS_MASK_INVALID 0xc300
>   
>   #define PMCW_CHARS_MASK_ST 0x00e00000
>   #define PMCW_CHARS_MASK_MBFC 0x00000004

Thanks, queued to my s390x-next branch now:

https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


