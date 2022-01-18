Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E5A49226D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 10:18:29 +0100 (CET)
Received: from localhost ([::1]:44292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9kdI-0005pd-9d
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 04:18:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9kb4-0003kB-Sw
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:16:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9kb2-00050h-32
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642497367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W8r5FFYk7G6VEt6+tZK30ez7mbMLaOYio4TglxN/yxY=;
 b=VAekLn6v/QD2WAlPymUlRiIEZxabdrva9nkCdWvTImRPEEh0gKJ2J8WvRe0XI3gGgsBvWY
 heti3Of7B7EkxrAjyon4ucGURMfZS/2lutKuz/hsiKtLaTDN1M9CxpBQs3iDGvZVPdUYPo
 pCIRH8h57WxNoAFc6p0GqKotGocxuWM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-DniQzclXNmKXbH0gk9nORQ-1; Tue, 18 Jan 2022 04:16:05 -0500
X-MC-Unique: DniQzclXNmKXbH0gk9nORQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 p7-20020a05600c1d8700b0034a0c77dad6so1610879wms.7
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 01:16:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W8r5FFYk7G6VEt6+tZK30ez7mbMLaOYio4TglxN/yxY=;
 b=AiH5/5IxPxLFxvhk3k6pjVIt5XtWHfey+esquBjdjDOmMc+qb9p4lGqq4XEmCTCO7d
 cUXHsZTi2cIg+g5hPEig5iLfZE/JgK9ieAs4B+9WUrH8Tps2k3Ac/IAbpIHWPgvQ+utd
 HiPqfAzs3jHSnsyRcLHwPM6C7eUhMkxPjLVt04EU0kydwyBFZ0l6cncCX8nLHFoNaNTF
 Jld9AXwDR8Gs3EkWU9h0mVX/339zucXT6T1lDkzbZh6Stm9cQSqlKPFx/5hDAn5u46R1
 61ESMjyx7Hrn7bAsgYgpmZL1Sz2VPa0rlzhaWjdI8XGe4bQ/QHOxqTPb8uCiysuBrABi
 UAjg==
X-Gm-Message-State: AOAM5309rkFIiUMKeS4yoJdJPVOcQ79F0aqU0cAS4UAmK0K5joq53E+Z
 1YLBkKqAqDPoX1CuYWSrorshuRe9RsEQu5HCuz9upuSYALX4Qf1H8x2LlS+9Zk8APN818696+7s
 8qQa+hChi8k7BfKc=
X-Received: by 2002:a05:600c:354f:: with SMTP id
 i15mr4082592wmq.25.1642497364669; 
 Tue, 18 Jan 2022 01:16:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy83szH1MKOWsg03CT+VjGT0++DDSZsiBojifZ/ylFX6Rjo6uk3trJ9wq6AqqE93yYxqnWnPA==
X-Received: by 2002:a05:600c:354f:: with SMTP id
 i15mr4082563wmq.25.1642497364469; 
 Tue, 18 Jan 2022 01:16:04 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id v8sm16343677wrt.116.2022.01.18.01.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 01:16:03 -0800 (PST)
Message-ID: <23027d70-f144-61e9-1a74-e3511e5509ab@redhat.com>
Date: Tue, 18 Jan 2022 10:16:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH RFC v2] MAINTAINERS: split out s390x sections
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20211222105548.356852-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211222105548.356852-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/12/2021 11.55, Cornelia Huck wrote:
> Split out some more specialized devices etc., so that we can build
> smarter lists of people to be put on cc: in the future.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Acked-by: Thomas Huth <thuth@redhat.com>
> Acked-by: Halil Pasic <pasic@linux.ibm.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> v1->v2: move some sections to "Devices", some minor tweaks
> 
> I guess that can go with the next set of s390x patches.

Indeed. Queued to my s390x-next branch now (together with Eric's update):

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas



