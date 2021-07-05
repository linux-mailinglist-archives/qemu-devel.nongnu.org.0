Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451DA3BB9E4
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:09:46 +0200 (CEST)
Received: from localhost ([::1]:55580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Kbo-00077U-4Z
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m0KZb-0005JR-PB
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:07:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m0KZa-0001I4-0y
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:07:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625476045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EB/SGbPkzycrj6c2a56SaIHGo/Q4c2bMYqK9No09P+Q=;
 b=A3tTwmDXWTMz00j0oWmpwih9bv9gh0EsvfFsXpBKW/boitrpyWIEHz4FAEWE3dek0PMu6Z
 sI9vKMQ40gMeMI3pJ8IHmkJbwCXQkxjo72TRokHIUp27DTTCErWnB6KW10lR7kjBQkdVU9
 mwnvdNRhRK7gj0Q56AGzH9p/PFQP1Rg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37--BFXxm5UPi-P_K3Gw38D4Q-1; Mon, 05 Jul 2021 05:07:24 -0400
X-MC-Unique: -BFXxm5UPi-P_K3Gw38D4Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 n17-20020a05600c4f91b0290209ebf81aabso800006wmq.2
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 02:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=EB/SGbPkzycrj6c2a56SaIHGo/Q4c2bMYqK9No09P+Q=;
 b=kvskHWxiQOcdDuZzNDhv29adp9WhibRB/cylBYm5ftnbcQXiPnq8p/BpHMSLJ4TvpY
 ILUWOtO9hEc2bodOu2ogwwaXa1zbff/4E7wjC7DKwHrvzIBA4hgqNBbojCKQHKi/+Q4u
 W6ZY3XbmCbo2oLSuhBujWRLKAcdBvIGvnL9az8k8t27C/jMmN7SKTS5h22+9p6N09Ysa
 PlFCzxL5uHNtfa5NL/WPWOBgZP2xDyh34hvLkXrdlgbhUF9lYEGA+IVsjrbdRXb2Iizq
 ZWJgzn/Xf9+UM4RFSCqIQYUeFNjxOeLONN6dNDvKyGN5aZMrhcettwOrueN2rlbWvlS5
 IF9w==
X-Gm-Message-State: AOAM532US6oYSvD/ftm/PxVbZ7axpz5GQ+vdu/lMy0CLjf8/8DkqmQjB
 2IRVY0LsdmFE8AdRhFnXaMn+WtzDK10RqCPkiRJ8PhazvvysKvHhok4KkgUTplJmA2TpiuoPCX2
 U2wwUIy+KdRcI/oM=
X-Received: by 2002:adf:ef87:: with SMTP id d7mr14508919wro.204.1625476043253; 
 Mon, 05 Jul 2021 02:07:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUDw5k1eYgsIc8gRaIpdTD1cBbO913B/l7Bu0ASEHdutAPsTp5DaO1odi5wiG4iInozSFhBQ==
X-Received: by 2002:adf:ef87:: with SMTP id d7mr14508880wro.204.1625476042915; 
 Mon, 05 Jul 2021 02:07:22 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id r3sm9698856wrz.89.2021.07.05.02.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 02:07:22 -0700 (PDT)
Subject: Re: [PATCH v1] s390x/tcg: Fix m5 vs. m4 field for VECTOR MULTIPLY SUM
 LOGICAL
To: qemu-devel@nongnu.org
References: <20210705090341.58289-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <06e02d5a-3bff-aef0-e240-1f2ab84f2300@redhat.com>
Date: Mon, 5 Jul 2021 11:07:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705090341.58289-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.07.21 11:03, David Hildenbrand wrote:
> The element size is located in m5, not in m4. As there is no m4, qemu
> currently crashes with an assertion, trying to lookup that field.
> 
> Reproduced and tested via GO, which ends up using VMSL once the
> Vector enhancements facility is around for verifying certificates with
> elliptic curves.
> 
> Reported-by: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/449
> Signed-off-by: David Hildenbrand <david@redhat.com>

Forgot to add

Fixes: 8c18fa5b3eba ("s390x/tcg: Implement VECTOR MULTIPLY SUM LOGICAL")


-- 
Thanks,

David / dhildenb


