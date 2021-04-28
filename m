Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F05936D57C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 12:11:43 +0200 (CEST)
Received: from localhost ([::1]:44830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbhAU-0003bH-Dd
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 06:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbh6v-0002Il-FC
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:08:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbh6j-0006Rn-SH
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:07:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619604468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NFdBKv1v8acwobphrk5O4CM+xAHutrY5trBTTW4qb5o=;
 b=IK8oFh++qAEoA59XvZA4lNsUB8uAopND3tmCsKac1aPKgCYogqaTiwbIjTeNOYlGCBesuA
 MH/ah1XMpqGr7EzQU9v9pF/W7yNJWXtBTm9ycoCS+QxSvsngpoAiuEqY9VIqff19mq4BkQ
 RK6iaSWc2En0HZYbYLJjGalMHZHTemE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-FxfPxMJMNu2kQuG81ovYLg-1; Wed, 28 Apr 2021 06:07:46 -0400
X-MC-Unique: FxfPxMJMNu2kQuG81ovYLg-1
Received: by mail-wr1-f69.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so10502235wrm.13
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 03:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=NFdBKv1v8acwobphrk5O4CM+xAHutrY5trBTTW4qb5o=;
 b=fDK7mg8otB088IuYCcG4rBKU+/PvikFmwUxBiX5UWjNvI7s5KQ9/jtNnCZUUtdnA67
 47hyEKKGRk9PK1UmZhvHoT9b5hw0z85+qj4DgrAp9rmyiNkQ0F/ipXwwvGBX7a9RHoRE
 uNqgFo8d/JunHr/3qFQdI52wv3XdE274BoA3WZRF7h7j178fk9Klr9jlt1FahubhobdH
 ShBp8ftnlNZlTw3d+oaPY4PGebOG3B8xl02DwknVm+fSaetqln0VTaN3JypwaqCnVgJ0
 kbc4S7z5ZFkKN+UR/VSMApbuLNCZy3TIuei0TaolvRwEtGh0dE5n8GKRhjVLiI1Stru3
 SNFg==
X-Gm-Message-State: AOAM533+gxYlJ/LKCLvEwvw3ChqfApoPEOyGNfbrNP8WZgavb37na1Ej
 Ptf4NhkhGD2w8O0YcoRBH/6U95JUuxLXCSX7O8Zf475sVqLfjJtGmF9P+DZkMK1bVZl3VZRnHoX
 TRyG37S0dJXRuIxI=
X-Received: by 2002:adf:d22c:: with SMTP id k12mr28385115wrh.25.1619604465600; 
 Wed, 28 Apr 2021 03:07:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzV35jAhG5SWO4hZIzmF6bkTjnz/cL2UY9Dlpe+6pEdMzcnpNyUCvdfjvuzzOQpyjqxuA3hTg==
X-Received: by 2002:adf:d22c:: with SMTP id k12mr28385100wrh.25.1619604465439; 
 Wed, 28 Apr 2021 03:07:45 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f38:2400:62f4:c5fa:ba13:ac32?
 (p200300d82f38240062f4c5faba13ac32.dip0.t-ipconnect.de.
 [2003:d8:2f38:2400:62f4:c5fa:ba13:ac32])
 by smtp.gmail.com with ESMTPSA id l21sm7064392wme.10.2021.04.28.03.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 03:07:44 -0700 (PDT)
Subject: Re: [RFC v3 02/13] hw/s390x: only build tod-tcg from the CONFIG_TCG
 build
To: Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210422115430.15078-1-cfontana@suse.de>
 <20210422115430.15078-3-cfontana@suse.de>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <606b50d9-e586-a527-e56e-0f96dbe9c7f7@redhat.com>
Date: Wed, 28 Apr 2021 12:07:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210422115430.15078-3-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.04.21 13:54, Claudio Fontana wrote:
> this will allow in later patches to remove unneeded stubs
> in target/s390x.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/s390x/meson.build | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
> index 02e81a9467..28484256ec 100644
> --- a/hw/s390x/meson.build
> +++ b/hw/s390x/meson.build
> @@ -16,7 +16,6 @@ s390x_ss.add(files(
>     'sclp.c',
>     'sclpcpu.c',
>     'sclpquiesce.c',
> -  'tod-tcg.c',
>     'tod.c',
>   ))
>   s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
> @@ -25,6 +24,9 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
>     's390-stattrib-kvm.c',
>     'pv.c',
>   ))
> +s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
> +  'tod-tcg.c',
> +))
>   s390x_ss.add(when: 'CONFIG_S390_CCW_VIRTIO', if_true: files('s390-virtio-ccw.c'))
>   s390x_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('3270-ccw.c'))
>   s390x_ss.add(when: 'CONFIG_VFIO', if_true: files('s390-pci-vfio.c'))
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


