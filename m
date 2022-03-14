Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0E04D8524
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 13:38:13 +0100 (CET)
Received: from localhost ([::1]:43880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTjxj-0002n2-HP
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 08:38:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nTjvO-0001j4-Ur
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 08:35:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nTjvK-0007G1-KH
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 08:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647261341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kkIQkTPpgnE2yF+vtW+XsPNjLd2BCNHoV2rrvGjk49o=;
 b=THG42CDwirRcKITRrf7BGJ8ofN+2iN6frI9hKHqtd/EXBEAOUvrzgAE+9pAUQlSZBXfpYq
 VO//4LgvZUuptX9HIopp1XoHEYXWHcnDeeEDjOWHCDyOUL0+IsAEACFIrC8VvFsPt+fOg/
 zwloA4wd1G42l0mT72ptaO04dON3ay0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-6BknvNn2MQWFIGO6yV_E3A-1; Mon, 14 Mar 2022 08:35:39 -0400
X-MC-Unique: 6BknvNn2MQWFIGO6yV_E3A-1
Received: by mail-wr1-f69.google.com with SMTP id
 l10-20020a05600012ca00b001f1e4669c98so4289185wrx.23
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 05:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kkIQkTPpgnE2yF+vtW+XsPNjLd2BCNHoV2rrvGjk49o=;
 b=zOhWm2l8NC2K4fp3U5pWpF0Co5rQWBdAIFNkuHO0dOgPj/x7IHwqgmEAHNDzj3TLGh
 42KjplPlDcaENdnC8DjfxSWtEdxLYUkVhY5CqgKZClT+1T790aDcwBGnkJMiMCF19wOe
 kONBnu2AA7M65/YkMa8RL29B8ljeiiMyxdvjt5tquXocqXd6ZlPRaN8ZnbXwO/fUB8hd
 WawU+kHRiMgyIZawIdI9NsiPlaKM42txlQXsTyyPe6UBvLT6Ggkv59d8outVyigs+oBE
 2Sw/dMkKyaDdVX3uBlr2sAarwDU34pi0bMKlODxSOjPGWTHcaRNo2ZaJ+Tn88crp1bCR
 WaLA==
X-Gm-Message-State: AOAM530GXqWDN5NeP7CXizBbYc2bZVhLN6rzvouqnNU558KSMf0ij339
 2xzAcGKhSoOsTxE9pUg72G+eC4Ij4wp4BDPMkzcxhnmL7/7H2pjpEQMlIBCFhQ4Oef2dBiVDn3k
 Ygo9QHuzZ61mfINU=
X-Received: by 2002:adf:f18f:0:b0:1f0:761:491d with SMTP id
 h15-20020adff18f000000b001f00761491dmr16029284wro.505.1647261337667; 
 Mon, 14 Mar 2022 05:35:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzx/DEohZXdCs4x6OFxNJA0hARAtJLSZDnD4aGSAq6yl90SPMh17tLKKVRnlPi514MhPVq/YA==
X-Received: by 2002:adf:f18f:0:b0:1f0:761:491d with SMTP id
 h15-20020adff18f000000b001f00761491dmr16029269wro.505.1647261337434; 
 Mon, 14 Mar 2022 05:35:37 -0700 (PDT)
Received: from [192.168.42.76] (tmo-099-109.customers.d1-online.com.
 [80.187.99.109]) by smtp.gmail.com with ESMTPSA id
 l18-20020adfe592000000b001f064ae9830sm13032836wrm.37.2022.03.14.05.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 05:35:37 -0700 (PDT)
Message-ID: <704ca662-60c7-9f8e-93dc-e71b28ba443d@redhat.com>
Date: Mon, 14 Mar 2022 13:35:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 0/3] Fix BRASL and BRCL with large negative offsets
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20220314104232.675863-1-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220314104232.675863-1-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/03/2022 11.42, Ilya Leoshkevich wrote:
> Hi,
> 
> I noticed that sometimes jumping backwards leads to crashes or hangs.
> The problem is a missing cast.
> Patches 1 and 2 fix the problem, patch 3 adds a test.
> 
> 
> v1: https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03356.html
> v1 -> v2:
> - Skip the test if mmap() fails (Richard).
> - Replace test opcodes with inline asm (David). Since we now want to
>    skip the test if the code cannot be mapped (e.g. on a 31-bit host),
>    we shouldn't be asking the loader to map the code right away. So
>    the mmap() approach stays.
> 
> v2: https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03387.html
> v2 -> v3:
> - Use MAP_NORESERVE (Christian / David).
> - Unhardcode 0x100000006 (Richard).
> 
> Best regards,
> Ilya
> 
> Ilya Leoshkevich (3):
>    s390x/tcg: Fix BRASL with a large negative offset
>    s390x/tcg: Fix BRCL with a large negative offset
>    tests/tcg/s390x: Test BRASL and BRCL with large negative offsets
> 
>   target/s390x/tcg/translate.c           |  4 +-
>   tests/tcg/s390x/Makefile.target        |  1 +
>   tests/tcg/s390x/branch-relative-long.c | 68 ++++++++++++++++++++++++++
>   3 files changed, 71 insertions(+), 2 deletions(-)
>   create mode 100644 tests/tcg/s390x/branch-relative-long.c

Thanks, queued to my s390x-next branch now:

https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


