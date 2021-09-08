Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5281D403633
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:37:10 +0200 (CEST)
Received: from localhost ([::1]:49344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNt4v-0005eq-46
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNt0U-00086Q-OK
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:32:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNt0R-0001Kg-HE
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631089950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CRmEkw47UKVa3pr+SzsXtj+WB8oha2CXIPqK5dNzbOo=;
 b=UraqY5cKMxj+sl/DQvf+Jk+tVsUEOohGRKiN+AzmdToTXslii3cucWGAhBMt/hZXa4qHYO
 7dNOWCjmH+z4t0QN/Fr5U18myNi9ujTmvlDpQJIdTqliqTefnrKvXhnAW83WPzbZeRHFCo
 AbrIjLCNIUATBz8QJDvwZkzt0HxFFvI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-JYcMhb3CN3ybstE5BQbOew-1; Wed, 08 Sep 2021 04:32:29 -0400
X-MC-Unique: JYcMhb3CN3ybstE5BQbOew-1
Received: by mail-wr1-f71.google.com with SMTP id
 n1-20020a5d4c41000000b00159305d19baso281457wrt.11
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 01:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CRmEkw47UKVa3pr+SzsXtj+WB8oha2CXIPqK5dNzbOo=;
 b=dtP/3PX49kQK/YzS5uaEyPIFk9eFGaeQ721y30Xsl343BxxPOwyoYWqf9s8/OdCc62
 C6drhUmO7tDlqWb16jeQ5FPSHvxI6/i5riHaYPFf7EgYlOMvn+bCOmEyRf0Zvk9m4d7u
 Ob+hoA2sMl1KC9yz4YTxPId1oVbPaDHGpK9NOzCK9UovnLW+Qe7ZzC/QwjDEPu1+XSoC
 NIupn7kgKBzMmnQMvD7aIDUXu1j6bF0JFZyXGZJAgWKWkrDk4UKiqBTvR8GST3fbrz2M
 pBd9rBQ674ceqL7gWujoMUAkdz7wgwsxRZ/v7ig7hrJ9ZmYEdavBSdYn9HATF4nQD0kX
 A1qw==
X-Gm-Message-State: AOAM531sQ+edMQkI9/ZlFOfYRbNq/YX5vbLM9gOrLUTodRn6NWn+ZyzU
 78d5Xhtp9+vYRgeoNYp6pLhHMLPMOjfdEgDFUpxcFKt2/EOoA80ZHCGX+6/kQQ7UdIYOglYMVk4
 1hF8MGwUHLL48Er4=
X-Received: by 2002:a5d:528b:: with SMTP id c11mr2532948wrv.369.1631089948679; 
 Wed, 08 Sep 2021 01:32:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvlQx9YgSf9h6GjxWbHOMMxLhfZHZJDUV6zajwOD9fvEKYoUKEpRZ1ycusXgWrB16opnDgYw==
X-Received: by 2002:a5d:528b:: with SMTP id c11mr2532931wrv.369.1631089948500; 
 Wed, 08 Sep 2021 01:32:28 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id l124sm1374362wml.8.2021.09.08.01.32.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 01:32:28 -0700 (PDT)
Subject: Re: [PATCH 3/7] i386: Add sgx_get_info() interface
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210908081937.77254-1-yang.zhong@intel.com>
 <20210908081937.77254-4-yang.zhong@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8802ca02-9ebf-d599-f6b4-87ae5640dad4@redhat.com>
Date: Wed, 8 Sep 2021 10:32:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908081937.77254-4-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: pbonzini@redhat.com, eblake@redhat.com, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 10:19 AM, Yang Zhong wrote:
> Add the sgx_get_info() interface for hmp and QMP usage, which
> will get the SGX info from this API.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  hw/i386/sgx.c         | 21 +++++++++++++++++++++
>  include/hw/i386/sgx.h | 11 +++++++++++
>  target/i386/monitor.c | 32 ++++++++++++++++++++++++++++----
>  3 files changed, 60 insertions(+), 4 deletions(-)
>  create mode 100644 include/hw/i386/sgx.h

> @@ -766,12 +767,35 @@ qmp_query_sev_attestation_report(const char *mnonce, Error **errp)
>  
>  SGXInfo *qmp_query_sgx(Error **errp)
>  {
> -    error_setg(errp, QERR_FEATURE_DISABLED, "query-sgx");

>  void hmp_info_sgx(Monitor *mon, const QDict *qdict)
>  {
> -    error_setg(errp, QERR_FEATURE_DISABLED, "query-sgx");
> -    return NULL;

What is the point of patches #1 & #2? Why not squash all here?


