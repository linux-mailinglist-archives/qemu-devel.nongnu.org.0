Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00DE3B905E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 12:12:38 +0200 (CEST)
Received: from localhost ([::1]:48816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lytgT-0004tM-Fd
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 06:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lytfI-0003h7-Nh
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 06:11:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lytfE-0003Lj-VQ
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 06:11:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625134279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kAW6EP0+MuLF2Xc8anzFj5uf4BS2FAi62fOXgOv2SXc=;
 b=ZjLGDVGlma2aGA2aTo809Twn/wwVHbQB5EezC3dqpTVKi26vtjlnnF6ljy9ttsP9bvuqni
 WXutmsu0cEK2VneNxH01kLTzBFda+q368iIy+WZgJRwmw3+vIxwlPf7s7vwRYhHVxxvuz4
 7/ppBmpVzgfYjONQ+qTKxLkX0rj4xDw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-KLs03dCaP9y0nOU3WaSWug-1; Thu, 01 Jul 2021 06:11:18 -0400
X-MC-Unique: KLs03dCaP9y0nOU3WaSWug-1
Received: by mail-wm1-f70.google.com with SMTP id
 z4-20020a1ce2040000b02901ee8d8e151eso4365536wmg.1
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 03:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kAW6EP0+MuLF2Xc8anzFj5uf4BS2FAi62fOXgOv2SXc=;
 b=WMSkCKWeUtRoyVIQthFRt+nZPkd4GxHk2/x/O5JcgwKhpox1EUhhEkd7IyV1A37GtT
 U25jwzOiiHFaIIqYR1gpdNP6drBw0q+7btJFJPBGCjGW3yqdEv7r+qvO7Zhtby/cNvgo
 pm9pmtAKIfs1CGYlT9ETgJDaa/FTIlHs+zL3i/1ivSh1bc/XQNQ/k00TOYxsXPW45hgX
 ihTYN4MBVeI17vRJfZ8h+/VNqGTpCEhzPb7dk6sAVrYtLUBGP8K86dVVRf2CG3bkMWz0
 JMXq97Z/GIVj6yMC5BxkQS8SOZErjFte5XQO4CxUCItJb3fjd8k7W1snKxQW2TRF5mJh
 z5cA==
X-Gm-Message-State: AOAM532L7qJQrs6eWKUjTH5kkZSoV0eVQ+Kfg0/ZnqCZjMBFtXCVluFw
 D5Z+bqiB5Zcsrc0rMDE8t1sad3fXwtK0bJ9JT7FMDdELZ2N6cuPxlv+0J1+FMgMfH0tV+z5tOGg
 OfL4k2q8zNWIOZaw=
X-Received: by 2002:a05:6000:c7:: with SMTP id
 q7mr27661096wrx.161.1625134276880; 
 Thu, 01 Jul 2021 03:11:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcVX7oGBZGyiLvZN+QxdJOl5dXozFStBkRK1GziTHx83eeSLmDu6LIH73WX7o+WP4J9oM4Ww==
X-Received: by 2002:a05:6000:c7:: with SMTP id
 q7mr27661055wrx.161.1625134276511; 
 Thu, 01 Jul 2021 03:11:16 -0700 (PDT)
Received: from thuth.remote.csb (pd9575bc6.dip0.t-ipconnect.de.
 [217.87.91.198])
 by smtp.gmail.com with ESMTPSA id p2sm23888784wro.16.2021.07.01.03.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 03:11:15 -0700 (PDT)
Subject: Re: [RFC v6 02/13] hw/s390x: rename tod-qemu.c to tod-tcg.c
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-3-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f5f54248-170d-db7d-583e-811e0197b2de@redhat.com>
Date: Thu, 1 Jul 2021 12:11:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629141931.4489-3-acho@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Cornelia Huck <cohuck@redhat.com>, cfontana@suse.com,
 David Hildenbrand <david@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/06/2021 16.19, Cho, Yu-Chen wrote:
> we stop short of renaming the actual qom object though,
> so type remains TYPE_QEMU_S390_TOD, ie "s390-tod-qemu".
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>   hw/s390x/meson.build               | 2 +-
>   hw/s390x/{tod-qemu.c => tod-tcg.c} | 0
>   2 files changed, 1 insertion(+), 1 deletion(-)
>   rename hw/s390x/{tod-qemu.c => tod-tcg.c} (100%)
> 
> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
> index 327e9c93af..02e81a9467 100644
> --- a/hw/s390x/meson.build
> +++ b/hw/s390x/meson.build
> @@ -16,7 +16,7 @@ s390x_ss.add(files(
>     'sclp.c',
>     'sclpcpu.c',
>     'sclpquiesce.c',
> -  'tod-qemu.c',
> +  'tod-tcg.c',
>     'tod.c',
>   ))
>   s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
> diff --git a/hw/s390x/tod-qemu.c b/hw/s390x/tod-tcg.c
> similarity index 100%
> rename from hw/s390x/tod-qemu.c
> rename to hw/s390x/tod-tcg.c

Might be worth the effort to also change the comment at the top of the file 
("TCG implementation" instead of "QEMU implementation").

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>


