Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662B03467D7
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:39:12 +0100 (CET)
Received: from localhost ([::1]:46736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlvr-0000Gh-Dx
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOkwC-0001Rz-CB
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:35:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOkw7-0000RM-Rf
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616520922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7c3ygpA3g6wUaoH8nwRYCnYQ4ZB2rf93ntv/Xrom2OM=;
 b=VzvQOQRW6Tj/YPx84CntBgLUjqG8ymRs/6WZmBX3cm/MkG+RaTZhwy1+KkGbpqxDfxNH0a
 aMrMbxNzD+6TQQaI92gmO98iOccNJovUcgf/cTaszVEBQcUhLmlit+nGuRPkZeH5jUrfz5
 /UmqPvKsc4p3XuclEC9oDPFwApbNPbc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-Rie6QaQEMBiL5MGJDipFrQ-1; Tue, 23 Mar 2021 13:35:20 -0400
X-MC-Unique: Rie6QaQEMBiL5MGJDipFrQ-1
Received: by mail-wm1-f71.google.com with SMTP id y9so758888wma.4
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 10:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7c3ygpA3g6wUaoH8nwRYCnYQ4ZB2rf93ntv/Xrom2OM=;
 b=dZa+89WxElVTOYrdyLHExMUsXDOHNEUVaL5Gd5QZwYHq3IDEkJpppdX7MgcRHYDkFl
 AeIOotuju9YW98lGDcip3YzLTXRrggisjqTPFl0VFpBDhQZEPWZ/uqGyISNl20sVqGda
 gjaF20hIpw+7xH8AvHiQpebNI4/1kW5/wl6oVh4vz3351JElijCwfBdlFUy+0Dcg7et9
 B70OQ47NXakfboi8e+eLJZn293Vw0IuExXdKE3XoHbPKa6ivr9FQyhBX1R0pC5iUS7Yf
 8w2tjuP7EJdkbCg6Cywi8qqv84xB2hQ7auc28azIM955jmMMTSKBPxnr4OYITfVPQ1mo
 gB3Q==
X-Gm-Message-State: AOAM533vcW3hJ6XMpdVpaYqkqQ4sFUpN3cVQ7zbRSQIDdD1GWl/RP28i
 vUz9CdgBXscNXXI59liA9GJarToj1+1F7VRfgpm3stpQJTt8zpIrue881yZaRoI0NqmijGtv3m7
 xw6D5f4Bg9c5DbOQ=
X-Received: by 2002:a05:6000:181:: with SMTP id
 p1mr5150097wrx.73.1616520919556; 
 Tue, 23 Mar 2021 10:35:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1aJvxtukLc+jkVgva7f+RMKFf7s3gZnpnKVOHzpP+aKupXCg/HM13m829E44EL0GypZDQww==
X-Received: by 2002:a05:6000:181:: with SMTP id
 p1mr5150079wrx.73.1616520919392; 
 Tue, 23 Mar 2021 10:35:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j13sm23656566wrt.29.2021.03.23.10.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 10:35:18 -0700 (PDT)
Subject: Re: [PATCH 1/4] qemu-iotests: allow passing unittest.main arguments
 to the test scripts
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210323130614.146399-1-pbonzini@redhat.com>
 <20210323130614.146399-2-pbonzini@redhat.com>
 <f2d648c7-1b80-bec6-f17c-78d36cf998b1@virtuozzo.com>
 <97e7aa7e-dcf0-17d0-3a4b-2d293e9c89ed@redhat.com>
 <a51c2d8d-cc9f-705f-2527-857a791e54de@virtuozzo.com>
 <04724b6a-3be2-54ff-c769-35fed34e9135@redhat.com>
 <d2982f83-5ce9-4617-3cc7-aaccec8584e4@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <89a877e5-43bd-b1d9-10ca-02e0d2903bb3@redhat.com>
Date: Tue, 23 Mar 2021 18:35:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d2982f83-5ce9-4617-3cc7-aaccec8584e4@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: eesposit@redhat.com, kwolf@redhat.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/21 18:27, Vladimir Sementsov-Ogievskiy wrote:
> Sounds good :) We'll see dots appearing dynamically during test run, yes?

Yes, exactly! :)

Paolo


