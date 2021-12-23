Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4382D47E3D4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:56:41 +0100 (CET)
Received: from localhost ([::1]:41694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0NeC-0005yG-C4
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:56:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n0NPU-0003TW-I1
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:41:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n0NPJ-00044M-4D
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:41:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640263275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9cm5P7xJO6rAlYqEUBb374Y3zXmpu9FQnpZ+mQntPi8=;
 b=CX3khG51Inlgo8K+D6ChBtspsVh+zrqDJwhOVSGtPV6hROnoVaFUQFYCLaRt71SS/89mjb
 Wd9VWwBhzDhrHuAX2ZyRslxcze1LAmDtA0lKu7/kCNWV4bL9ljWLpF5dpTde4MWftBkut+
 8aeiuO3q9FDoR4HX3Dl3vG+jxJK8n8Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612--_hHb2lsPB-WN_I_7RFsQw-1; Thu, 23 Dec 2021 07:41:12 -0500
X-MC-Unique: -_hHb2lsPB-WN_I_7RFsQw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg20-20020a05600c3c9400b0033a9300b44bso1927963wmb.2
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 04:41:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9cm5P7xJO6rAlYqEUBb374Y3zXmpu9FQnpZ+mQntPi8=;
 b=4bQb0MPvU78xa9v7x/NnSTengMF7xQYE8816i1W0gguLseqX1NVQMPzQo5SwPWpA6p
 SOAku0VynIevnHc2YeXARD/23Qa5qgjAHNTDgToSB8rDnC1rLJxlcXnJ0hbM2Ts9DfNI
 Hs1fgfcND+aS6DvA5+eKXachJzbVJKCxQ9ZbhtSmeTEj/XpQSMmI1u0S9ivcgOIgB9XH
 +RXi/2qii4AJeoJ1rP8LEclOTaqm5I1tffNNWIZ7SaAHHyowm9jxibBKysPbIYIwVI8q
 tA6G5w0vjBi4uN/SU9X1Yne+aRVPV31tWaLD5TBCA3OSmEh64i5/BGluDZXeQqj53UjR
 oB4Q==
X-Gm-Message-State: AOAM532D2hmsAU//kkBlh9lmrQQYEs7igVCFQz/ZpaOpLO2SasnMjgoV
 123dXjst12BxnCcNLtgjsmhvgfQ6zqF+OG2EdVRZl10iIOf6l+2/xPhSW0MbJ6nKjzQDgecp3XF
 oM0WVASM45+TDnQw=
X-Received: by 2002:adf:dd8d:: with SMTP id x13mr1573208wrl.401.1640263271818; 
 Thu, 23 Dec 2021 04:41:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXGwa7CGVHYK7FJS3P7o4E7QC3PE/q2CF9tWoV8F5r/eLouMaQhGBtLu7DRCnDwlfInP/itA==
X-Received: by 2002:adf:dd8d:: with SMTP id x13mr1573191wrl.401.1640263271617; 
 Thu, 23 Dec 2021 04:41:11 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id p13sm2837046wrr.37.2021.12.23.04.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 04:41:11 -0800 (PST)
Message-ID: <f93baaa5-7d05-5a59-d439-c4a7e99e48bd@redhat.com>
Date: Thu, 23 Dec 2021 13:41:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 18/19] iotests.py: implement unsupported_imgopts
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
 <20211203130737.2924594-19-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211203130737.2924594-19-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.264, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.12.21 14:07, Vladimir Sementsov-Ogievskiy wrote:
> We have added support for some addition IMGOPTS in python iotests like
> in bash iotests. Similarly to bash iotests, we want a way to skip some
> tests which can't work with specific IMGOPTS.
>
> Globally for python iotests we now don't support things like
> 'data_file=$TEST_IMG.ext_data_file' in IMGOPTS, so, forbid this
> globally in iotests.py.
>
> Suggested-by: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/iotests.py | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

Can we move this and the next patch before patch 2, though? Otherwise, 
the tests adjusted in the next patch will be broken after patch 2 (when 
given those unsupported options).  The move seems trivial, just 
wondering whether you know of anything that would prohibit this.


