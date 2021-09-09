Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C5C404835
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 12:05:02 +0200 (CEST)
Received: from localhost ([::1]:51018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOGvV-0007yO-J6
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 06:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOGsO-0005jI-Li
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:01:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOGsI-0000W2-9o
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631181698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NeGWlrf5vev+gEOfCXbrlvWAI/u03MMiPQrjaUt1lXM=;
 b=b8z0Q5hPdxq4Dc/NS+9ZjK6JHkTOh6QOFqeBApJOS4I/3KXyyVXP9p9eJY8JJEx+LeoSdq
 H8A+q2crvkinRqzqk6B3Xdz6zq8LdUQHvSg1V75q88wvenQn3NLmQvIhZYnYD/tSwY+HOX
 +KQsKAXKIvspfKo1h/WcoKfWl63O3JU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-1h6aJAf6MsWND8YJNLIkNA-1; Thu, 09 Sep 2021 06:01:36 -0400
X-MC-Unique: 1h6aJAf6MsWND8YJNLIkNA-1
Received: by mail-ed1-f72.google.com with SMTP id
 y19-20020a056402441300b003cd8ce2b987so712571eda.6
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 03:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NeGWlrf5vev+gEOfCXbrlvWAI/u03MMiPQrjaUt1lXM=;
 b=5f/9KCPgrAXaU5R1AIT7eASJw/qwLulqIX1WQT/TV6668FlLBprPOYUhr9RBpxGKCz
 TauUxKQhMCeLVpg+J7hPWB7muQr5FJqbK7yo93yWwBf0K6TRzvC2BoEnu9CdM7MnBDDJ
 nLKnK8s0a7Laf+7VQmZ82WRpqebxIIZMoARF1kJnrLbwsb3mXDLHijgT6HwOYzKoBuby
 E/gkpe2MwptSeFWc6vKzXWmndSSAx23FiguQ80fiZGH0JKvLXPERVm0DzOQWXBN0OG0k
 /CCVBP/KcgRdSYcqLw9JpzZly0nL2ahUQi2CLI85lfEYdfEvpG6ouSs1KRs4/1K0ut/3
 7/qQ==
X-Gm-Message-State: AOAM531ZSOVOPPa+9JpWo2/A7A71A1lODPj/lvKSVDRyZoqorStnjRJq
 MwyXoP2d26HEk3QRD0r2HWapx1e/yC3uoB9VCCne+t8SsiDjaLqN2cZYQYox2vghXbwcY4RzGdY
 /jEOiEh84PTKHBeU=
X-Received: by 2002:a17:906:b782:: with SMTP id
 dt2mr2490190ejb.310.1631181695745; 
 Thu, 09 Sep 2021 03:01:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaaVojQ78dzvuwBQG6dnOgiYYtED8hU6C1zxFqk1STHW4PQ44zaKff1f8hXuv91Gn62rzOaw==
X-Received: by 2002:a17:906:b782:: with SMTP id
 dt2mr2490145ejb.310.1631181695393; 
 Thu, 09 Sep 2021 03:01:35 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id l9sm808653edt.55.2021.09.09.03.01.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 03:01:34 -0700 (PDT)
Subject: Re: [RFC PATCH 01/10] sysemu: Introduce qemu_security_policy_taint()
 API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210908232024.2399215-1-philmd@redhat.com>
 <20210908232024.2399215-2-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b56b5716-a461-0dbe-f706-524c42589e33@redhat.com>
Date: Thu, 9 Sep 2021 12:01:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908232024.2399215-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) DKIMWL_WL_HIGH=-0.393, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.922,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/09/21 01:20, Philippe Mathieu-Daudé wrote:
> +static QemuOptsList qemu_security_policy_opts = {
> +    .name = "security-policy",
> +    .implied_opt_name = "policy",
> +    .merge_lists = true,
> +    .head = QTAILQ_HEAD_INITIALIZER(qemu_security_policy_opts.head),
> +    .desc = {
> +        {
> +            .name = "policy",
> +            .type = QEMU_OPT_STRING,
> +        },
> +        { /* end of list */ }
> +    },
> +};

No new command line options please.  You could rename -compat-policy to 
just -policy, and make this a "security" suboption.

Paolo


