Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AF7397236
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 13:19:30 +0200 (CEST)
Received: from localhost ([::1]:58874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo2Qj-0002aL-MH
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 07:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo2OV-0000FN-2C
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:17:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo2OR-0003Mm-C9
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:17:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622546226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6XZTHyLtbtZL5+LDnGDiDzhvwMt6FbAzVoo/m/uVN0c=;
 b=S3oddgYIFrW9isj//x6jvJvvPnTSfWBrzYuuITE0qme97si2jadMbFE/OucvO8/MvLncBV
 LGqdM/5HXUlmj9qXY8wR91sz1FT+G8n++H8/nG/9o8igyg6qOHrs6Jix8fveyQFD2mx4De
 l+ecV891lFRlk54v2Kd/uS/Wt9anrfs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-jmKg-Bd1Ooa0eNcdAqy5qA-1; Tue, 01 Jun 2021 07:17:05 -0400
X-MC-Unique: jmKg-Bd1Ooa0eNcdAqy5qA-1
Received: by mail-ed1-f72.google.com with SMTP id
 w1-20020aa7da410000b029038d323eeee3so7686352eds.8
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 04:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6XZTHyLtbtZL5+LDnGDiDzhvwMt6FbAzVoo/m/uVN0c=;
 b=DNsgdcTG9hAy0fCviR4/Hqwhkrv33t8Zo+5TeBo3bwxo02w63oUrS9WAOo+6jK+kSh
 A9rEVmVMvUX43uGoO56VbW5+N6+HBA9c9SQVu+BDtYjed6lUgymyichYdKNfscd4YsuV
 EuWx/COGUttPUICyV1C7L/SIytQT977H2JxeUGdsFOHyWusiLWtFPyWwicPELJBWTEdJ
 zDGaA3RVlYHQ9mqnj61bKwMKsMOhG99qv+QEfG8E7+u9/gDcLm3UujbfNUoDCLTBQXmw
 wg9NuXN1hMGEBX9Cyp5VvhkbCrHrqxnwJBPnzyhcez+NQqXbXbq5eA0AQRENY4lbqu9n
 7MRA==
X-Gm-Message-State: AOAM532rtw1knTrdzssqQ3QeNMdqvH1oq010d2+84gRpaYRTygYj7dxD
 pr4YbFa0QXB2xKKR75DXld6mMyithwlofmabeqxePd4vt52bgrH9I/+Z71SnK+AtMRQcW0TwAF3
 VUsQYi6/EzgnRn8U=
X-Received: by 2002:a17:906:1401:: with SMTP id
 p1mr24134487ejc.526.1622546223905; 
 Tue, 01 Jun 2021 04:17:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/ZHiZNygPKWdElBn6ZDEov0rM7qeyPkHlG4PXu+WD1NZdcWl0O+XO3rAEx056yBLXxOaPzQ==
X-Received: by 2002:a17:906:1401:: with SMTP id
 p1mr24134477ejc.526.1622546223780; 
 Tue, 01 Jun 2021 04:17:03 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 c7sm8113040ede.37.2021.06.01.04.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 04:17:03 -0700 (PDT)
Subject: Re: [PATCH v2 26/33] iotests/222: fix pylint and mypy complains
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-27-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <8a96a7b6-f700-10ba-160b-605d745bc03f@redhat.com>
Date: Tue, 1 Jun 2021 13:16:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-27-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:21, Vladimir Sementsov-Ogievskiy wrote:
> Here:
>   - long line
>   - move to new interface of vm.qmp() (direct passing dict), to avoid
>     mypy false-positive, as it thinks that unpacked dict is a positional
>     argument.
>   - extra parenthesis
>   - handle event_wait possible None value
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/222 | 20 +++++++++++---------
>   tests/qemu-iotests/297 |  2 +-
>   2 files changed, 12 insertions(+), 10 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


