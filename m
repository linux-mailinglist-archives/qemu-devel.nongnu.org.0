Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F28E3A0FB5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 11:32:14 +0200 (CEST)
Received: from localhost ([::1]:42882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lquZI-0002ak-QM
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 05:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lquXp-0001ma-WF
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 05:30:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lquXm-0000zt-68
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 05:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623231035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sPgXmOBcoKNW9ZEZ5mmAeAIIwhJPgluCnVOzwx10Ui0=;
 b=Qp97iCyysll/4kzFft9KgJuBz/EZ7J8dT8ypEr3FYyAmexO8LJsr2TrCibfx9Z603CQ57Q
 Y2gjxuG/AFjjlQd7UylvZqEU1XvVab3NABAKRfgQaGZDEFsUIYmYHS1B/8EHILK6wJJJ/J
 4F1zwQutepuKvvPY2mAWp47Qbj0tBKw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-3sqswcZiPYaQMetYqcyFsA-1; Wed, 09 Jun 2021 05:30:34 -0400
X-MC-Unique: 3sqswcZiPYaQMetYqcyFsA-1
Received: by mail-wr1-f72.google.com with SMTP id
 t14-20020adfe44e0000b029011851efa802so10454474wrm.11
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 02:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sPgXmOBcoKNW9ZEZ5mmAeAIIwhJPgluCnVOzwx10Ui0=;
 b=A1Ds2OdfAbxb8lyJrbvy8VODI2hzQO1blAUCSLS476xR12mJhnVrpy5Ts3lZRMpbRi
 yh+bxFEjCAUTennrUILgyzJVrtK31SWFAfNeKn8rraK+ME1SmD6kM0XzseiCjD/wyB+W
 E4wfgneEsUFdejVCpAirwHVlAFMuHnIgqWzGcPaspI5g107QqGky0bCV9P1GAs7M1SjJ
 ne1BVoNXmycLXloCTP+PjQ/SSnthpUx6cN3AeJPRB8JtQi6bUqnXxXwon3XtvnT3Qg9j
 T6OHDH5s3bxhPqeGropAEgdyrjDifKYwaxxUVT10OxK3r/djXgfosBXtSwkzQ51TyFCd
 ZANg==
X-Gm-Message-State: AOAM5334uRcwFfVDoHcioRghB63EqmDIlnS7L6zHZNDRP2gzMbS5qD+3
 vBKmuEHr66V/OC+6fGn92MLXJpDWFZdwxn7eE4exTDl6N0wlJ91DFut0ELgrGaLdIHIbfIS6MQJ
 pJ+bjcdQtaviUgRun1B5Bq0S0l/jDNcP94KeTHoK6GB7sQJsegdVtS7CcEuL91JqN6xo=
X-Received: by 2002:a5d:63c7:: with SMTP id c7mr26333323wrw.276.1623231033419; 
 Wed, 09 Jun 2021 02:30:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcLp8qm3vDx9c+5Hg3yzlkO1kPF9TRU9D7l5zDNbwBHOy/6jQgaQ4M2On7fDBLhw8MWAD79g==
X-Received: by 2002:a5d:63c7:: with SMTP id c7mr26333304wrw.276.1623231033239; 
 Wed, 09 Jun 2021 02:30:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n10sm10488223wri.77.2021.06.09.02.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 02:30:32 -0700 (PDT)
Subject: Re: [PATCH] vl: Fix an assert failure in error path
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
References: <20210610084741.456260-1-zhenzhong.duan@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <048a18be-0d1c-7fd0-7031-51e64c5432f3@redhat.com>
Date: Wed, 9 Jun 2021 11:30:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210610084741.456260-1-zhenzhong.duan@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/06/21 10:47, Zhenzhong Duan wrote:
> Based on the description of error_setg(), the local variable err in
> qemu_maybe_daemonize() should be initialized to NULL.
> 
> Without fix, the uninitialized *errp triggers assert failure which
> doesn't show much valuable information.
> 
> Before the fix:
> qemu-system-x86_64: ../util/error.c:59: error_setv: Assertion `*errp == NULL' failed.
> 
> After fix:
> qemu-system-x86_64: cannot create PID file: Cannot open pid file: Permission denied
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>   softmmu/vl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 326c1e9080..feb4d201f3 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2522,7 +2522,7 @@ static void qemu_process_help_options(void)
>   
>   static void qemu_maybe_daemonize(const char *pid_file)
>   {
> -    Error *err;
> +    Error *err = NULL;
>   
>       os_daemonize();
>       rcu_disable_atfork();
> 

Queued, thanks.

Paolo


