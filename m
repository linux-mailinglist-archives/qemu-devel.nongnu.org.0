Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DB23B3E62
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:21:27 +0200 (CEST)
Received: from localhost ([::1]:58918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwh5a-0005j7-9b
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwh4A-0004v5-Tg
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:19:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwh46-0001rS-V4
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:19:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624609193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2OOFCIX191TY1pwR3okMxfD37iva2ABBAsHTD0ZrRPc=;
 b=XcmY0eQsFFKkocfhZnoCloOnRauDTFZn0TUpjrEcshr8lcq8V5Xdh/WOU7vO/OZeMJMTYL
 Su/TZlszRT0LZHj8xsxsoUqZ/4mReQ1hRLheyXldWmoLPsmFbTgQnIiRzdwLlBLXFDWY+t
 unpynOp6xubrZHtb4kWHsY20tD5Ucsk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-NhC6-W8ONxSnhAU1HPRyGw-1; Fri, 25 Jun 2021 04:19:52 -0400
X-MC-Unique: NhC6-W8ONxSnhAU1HPRyGw-1
Received: by mail-ej1-f71.google.com with SMTP id
 jw19-20020a17090776b3b0290481592f1fc4so2833250ejc.2
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 01:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=2OOFCIX191TY1pwR3okMxfD37iva2ABBAsHTD0ZrRPc=;
 b=OCT0KLgi038U31FLbQW3hAuTJ+EG1354eCYWSqq6eX87IFkPiHgZLbasTOAQd3GTUO
 274BAQu0pvanrIG/p182jgaiFAd0b893BTuZ3wiCD8wg6G4E54xfatooRhaNChOMa6fS
 en5cYhOpQb+5qGxo9wt2YKLDFpqmjJ9Ic8Y42DSQthx9XHxvhzWSKwAysPYviMSxM9UW
 cjlzIS8yN2sngezh8P3ZjeKwpx1m+ekdGw98Jep+Q2mCi8zab3CrjN9F3/3Fe1LfyihT
 P7U4FUO+Bw9T7ikjQLfQ0Sc8TyPU0CzYpevP2o5HbFgJDMkxqoS+nYS4rd55VXXEuLwQ
 ey2A==
X-Gm-Message-State: AOAM530d30fWdMG77v5VUFyc3V5rd4qIxPmUdHOskHqrkly/1NExIVmM
 g2qHzoY7vYaXSzCy7VMil8msu2Qa2MgvQ6LxJowFPKJkuKEgTlFvBvDl2KPKt45N22+BbembIrV
 qir2VFE+yDFyYbEw=
X-Received: by 2002:aa7:dc0a:: with SMTP id b10mr12787385edu.134.1624609191221; 
 Fri, 25 Jun 2021 01:19:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC7mRyFBf1T7M0D9went7WhkZ8ubDSHO6ta5VAION+Wt++x5a4QV21EKsM5qltAxUXbBtGww==
X-Received: by 2002:aa7:dc0a:: with SMTP id b10mr12787366edu.134.1624609191062; 
 Fri, 25 Jun 2021 01:19:51 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 j24sm3456331edv.48.2021.06.25.01.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:19:50 -0700 (PDT)
Subject: Re: [PATCH 06/11] file-posix: try BLKSECTGET on block devices too, do
 not round to power of 2
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210624180423.1322165-1-pbonzini@redhat.com>
 <20210624180423.1322165-7-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <8092ed59-d1a1-4fff-a66c-a3fdc5bb4e05@redhat.com>
Date: Fri, 25 Jun 2021 10:19:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624180423.1322165-7-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: qemu-block@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.06.21 20:04, Paolo Bonzini wrote:
> bs->sg is only true for character devices, but block devices can also
> be used with scsi-block and scsi-generic.  Unfortunately BLKSECTGET
> returns bytes in an int for /dev/sgN devices, and sectors in a short
> for block devices, so account for that in the code.
>
> The maximum transfer also need not be a power of 2 (for example I have
> seen disks with 1280 KiB maximum transfer) so there's no need to pass
> the result through pow2floor.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/file-posix.c | 67 ++++++++++++++++++++++++++--------------------
>   1 file changed, 38 insertions(+), 29 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


