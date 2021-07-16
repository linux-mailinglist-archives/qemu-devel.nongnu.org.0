Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6942B3CB7B1
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 15:07:04 +0200 (CEST)
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4NYU-0008GB-Qu
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 09:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4NVt-0006Yf-Ue
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 09:04:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4NVq-00026u-Pe
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 09:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626440657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9AVhWWgsbpRXKroojsdY2/pR63ITGUqYXlJUfXWm/TE=;
 b=Ailil3JseyIWh7YRP6x8V/oRSxxh/D6kY1K/z8lzJOethL5YGqqcLPDofg0Nt0D49cqv8w
 PwsQRXSUXdByFm3RovSuSzi677EN1elKc5UMq4ME84xXpxiZBsIfFQYGHDFaYNJaw2JYvR
 t+iCzXrI2Nc6PxcXXvkdmdgiWMtZAyU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-UeZhihBQMI60moAbaKWDIA-1; Fri, 16 Jul 2021 09:04:16 -0400
X-MC-Unique: UeZhihBQMI60moAbaKWDIA-1
Received: by mail-wr1-f71.google.com with SMTP id
 r18-20020adfce920000b029013bbfb19640so4772810wrn.17
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 06:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=9AVhWWgsbpRXKroojsdY2/pR63ITGUqYXlJUfXWm/TE=;
 b=skEQNDjOOyNzCrM/CeS856csPsQaZusVrqO6uSDH+O3rTsfrkX/pyRuSANFWtWnVo8
 k3+9ddbsHv4rMvOjAZAAbK9QXaYoF+g8bKka790bExnBEcHDkWKLR5HtaIM+AS7rfFlB
 SASeshhy/Z8Fblm8AxPvxv8Bn/oRhJ2PtuLRdo36PM7XgLRtP6P3ichsQrfTWiOB4GWr
 gk1NDbXNfQrm0SyPKnqIgIlhJx2OP0yMqiwZUBq+CkVz/KkICYbDIgOUvqCDlbgCykTS
 ZzXHgI5dgPJKXqSCrB9T7+al4labpIwR8pD2dTXVcD4xdhDb30Vt194KVmRyR58Oqsnc
 +6Rw==
X-Gm-Message-State: AOAM532hmr17fQKgCDv57gKsPZ03/HFpb3pv2ldkQ+glFA42j45Fd5FM
 6gx26cv1pgX4I4DWIOuyqs7blRTyIgld/ebBsng7eYZ003TKIVsJn+FFvMS0jr5m26USAw3PcuC
 qHBAPSokHdqiUS0U=
X-Received: by 2002:a1c:7c08:: with SMTP id x8mr10634599wmc.2.1626440655555;
 Fri, 16 Jul 2021 06:04:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSlpfYs//x7oU/hMFIennMpboVyGYstmrzc0Ws2x52ay6Ue9O0gjgElbgJP8zuOJstGf1rlQ==
X-Received: by 2002:a1c:7c08:: with SMTP id x8mr10634557wmc.2.1626440655208;
 Fri, 16 Jul 2021 06:04:15 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 o28sm10909494wra.71.2021.07.16.06.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 06:04:14 -0700 (PDT)
Subject: Re: [PATCH 10/14] iotests: massive use _qcow2_dump_header
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-11-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <331dad50-976a-5fcd-e99a-5945135b0f7e@redhat.com>
Date: Fri, 16 Jul 2021 15:04:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705091549.178335-11-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.07.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
> We are going to add filtering in _qcow2_dump_header and want all tests
> use it.
>
> The patch is generated by commands:
>    cd tests/qemu-iotests
>    sed -ie 's/$PYTHON qcow2.py "$TEST_IMG" dump-header\($\| \)/_qcow2_dump_header\1/' ??? tests/*
>
> (the difficulty is to avoid converting dump-header-exts)
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/031 |  6 +++---
>   tests/qemu-iotests/036 |  6 +++---
>   tests/qemu-iotests/039 | 20 ++++++++++----------
>   tests/qemu-iotests/060 | 20 ++++++++++----------
>   tests/qemu-iotests/061 | 36 ++++++++++++++++++------------------
>   tests/qemu-iotests/137 |  2 +-
>   tests/qemu-iotests/287 |  8 ++++----
>   7 files changed, 49 insertions(+), 49 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>

I think I’d have merged patch 13 into this one, but if you want to keep 
it separate (so that this remains a purely auto-generated patch), then I 
think it should at least come right after this one.

Max


