Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89343CB79C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 14:58:00 +0200 (CEST)
Received: from localhost ([::1]:40022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4NPj-0004zM-N5
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 08:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4NOr-0003qE-L6
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 08:57:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4NOq-0006XR-8I
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 08:57:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626440223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=us+JnBBF+CQ1NXosyepwUbMMjVKX5Lo/O+KYWDgR9Bw=;
 b=McWop+1Mx11yqP1knZV1d4zP0VKwHCDR+8yw+njop6Iwy3vt1Fx2RwnFPzCj5yWJZH1j7b
 KYWLTwZwj7KDIK0M1VndbC8M+q/JbPMNLcF+3LPmzUJVmvtowACCSDRGz7RbbZChjlqBlF
 eorN5ri2gow38v7hUFbMISSq46qY6GI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-UxA5A3U2OJmYrjSXKk_pTg-1; Fri, 16 Jul 2021 08:57:02 -0400
X-MC-Unique: UxA5A3U2OJmYrjSXKk_pTg-1
Received: by mail-wr1-f71.google.com with SMTP id
 m4-20020adffa040000b02901404c442853so4803303wrr.12
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 05:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=us+JnBBF+CQ1NXosyepwUbMMjVKX5Lo/O+KYWDgR9Bw=;
 b=YWqtn3bOPXJxPWF+94DmVOXKgDeuKJtYyhHmMRi5V670GYcbI55u6It/1+9c3kTlm6
 UnHaUXpYh+EuzqrH6O+EPxRPHmXSZ7mVtaBPoyg3xCEXczrCamDomdpIwI0nOOT6nqSi
 vLGGqErxuafnqMnSYofMf4SkMecHJrDCD+I38qIGq/UP46rI9qiozvUwpEzWhnJKup51
 Yp1PyCl1kGbSgPhzJ2uafdQwKdEd5JtAK0m1yvLRzQxCivNUstHjyBr4wm4dXlq3vWnu
 mEr7Ijwf6kD/AUIBddfr0gOxUHDQrloG/blM0/XF+T104FW9DVxf1Avy4y7KrU+rdj3h
 MV+Q==
X-Gm-Message-State: AOAM530ZRCV9HWCMi6iVl8mpRGNZpqMeSjsPVaYUZyBWPiBRPe4frS2x
 U/nUSBI9sCASFspDTd/XIcuW2MQUUoicJWjPqtkeFMzjTxRTV7/K0HEhZmzsj97Tyfyu1XPBI3D
 rdT96eWNdjjvd8Do=
X-Received: by 2002:a1c:9851:: with SMTP id a78mr16377579wme.33.1626440221249; 
 Fri, 16 Jul 2021 05:57:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7B7aF4r+eLEgdo+HgOkPf3IddsodJF4x7eIyhWkpG6sMrgtFQjIFmeoKqtlL73SWACLtuRQ==
X-Received: by 2002:a1c:9851:: with SMTP id a78mr16377488wme.33.1626440220029; 
 Fri, 16 Jul 2021 05:57:00 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 m7sm9984857wms.0.2021.07.16.05.56.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 05:56:59 -0700 (PDT)
Subject: Re: [PATCH 09/14] iotests/common.rc: introduce _qcow2_dump_header
 helper
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-10-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <81a041b8-fae6-a716-0738-185255070e1f@redhat.com>
Date: Fri, 16 Jul 2021 14:56:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705091549.178335-10-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
> We'll use it in tests instead of explicit qcow2.py. Then we are going
> to add some filtering in _qcow2_dump_header.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/common.rc | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Max Reitz <mreitz@redhat.com>


