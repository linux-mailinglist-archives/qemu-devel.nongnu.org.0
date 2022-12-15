Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C190764DD34
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 16:00:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5phE-0006yl-LL; Thu, 15 Dec 2022 09:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5phC-0006yM-LI
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:58:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5phA-0003s5-Sc
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:58:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671116328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gFLo4NwiUsvGgbE+chHupLji/qTtSURR5gnlyI5UfLk=;
 b=cf4FGlkHs8QSA2gydTqSdsEpNV/qWS2eFHJ4wRZIMBhTtjg2xSQaan5AxZqHMJCIC/GCpI
 y9H4KilUDJRs1K39F2oHDpLkMaqsBjye/gmdSTsNOwWYAJvQNSIl7oCviHZPKKSOH6oUf2
 V+v4j5fPZvoDISnj2IB8Y/FKPsAntEc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-484-iu6npr0LOfG9iUQg2y1h0Q-1; Thu, 15 Dec 2022 09:58:46 -0500
X-MC-Unique: iu6npr0LOfG9iUQg2y1h0Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 m38-20020a05600c3b2600b003d1fc5f1f80so1237311wms.1
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 06:58:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gFLo4NwiUsvGgbE+chHupLji/qTtSURR5gnlyI5UfLk=;
 b=vUcWqUS9RFgsa2QMWFQgA32rE53TauWVWW+rKEw1dl5uMvSc1Ap3XwT2fkiaITm9/3
 TvVA4tBVBX1LhFqBBdCeAMgeoVAqapeyPWBpOmJoeX+tiYBchdsK39Blq75KGH2iVYtf
 SGiv8NBjPqCALB9Ks3U+ZMtjJSJ/SIYMNG1yXDIkENgjQIxig6qDmIN5ETU0p2Fm5Q0o
 oLmxASafJgdzfF9uMiM34JIcyiJcoVgcXmwghETDfENkiMQedCmTqYw5x08AzP/z9QDO
 p81aOEnbthIuQ6hkn+fLlNg8UKceeBRe5sRwsio06Wt7wwhOFgCB6vy/E9S36gomSql4
 wCTw==
X-Gm-Message-State: ANoB5plgbW4XxmXCD2mKVScP2P5eKyGKAPhIX4MUt2JQUxgv4AGE/XNA
 hF0tkldtFh+bfvFVBRAfETRnINwUBIXzCfV87qe3IqivShAY4CC1PoMUrmuFZmP+18FUALbxi0D
 N690+VqHsfDoBoAg=
X-Received: by 2002:a05:6000:102:b0:242:14f5:7a9b with SMTP id
 o2-20020a056000010200b0024214f57a9bmr18495367wrx.44.1671116325286; 
 Thu, 15 Dec 2022 06:58:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf53AwuL+nTMciormMoIDTt17FGx/xhefNwFjHcPvbyZwQV9UJanRbmlOydRCxv7N6qeWuzQeg==
X-Received: by 2002:a05:6000:102:b0:242:14f5:7a9b with SMTP id
 o2-20020a056000010200b0024214f57a9bmr18495354wrx.44.1671116325106; 
 Thu, 15 Dec 2022 06:58:45 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 e17-20020adffd11000000b002422816aa25sm6998967wrr.108.2022.12.15.06.58.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 06:58:44 -0800 (PST)
Message-ID: <94bcf104-aeaf-2b52-1682-81402395ce07@redhat.com>
Date: Thu, 15 Dec 2022 15:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH] gitlab: turn off verbose logging for make check on
 custom runners
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221215144035.2364830-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221215144035.2364830-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 15/12/2022 15.40, Alex Bennée wrote:
> The verbosity adds a lot of unnecessary output to the CI logs which
> end up getting truncated anyway. We can always extract information
> from the meson test logs on a failure and for the custom runners its
> generally easier to re-create failures anyway.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml   | 12 ++++++------
>   .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml |  2 +-
>   .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml | 12 ++++++------
>   3 files changed, 13 insertions(+), 13 deletions(-)


Reviewed-by: Thomas Huth <thuth@redhat.com>


