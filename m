Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88AE6FF9FD
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 21:18:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxBmu-0000go-0T; Thu, 11 May 2023 15:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pxBms-0000gY-7D
 for qemu-devel@nongnu.org; Thu, 11 May 2023 15:17:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pxBmq-0004SJ-5V
 for qemu-devel@nongnu.org; Thu, 11 May 2023 15:17:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683832628;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/YqZb0II87tTR86URZq6mHQmzTlPePW3rrPqSh6DC2o=;
 b=gBh+BRYclIs+NTMl1d0Tg1hVNTDVoofd9NB8WtMx12yW/ZF2zgJakjAmwi9/8mo8+FcWfc
 QzOVWIRxDRHqE/fSbEzV5gQg9UisIgI1nQsKoOoS3N1VNCDEZELvYkXWHP0yMnn9Z6asbK
 +piC+T1nru6YoeE13r1xxtYkdw7z0d4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-FqeFbi7FPxC3SXeshC03eQ-1; Thu, 11 May 2023 15:17:01 -0400
X-MC-Unique: FqeFbi7FPxC3SXeshC03eQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-307bac4c949so1473779f8f.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 12:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683832620; x=1686424620;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/YqZb0II87tTR86URZq6mHQmzTlPePW3rrPqSh6DC2o=;
 b=K3TZCE0jBjPHdoDMG+akEKAQoOYmt/FK3aB1Zo5Z/Lmiywhs7tmLVT8AoGNGOQs2eb
 5NGHhXTpJdwWEdvH/XxmMMO0vcHFqKrz7w2suFD+eOtY4QRZtEN1Y4NPy0Lv07UvRu4G
 wUZkohcZyVqzrfUEh24stpVFJKgt302DmYDcjRSXRn7DIgDcS5Htdw2r/4bDnVh98B2O
 voV6mqaRm7cEedMDHpDL5XHVBAUO+psFHvlignyNXT0yHnL4Urue60vcoTDLvF4Hf+oc
 eBiBWpLmI4mq3Du35oPL6bpDwrp4Bb4Hi1r3G7SbVCRuOXkyOfPMyuBRnSDHVnqco6pG
 qh4g==
X-Gm-Message-State: AC+VfDxz46UGlgm/Epq1IpEInOqnsN1HlZE2xeS1Vvjtk7WMFzCjahQr
 ZkLkLeo05WwXf9gMvQ9o2O4dUd+yumcNcbSU5W9RF0qmkI/INCOa8VuLEOfXEPk4ls7ZVRkSXxg
 9/4Nx626xGhsgsRw=
X-Received: by 2002:a5d:5641:0:b0:306:3817:4a80 with SMTP id
 j1-20020a5d5641000000b0030638174a80mr18368095wrw.0.1683832620386; 
 Thu, 11 May 2023 12:17:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Sl3jybTgAt5XIBGMEjcGswgv4hmiVCTAxh+KXyvf8Ax0xB9n0FyUug/Dp3nZpZQcC2A1KCg==
X-Received: by 2002:a5d:5641:0:b0:306:3817:4a80 with SMTP id
 j1-20020a5d5641000000b0030638174a80mr18368075wrw.0.1683832620084; 
 Thu, 11 May 2023 12:17:00 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 k14-20020a7bc40e000000b003f4272c2d0csm11698135wmi.36.2023.05.11.12.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 12:16:59 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  David Hildenbrand <david@redhat.com>,  Leonardo
 Bras <leobras@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Peter Xu <peterx@redhat.com>,  Andrei
 Gudkov <gudkov.andrei@huawei.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,  Hyman Huang
 <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v2 3/5] migration: Teach dirtyrate about
 qemu_target_page_size()
In-Reply-To: <da6c03af-fb68-4d30-5a9d-42b86c9b102d@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 11 May 2023 20:56:19
 +0200")
References: <20230511141208.17779-1-quintela@redhat.com>
 <20230511141208.17779-4-quintela@redhat.com>
 <da6c03af-fb68-4d30-5a9d-42b86c9b102d@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 11 May 2023 21:16:58 +0200
Message-ID: <875y8y4r11.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> On 11/5/23 16:12, Juan Quintela wrote:
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>   migration/dirtyrate.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
>> index 38ea95af59..6706e3fe66 100644
>> --- a/migration/dirtyrate.c
>> +++ b/migration/dirtyrate.c
>> @@ -314,10 +314,10 @@ static void update_dirtyrate(uint64_t msec)
>>   static uint32_t get_ramblock_vfn_hash(struct RamblockDirtyInfo *info,
>>                                         uint64_t vfn)
>>   {
>> +    int page_size =3D qemu_target_page_size();
>
> size_t? Otherwise,

Nice catch.  Will change it.

Not that it matters in real life. The bigger value that
qemu_target_page_size() can give with current hardware is 64K, so
anything bigger than a short should work O:-)

>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
>>       uint32_t crc;
>>   -    crc =3D crc32(0, (info->ramblock_addr +
>> -                vfn * TARGET_PAGE_SIZE), TARGET_PAGE_SIZE);
>> +    crc =3D crc32(0, info->ramblock_addr + vfn * page_size, page_size);
>>         trace_get_ramblock_vfn_hash(info->idstr, vfn, crc);
>>       return crc;


