Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AE56A429C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:28:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdXz-0004TS-Gi; Mon, 27 Feb 2023 08:28:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWdXx-0004T8-On
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:28:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWdXw-0006Ek-DZ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:28:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677504483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YmlhivxPyn41yfCley82zJJmLNnrUbgrLTlucDsjrt8=;
 b=dg5maO3+BIt2KbDnoKjrmCoKL64I6Xil0Q2i6CkMtt97xT+vkJVc/GTzCW+CJxBc0hHV4d
 17tg2DlT3nwHrwp5/zn18G/uj5lCDXK1dsHYK6Ei2q+FZjo9zBHDm+y68HXSpBwvvku+Hy
 lleGYyiH0lbItXPek6M5Nh8+aVAL6uw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-13c6xpvwMpOttUOkvwJ9zA-1; Mon, 27 Feb 2023 08:28:01 -0500
X-MC-Unique: 13c6xpvwMpOttUOkvwJ9zA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j32-20020a05600c1c2000b003e9bdf02c9fso5339371wms.6
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 05:28:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YmlhivxPyn41yfCley82zJJmLNnrUbgrLTlucDsjrt8=;
 b=iWQbXbuQnY6L4MFaWoWo7uJQV5TFBnZFjvXMRNpI/lh7XVNY+FYTiDHMR9JOMHrxHi
 iQY5TlZyf1Z8uR3d4DXZTtcI7iK2Z0slgJsNBL/FQgK1cpCMmrRTodCernXB53kXQ555
 yUsPbA9N4w/00mS0ErK73u83OWIGHRSnyj2x3y9d6gC60QioSgWWA+duKQQvV/ED5ilC
 pKdgD1mHasdEuSMrsbLw2LLQDFmAr7YEheTOMSvpIU0Oo97YuEe34hL6PKV/1t9R6bRc
 ec+BAd0IUlkhjycCbIgXZ7hGjIqT5KJEQcwiwyqj3ZmF4gtDGsW0tODF7pEQlVOAivnV
 7u+w==
X-Gm-Message-State: AO0yUKVHREXCAwt0SLRmMOxtY7FUpDIl+1zHuUNMvEirWUIjOEoHros6
 ia0Qb84TUUdXxpf33r+LcjLN6934fMaTVO3jp/pwrv4NurXo+d9VUOK8G2QhyEU9pv9JUBFxzsd
 9s8vD6NVGqSjOD7E=
X-Received: by 2002:a05:600c:818:b0:3dc:5390:6499 with SMTP id
 k24-20020a05600c081800b003dc53906499mr13658601wmp.1.1677504480834; 
 Mon, 27 Feb 2023 05:28:00 -0800 (PST)
X-Google-Smtp-Source: AK7set8j17rihmR4PnRjPZNfIiGsZQncvoBmO3R1RfbNlYVcX3HsAHTzsNmwUFsPQa1kL1FyJcYnlQ==
X-Received: by 2002:a05:600c:818:b0:3dc:5390:6499 with SMTP id
 k24-20020a05600c081800b003dc53906499mr13658575wmp.1.1677504480584; 
 Mon, 27 Feb 2023 05:28:00 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-150.web.vodafone.de.
 [109.43.176.150]) by smtp.gmail.com with ESMTPSA id
 l21-20020a1c7915000000b003e21ba8684dsm8942230wme.26.2023.02.27.05.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 05:28:00 -0800 (PST)
Message-ID: <6db3c0bd-ce65-1d23-ca6c-ee4a6fb60dbf@redhat.com>
Date: Mon, 27 Feb 2023 14:27:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v16 09/11] machine: adding s390 topology to query-cpu-fast
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230222142105.84700-1-pmorel@linux.ibm.com>
 <20230222142105.84700-10-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230222142105.84700-10-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/02/2023 15.21, Pierre Morel wrote:
> S390x provides two more topology attributes, entitlement and dedication.
> 
> Let's add these CPU attributes to the QAPI command query-cpu-fast.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> Reviewed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
> ---
>   qapi/machine.json          | 9 ++++++++-
>   hw/core/machine-qmp-cmds.c | 2 ++
>   2 files changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


