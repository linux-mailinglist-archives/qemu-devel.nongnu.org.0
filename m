Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B492390349
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:02:47 +0200 (CEST)
Received: from localhost ([::1]:58468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXdu-0005bw-0q
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llXbG-00033v-1u
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:00:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llXbC-0006ms-0q
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621951197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j0AxdkCktydGuWzAg+7OxPXFP0LJjJbRID5n2GqAKpM=;
 b=EzqVowBnMpBQnJSv4jeVZLjVmOYY5Ux0iyJ5dODqRVDdJziizm3pGv8iyC6/lb5DXZAwLz
 M492CW+c6Ni8hb5BV4UDIGkPB5pWBapjnVWPpvjZj8Dz/jyl6jc+eyACTUMTVt2W6HPpxx
 8aQ4ky9LdlDUyFrg3UNLDu1rv7IuJQo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522--k40qLJENsycRV9X0XEOtg-1; Tue, 25 May 2021 09:59:55 -0400
X-MC-Unique: -k40qLJENsycRV9X0XEOtg-1
Received: by mail-wm1-f71.google.com with SMTP id
 h129-20020a1c21870000b02901743c9f70b9so4714005wmh.6
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j0AxdkCktydGuWzAg+7OxPXFP0LJjJbRID5n2GqAKpM=;
 b=cEzgKPY1VSDUXI6KlQdjzLfL7eiAEuKs4gx6dlO4FewGt0oU1l3zNVBc+CeOHbl30J
 LZht0ogtg+AaZhWwyJSviFXqD4ZaP1lWPR1+YTJcCxkYkJOmjKHYaNim/3qJuMDcX3m+
 aJn6oUIOh1zPNtM8QMU+LNeaIWGPca8L0xZNZDC8ZxVhnodbWgzBWXFW97umdVrwcsM2
 4iK+tHwl8f+593XPD+bsllpUDBweRnaaYDnZ832aUVKfiHaD8JdYYqRt3SbugUIfLPhr
 1Om8ILR9mHQiC1xSHCOZervaz3LXJCS8Pfm8LGemw/RG0lh9Tsp50BzwWTtbqK3SHv9j
 zqJw==
X-Gm-Message-State: AOAM533P+fLiZh/nsaTpf1eIEgRe7Jm9mrwvjZi6aPFJLfPbXcui7K00
 hF1BZbE0ozT1BC1FRCwy3igu5XhnMaKPJLdHB9CMUAnbPN73a9ZcBpeKtDbqYyvF/T+c9sTaFly
 Zcy+KB7blZMjtpbM=
X-Received: by 2002:a05:600c:2f9a:: with SMTP id
 t26mr4131955wmn.166.1621951194445; 
 Tue, 25 May 2021 06:59:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVDKB6w1hyBaU0C0lHLc494suk0pDk72F6VbOpbV7Hvhvkoi+dtST7ZPXwEzS+MWE+oeIFZQ==
X-Received: by 2002:a05:600c:2f9a:: with SMTP id
 t26mr4131939wmn.166.1621951194280; 
 Tue, 25 May 2021 06:59:54 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b8sm16519533wrx.15.2021.05.25.06.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 06:59:53 -0700 (PDT)
Subject: Re: [PATCH 3/6] tests/qtest/hd-geo-test: Fix checks on mkstemp()
 return value
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210525134458.6675-1-peter.maydell@linaro.org>
 <20210525134458.6675-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <880bc986-f01d-e27f-dbe6-e2a808f14ba8@redhat.com>
Date: Tue, 25 May 2021 15:59:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525134458.6675-4-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 3:44 PM, Peter Maydell wrote:
> Coverity notices that the checks against mkstemp() failing in
> create_qcow2_with_mbr() are wrong: mkstemp returns -1 on failure but
> the check is just "g_assert(fd)".  Fix to use "g_assert(fd >= 0)",
> matching the correct check in create_test_img().
> 
> Fixes: Coverity CID 1432274
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/qtest/hd-geo-test.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


