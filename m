Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4187B40AA69
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 11:14:25 +0200 (CEST)
Received: from localhost ([::1]:55764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ4WG-0002uO-1t
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 05:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ4SY-0000fB-8a
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:10:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ4ST-000687-Jj
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:10:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631610628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=foyBv6duy0C0oCTLY8KxjXIzwVFRvi93w+TtCVDBEZk=;
 b=gJg+t2prXWPBYyXByXaPF2MeijlqUklRhQCCRc8LgsoxjPyL6ScGOBjfehfwC8DaqwaWsb
 Xqo24uNfQrMbTJFEq3uUSXSkStRTT5lSJRE/RXn2/dzkuqoKrmx1UvMKWw/gi+jmr4fyAs
 dwBiZIy7MTYHJvjk6bKz2xZt+pQHyxE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-NML1BDHvOS-KAE6vxWs-kg-1; Tue, 14 Sep 2021 05:10:27 -0400
X-MC-Unique: NML1BDHvOS-KAE6vxWs-kg-1
Received: by mail-wm1-f72.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so450439wmj.8
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 02:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=foyBv6duy0C0oCTLY8KxjXIzwVFRvi93w+TtCVDBEZk=;
 b=Dv1uCYt/lHnBUQUFxDbJkHRl7VyDfR7DAUM5LYiG0MAFa7wWBhLfuGfXui9WAgnu1S
 IxNEaTaRRbTRw3TBNs+vUSbP3vjDQB6c2qLNHUkwH8M8STItV3x9ZeUpUI0xbiRLxTsa
 rhOJPGPjeKpVPj5bPPS13USZOq/mVOMXkzQKJQImXaf5qEs2OKpYCDdSBM/vMov+pjU2
 9UK61B+KMfjoQtSl2EVbAMqts/uACjyGs5xi/sfgGKRO+9pA9nqXnDsJl/YMqejrWdRF
 MIg5ld96R0g/mWQJrQQoN30235HIq0Qf8GdOQolRAmtMXBqdQm+gj3Tvz5pteLtnVrTO
 V6sQ==
X-Gm-Message-State: AOAM531AacDBfwE5JisPC4Vr8sZcpi/L5MyUg3qtu63DJWkjqHPeLMa1
 7Yd2IcEt3/l4D+8XjwJdraotagP2MGv4xlF8MDvOYHecmkaZGzyeXPtufY0KpfmuZONjDkWD+Lk
 Uu3tHsv0gNMC65Mc=
X-Received: by 2002:a5d:64a7:: with SMTP id m7mr17571761wrp.171.1631610625822; 
 Tue, 14 Sep 2021 02:10:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJRgux/KI2xdpxbXxTpUXLqDcqff9MGZ2B9Ail7JghWO/H2N5zfQp1ZiDrVI2aIcof2sDPaQ==
X-Received: by 2002:a5d:64a7:: with SMTP id m7mr17571720wrp.171.1631610625521; 
 Tue, 14 Sep 2021 02:10:25 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id o24sm514022wmm.11.2021.09.14.02.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 02:10:25 -0700 (PDT)
Subject: Re: [PATCH v3 09/10] qcow2-refcount: check_refcounts_l1(): check
 reserved bits
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
 <20210524142031.142109-10-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <8dae6ce7-e92e-c13c-2701-982a199f119c@redhat.com>
Date: Tue, 14 Sep 2021 11:10:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210524142031.142109-10-vsementsov@virtuozzo.com>
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
 mreitz@redhat.com, ktkhai@virtuozzo.com, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.05.21 16:20, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
> ---
>   block/qcow2.h          | 1 +
>   block/qcow2-refcount.c | 6 ++++++
>   2 files changed, 7 insertions(+)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


