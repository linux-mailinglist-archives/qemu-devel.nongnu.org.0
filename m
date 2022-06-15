Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E33E54C7EA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 13:53:24 +0200 (CEST)
Received: from localhost ([::1]:53170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1RaN-0003tN-2U
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 07:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o1RWq-00016Z-AN
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 07:49:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o1RWk-0006lZ-3z
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 07:49:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655293769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ckgJLnA02HYBQu32vjYDoknctz2PhLaLWWm4YNyVOZA=;
 b=dQ+8HvvTOML1BBjNH5OxChgLifA3A8YwrKuvwJzakcmzZWaQRXC1MBE5RPOY3+EadjRbhu
 dIWIm2N+DPSQ7Gycve2hHYbTqwYBugf/UFV0xYPvwlfBIPkQDaKuafVmSS1cthITeufKiv
 G65AnyXsbxlbbUJ+siQM1j/88uUM4cE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-Wpp2n1_fN2-p9PCRN-lWEQ-1; Wed, 15 Jun 2022 07:49:28 -0400
X-MC-Unique: Wpp2n1_fN2-p9PCRN-lWEQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 u18-20020adfb212000000b0021855847651so1778353wra.6
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 04:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ckgJLnA02HYBQu32vjYDoknctz2PhLaLWWm4YNyVOZA=;
 b=J4mdiQtDxOdEok0mecxW+k7MXJUW7/W9CQHhv4DrpkSI2PAIHlTf/jDTmu/8BTLnEQ
 jhImCwKhjoa5bhToMs929C0nPFOJbuKyOUoWEJJyNE18OCbavGKds5bf4sXFW8edPsnF
 UzTbjHte1e06/3BIim0NMpZcAe45SLktvKN4xa8f3a2XOUcvH230BEoukn16oNSutSOT
 g/MTGrw3YgwY7sGrplAFdrsERXy5QlyjmPGOqbl0KPKLr37e4I6hrui4q6gzsZ3FKfDN
 imJFSB0RWBN4AAOLD5qG5wI2rp89Uw82jbj5BWormWHY0blA1WowBREwzPjCUJgmsesf
 FyPw==
X-Gm-Message-State: AOAM533hoUMU1KsPAMLNoUVWVvVP4kZmgbyCMPrdk6Pf0D0k6kWmzQWn
 rvUkXvitHKy4mILblSvnfd2daEzHd3FdbHoDgE0S2cQmZWxOexnu/0FKJPWfTd/tzw8Q6jSlbSR
 QVq3oIie2j2K36nQ=
X-Received: by 2002:a05:600c:3acc:b0:39c:7427:d379 with SMTP id
 d12-20020a05600c3acc00b0039c7427d379mr9703779wms.32.1655293767027; 
 Wed, 15 Jun 2022 04:49:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQ0O7f3Iz+DT3XsCPXMA90YOmBlmcwsl/MQpDhqlEi46w7vWhuwSssISR/Sb/3FlCRBhwcCw==
X-Received: by 2002:a05:600c:3acc:b0:39c:7427:d379 with SMTP id
 d12-20020a05600c3acc00b0039c7427d379mr9703761wms.32.1655293766757; 
 Wed, 15 Jun 2022 04:49:26 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70a:2700:1d28:26c3:b272:fcc6?
 (p200300cbc70a27001d2826c3b272fcc6.dip0.t-ipconnect.de.
 [2003:cb:c70a:2700:1d28:26c3:b272:fcc6])
 by smtp.gmail.com with ESMTPSA id
 m17-20020adfc591000000b0020fff0ea0a3sm14923445wrg.116.2022.06.15.04.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 04:49:26 -0700 (PDT)
Message-ID: <5e00555e-1301-b1ce-db3f-e993e6a16567@redhat.com>
Date: Wed, 15 Jun 2022 13:49:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] hw/mem/nvdimm: fix error message for 'unarmed' flag
Content-Language: en-US
To: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Cc: Julia Suvorova <jusual@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <20220531145147.61112-1-jusual@redhat.com>
 <YpY0/Pc3uoA9QQD/@stefanha-x1.localdomain>
 <CAMDeoFUxG7B67BCm4nb303VEwBdiD=JNi_OWSaxirThWnTd6LA@mail.gmail.com>
 <YqdTQYUhO/3dzJvZ@stefanha-x1.localdomain>
 <20220614105408.235f0f41@redhat.com>
 <ac7c0d9c-4fb2-c67b-db25-00e4bbc0eb42@redhat.com>
 <CAMDeoFV3SEWv5gAUd-ZJ=pGw3=JkHR9pOztkytGr1tRhM_uBNw@mail.gmail.com>
 <0fe9723a-620a-f388-68a8-c6a11f8aa3ca@redhat.com>
 <CALg51MOVVm2P5WUjnFF_xvsAk9+QYtWXjOqdU9wdCQJnv6oagg@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CALg51MOVVm2P5WUjnFF_xvsAk9+QYtWXjOqdU9wdCQJnv6oagg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.06.22 13:17, Xiao Guangrong wrote:
> On Wed, Jun 15, 2022 at 4:24 PM David Hildenbrand <david@redhat.com> wrote:
> 
>>>> Is that a temporary or a permanent thing? Do we know?
>>>
>>> No idea. But his last signed-off was three years ago.
>>
>> I sent a patch to Xiao, asking if he's still active in QEMU. If I don't

s/patch/mail/ :)

>> get a reply this week, I'll move forward with proposing an update to
>> MAINTAINERS as described.
>>
> 
> Okay, please do it.
> 
> Sorry, I am just roughly reading the mailing list of qemu & kvm usually,
> and do not get enough time to actively review or contribute on these
> fields. :-(

Not an issue, thanks for that information and thanks for your work in
the past on that!

Should I keep you entered as a reviewer for the new section?

-- 
Thanks,

David / dhildenb


