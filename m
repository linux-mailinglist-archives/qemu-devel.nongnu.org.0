Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEDE31D72F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 10:58:59 +0100 (CET)
Received: from localhost ([::1]:45326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCJbm-0008SR-9y
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 04:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lCJaS-0007OF-Gl
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 04:57:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lCJaP-00006y-Sl
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 04:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613555852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7s87ey3TG1QBVAYgtIYgPo9FMPaf7XkvVIbKiVyF+a8=;
 b=iCowSNzRHE7kH1Fdazg39BoubmMPd/1XSz9LPV27Dlgg8lWFkExnqEIyWqbWkNoTan6yNA
 +N4dui7U+a19hKkDHz/E4jT3COIJ/qFj9sdJppu5yTVgURNjBRaqk6mazD7TzPmWAgQFTh
 XIg+ID/dzwBng60R/LKrohdRXGWeuo4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-q-m0nGxSPcazEN0d1J-HNQ-1; Wed, 17 Feb 2021 04:57:30 -0500
X-MC-Unique: q-m0nGxSPcazEN0d1J-HNQ-1
Received: by mail-ed1-f69.google.com with SMTP id d3so6324627edk.22
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 01:57:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7s87ey3TG1QBVAYgtIYgPo9FMPaf7XkvVIbKiVyF+a8=;
 b=OTrie1j/iJ4QT7BcJsm6a07W1nlNJqcQb7t577VIAARpfyFGEBTIllJoB4nHdPpU8f
 xRjbTvdh69BGLUjbgTX3lxw3V02Ra9qJ0XlXg9NeN+HJEeEQjRtXHuY9gmZ91degG54p
 fizrBfcZxq+f08bcvX7lZ2PBskvCBd8kP2Fr/DxIlkeg0BDRJz/hNLVU7OqKSliYfF69
 SBCaMwI9AUIYeWjw4mo8Vb9w4teJFQxUX6xUo4QhY0FlhoVYqbaF2YL5j2zux9EPrqxj
 TiAT0oeJnufTWJKw4TwK7hWtuBCXCO0cW4wOPZYs+aMMoeR3kHYbnHrbBZaSRgFhMuf7
 hm8g==
X-Gm-Message-State: AOAM532sDudeyqkZfo30vIICgbC9Kda/IlsoGScGY1SydVR52KuZFyku
 XGmx9CGLCG37qynLGS0OUWuvOvQfdkfuB8cw0Hs6k6L7c1jB6A7NVf++Am/o73Zzqh1Aj4hUEkp
 xlVAxjMyTwNI/GIw=
X-Received: by 2002:a17:907:d0b:: with SMTP id
 gn11mr24595808ejc.144.1613555849065; 
 Wed, 17 Feb 2021 01:57:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4IbyAH8M5PnUUWLVHDicAiXUIX8xmdo7tgcAIX90hLXIl3IaMIlwhpXf72F+CjyhmmNP0Uw==
X-Received: by 2002:a17:907:d0b:: with SMTP id
 gn11mr24595798ejc.144.1613555848909; 
 Wed, 17 Feb 2021 01:57:28 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n2sm822944ejl.1.2021.02.17.01.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 01:57:28 -0800 (PST)
Subject: Re: [PATCH] fuzz-test: remove unneccessary debugging flags
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210216181316.794276-1-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2d674c20-cc80-a008-04a9-dd92cf31ad53@redhat.com>
Date: Wed, 17 Feb 2021 10:57:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216181316.794276-1-alxndr@bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 7:13 PM, Alexander Bulekov wrote:
> These flags cause the output to look strange for 'make check', and
> they aren't needed to reproduce bugs, if they reappear.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  tests/qtest/fuzz-test.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


