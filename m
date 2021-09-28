Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF2C41AD7D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 13:02:48 +0200 (CEST)
Received: from localhost ([::1]:50420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVAsp-0004g8-9s
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 07:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAoy-0001l2-97
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:58:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAow-0008Ot-3y
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:58:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ntIDc2sx7FlL3GwPyHm16Z5hrk/Ysi5NNhIXU5bFF6M=;
 b=RuLy+u9gxYGHcQOCHv6BDpETYciTmviEctHHjGE8jWngf52bwLArxUyumIJgZTt6zVmq0/
 mYZbujF5KUW3jApiQbB5N4QsjkLhpQcKWLCyIcgWCUykNZnZbip8R3LRXAdSIzR+KCRSST
 +bcU4Si4nuXxphu980UUWPRRlWDCUp8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357--CIAUzpkNHeYbl_mT0DOCg-1; Tue, 28 Sep 2021 06:58:43 -0400
X-MC-Unique: -CIAUzpkNHeYbl_mT0DOCg-1
Received: by mail-wm1-f71.google.com with SMTP id
 p25-20020a1c5459000000b0030cac3d9db1so1826657wmi.6
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 03:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ntIDc2sx7FlL3GwPyHm16Z5hrk/Ysi5NNhIXU5bFF6M=;
 b=Y8PBq2k2pzKCbbPONw0B2n82EagbxHiA5tAusxO/S2k+SDQPhLu8/l3rLYxAKkgmCP
 OptMbVe6mLsbADL0Fcx4TnYlbc4eEKBErHdFrnQlDzac8zsEI0WdttzJpe0jSHgGbU1/
 bGA7grE5ZSUePA2xxYesz9ga3zkaU+q5kYUDa9d9hincOSm058SWrGYV9SD1a5Pe7Ye3
 BqfWDcRc2vkAQ7kFoYBv1qUvX+uWvESV6K0WDDenqR2TGVfkCcSHnpgvIF/hicUHYaDU
 knB7JFnKMS5z5A4NDa6I3fV0E15tKfLIlEREBOmVBfrsvTx0hkzB9dbvEGlFVtN1PUUu
 8n0A==
X-Gm-Message-State: AOAM53223Pvi5sreuSMQH34dLDZG4IPAinGZspF+6CPXOY1Ea3xA3DNf
 VZ0FqZDY1XujnqbnHHt7cPlrpWgT7rsp6kCrOTXpLIPzePX6WVuaDqd16QASdriyFRzOM8ACb3z
 KiJGptk5mZSoSVik=
X-Received: by 2002:a05:600c:1c9e:: with SMTP id
 k30mr3945133wms.74.1632826722441; 
 Tue, 28 Sep 2021 03:58:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMH58L8rqBnZ2aUGSAEf2mLUyL/anDrudhO5ajy2KX/oWRt2mY5rFd+jMLHeAdX8SnBZ6ykA==
X-Received: by 2002:a05:600c:1c9e:: with SMTP id
 k30mr3945122wms.74.1632826722311; 
 Tue, 28 Sep 2021 03:58:42 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id l17sm825295wrx.24.2021.09.28.03.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 03:58:41 -0700 (PDT)
Message-ID: <718e3d38-44db-77f5-a1cc-50ca1416b414@redhat.com>
Date: Tue, 28 Sep 2021 12:58:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v11 10/14] machine: Tweak the order of topology members in
 struct CpuTopology
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-11-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210928035755.11684-11-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 05:57, Yanan Wang wrote:
> Now that all the possible topology parameters are integrated in struct
> CpuTopology, tweak the order of topology members to be "cpus/sockets/
> dies/cores/threads/maxcpus" for readability and consistency. We also
> tweak the comment by adding explanation of dies parameter.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> ---
>  hw/core/machine.c   | 8 ++++----
>  include/hw/boards.h | 7 ++++---
>  2 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


