Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBCE3DB958
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 15:30:43 +0200 (CEST)
Received: from localhost ([::1]:38688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Sb3-0002BD-UI
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 09:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9SXm-0007ND-0U
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:27:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9SXh-0000yK-B2
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627651631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A/A3McV4BbQguDgDZtklzUxZfJl50b5u1fiu7wrDVJ0=;
 b=WQCIzarfdNP0Pb4FQnN3POnvrZ6SsJ+r9nFniskdqHjPN7VjSD9djWj2UpiKHI2q5WKIde
 q2o34HIXFExicOOiqqlBBLgGrwLvDHNOcF5di9lAgSyXrroOH013Kgdtcwa5d9b9SRTFkk
 YIvPBYKGtapv2awrG/BkucJcWlRrtiA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-55LUtclANyqefd6k-Jtxqw-1; Fri, 30 Jul 2021 09:27:09 -0400
X-MC-Unique: 55LUtclANyqefd6k-Jtxqw-1
Received: by mail-wr1-f70.google.com with SMTP id
 n6-20020a5d67c60000b0290153b1422916so3230713wrw.2
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A/A3McV4BbQguDgDZtklzUxZfJl50b5u1fiu7wrDVJ0=;
 b=Mvd+dGAiQCzxk9j+ENVJHvcs64RzZwEUvxw+tXAPLLovW5I5uLOSnqGiz0r1tWVnzc
 E+xSa8aljhFcb+WyfFLPU34P/7C5qr9SdluI0qd6oBeu5wmc9A+nk6+OeZuItSkih/8p
 lAASf5hjfhr0eKidtow/7Q5Hjp+odJSdhZtR4yI7tVEj0vDaJwIbxAon3Lws4aOcKJsn
 tF45SP8y+5mYUv7yJFI2DPx4OH5au0ctCLAir+/wNuCYSeeAov76A6G/sJnIjll2xNt8
 VM4o1zPPI+c/rnXqwpyhF9HP2wq4bz+zkBT3En9lhZLyj2F9Ht9gl6EaQ4G2hI9k5zo2
 UkKw==
X-Gm-Message-State: AOAM530sWWduDVrGCC26rKhYnegZqmMMDmj02d6dENZTEEIeKlb6xRMT
 JGbkmQAcsyHQc4PICe1Tk1tDcjIcCOUe35iZ+Dun5V9MTn4DUqyf6vlf8taEu6JbHL7uGBOVnpe
 lCzFsI8cHO5+EogI=
X-Received: by 2002:a5d:51cd:: with SMTP id n13mr2999793wrv.185.1627651628775; 
 Fri, 30 Jul 2021 06:27:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRgUQjlSH76oHF/7269Ty8BOgdDUAONEpfFArWZa4zvygE+YVtAQ/vk4rKch0EoSqQF/Op4w==
X-Received: by 2002:a5d:51cd:: with SMTP id n13mr2999781wrv.185.1627651628601; 
 Fri, 30 Jul 2021 06:27:08 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id l7sm1633326wmj.9.2021.07.30.06.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 06:27:07 -0700 (PDT)
Subject: Re: [PATCH] intel_iommu: Fix typo in comments
To: Cai Huoqing <caihuoqing@baidu.com>, mst@redhat.com, peterx@redhat.com,
 jasowang@redhat.com
References: <20210730014942.2311-1-caihuoqing@baidu.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6305f2ce-5d58-7eac-1568-05b64f45d96f@redhat.com>
Date: Fri, 30 Jul 2021 15:27:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730014942.2311-1-caihuoqing@baidu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) DKIMWL_WL_HIGH=-0.717, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 3:49 AM, Cai Huoqing wrote:
> Fix typo:
> *Unknwon  ==> Unknown
> *futher  ==> further
> *configed  ==> configured
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  hw/i386/intel_iommu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


