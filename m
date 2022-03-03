Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCBF4CC030
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 15:41:34 +0100 (CET)
Received: from localhost ([::1]:57792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPme5-0000cG-Kj
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 09:41:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1nPmaD-00040z-L8
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:37:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1nPmaB-0003IW-V3
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:37:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646318251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rGTXUyVAGoeZXJD0gqHgScod9LzHtNnKKxtjDXPN7ew=;
 b=UxsGQgEswgTNnR1d0A7u5hn7bSRr1q5E9ObFjpaHqa6nCdOS7rktcLgy0UCNdKBkoAT9A7
 UQghQtrmDHYV9YqP5XSe/zK8qN5XLBJxljmu2DzuKWINFX1iA0+Qq9BQipeR7ybY0UNQNg
 A+3OTeNM5GzGBN/XS/nlIXLQgMNJQTI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-ihztLLEdOQG5eSggEaIuCg-1; Thu, 03 Mar 2022 09:37:29 -0500
X-MC-Unique: ihztLLEdOQG5eSggEaIuCg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l31-20020a05600c1d1f00b00380e3425ba7so1697284wms.9
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 06:37:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rGTXUyVAGoeZXJD0gqHgScod9LzHtNnKKxtjDXPN7ew=;
 b=dsSUVGOms558p5ngw2SDkclOiM3C689jFgPmu42CxjYCsUVX+SF2dfInEoSIK+N0eW
 gJpNnxNF0RkLCeEczQfqSd1L84xfjkfAeHpoqxCBWGbZF7EKzFn0ySjZPQuEWOQYIb0Q
 tEoeDZWLKSoQZSqZSLf5+OOqmQeUHRskKuZNDx+frJ7iEWYyVDBp/COGb4kUGrA4Wij6
 Uxjqo+PcTx98JxSt3xlaK5moCVx6EqSC2QrUca5ffN+xhajYXBPHGSR7ORDCN7lBv1tm
 1iA1JosL/B1BrmS8m680naGJ/qE3FTMW9TmiYvz0l5pcTwbRLC4/vok1JwZ6IxoWrFBS
 gR7Q==
X-Gm-Message-State: AOAM531ffeCPRe5FM1KiemH9phuwOKO/PGrmqq/tgn5jKUS1/QNCYZan
 9d23zajv1TGcaP1iBGaVlUJIlkE1Pd20ce8kBC+/9Y75a3ViRI8Nq5lmbUSEN4vz1T8OPj2i3+Z
 O8sBW4rrfSfB2gV4=
X-Received: by 2002:a05:600c:418a:b0:384:224e:1817 with SMTP id
 p10-20020a05600c418a00b00384224e1817mr3914615wmh.123.1646318248143; 
 Thu, 03 Mar 2022 06:37:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbB2eSbtmX9hkANK+5BUNsWIHBT/ab6F7qnuPj7VwuirlLDoTw2HOe2nAP+9WCyrSnlvvbDA==
X-Received: by 2002:a05:600c:418a:b0:384:224e:1817 with SMTP id
 p10-20020a05600c418a00b00384224e1817mr3914592wmh.123.1646318247906; 
 Thu, 03 Mar 2022 06:37:27 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 7-20020a05600c020700b003862bfb550fsm2242659wmi.46.2022.03.03.06.37.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 06:37:27 -0800 (PST)
Subject: Re: [PATCH v4 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
To: eric.auger@redhat.com, Stefan Berger <stefanb@linux.ibm.com>,
 eric.auger.pro@gmail.com, stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com
References: <20220208133842.112017-1-eric.auger@redhat.com>
 <20220208133842.112017-2-eric.auger@redhat.com>
 <310e3bd1-0ca8-ddc6-4500-dd1bea589fad@linux.ibm.com>
 <b39a5fd1-15a5-7461-0849-4b4478f1aef5@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <b475d44e-3e25-7db2-7cde-6f6061f1610d@redhat.com>
Date: Thu, 3 Mar 2022 15:37:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b39a5fd1-15a5-7461-0849-4b4478f1aef5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: quintela@redhat.com, cohuck@redhat.com, f4bug@amsat.org,
 dgilbert@redhat.com, imammedo@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 2/8/22 6:58 PM, Eric Auger wrote:
> Hi Stefan,
> 
> On 2/8/22 6:16 PM, Stefan Berger wrote:
>>
>> On 2/8/22 08:38, Eric Auger wrote:
>>> Representing the CRB cmd/response buffer as a standard
>>> RAM region causes some trouble when the device is used
>>> with VFIO. Indeed VFIO attempts to DMA_MAP this region
>>> as usual RAM but this latter does not have a valid page
>>> size alignment causing such an error report:
>>> "vfio_listener_region_add received unaligned region".
>>> To allow VFIO to detect that failing dma mapping
>>> this region is not an issue, let's use a ram_device
>>> memory region type instead.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Tested-by: Stefan Berger <stefanb@linux.ibm.com>
>>> Acked-by: Stefan Berger <stefanb@linux.ibm.com>
>>> [PMD: Keep tpm_crb.c in meson's softmmu_ss]
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>>
>> v4 doesn't build for me:
>>
>> ../hw/tpm/tpm_crb.c: In function ?tpm_crb_realize?:
>> ../hw/tpm/tpm_crb.c:297:33: error: implicit declaration of function
>> ?HOST_PAGE_ALIGN? [-Werror=implicit-function-declaration]
>>   297 | HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
>>       |                                 ^~~~~~~~~~~~~~~
>> ../hw/tpm/tpm_crb.c:297:33: error: nested extern declaration of
>> ?HOST_PAGE_ALIGN? [-Werror=nested-externs]
>> cc1: all warnings being treated as errors
> 
> Do you have
> b269a70810a  exec/cpu: Make host pages variables / macros 'target
> agnostic' in your tree?
I may have missed your reply. Did you have that dependency? Were you
able to compile eventually?

Besides, do you have any opinion overall about the relevance of
transforming the CRB ctrl cmd region into a RAM device wrt the TPM spec?

Again spec says:

"
Including the control structure, the three memory areas comprise the
entirety of the CRB. There are no constraints on how those three memory
areas are provided. They can all be in system RAM, or all be in device
memory, or any combination.
"
(https://trustedcomputinggroup.org/wp-content/uploads/Mobile-Command-Response-Buffer-Interface-v2-r12-Specification_FINAL2.pdf)

What was the rationale behind using RAM device for the PPI region?

There are some spurious warnings when using CRB with VFIO and that would
be nice to remove them one way or the other.

Thanks

Eric
> 
> Thanks
> 
> Eric
>>
>>
>>
> 


