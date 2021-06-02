Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BA3398A35
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:08:46 +0200 (CEST)
Received: from localhost ([::1]:36262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQc1-0005Mg-G2
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loQal-0004cQ-Dk
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:07:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loQag-0000Np-Tz
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:07:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622639241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k+kSOnqgVadNBcsJPadQgch+yIsKtlwFdnRGUUt5Fhs=;
 b=TVKJp7Ij05S7Cer9S3SokskK/8weO0DXRG/LMz9dNzPM2lFti7TAs4qeQLfQpRUZtkF8uf
 8iUr+Z+DJO8/H/Q4pnOy3ou4XBerHA/m1MEg69U5Crooq7UIU8C82f55NwVyYIRwzeLH9T
 +0jTaoZ6dHT6bap1kWEK85rYaH44VAI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-_vMfG0SyOri4OV-XG5kWuw-1; Wed, 02 Jun 2021 09:07:19 -0400
X-MC-Unique: _vMfG0SyOri4OV-XG5kWuw-1
Received: by mail-wr1-f72.google.com with SMTP id
 x9-20020adfffc90000b02901178add5f60so1006096wrs.5
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 06:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k+kSOnqgVadNBcsJPadQgch+yIsKtlwFdnRGUUt5Fhs=;
 b=tj3Kga4/sMUY/hOoxlWk2CJ2mKZ6d7m6uFSS499A08sSNrDJhuOJ7yHA80UUKOjHAO
 bIYjWJDI1HoPBSXDCzx41/I3XTEQyN++r6c/dIyI8sroxLGzbg/8j9Hcd1TZUhypPBbB
 Y7a5cj4CWL4TZSoHV2YpF6e2iIn+/UQKIagiY0rlIoRTvFNJmWmySvS03mGLX3lLPslc
 yzQDKxQIJsWRReUcR+rvC01UzcBqCgBqap6z9lv3o5VeAgBYfAlgggXjFtR1K1ytQ1zI
 nzVDBPDCWixGJHuUERYmseEgNqPjX6iqZj64t53TIstBWjEWTQHO/A8wln+LcIdQLKdh
 JraQ==
X-Gm-Message-State: AOAM5335UnQmd9JFUDfIfH40aGRAa3zYY1OB0nSdCtlbLjC0b4gPBZ8/
 epZ5F8vM7CH3zk9DNmZr8Ghh9A2R6Z/wRKh+7dI8IYREBuBHJeI3kZH063Xk7IP5Jm9vuNf9Gyn
 J21tt8D0IZ0yoZLBhUaHY9WRsWh/pqAF49fS5Ffgvd1CrvaXWL5JDavl3xZR+xow=
X-Received: by 2002:a7b:c8ce:: with SMTP id f14mr2221671wml.88.1622639238139; 
 Wed, 02 Jun 2021 06:07:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypL45nEscpSFMsm5fTHuhzLxwLCXr7hPIuDhaL05nVpxGlb7JeP4PuPHQP1h1s/86/LU+oKw==
X-Received: by 2002:a7b:c8ce:: with SMTP id f14mr2221644wml.88.1622639237940; 
 Wed, 02 Jun 2021 06:07:17 -0700 (PDT)
Received: from thuth.remote.csb (p5791de31.dip0.t-ipconnect.de.
 [87.145.222.49])
 by smtp.gmail.com with ESMTPSA id s2sm2652373wmc.21.2021.06.02.06.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 06:07:17 -0700 (PDT)
Subject: Re: [PATCH] s390x/kvm: remove unused gs handling
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210602125050.492500-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2fa121d9-e2a8-fa42-00db-6b9ec6a13627@redhat.com>
Date: Wed, 2 Jun 2021 15:07:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210602125050.492500-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/06/2021 14.50, Cornelia Huck wrote:
> With commit 0280b3eb7c05 ("s390x/kvm: use cpu model for gscb on
> compat machines"), we removed any calls to kvm_s390_get_gs()
> in favour of a different mechanism.
> 
> Let's remove the unused kvm_s390_get_gs(), and with it the now
> unneeded cap_gs as well.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   target/s390x/kvm-stub.c  |  5 -----
>   target/s390x/kvm.c       | 10 +---------
>   target/s390x/kvm_s390x.h |  1 -
>   3 files changed, 1 insertion(+), 15 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


