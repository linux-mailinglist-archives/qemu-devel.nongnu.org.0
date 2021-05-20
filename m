Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD27389F11
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 09:43:37 +0200 (CEST)
Received: from localhost ([::1]:60356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljdLE-0006Vu-HF
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 03:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ljdJ4-0004aa-Gb
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:41:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ljdIv-0005IH-3d
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621496471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P16ASH2kZ0PLkYZPbQkf0WPf9ayYZORcF32+aEYn7eo=;
 b=CXuqFk+s/sVYlT2SUWxpRpXGX4QsjwvN0AcXOaFQXx5AZ/ZWY/M2gbkwujsVIME6tsQW2e
 KINL/0jNC2KwgjNMMzhOE5I80vyLBext1ZUNpMUWxNF10rYNs4RvN7hhd8sYReO3bS1XIj
 halpvhFOtZAjtEy7mYJ3XXailWAOwRc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-wBTJAAmSPyixO_SRFRZQKA-1; Thu, 20 May 2021 03:41:09 -0400
X-MC-Unique: wBTJAAmSPyixO_SRFRZQKA-1
Received: by mail-wm1-f72.google.com with SMTP id
 g206-20020a1c39d70000b029016ac627fbe9so1112929wma.9
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 00:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P16ASH2kZ0PLkYZPbQkf0WPf9ayYZORcF32+aEYn7eo=;
 b=DyJYkD8/9zr4gplPaANzSE7ajf9MSJug6xC9cYjuuVb1HaAqviVUWhUm1+kvALz89I
 tT3/SmNVKgOIL9B2VuPPF7blGM+O2x6JeRAfNSehvhGpP91dW0S6puQlerVnP4eGfuQq
 3xcMu/XbOUU4OMtgq/dyE8tHubxerVaBguaKnCF73FL54MIEU9XFKq7ur3PnPiKX5EY3
 gC5TEDOLnByCRtTudXSJJUL2AKihvL4pUPYYNRNH9i5P6dY316KMfN3F0VGiNWjG8Hvq
 /sh6Qx5ezEvNHF8i3cX5auM4eDOk8z/eRSiQLq6NGhclF916wmfNm01Y11Nm52tWTO4o
 tn4Q==
X-Gm-Message-State: AOAM531VE1QOZy+7pu8txhu1AQhc5XCIQDXQEvWDBRGEM8ti1DrI6nTg
 ijEJLLsiifvkCXxE3+4MqSziM3ZiSDQUSbbN6TX5EV/O9hj+9UQfY3g8nF68xMM5Dxj6tH1a79c
 91QhAnPkOg8zGku8=
X-Received: by 2002:a5d:6b43:: with SMTP id x3mr2785185wrw.263.1621496468780; 
 Thu, 20 May 2021 00:41:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMpUyhjyeV9HULzIQyu/UEHgPY2UbWxCUSF0+6V2qbduPkgBZkaaoDm2deFVlVNvPbBS5wIA==
X-Received: by 2002:a5d:6b43:: with SMTP id x3mr2785167wrw.263.1621496468598; 
 Thu, 20 May 2021 00:41:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p2sm2106802wrj.10.2021.05.20.00.41.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 00:41:08 -0700 (PDT)
Subject: Re: [PATCH 1/3] qemu-config: parse configuration files to a QDict
To: Kevin Wolf <kwolf@redhat.com>
References: <20210518154014.2999326-1-pbonzini@redhat.com>
 <20210518154059.3002446-1-pbonzini@redhat.com>
 <YKUjXnThNZk6YfTZ@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <653d3df6-1a5f-7099-c780-6b73ef1f2852@redhat.com>
Date: Thu, 20 May 2021 09:41:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKUjXnThNZk6YfTZ@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-stable@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/05/21 16:40, Kevin Wolf wrote:
>> +    qemu_opts_absorb_qdict(opts, qdict, errp);
> Shouldn't we check that qdict is empty now and return an error if there
> are any options that the QemuOptsList doesn't accept?

Indeed, my bad for not checking exactly the contract of 
qemu_opts_absorb_qdict.

Paolo


