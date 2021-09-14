Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3763D40B5BD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 19:14:22 +0200 (CEST)
Received: from localhost ([::1]:41814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQC0j-0006n5-Az
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 13:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQBz3-0005bS-N5
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:12:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQBz2-0006Sb-6f
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631639555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=275ipv2RS0/IFAZ1UrS5A7NARKPA0MpPMCH4Ek///0k=;
 b=Tkl9uUnxWj5YhZDjYrlEzdedf4aKX8y6vJCykWSBhZUPPTzC+uUJOMUw5XwEf+t1RB0aRS
 Ejw8vRjkBRrYmyahyU/s2KjFwgDYF9V5rc80iyw81jiEA/vip2XnAt3LgF8sVfd5MB2vUd
 4G1SSujZkWdd3EOBIHF7RcvC6clFRyA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-R_Ke63YhMn2Sdprc-OATUg-1; Tue, 14 Sep 2021 13:12:34 -0400
X-MC-Unique: R_Ke63YhMn2Sdprc-OATUg-1
Received: by mail-wr1-f72.google.com with SMTP id
 f7-20020a5d50c7000000b0015e288741a4so349000wrt.9
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 10:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=275ipv2RS0/IFAZ1UrS5A7NARKPA0MpPMCH4Ek///0k=;
 b=gTyWGhMiByTmiCtbzHl7Vmb4TMhb4hXPYxbivQaT/7jVEw9s10Nbpr8QPM8zeYDeui
 C7GN1N4GroVPyqLYr6KTV9AUcYZ2Rah9g+PyUQgfktWJAZ8DSEl1WaNN2JvT1KrcGIuJ
 KlkXtwwefANz0vT+lBcC254CFCu1MmVLak8DIu+Hp83UkFPqgPZciacT9VcS4bXeyrSV
 sWbY/lc0NQKPJii2ZRPDl/M0Pp4CbtQuaiyqxnixKZEwT/E+IQ8aBSO2mfry9hsKkpU+
 8zpm5spLLBbvfv/+XpYBZZPqud+haDsgVDUludOSvmFzkonAU1q7wulJhE3gew6RdPmK
 sVDw==
X-Gm-Message-State: AOAM533CnflQ6n0Pd6PN+JU1fIHuRGjZAqCOoybiLWmSjf2kBPstxCwU
 5O6TwcvV2Zlh9iPxIGpExA9Hs61w6nQ8QnL0HMzZ7qDH4DJPQkzbT7Ga1ssfkASUCvFL+1hiZbn
 rITpaebwNgR8k7CY=
X-Received: by 2002:a05:6000:1207:: with SMTP id
 e7mr275923wrx.170.1631639553358; 
 Tue, 14 Sep 2021 10:12:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH2Nu/d+o24emJyYoeWi+BO/qXs2XD3Zym0fXvio9vQcSvJdY1jZ3FvVB7qJKDJ8BbQkmqoQ==
X-Received: by 2002:a05:6000:1207:: with SMTP id
 e7mr275892wrx.170.1631639553089; 
 Tue, 14 Sep 2021 10:12:33 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id r25sm11919515wrc.26.2021.09.14.10.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 10:12:32 -0700 (PDT)
Subject: Re: [PATCH v4 06/10] qcow2-refcount: check_refcounts_l2(): check
 l2_bitmap
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210914122454.141075-1-vsementsov@virtuozzo.com>
 <20210914122454.141075-7-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <d600c9a5-7060-5a42-1909-bb58cf9848c9@redhat.com>
Date: Tue, 14 Sep 2021 19:12:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914122454.141075-7-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 ktkhai@virtuozzo.com, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.09.21 14:24, Vladimir Sementsov-Ogievskiy wrote:
> Check subcluster bitmap of the l2 entry for different types of
> clusters:
>
>   - for compressed it must be zero
>   - for allocated check consistency of two parts of the bitmap
>   - for unallocated all subclusters should be unallocated
>     (or zero-plain)
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
> ---
>   block/qcow2-refcount.c | 28 ++++++++++++++++++++++++++--
>   1 file changed, 26 insertions(+), 2 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


