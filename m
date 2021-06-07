Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC1239DDC1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 15:35:17 +0200 (CEST)
Received: from localhost ([::1]:56528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqFPQ-0007nT-AP
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 09:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqFNV-0005Xt-J5
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:33:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqFNT-00053N-6v
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:33:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623072794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bH1VJmI0r7CrFal2IOQrlbioO4h3kMcx1mOQjEXrGns=;
 b=Zmdsj3rRpVhMgqLSWFj0liaWsBKH3M5uumN1AgdEKCm2O4YKd58V3WXXfq0yTAzyGX1tdf
 hYKl+4fhI1cNu1Qz9j4lH8dNiIbZIY9sno4CAAyT8/ZhizOnSW6GCRixCrIKMorU8hS+HR
 12tOD+eSOSu8MdxTTnl+Nfz4R7h/ucQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-TQPnrwLpNJyhy8zxNLXx_w-1; Mon, 07 Jun 2021 09:33:13 -0400
X-MC-Unique: TQPnrwLpNJyhy8zxNLXx_w-1
Received: by mail-wm1-f70.google.com with SMTP id
 z19-20020a7bc1530000b02901ab5fafdcb4so587452wmi.0
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 06:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bH1VJmI0r7CrFal2IOQrlbioO4h3kMcx1mOQjEXrGns=;
 b=cVc8hwPmn0I6BWSO8fdfDVjfSYAy8c8KTUWCU7lOgw4eQuVc2MUtdZ8yWKodFbHO4R
 CdkPHowiF9EjXrFDY6wIAseURcqKKJhtyVWlZOyi6GAWvzD5Rrrz9iRa5hH3LIA7QBxz
 6HO9s0jUkkTA0BLMvAjn/kc+mKacJwfxLbQ9wyvpPsOsfruI4pprYIowO2wm/9ENJYtT
 yAeQNTK9aYq4wl6fc8O3R1rv2NfDuATlaU4JU83jdjzaVyrGS6w2uoORzpGbD3W/Aqjz
 EEJqRwWHcSRTIQR4xZmvG4f5RDhD+gfAzmip9A2YejsYNVoCOjFiALJnyJHdv02b8X5e
 Xkmw==
X-Gm-Message-State: AOAM530hNFna3q7VD05tGTqp3YXy/+9S/rUXNXLNTY476TcA8cVXxahE
 FfP1avhmKH4ME5jEunxvis0B31+v8HjdK6vV5cmIWewxltKoBPBjtgwHdXEMj58VAE0i1ao9jLu
 lyfCoV6zkmohl9Lg=
X-Received: by 2002:a5d:618f:: with SMTP id j15mr12283398wru.348.1623072792169; 
 Mon, 07 Jun 2021 06:33:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDNuwJWPUy5xLgAT1z4wEjf3Qj99US2Yr6MN2pQ4/vWWFivGtB8Bqgp5j9exMgqMwsWbuyoQ==
X-Received: by 2002:a5d:618f:: with SMTP id j15mr12283378wru.348.1623072792003; 
 Mon, 07 Jun 2021 06:33:12 -0700 (PDT)
Received: from thuth.remote.csb (pd9575779.dip0.t-ipconnect.de.
 [217.87.87.121])
 by smtp.gmail.com with ESMTPSA id m21sm12056334wms.42.2021.06.07.06.33.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 06:33:11 -0700 (PDT)
Subject: Re: [PATCH v16 08/99] qtest/migration-test: Skip tests if KVM not
 builtin on s390x/ppc64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-9-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6513579d-e6e7-5c20-d016-1d0cccda7c08@redhat.com>
Date: Mon, 7 Jun 2021 15:33:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-9-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> We might have a s390x/ppc64 QEMU binary built without the KVM
> accelerator (configured with --disable-kvm).
> Checking for /dev/kvm accessibility isn't enough, also check for the
> accelerator in the binary.
> 
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-9-philmd@redhat.com>
> ---
>   tests/qtest/migration-test.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


