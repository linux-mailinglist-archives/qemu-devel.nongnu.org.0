Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE312F6215
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:36:12 +0100 (CET)
Received: from localhost ([::1]:57298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02nL-0007cl-Ni
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l02l0-0006Da-Gy
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:33:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l02kx-000453-88
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:33:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610631222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NxaReX6Qp/yOONMt+CqcO7vKmkNzid1GVkTGQg8Qx88=;
 b=hthozERBGYWC2KDiEhDT1jxyLymaO223BEwrpKJa3WaNYo/DZbbsLS81uDCRDHz6IbpCR6
 sI+UQMd77QR/AiRhpJxjbrgwAo8APoo0XnAiOqx0kY8IU8jiCEoathl8m2//LHc2PLlmjO
 nHHfHgBUXFzPataT+Z6iyUWmyHi/I8I=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-L57Zy4CzMf24QsjAVXKc0A-1; Thu, 14 Jan 2021 08:33:38 -0500
X-MC-Unique: L57Zy4CzMf24QsjAVXKc0A-1
Received: by mail-ej1-f72.google.com with SMTP id k3so2208886ejr.16
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:33:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NxaReX6Qp/yOONMt+CqcO7vKmkNzid1GVkTGQg8Qx88=;
 b=U/dbg0Z1Qp9Ci8WgWtep2yWXnJ+s1CinjzEFPsUocyUwDrD8vPSGPhH5QaKFYriW/C
 SxDjWxjxoBLsY7HmXrvR8/6Nuy/FrAxgnG3wMinYPYFyPkxKALIx+ls9IeObQaesZHRU
 QibkVpxEMiJIF1isNvH5Lh8PIwSrT11dV0USBwKmjGlWqI83cpUrc8Ff8VOH1M5Maqj9
 B4fSzBJ3yynzz1QK9v0ZchfkTLZaiE45LJBDMtSLWS6WdHUEwZZnvHWSuWjCiAvyK5oD
 5G7lYCBJqT1lJNyTxSX981/vZQ1bvH1WuXiWxNbtUUO47yUhKL7Bth6n1KB19596b/fV
 r22A==
X-Gm-Message-State: AOAM530hD/MH6pVvoTUZC3zgMS4K6yc/Jru35dYgHhsOz4oJPGuvsOwB
 aG3usRYp1E7nQ55xSZW4dPTnkbe7fkh2O49qLtFJJYZtM722Odyp9GIfxOvLNrVUved6qQlb8v8
 2lZsDKSfBc+MLFPs=
X-Received: by 2002:a17:906:aed3:: with SMTP id
 me19mr5140889ejb.98.1610631217070; 
 Thu, 14 Jan 2021 05:33:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymV73zMrwERGioBFB4Njwr4D/OtiIbTgHDsiNGv77qw4xNE+QHhcGQRieeXdxAf9ugXLQUbQ==
X-Received: by 2002:a17:906:aed3:: with SMTP id
 me19mr5140874ejb.98.1610631216894; 
 Thu, 14 Jan 2021 05:33:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bq20sm1976192ejb.64.2021.01.14.05.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 05:33:36 -0800 (PST)
Subject: Re: [PATCH 0/5] Update libslirp & make it a subproject
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210114125605.1227742-1-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <04472318-3dfe-d2d3-9852-51b5e7269f46@redhat.com>
Date: Thu, 14 Jan 2021 14:33:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210114125605.1227742-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: samuel.thibault@ens-lyon.org, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/01/21 13:56, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Hi,
> 
> Here is a few patches to update libslirp to git upstream.
> Since it now supports meson subproject(), adapt the build
> system to use it, and related fixes.
> 
> Marc-André Lureau (5):
>    build-sys: remove unused LIBS
>    build-sys: set global arguments for cflags/ldflags
>    build-sys: add libvhost-user missing dependencies
>    slirp: update to git master
>    build-sys: make libslirp a meson subproject
> 
>   configure                             | 34 +-----------
>   meson.build                           | 78 +++++----------------------
>   .gitmodules                           |  6 +--
>   slirp                                 |  1 -
>   subprojects/libslirp                  |  1 +
>   subprojects/libvhost-user/meson.build |  3 ++
>   6 files changed, 20 insertions(+), 103 deletions(-)
>   delete mode 160000 slirp
>   create mode 160000 subprojects/libslirp
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


