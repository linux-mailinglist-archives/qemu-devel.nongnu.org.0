Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4414BF36B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 09:21:08 +0100 (CET)
Received: from localhost ([::1]:40758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMQPz-0003Jp-4T
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 03:21:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMQJd-0001RW-Ap
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 03:14:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMQJZ-00022J-Uz
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 03:14:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645517669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Xipu9FGb5Qh4PzvfZKh5mK1DfDzKbMW+Bx39wa6CWg=;
 b=L66q1+7baeAgCJ/LqdpqMKVmDbbkdTnHJbs5FevK6rb9ZWad6CR5idZTkhIvWqfMrdi5nf
 94oUiUgiUekE9bZCxS6QE01z5fnYXtWF8Tie5UgzSdyjd9t/kxgpg45DTAP4JaNoi9KAj3
 758q+neB8Lwjl4acJH6EhmCoy6s4m3g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-ZCiu9UUGMCSKY0MbNBAsdw-1; Tue, 22 Feb 2022 03:14:27 -0500
X-MC-Unique: ZCiu9UUGMCSKY0MbNBAsdw-1
Received: by mail-wr1-f71.google.com with SMTP id
 y8-20020adfc7c8000000b001e755c08b91so8600533wrg.15
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 00:14:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9Xipu9FGb5Qh4PzvfZKh5mK1DfDzKbMW+Bx39wa6CWg=;
 b=heCTAQsnowlEo5MKXo9RnuAtNhw3H4WoFTIbMEWbuKMV0jQW7sBo/4gwySGQVDodk0
 XE1sK0ILBIJrpHsTdzsFi/QLQWfhWhN1NfTpEubAgNJwv8P5ykLQBdHZ4Sq28ixP0rPH
 HglridVWRxUqf2fQwzqLCH6hegf5KxA3GDB4JNbLevApLOnxJoBsrR5Cq3xs3NvVVPKs
 +M3cI4gKkbtobGYVTsP2Z6nPfEDFmvMwZfvgJ0u2Vlb7ywOJzMeUJ2rVbgloioTr3GdS
 Xzk8SAK8fENamO+7uBm8yyfaC5nhgVxb0l2k6cVg4LgGHu3i/X2tzeoS/PuOx3RmeWKp
 ndjw==
X-Gm-Message-State: AOAM531ZdXQou2BK/f8axLNWUCJgWb1s1ry1vZEJQFlcKt7A5EIaDG/T
 7/RCEuykp0ZNYy+E5SRowzJg9QOP/ykJB+1jsDeF4036sTULGV7sRfxXlCjkZONOCm6x+j26JuC
 wLUG3k5UJhp5Vksg=
X-Received: by 2002:a5d:5191:0:b0:1e3:4f1:b53f with SMTP id
 k17-20020a5d5191000000b001e304f1b53fmr18396287wrv.538.1645517666469; 
 Tue, 22 Feb 2022 00:14:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjA3AFIysyVXuQCicYgAqW1RPfgNAIQn/0J1iHjEJyf9sK0EGifz+duoYS2gSGe7mhNyijrQ==
X-Received: by 2002:a5d:5191:0:b0:1e3:4f1:b53f with SMTP id
 k17-20020a5d5191000000b001e304f1b53fmr18396274wrv.538.1645517666267; 
 Tue, 22 Feb 2022 00:14:26 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id f14sm1897082wmq.3.2022.02.22.00.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 00:14:25 -0800 (PST)
Message-ID: <0ee3af15-0d52-a15e-e261-5d138ca2cb7b@redhat.com>
Date: Tue, 22 Feb 2022 09:14:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] gitlab: upgrade the job definition for s390x to 20.04
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220221230607.1277120-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220221230607.1277120-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/02/2022 00.06, Alex Bennée wrote:
> The new s390x machine has more of everything including the OS. As
> 18.04 will soon be going we might as well get onto something moderately
> modern.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
>   .gitlab-ci.d/custom-runners.yml               |  2 +-
>   ...18.04-s390x.yml => ubuntu-20.04-s390x.yml} | 28 +++++++++----------
>   2 files changed, 15 insertions(+), 15 deletions(-)
>   rename .gitlab-ci.d/custom-runners/{ubuntu-18.04-s390x.yml => ubuntu-20.04-s390x.yml} (87%)

Reviewed-by: Thomas Huth <thuth@redhat.com>


