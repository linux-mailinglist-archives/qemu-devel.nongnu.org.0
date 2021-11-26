Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6E045F2BD
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 18:14:29 +0100 (CET)
Received: from localhost ([::1]:34788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqens-0004Yp-7N
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 12:14:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mqekw-0002AF-5r
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 12:11:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mqekt-00007u-5G
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 12:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637946681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xw1sw6Nq+ypCv4aT9fCD9c+2JcCA7IFrmkUi4S+icPA=;
 b=GRRa+t5dYyK2ZqhRo2sLQZD+22tyP4iJz2feB/UHPamhUe0iWPB610TsKw9BC0F3pqe4LJ
 T/GMK/TBegtp98iQdi4MVkCYLL1WIkcBXuBpifQhg+HUICOPbYtFcD8dcQsfZ0pEL2OXBk
 NZiMDSEKUOtYrIqnXAizk6PhPYyEOvQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-200-NshXHs4uPu-R9RLCwmTxiw-1; Fri, 26 Nov 2021 12:11:19 -0500
X-MC-Unique: NshXHs4uPu-R9RLCwmTxiw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so5353130wmj.7
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 09:11:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xw1sw6Nq+ypCv4aT9fCD9c+2JcCA7IFrmkUi4S+icPA=;
 b=L1nNtxKXNZJZV/24uCkX6YB7nUvhrLrKZ0HGK281mYKtXpzOHWgokO4QPJEjLQv33g
 T8iAeO47XxIOppWOPeNGKAL2mkS0c1IS7pRI/U5FuhKJ2jaDCzcbbtcXN9Gx6BeI7/CN
 rS72G0lehmsxAfcK6FA+F5svhEDODdWb9nnIzEX5u8i41D0K8PwzW64VdwM8PaSLcTQD
 TISZjrjMxYutRM2J580tprm7KXF4/mJHVjlAGprFPpoKbu2Iz0cZhknohHCQgMcUhbnd
 M3uhGKtU68KMBqCRa6DSDA/IEL0XX7gPo9Vhry5lzGGCEwBGznVfFIlKmLT3DhSFtfe5
 +Icw==
X-Gm-Message-State: AOAM531ehXTemNmyw8F/PDVTpG8WPUsCnu7015j8Kf9eQt4R09XtaDkB
 2Wkq++tIbF6ABa+NZAERZq0W5FcVDndbQP5L2BSVmQKaQCwcdBwwFmhSt3Hss767Q/zQ4vEBTEq
 MWiKghXYfWIQufjU=
X-Received: by 2002:a05:600c:1c1a:: with SMTP id
 j26mr17069079wms.28.1637946678423; 
 Fri, 26 Nov 2021 09:11:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwztvj048KYf0KJwtf9VX68G5vsCsZ4zKTSrxXq3JOwkmAd0bwLjT68Diwj43YWcH2ppUEEjg==
X-Received: by 2002:a05:600c:1c1a:: with SMTP id
 j26mr17069050wms.28.1637946678202; 
 Fri, 26 Nov 2021 09:11:18 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id r15sm11281582wmh.13.2021.11.26.09.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 09:11:17 -0800 (PST)
Message-ID: <911f6985-f985-2a6f-abde-bf55c2a9544a@redhat.com>
Date: Fri, 26 Nov 2021 18:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/1] MAINTAINERS: update email address of Christian
 Borntraeger
To: Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20211126102449.287524-1-borntraeger@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211126102449.287524-1-borntraeger@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.993, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/11/2021 11.24, Christian Borntraeger wrote:
> My borntraeger@de.ibm.com email is just a forwarder to the
> linux.ibm.com address. Let us remove the extra hop to avoid
> a potential source of errors.
> 
> While at it, add the relevant email addresses to mailmap.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> ---
>   .mailmap    | 1 +
>   MAINTAINERS | 6 +++---
>   2 files changed, 4 insertions(+), 3 deletions(-)

Thanks, queued it to my s390x-next branch now:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

   Thomas


