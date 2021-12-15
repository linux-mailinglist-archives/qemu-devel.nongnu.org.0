Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7329475D28
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:16:38 +0100 (CET)
Received: from localhost ([::1]:42854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWxJ-0006yG-TH
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:16:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxWUZ-0005eT-15
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:46:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxWUW-0006C8-Jw
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:46:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639583211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ifPIaXanRfJneEpzkRhnujnGmRPb3ep4TXREdwofqbc=;
 b=gyuvz3hr9iAWJiqhsmT/9EVzpoKYVZOX55BlMxGAIAZGtt2RByXsPcMX4d3AUhUI80oNpQ
 UdXMkoic2DQog1B9DL7Rb9bjj3411sn3A6d8Fl9dJ72UdVI64tQBepD/2QKOTv4KXy1q8X
 MYgze/lEplrjhwy9qvImw33yjq5TirY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-dj8GellLNPO0q9IKJsdhgQ-1; Wed, 15 Dec 2021 10:46:50 -0500
X-MC-Unique: dj8GellLNPO0q9IKJsdhgQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso14792298wme.8
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 07:46:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ifPIaXanRfJneEpzkRhnujnGmRPb3ep4TXREdwofqbc=;
 b=jVhHX6lFCTV6m1E5mpRy/2NVVsA7mb35ctuK7Kpw+xh6SjKDPTRr0+UWskcOq7Z5Kv
 1M4w96b+FPdCH4mgiQ6kN9jkZPFoUzmKH6y5Pls9I7cQR6IHlHN6OcYaI79JzLYUrE2k
 sqqK98hRRogpGmnGrFeklGGuYgha0wP9Zll0sksF5qu5vtn6lLL5IGffZZiIYSRqRbwJ
 HgMlJzUDqQlKiHYKE97UW1e8YikZDo8Yiqf8QWtWCDBqQSqrgXa66EBK6YP/RqLIqwA6
 UYizNAEC4vsZVzqBqhDxWRH03zG5IHOmrJtcUtUimy5ijNCWnkiD/F8kv6AXjqqutHAX
 R5Mg==
X-Gm-Message-State: AOAM533mlbavx5QOHuJXDHCx/kAjKAisnZth3JPpJYj6TpLualdUL09/
 HNq1AReCr/ajArxPaA54Yq76P1IhozrHv0VkSFha/agO9iFFNeXu8kxWs1fp5hkT/oYc5F5tvnZ
 LcnzSdlg7FTU41hQ=
X-Received: by 2002:a5d:6d4c:: with SMTP id k12mr4812887wri.511.1639583208888; 
 Wed, 15 Dec 2021 07:46:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxo9zQ9tBMpgtOHqk77o5YRFilQaznV4JQkulPJH01hPp5RDzyjX3rrLnP4BMR7JatRP04IQw==
X-Received: by 2002:a5d:6d4c:: with SMTP id k12mr4812877wri.511.1639583208716; 
 Wed, 15 Dec 2021 07:46:48 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id k37sm2353864wms.21.2021.12.15.07.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 07:46:48 -0800 (PST)
Message-ID: <1516c622-f230-b378-6dd6-b69861a91bc3@redhat.com>
Date: Wed, 15 Dec 2021 16:46:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH] docs/devel: update C standard to C11
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211215152055.1748462-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211215152055.1748462-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 16:20, Alex Bennée wrote:
> Since 8a9d3d5640 (configure: Use -std=gnu11) we have allowed C11 code
> so lets reflect that in the style guide.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  docs/devel/style.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


