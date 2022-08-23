Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9FE59E09A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 14:38:21 +0200 (CEST)
Received: from localhost ([::1]:45512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQTAh-0000ml-IK
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 08:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQT44-0004NO-7i
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 08:31:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQT3z-00041D-Aq
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 08:31:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661257882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A2wOIGiXyyeHbeE7TbB8Uh41BrPHJ43vsIw/En/DjOg=;
 b=LbXBzz1cPJgj/5RufU15yGExekC7quflUtKjw3HY9JDb11TEKfuwnrRk0kMRbYcXDJBUbN
 a2/6G2qgqDaaxn6b3o60AJSrtlHGPp1koUYDC+htnsR/2OXejWt9uDMq7bxKrp06XNw/P1
 vCe+4nGyB/MpmxqcXZrlQ3oU3vHtc/0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-Jav0udHoPha82x12Z5jCQA-1; Tue, 23 Aug 2022 08:31:20 -0400
X-MC-Unique: Jav0udHoPha82x12Z5jCQA-1
Received: by mail-wm1-f72.google.com with SMTP id
 n1-20020a7bc5c1000000b003a682987306so288065wmk.1
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 05:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=A2wOIGiXyyeHbeE7TbB8Uh41BrPHJ43vsIw/En/DjOg=;
 b=IBrgqytzM2Mrgsu7a0Nf2Oq+BsOJYN/w1rXXMXJhEPJJiZxhKkSinP6LfUEnrNUfCu
 4o73gC1fdgEB5JrNrJPfglfX+wFkbzFpfsUtTTS0a2xqc/H5SKqV/QLGgvhcU//rcDED
 3Ihas9QDyYL7QolORgRQ1S4idlj8TmCGRFYp3UtWbOkDh3gd3g5CbuJI8FNFLO8HnmJA
 P7niFDSLonL0lGIu8UIjmGJuG53T3GP8RkFYAUbjREz1bw88wV5xoyrY1M1oWpbubNYR
 C9Ncj8WyeYOqbmJNnw5x5BtZbF+yQr/4LsuKzx264VkhKy80t1Be07hoCyXJ5DQsiTg/
 KxYA==
X-Gm-Message-State: ACgBeo3nQ1eAX0kZtCQyNW1FJPVCpDnbmfmCT0SlxE57tEynlS5GJVYO
 VLBhSzpff0wOga3SBi8JvmQYu59tfdc0RdF/5oXdEFuP9Ua3ZcXk7J2poZ74CGfAQkDcFua/Xpi
 HarfeiptzZGE1EhY=
X-Received: by 2002:adf:f911:0:b0:21e:c0f6:fd26 with SMTP id
 b17-20020adff911000000b0021ec0f6fd26mr13229215wrr.361.1661257879855; 
 Tue, 23 Aug 2022 05:31:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7s9o5x1PiEESCd6C73V7tq3iwnW8+tZJ/bxVWWIjyuYt+Oh4wXidu2eJ4d2xdyk+/kEGWVyQ==
X-Received: by 2002:adf:f911:0:b0:21e:c0f6:fd26 with SMTP id
 b17-20020adff911000000b0021ec0f6fd26mr13229201wrr.361.1661257879635; 
 Tue, 23 Aug 2022 05:31:19 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-217.web.vodafone.de.
 [109.43.178.217]) by smtp.gmail.com with ESMTPSA id
 v5-20020a5d6105000000b002251c75c09csm16729959wrt.90.2022.08.23.05.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 05:31:19 -0700 (PDT)
Message-ID: <b814ccb7-3a18-c79e-ff79-df6ff41463d8@redhat.com>
Date: Tue, 23 Aug 2022 14:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] s390x/cpumodel: add stfl197
 processor-activity-instrumentation extension 1
Content-Language: en-US
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Janosch Frank <frankja@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220727135120.12784-1-borntraeger@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220727135120.12784-1-borntraeger@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/07/2022 15.51, Christian Borntraeger wrote:
> Add stfle 197 (processor-activity-instrumentation extension 1) to the
> gen16 default model and fence it off for 7.1 and older.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
> v1->v2:
> - this is on top of "hw: Add compat machines for 7.2" from Cornelia Huck
> (please queue afterwards)
> - move fencing to 7.1
> 
>   hw/s390x/s390-virtio-ccw.c          | 1 +
>   target/s390x/cpu_features_def.h.inc | 1 +
>   target/s390x/gen-features.c         | 2 ++
>   3 files changed, 4 insertions(+)

Thanks, queue (together with Cornelia's patch) to my s390x-next branch:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas



