Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9240A6F24A3
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:24:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjc5-00013m-DP; Sat, 29 Apr 2023 08:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjc3-00013C-BW
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:23:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjc1-0006Bx-VK
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:23:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682771017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TV0IKcuqHtOwlf+aGtF68A178lgnGeVx46ZvMXHjv+Y=;
 b=TRKgms3DVgk2J7itobUK6QCcfPaf3h7iLhcxI4qrwI83Ok7Ssi2rrxNnOekIJ7AqliHOeW
 aWmUe73/FnE7CaMAU2flObsXm3YAWb4s94Jyliic2brkLY69RQZWSwc9gk92SQ2TVbI6U+
 Uu1BjFz9fgA9v8QC+55rEfLFqg7ZSRU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-ZAYPmixJM6i97VZcNS7Aqw-1; Sat, 29 Apr 2023 08:23:35 -0400
X-MC-Unique: ZAYPmixJM6i97VZcNS7Aqw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9532170e883so103899666b.3
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682771014; x=1685363014;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TV0IKcuqHtOwlf+aGtF68A178lgnGeVx46ZvMXHjv+Y=;
 b=djtkO1t9X5X6UotzDpaLlgvm1TKdOAuYi3eMdhQcRxpEbiUf3h5oxUhZOHm22zCLyJ
 9pCHuHrVT/pucG7I4ydBRMTTOF0w56Rh2ehJNuYCrZoHlEj8gNJ0S3Nj6KvQ/0XGfsT1
 ZnhiRxOWJCRnCFpZIjQZpzW+tR7dn0R/GdrU6RkS5KKeTXfEfq8QWuxpI5OkH9R6oZtu
 +PM6NU11o+fWEgEo7qWHO9NVUX9EoekNhYfyjFkMQqMvOAMJ5PJ2Waa0hCliLIaO8qso
 GSATpqTFPtZukhS+G4QXFaJhkmA1M5dnuEAqrif4t5x7n1/FxNfVenleTlm7pB9115vV
 UZ+A==
X-Gm-Message-State: AC+VfDzeC5LufD75eIgU2wRYJfEdP3yqCPw/NN8q708qV0YjqhtFHCav
 SB2IXSyPupFF3SgUrR9C9osaH4hy0Y0lrv9GPeGXS5+xrPUug2U9kKO+nxTBibwGUZTSTyUv4QX
 MHdS2ie+FsLsAbWw=
X-Received: by 2002:a17:907:31c7:b0:8b1:7ae8:ba6f with SMTP id
 xf7-20020a17090731c700b008b17ae8ba6fmr7536036ejb.16.1682771014483; 
 Sat, 29 Apr 2023 05:23:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ577pjxIHGAVa6a5gl6yn2NfBAJSBYYFfoAwgpZ643gyiwOJ3jCqLDTy89Lgb+7K2Cw9ZqkbA==
X-Received: by 2002:a17:907:31c7:b0:8b1:7ae8:ba6f with SMTP id
 xf7-20020a17090731c700b008b17ae8ba6fmr7536019ejb.16.1682771014202; 
 Sat, 29 Apr 2023 05:23:34 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 bv7-20020a170907934700b00959c6cb82basm7500532ejc.105.2023.04.29.05.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 05:23:33 -0700 (PDT)
Message-ID: <e00e814a-53ac-df6b-44a2-ea1fda4e20ba@redhat.com>
Date: Sat, 29 Apr 2023 14:23:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] target/hexagon: fix = vs. == mishap
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng, anjo@rev.ng, 
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230428204411.1400931-1-tsimpson@quicinc.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230428204411.1400931-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/28/23 22:44, Taylor Simpson wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> **** Changes in v2 ****
> Fix yyassert's for sign and zero extends
> 
> Coverity reports a parameter that is "set but never used".  This is caused
> by an assignment operator being used instead of equality.
> 
> Co-authored-by: Taylor Simpson<tsimpson@quicinc.com>

Thanks for the fix Taylor, I'll let you submit this as part of your pull 
requests.

Paolo


