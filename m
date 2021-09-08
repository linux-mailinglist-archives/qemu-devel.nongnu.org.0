Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA1A4033ED
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 07:49:09 +0200 (CEST)
Received: from localhost ([::1]:48126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNqSK-0001H2-EQ
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 01:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNqQX-0007La-3Y
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:47:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNqQV-0005m9-Gs
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631080033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TqdpgT27qEQmwUc0/yVyQgbt/Up9J2Cr4uMlOaFd0vg=;
 b=D0Nm/WNq1z1OJG+cI9oMWxnWC9lNCBsKWNLZTJFTWYYswTMJYY/jXj/V1m0tPCRer1taVK
 QpEqaNWPS5IMLfhYORoX6NGa4+jZwcGlaVTfYZ3DeTmdiwozQr3WSu7tffezThdY2EVqLr
 xaUnzoVbzU0y7XBZ3fJuFD6KwViZaik=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-1bB6Z614MXKMUUJovR15tg-1; Wed, 08 Sep 2021 01:47:12 -0400
X-MC-Unique: 1bB6Z614MXKMUUJovR15tg-1
Received: by mail-wr1-f70.google.com with SMTP id
 l12-20020a5d410c000000b00159aa62fbb2so174557wrp.3
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 22:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TqdpgT27qEQmwUc0/yVyQgbt/Up9J2Cr4uMlOaFd0vg=;
 b=DEAKWcES/O1GvknOU2jdKCSTMLVyvzE3Z3kt0cvF0hauCpsnSSNV45HQPeYQ0LRMwr
 jy7FmxcKGH1yBmdCJziVeygxnepjLGdCb5ksXeThC1cOpbF8+BcHdfX5bOnCCOKvE0JS
 wgBlmk/ztO4hK/8oDYt/QNjKZFZt6+lwuXyPx/+bD43BAfWHHhjwsVcbPAxXzY1Bl8KV
 BwXyn+sooeJdZCZVU59MsmycaFAoPk5VQprmR1dRTVG0yLRkvbySQLr/5/6RLKceTuMW
 UwkpaF/UW+/BH1xueyL3g/8ulpJak5AwMSACEa0fcePnLClw3tg997YxLeFQIOQeV6pi
 nwYA==
X-Gm-Message-State: AOAM5327SwYCrYSP6DU/KCDUhYUPjeWRLwTVko0AG4Fp7ShMXhr+S35g
 KnIzAe4Zc9cMT9AYFh76D9GtpGzIB/FNfSMUR0bWhJX7zDL7lpwCaqeCOCoV4bXldV0FwW3LXT9
 sEGF86MwR0nGrzEcjjGGUvvJ3PxsMYWwIAwROJ9YBQJIIj6/b4glebE54PjxOSeHQgLE=
X-Received: by 2002:adf:f0c7:: with SMTP id x7mr1891288wro.432.1631080031024; 
 Tue, 07 Sep 2021 22:47:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzI92W3oEEqrElL8IhIx0hLMZYc4CKDtw7NVO8Y/NhT3Rp4eDPhzhYyYFe5/Y/7+zHZKVUFVg==
X-Received: by 2002:adf:f0c7:: with SMTP id x7mr1891273wro.432.1631080030780; 
 Tue, 07 Sep 2021 22:47:10 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n13sm924303wmq.3.2021.09.07.22.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 22:47:10 -0700 (PDT)
Subject: Re: [PATCH] fw_cfg: add etc/msr_feature_control
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210907170935.210428-1-pbonzini@redhat.com>
 <f9c001a8-b81c-c559-7ba9-437827594f29@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dc764149-022b-b108-c185-70c485038e6c@redhat.com>
Date: Wed, 8 Sep 2021 07:47:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f9c001a8-b81c-c559-7ba9-437827594f29@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/09/21 20:19, Philippe Mathieu-Daudé wrote:
> Fixes: 217f1b4a721 ("target-i386: Publish advised value of
> MSR_IA32_FEATURE_CONTROL via fw_cfg")

Yes, thanks.

Paolo


