Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E296C2EA7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 11:24:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peZ8d-0007Yu-6f; Tue, 21 Mar 2023 06:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1peZ8a-0007Ya-Jh
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 06:22:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1peZ8Y-0007YZ-Mk
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 06:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679394157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0wQ09+nzoYjuyBnSEz7HEeaSpaxVot6E7BTfJmJwlrQ=;
 b=IA3SaA0AK3jD28TIGJAdwXuxf9yr7vSXffJe/gxN11qqaGW+NJCRFYoZe4X4xa5USzeGkZ
 U/VTbtRfvhnNhMUoKNLFECR1W7jYEIOHeOZybcFeYotcNgQI6SM07D1OMDtwzzKGED6uKk
 M3Nhy7qkufFfvmHdnRb5z9XX/g0bDdE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-kNJPXAUJOF2Ttbj-njKhsA-1; Tue, 21 Mar 2023 06:22:36 -0400
X-MC-Unique: kNJPXAUJOF2Ttbj-njKhsA-1
Received: by mail-wm1-f72.google.com with SMTP id
 iv18-20020a05600c549200b003ee21220fccso1192760wmb.1
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 03:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679394155;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0wQ09+nzoYjuyBnSEz7HEeaSpaxVot6E7BTfJmJwlrQ=;
 b=3Tl4pfXKLtfJpWH2KpfRvQWviU2M+XDTPa4jVxaCHYxQePmZ616AEjC5DX7w1Ear2F
 0uQnbQEIEijo/wW0tA5D/iaiQNdRAogjiYZO6wnx0Wbfp3rFNM9qO0m2JlRM8AX7JT8J
 1orq+A5vq9Su8cop8B2+OXEe5nGplxY8BMK/Pw8RarugeOqE/QGRiPzM5vV0Ix4SLEri
 tAE1S0GUwqvFUkakLk2lEMrcPfs8e9SXwk86IiYiy/6F3CMbPvT8O5rgQSgJycun/Fkm
 Itxu3XwQQHpooUzkyr0w3Pl+YoBcXCwhH9OwC/g29pcp6az56jz0P5T7Aie66D+o6WIz
 4KMw==
X-Gm-Message-State: AO0yUKVNS/SpoB3PStqcMbh6ZKw0re7T60HU2Jop0chIDMALP+zmCQHg
 13pRMU6LbePu7w9DsTyW0pK6trDLGlA3Fm9po0mys4JTvjhGuuaxcmZHG8QqY3ptXQPXOrY/ChE
 NlNxtvbi8l787FXQ=
X-Received: by 2002:adf:f149:0:b0:2ce:a88d:32f7 with SMTP id
 y9-20020adff149000000b002cea88d32f7mr1730834wro.61.1679394155112; 
 Tue, 21 Mar 2023 03:22:35 -0700 (PDT)
X-Google-Smtp-Source: AK7set+Gg3hUMtp4MxGEaJWJs9PV6Jo0uHAkddqm1cccShexgQxAQIamSsGQLlLatCfk3ikli0Ugog==
X-Received: by 2002:adf:f149:0:b0:2ce:a88d:32f7 with SMTP id
 y9-20020adff149000000b002cea88d32f7mr1730821wro.61.1679394154775; 
 Tue, 21 Mar 2023 03:22:34 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 g18-20020adffc92000000b002cdbb26bb48sm10988875wrr.33.2023.03.21.03.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 03:22:34 -0700 (PDT)
Message-ID: <895227cc-243a-1e93-26c2-da22bd8864c5@redhat.com>
Date: Tue, 21 Mar 2023 11:22:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0 1/3] async: Suppress GCC13 false positive in
 aio_bh_poll()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230321083322.663561-1-clg@kaod.org>
 <20230321083322.663561-2-clg@kaod.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230321083322.663561-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

On 3/21/23 09:33, Cédric Le Goater wrote:
> From: Cédric Le Goater<clg@redhat.com>
> 
> GCC13 reports an error :
> 
> ../util/async.c: In function ‘aio_bh_poll’:
> include/qemu/queue.h:303:22: error: storing the address of local variable ‘slice’ in ‘*ctx.bh_slice_list.sqh_last’ [-Werror=dangling-pointer=]
>    303 |     (head)->sqh_last = &(elm)->field.sqe_next;                          \
>        |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> ../util/async.c:169:5: note: in expansion of macro ‘QSIMPLEQ_INSERT_TAIL’
>    169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
>        |     ^~~~~~~~~~~~~~~~~~~~
> ../util/async.c:161:17: note: ‘slice’ declared here
>    161 |     BHListSlice slice;
>        |                 ^~~~~
> ../util/async.c:161:17: note: ‘ctx’ declared here
> 
> But the local variable 'slice' is removed from the global context list
> in following loop of the same routine. Add an intermediate helper to
> silent GCC. No functional change.

Before doing this, I would like to see a case where this bug was _not_ 
caught by either Coverity (which is currently offline but I'm fixing it 
right now) or just cursory review.

I'd rather remove the warning.

Paolo


