Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C400A6C3239
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:03:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pebdZ-0000jv-0g; Tue, 21 Mar 2023 09:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pebdV-0000hq-S3
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:02:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pebdU-0004jR-BV
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:02:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679403761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L37zGIdrCI0lKWKM3Q8kK4VrVtRuY89p3/9wlNMNzE0=;
 b=V9iz+eYGNLc8fhcI97zxZGrjwaS0iNSN72PWRrQdywi9PZa85F0no5Ryv8KYzTMbG+WAdD
 fjVvCXm55oQ+60p/tyMCIp8fRmW4m0NqDk/7nJuwAzUQInAG0NCT7DV+lAEqKx67DB6RGl
 ifhljvwxXucx0qmhU1kOssWZpyFeX0c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-g_5_0ungNXK2Zx7hDmGJhg-1; Tue, 21 Mar 2023 09:02:40 -0400
X-MC-Unique: g_5_0ungNXK2Zx7hDmGJhg-1
Received: by mail-wr1-f72.google.com with SMTP id
 b9-20020a05600018a900b002cfe70737d2so1746051wri.1
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679403759;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L37zGIdrCI0lKWKM3Q8kK4VrVtRuY89p3/9wlNMNzE0=;
 b=itfMrfpTN99oxdm8PvEj9tZi/e0vSdwo9TcrEtpHiu2OgLqKUlRZu0JxZ+XtD7C4BH
 V6jHGSavl0/u9dj4fpeUXT4bBbmBkCfE6EUYB5SYgVviGsmb4dtL9EpETtKEwbgnFntq
 q7LQHq54kfq9jjSoXF2hTujtcJPcIkDBFUF8ekQgYnivNg4yfEB7X/pn9/TJBjv519Rt
 KRVZ2j1OwazG8tZjsyzUdPG9489mmOGKHpXZW7WbvZclOwDdRFQ95qoGS2NdikqVy5LJ
 ydZbUdOlqFEDxXLiC8b4Q9Q2GBIh0y8lSAbYz9za3Oi/1VZ+bVQanhZRLhGRS0X1Rxg5
 lgig==
X-Gm-Message-State: AO0yUKXhmWMZR8GAFBsX9GrpCPRAtVCIMjlv3AmU29IduLqqpKtKpUa/
 USxdDNF0dYwR3TmBauWl6kv+feSHNcAoGrsX2BY8LJKxkDHD8XCD+RS0nSitFqzvx2jBoBAJm3D
 LUs8Sm6km+zSwsqY=
X-Received: by 2002:a05:600c:258:b0:3ed:33a1:ba8e with SMTP id
 24-20020a05600c025800b003ed33a1ba8emr2363617wmj.1.1679403759448; 
 Tue, 21 Mar 2023 06:02:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set8yBsQzuclVQl+rtkzgjnx4u4RElImpqSg19WRhtzY9IR04tFNAo/4mrbBb18hYIhWbM9dtmQ==
X-Received: by 2002:a05:600c:258:b0:3ed:33a1:ba8e with SMTP id
 24-20020a05600c025800b003ed33a1ba8emr2363592wmj.1.1679403759120; 
 Tue, 21 Mar 2023 06:02:39 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 q13-20020a05600c46cd00b003e1202744f2sm19919648wmo.31.2023.03.21.06.02.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 06:02:36 -0700 (PDT)
Message-ID: <44a1041b-62b3-f779-7c8a-6a92123c8f1f@redhat.com>
Date: Tue, 21 Mar 2023 14:02:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0 1/3] async: Suppress GCC13 false positive in
 aio_bh_poll()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230321083322.663561-1-clg@kaod.org>
 <20230321083322.663561-2-clg@kaod.org>
 <1dc87cd2-2f86-3580-3f29-a89de375c79d@redhat.com>
 <fabc9edf-697e-41d3-101a-bd7a6ddda84a@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <fabc9edf-697e-41d3-101a-bd7a6ddda84a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/21/23 13:16, Cédric Le Goater wrote:
> 
> +    /*
> +     * GCC13 [-Werror=dangling-pointer=] complains that the local variable
> +     * 'slice' is being stored in the global list 'ctx->bh_slice_list'.
> +     */
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wdangling-pointer="
>       QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> +#pragma GCC diagnostic pop
> 
>       while ((s = QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
>           QEMUBH *bh;

Yeah, that's clearer.  Maybe even add "but the list is emptied before 
this function returns".

> May be that's more explicit. I wonder if we need to ifdef clang also.

I think clang understand the GCC pragma as well.

Paolo


