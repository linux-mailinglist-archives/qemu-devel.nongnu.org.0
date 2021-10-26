Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DBD43AE35
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 10:38:58 +0200 (CEST)
Received: from localhost ([::1]:42258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfHyz-0004rq-72
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 04:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfHmk-0004Oh-VP
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:26:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfHmi-0000Vs-LQ
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635236774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DaZrNteD3X3vtoUlD6VCiIG3DSVWWgRBBeLVB9WFvz4=;
 b=cuqyHVy9r2CCPubHn4Px4Ui8/m5lConv/B/bKlRZi2sscz8Y106SomKEVLfHRoELIsKaRu
 Tc8eZ70KXcCkPJYvYQKOIgYOuaPEdrotsPT2ol2siJ+ZbTongxobppwyivPT9lMg6shaIn
 Yyeu63bau+9H2ear1UsGKGwd0PBGUOI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-LirWa60_PfKuCFImblcpkg-1; Tue, 26 Oct 2021 04:26:13 -0400
X-MC-Unique: LirWa60_PfKuCFImblcpkg-1
Received: by mail-wm1-f71.google.com with SMTP id
 s3-20020a1ca903000000b0032326edebe1so729180wme.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 01:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DaZrNteD3X3vtoUlD6VCiIG3DSVWWgRBBeLVB9WFvz4=;
 b=pbQ/lKalRoWMVWdwk0Kubt37hGN6X0TAcqDvQQjPce5ww2H/dmeXVpgycf7a6QynmQ
 SyfMMRhJNS0bFsYIGrqxV7u1cBZn2L5AlyBeykI80BXt7EqX0r92Y7m0Ui+5+/YuNbJP
 8qYE6yjsyOWtO5KR5debX4JcDsd3EC0/axrbPL5K2L8WhmTwkiNeH5vxPUjVMZKRWYAu
 AP/FA/YN/S9umlzkNb4Spdr3xqHSCLp2r4GQ6d1uQp95aLHQ68uGMS+GC5M0eJU7kV1c
 UeNuqv9C5qoCGinEJJ7R8GRwgkPj5yb4W+95NUSVxj5xCJiuJChNwhO+aPT2fZnYmUt0
 7GUA==
X-Gm-Message-State: AOAM5319I18UE/j31nqo9irOCakxc2OMQRUPk9deEajXDtsHh1nojw0v
 SbMSJtIgXTuS2mp9LuCmrZEUF60vsG7w+p9tMFJ0lSMenCFNdIuYkj9iijDnnox477SJIuuHNo0
 qs2cyLBUHmNygh7g=
X-Received: by 2002:a7b:c049:: with SMTP id u9mr9912540wmc.102.1635236772271; 
 Tue, 26 Oct 2021 01:26:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymqBUNxdL+S24VpJydUnxZCQADK10f1hSJflM5CFO2xGPL44y0OS5apHncRothbWeLmtvtsg==
X-Received: by 2002:a7b:c049:: with SMTP id u9mr9912505wmc.102.1635236772015; 
 Tue, 26 Oct 2021 01:26:12 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id l21sm11446879wms.16.2021.10.26.01.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 01:26:11 -0700 (PDT)
Message-ID: <8c1a733f-d609-93bc-eec3-a7d8b339aded@redhat.com>
Date: Tue, 26 Oct 2021 10:26:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 4/4] iotests: add qemu-img-compare-stat test
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211021101236.1144824-1-vsementsov@virtuozzo.com>
 <20211021101236.1144824-5-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211021101236.1144824-5-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 nsoffer@redhat.com, nikita.lapshin@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.10.21 12:12, Vladimir Sementsov-Ogievskiy wrote:
> Test new feature qemu-img compare --stat.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   .../qemu-iotests/tests/qemu-img-compare-stat  |  88 +++++++++++++++
>   .../tests/qemu-img-compare-stat.out           | 106 ++++++++++++++++++
>   2 files changed, 194 insertions(+)
>   create mode 100755 tests/qemu-iotests/tests/qemu-img-compare-stat
>   create mode 100644 tests/qemu-iotests/tests/qemu-img-compare-stat.out

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


