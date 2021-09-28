Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB7C41AD56
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 12:54:13 +0200 (CEST)
Received: from localhost ([::1]:35698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVAkW-0002tx-Of
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 06:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAjC-0000gd-Ll
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:52:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAjB-0003Nt-4h
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q1cKMhi20Mg2NFvMjpR8tbzd2I3iL4g8r9r22jkQTDM=;
 b=NiVeVavkGEn4+3BclBeZD3EOd6KwZglWt+XPWdKICkNWHnq9fXBReNqGtOpRxDOEpiLBUn
 RYeyt8uL/BzQ3a1LaJwryROAn5oOs1WrQcGtGDOCbtrpLPlUtAr4wpfiLSVafdvsw+tyko
 5taZ8jGlJQYJuTCjY02qHnss4tOQUC0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-OyOd9kIPOIq6KPI1ZU2wXw-1; Tue, 28 Sep 2021 06:52:45 -0400
X-MC-Unique: OyOd9kIPOIq6KPI1ZU2wXw-1
Received: by mail-wr1-f70.google.com with SMTP id
 m1-20020a056000180100b0015e1ec30ac3so14962163wrh.8
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 03:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q1cKMhi20Mg2NFvMjpR8tbzd2I3iL4g8r9r22jkQTDM=;
 b=yIDcDGBdXCqvk8+fSkzzR7wY1DTzqzp38TQIAbVvFK4P/0mzD1NowIX1TrY5WubYQo
 AcP+TzQ8hplXbuQhDK7IZqK2fMNyS+B0bL4PgcS/8Xuu0gTKuTrtqqNHIKGB5r8+oPQz
 c1NfEejrxwUXNsPOHFCaKluumDYum8Q+Ls/Qk2S2DwuNlST55+Z9ozoyV11vP4MNmN8E
 w3W7kt/v42K92kfCv1/dWZq4tHFDvDIKYi3fh8v+IfF5g4rCRAWDybGDvzk0SzKN8jzY
 /u5Lr8OmoLB8iuFOgVdbgAA1o389VUSYiIc8B5Px/AsU5ERsyMcRfp89ez/8gyW5/jfx
 DteA==
X-Gm-Message-State: AOAM533Qw41wS3wWLstqEQooGRkAQNs+N1KQlgHcbfBMH57xcWUt8eKR
 Tr1L6D8SsttldNz4z9xAs1q3dGqCSA9ssGD7Wi5MLbf0KboYNP6LwB3g8euof0HE1H0BG6gEgJ8
 lQc98hGBRJ1sCqJM=
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr3924438wmk.5.1632826364295;
 Tue, 28 Sep 2021 03:52:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/+xHqIQCNd92ZpZrMJTd0XX9eWVQFVdpYAWxeAWxXOmvup5pWjrNvBBnqV8W1U9CDtY5AxQ==
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr3924417wmk.5.1632826364097;
 Tue, 28 Sep 2021 03:52:44 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o5sm8046262wrf.85.2021.09.28.03.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 03:52:43 -0700 (PDT)
Message-ID: <993caafe-76fd-6f36-1570-14875a97e84c@redhat.com>
Date: Tue, 28 Sep 2021 12:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v11 09/14] machine: Use ms instead of global
 current_machine in sanity-check
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-10-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210928035755.11684-10-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
> In the sanity-check of smp_cpus and max_cpus against mc in function
> machine_set_smp(), we are now using ms->smp.max_cpus for the check
> but using current_machine->smp.max_cpus in the error message.
> Tweak this by uniformly using the local ms.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/core/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


