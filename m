Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CEB3A9B66
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:02:26 +0200 (CEST)
Received: from localhost ([::1]:44562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltVBZ-0003AB-LF
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltV8V-0001kq-2X
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:59:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltV8T-0006xk-JD
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:59:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623848352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HvnLu4wtA8W3qfpli8vvjIhbgWGCMUjR4AJj1aXLJfQ=;
 b=YWogkfmFUBqfz5xxLIgaU9p/yEB4GrkDUvYx9ceSWf7SNth96W4EMfRmvITGp0DjkqFBbf
 BPATbz0etvx4legrkGJx6bxWJL6YzXmPmhYnZ3uH5avvJ+Nk1/PzP5PeQkCX57CtX7tnN+
 uDxUS0O1ajLcc1FcIAFtpNi7yL60+Eo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-5mt52WGhOEKFLXjIstDlPA-1; Wed, 16 Jun 2021 08:59:11 -0400
X-MC-Unique: 5mt52WGhOEKFLXjIstDlPA-1
Received: by mail-ed1-f72.google.com with SMTP id
 dd28-20020a056402313cb029038fc9850034so968970edb.7
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 05:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HvnLu4wtA8W3qfpli8vvjIhbgWGCMUjR4AJj1aXLJfQ=;
 b=f09IofoNdpJTmw08fLFMd1ta+yf9jbpW7f/S+Lj/USApHX8QoDEY84wxrODIEruL4d
 Lg3/Cl/ZIvVOpsG6Mvh3+Wrb86q/lunRL8MoWc8oJY7mH9CV4ysI0au/QdTHQbTwiG18
 c4Ux1H0ys+vB7Jrru5hZauU3qYLvVNKeqZRFfqzYehq7dcx+ypA1YOqKHSBPepz+uocf
 YtzGHYDkSq6y7whRK/HeSZ3DLgpMRpxBDETQhT+AUPLcuvP+4iVNTHiP7/bvdO5sGUxm
 oaEIrkSWNPH4svChb7u6W0GsY05sBzKb5zToImswhumOovjss41TZIKI1hTbBH/VcbHM
 u1+Q==
X-Gm-Message-State: AOAM530ptJ1RHC63YrF+55rlOGatCG53wDLrrT8walGiH21a0E1GJe4R
 f52ZL+KeEKDs/pJ8cwnxzyEUpCFS1Nht2390t8L1WPWSKCBBSC4lZqcqX4QtRLOFnjIYkVJ2Nbb
 uSv+nG2OIL7bdF34Rb8pmkjefCgA5jtwiVcMU243tr9KmyXTT9mRj0YMKHEyMbFH7Okg=
X-Received: by 2002:a17:907:7ba8:: with SMTP id
 ne40mr5235264ejc.209.1623848350137; 
 Wed, 16 Jun 2021 05:59:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXmT91zdFjI+lq9wO7Nmqc9vzkr2+4DMLpe9qiAfsNuC65aAipgb16sHZqDEdBOD0o5MO4vQ==
X-Received: by 2002:a17:907:7ba8:: with SMTP id
 ne40mr5235250ejc.209.1623848349983; 
 Wed, 16 Jun 2021 05:59:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m16sm1561070ejr.74.2021.06.16.05.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 05:59:09 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] target/i386: Refactored intercept checks into
 cpu_svm_has_intercept
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210616123907.17765-1-laramglazier@gmail.com>
 <20210616123907.17765-2-laramglazier@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8d83cdd8-8cea-7834-b7e8-20675d66f242@redhat.com>
Date: Wed, 16 Jun 2021 14:59:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616123907.17765-2-laramglazier@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.17, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/06/21 14:39, Lara Lazier wrote:
>   cpu_svm_check_intercept_param(CPUX86State *env1, uint32_t type,
>                                 uint64_t param, uintptr_t retaddr)
>   { /* no-op */ }
> +bool cpu_svm_has_intercept(CPUX86State *env, uint32_t type)
> +{ return false; }

This needs to be declared "static inline", since it's in a header.

Paolo


