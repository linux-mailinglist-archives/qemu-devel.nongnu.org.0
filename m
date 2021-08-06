Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FCF3E2658
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 10:48:01 +0200 (CEST)
Received: from localhost ([::1]:34752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBvWJ-0006dq-Re
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 04:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBvVZ-0005wW-5v
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:47:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBvVW-00052C-NL
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628239628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uoTvZnmA9yGBaGohl/jSAUwj3OwZR0GOKUwnuOxtI5U=;
 b=ROZYS63DPlQXVViP7ZTzdcbTibhKM6nFw9QKj4KhgzmDRzRX1aSaxh6zVpgEjd2y89ELjC
 IbSuOGDabxiBwSf75bTG9L92Pysbz53w9Gnr11IYJ/0X/A9vtJDOWbftJdT9mLdIMTlMYR
 6ZJ9IvlLp6pHTDjnaG1+4MshBo7y7Dc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-_SB_U7-cNwOAgDxxA2kmxQ-1; Fri, 06 Aug 2021 04:47:07 -0400
X-MC-Unique: _SB_U7-cNwOAgDxxA2kmxQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 a18-20020a05600c2252b02902531dcdc68fso3620359wmm.6
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 01:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uoTvZnmA9yGBaGohl/jSAUwj3OwZR0GOKUwnuOxtI5U=;
 b=mpUhTI9tYQtCafSRANpdOEoq49uhgi/Hd/8PTWFC6l0eH7QrxhqvpvyXwuGiOeVPos
 Ko6Q/epA9aZSQcaekFby+sZkQpdqSpuYL4TE9eT/DjMzaaY1anzmKMrlxJxWe4yOeryl
 koffY/Oji8E+F6r2ey/45EUxdu38a0t1FJ/TLbbb6h5uDzxysscjsJRUb1xCw/NijjjK
 JMAzXOA2NRx8OPyMXOhrixqnWlYkdxRKiUsoBIxJ/OKs1vjx2liSDdUG6G+Ow/fPVVQZ
 0DDtEAthEMPxxgal1aSdkzgT26hsccYNr+NOFkWo8meyivSfxZu6JmO83rFOckflAFom
 d56w==
X-Gm-Message-State: AOAM5332oq4EgnrFzhkFtduPQuAnplqE2Q4w2oRz7nQTv0Y81qFZltBh
 V939QgUxR2Egq5J64aFdcwNXN1LUrMsJ8wk/Z74E9XMUHnTzXTU7tyXiw90NxQkuaQXL58uHk//
 eTzCF0UNusRvaROc=
X-Received: by 2002:a5d:53ca:: with SMTP id a10mr9381046wrw.197.1628239626629; 
 Fri, 06 Aug 2021 01:47:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmR/1MukFXuDSce3xe803K7nHGHumfXmbn6ACrelUeWFDwiVUI4/WGdMku7JMssfrJbV+Sag==
X-Received: by 2002:a5d:53ca:: with SMTP id a10mr9381021wrw.197.1628239626427; 
 Fri, 06 Aug 2021 01:47:06 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id f3sm9073592wro.30.2021.08.06.01.47.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 01:47:05 -0700 (PDT)
Subject: Re: [PATCH v1 09/12] hw/s390x/s390-skeys: use memory mapping to
 detect which storage keys to migrate
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-10-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9f614da7-e1c6-b2c9-04f1-ee8ad8c60b5e@redhat.com>
Date: Fri, 6 Aug 2021 10:47:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805152804.100333-10-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/2021 17.28, David Hildenbrand wrote:
> Let's use the guest_phys_blocks API to get physical memory regions
> that are well defined inside our physical address space and migrate the
> storage keys of these.
> 
> This is a prepearation for having memory besides initial ram defined in

s/prepearation/preparation/

> the guest physical address space, for example, via memory devices. We
> get rid of the ms->ram_size dependency.
> 
> Please note that we will usually have very little (--> 1) physical
> ranges. With virtio-mem might have significantly more ranges in the
> future. If that turns out to be a problem (e.g., total memory
> footprint of the list), we could look into a memory mapping
> API that avoids creation of a list and instead triggers a callback for
> each range.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/s390x/s390-skeys.c | 70 ++++++++++++++++++++++++++-----------------
>   1 file changed, 43 insertions(+), 27 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


