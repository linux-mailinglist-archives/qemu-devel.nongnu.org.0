Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30016409708
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 17:18:28 +0200 (CEST)
Received: from localhost ([::1]:36904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPnj1-00069f-9S
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 11:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPngT-0004QK-0y
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:15:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPngO-0001l5-0f
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:15:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631546143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zlPlSWTBKECdo0zO6g3XR2lhkYWJltIUFfh/6H2NTXE=;
 b=VU6LNUgh+zPdns6etdsu0zkCHDL4tOT1tLqYSzXjhyq47dd6mOPClb3P8rjN9v2A6/jYTF
 J2wzJ2i3TrMfhrMeE2+3JObyjFzQz0Aj+0d2I+oBIduXsQhBDNsQ+UQx7Dv2+1/X56dNdX
 dH8kOfMJvLZOyuv858JgsEl5sGndABk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-1s0lTokoNlKxZUpR-6yr1Q-1; Mon, 13 Sep 2021 11:15:42 -0400
X-MC-Unique: 1s0lTokoNlKxZUpR-6yr1Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 s13-20020a5d69cd000000b00159d49442cbso2791269wrw.13
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 08:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=zlPlSWTBKECdo0zO6g3XR2lhkYWJltIUFfh/6H2NTXE=;
 b=FLO2kAuGcuPSnf0bZ5UTD8d9F5J+9KD/X5KD6qx+lPaxfx3CU/ag3OmlZsmnvaT86c
 cikiMoUiXlLM/4BRW31HMAVivxfTPyXvvRg8xNKcVrpYga3B/6n72docy1wVrQhhB8EW
 1zqaCKQEw1DkHTd9In8S5fQ2e5wjL9UqnDSyBkxWoK3vFy4ujzfrQ1bykPmwQHXzW2Sq
 6Top6mEO3hF80gFoHk2rgdeBm/6I4vOwkOLGVMTLYw5QHz8U5J3hxlHKvdZYLOdI/x4b
 02tYggDJuCTtDH34r7+elNeFoSGOrdC0airsbtjTlllL6YnY8mAOuNb7Go43ChE1akYK
 TeAQ==
X-Gm-Message-State: AOAM531Scyzhl4KA6RFTVBWpbXSmsrfTfUbIf4kNobcniYAP4+ZBKXwt
 AUSYpA1BejHXwdHYEMY9AjWwdFN3F2GJwuFdV4/5/0LQtHSW2yVNE949WLM2nPbMmbwlHvpCzS6
 eJHzOcV7m21QMxNA=
X-Received: by 2002:a05:6000:1081:: with SMTP id
 y1mr10838753wrw.14.1631546140907; 
 Mon, 13 Sep 2021 08:15:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOjjf6CiJ2JkL0QoXPuXbULAwm1EgSaXb6qy30ABVwBCBK1hheZn+KO6lM9uumAH3aj6mFGw==
X-Received: by 2002:a05:6000:1081:: with SMTP id
 y1mr10838729wrw.14.1631546140726; 
 Mon, 13 Sep 2021 08:15:40 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id c17sm2285264wrn.54.2021.09.13.08.15.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 08:15:40 -0700 (PDT)
Subject: Re: [PATCH v3 02/10] qcow2: compressed read: simplify cluster
 descriptor passing
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
 <20210524142031.142109-3-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <23bd6300-6a82-b0bc-c245-3a0147903d9c@redhat.com>
Date: Mon, 13 Sep 2021 17:15:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210524142031.142109-3-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, ktkhai@virtuozzo.com, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.05.21 16:20, Vladimir Sementsov-Ogievskiy wrote:
> Let's pass the whole L2 entry and not bother with
> L2E_COMPRESSED_OFFSET_SIZE_MASK.
>
> It also helps further refactoring that adds generic
> qcow2_parse_compressed_l2_entry() helper.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alberto Garcia <berto@igalia.com>
> ---
>   block/qcow2.h         |  1 -
>   block/qcow2-cluster.c |  5 ++---
>   block/qcow2.c         | 12 +++++++-----
>   3 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


