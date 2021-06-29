Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F69C3B6E84
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 09:03:17 +0200 (CEST)
Received: from localhost ([::1]:52498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly7m7-0004xG-P8
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 03:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ly7kt-00047Z-3V
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 03:01:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ly7kr-0003c2-Mx
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 03:01:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624950116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LaWlAypusaxp12kzhtSTMAXOAGP7Tw9UJTzKBpbDRvM=;
 b=F+OABhgmvlK+EN/3dICKV8tZkQSwuopuVbAPOr1DG5k/1QZGNGbL0vALiwNBi62hmWsgeX
 jbHY3lkj32ASwqplLAFpda+hS3KoKz3WDx85qDj2Ay79J5wvVxWAAOuATPUYbCzArrlt5Q
 gaMkzwRJzAk90qDYuXyEFU+P28Oppqc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-s1l3H9veMiqmWxSA2m3Guw-1; Tue, 29 Jun 2021 03:01:54 -0400
X-MC-Unique: s1l3H9veMiqmWxSA2m3Guw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k16-20020a7bc3100000b02901d849b41038so902747wmj.7
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 00:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LaWlAypusaxp12kzhtSTMAXOAGP7Tw9UJTzKBpbDRvM=;
 b=UQvs4YKmJWgPs8G2IO2y/xxjjSjst4ZmsOUwC3xLd82K8ITXu2oEFbaxLegZsXcYDE
 WtM4+Z2MxJOgkqerH65EVhF6zrdSbsUVzoquAQ3+qOwff7LIWfoHmCuPCgcld9JbrtMC
 Fr3PfXr+UCSKGSay2a+VRHZxHMNDd5yjtHHEUJgTd/8yvGAsEgAYmk+0glbT4OmETHz/
 aiGEELC3d6jL/cTTpjpmw66XQv32DNlOAMlwA6wMSHoyNgR05EfOCLfxKKxxmFeS5z3E
 R2pfRsuzopRMRZk+RUfldJgwNQQOUqoss3sSuMgscFMb3epucegqWCb2UP2b+JpK+fMP
 h/3g==
X-Gm-Message-State: AOAM533eYGIlYjzV5ILWJVMwperVx21v4+9LX01gz2jQpwLSlsfsDqtI
 nr0RCXaR241+chUbL6FP1pOMkbArQk5Yp5DTyTyYimEp6UOs7Xkeok2sDtK2jBW4i+EL3PPqcyb
 GB0zwzCDAENJ25f4=
X-Received: by 2002:adf:93c1:: with SMTP id 59mr11815614wrp.312.1624950113375; 
 Tue, 29 Jun 2021 00:01:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJws7nsnt+izagH0WYi6XNokvQ1kUftUIZius2muQhJ8g1BT2sajD3yzHfYkDH3PHvKpGUfWxQ==
X-Received: by 2002:adf:93c1:: with SMTP id 59mr11815600wrp.312.1624950113207; 
 Tue, 29 Jun 2021 00:01:53 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s62sm1671056wms.13.2021.06.29.00.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 00:01:52 -0700 (PDT)
Subject: Re: [PATCH v6 3/7] qemu-nbd: Use qcrypto_tls_creds_check_endpoint()
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20210628160914.2461906-1-philmd@redhat.com>
 <20210628160914.2461906-4-philmd@redhat.com>
 <CAMVc7JW23VFMG4tboxjpds2SnK_1j9aqpOboGY7xOG2mwwUWGQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b93d1d5d-cb48-f365-d04b-124ce4d8e6bb@redhat.com>
Date: Tue, 29 Jun 2021 09:01:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMVc7JW23VFMG4tboxjpds2SnK_1j9aqpOboGY7xOG2mwwUWGQ@mail.gmail.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu Developers <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/21 4:52 AM, Akihiko Odaki wrote:
> Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Thanks! Does this apply to this single patch or the
whole series (since this patch depends on patch #1)?

> 2021年6月29日(火) 1:09 Philippe Mathieu-Daudé <philmd@redhat.com>:
>>
>> Avoid accessing QCryptoTLSCreds internals by using
>> the qcrypto_tls_creds_check_endpoint() helper.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  qemu-nbd.c | 19 +++++++------------
>>  1 file changed, 7 insertions(+), 12 deletions(-)


