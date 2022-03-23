Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D7E4E51B0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:57:18 +0100 (CET)
Received: from localhost ([::1]:59714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWzc5-0000TC-8m
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:57:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWzFA-0003f8-9v
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWzEw-0007Bl-Fv
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:33:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648035199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ameg0XAwgR73srj0022TjpkgX/ZfQPWUHabzWIVwrjk=;
 b=AmmV6dfdVzI5aHZJHz0ETqnRKv80oap4M8+0cuAJhK1nN5AkoJs1etD434yKKUaoz+jqzO
 przeFyKh3lT2bzzqGVhlCg3LG4qy3vd9fwlK5r37x4MhAme2DOa3Wa+p4pfGiZVCoapMIa
 fOaDUVkVIWoPFBy6xV6EU9to5+EJrb8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-8dGy53W8NJO4weSeKtzX2w-1; Wed, 23 Mar 2022 07:33:16 -0400
X-MC-Unique: 8dGy53W8NJO4weSeKtzX2w-1
Received: by mail-ed1-f69.google.com with SMTP id
 o20-20020aa7dd54000000b00413bc19ad08so873077edw.7
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 04:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ameg0XAwgR73srj0022TjpkgX/ZfQPWUHabzWIVwrjk=;
 b=nG+JgurS/rBtRNjgGyacsU+LNusNtwXOMYLU1xyar9MrJy8jQUliIDZFg0gA8skcSi
 JSrAvEzDBBZeU7I+whsw/DRD9leiAQeqAGvoiQTiS+o4IfyrMErcTIwIcvPHbG7OSX/i
 7WJKoKEQrazRSe76b2gGlfUbgGfFW6Ymc7I1oZJssIZ+3J3kZ6d4ViUbavsjDD1n5Zoy
 Yh2evD5pSBKwG6TSf7e50BENAw4roA1Lf2o/Q93jJjCdXuGQ9ZpDfiVYEpctyA+albWq
 SlNovzwoGR66bMZZsITbzO6GdlAxgQgytqpoUmS9+IqZeX56dDiskkdwdO0x0GAZCETX
 aBQQ==
X-Gm-Message-State: AOAM533M/bH+qartBWn1RoBNiSXlVvr/re8yoxkIiSog5bOT3kPOURP3
 BuTndcawzglQdsC9GMKTj34VojopzFxbsNpLVUl2js7X3GeK23Owx64XHjakUuz2Gd8bEKxv18o
 81KgZslt6uCZ+VVY=
X-Received: by 2002:a17:906:c114:b0:6d7:1065:a8b0 with SMTP id
 do20-20020a170906c11400b006d71065a8b0mr31614300ejc.181.1648035195659; 
 Wed, 23 Mar 2022 04:33:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFYm3oLbQxB/7lAqvMZmP2Z7M15YILvnH2dPXTu3LZuM3WAabZhp7AxFwKYfaZN2EQ/aisSg==
X-Received: by 2002:a17:906:c114:b0:6d7:1065:a8b0 with SMTP id
 do20-20020a170906c11400b006d71065a8b0mr31614274ejc.181.1648035195412; 
 Wed, 23 Mar 2022 04:33:15 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a1709063ca900b006cea15612cbsm9883316ejh.176.2022.03.23.04.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 04:33:14 -0700 (PDT)
Message-ID: <e22baaff-2d21-ff8b-dedb-65797971af7e@redhat.com>
Date: Wed, 23 Mar 2022 12:33:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 0/4] Improve integration of iotests in the meson test
 harness
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20220223093840.2515281-1-thuth@redhat.com>
 <f71c35ff-1db2-7491-c9fe-a0dd3ab1cbee@redhat.com>
 <b9dd43ca-0120-a27b-823a-a88572be94c6@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <b9dd43ca-0120-a27b-823a-a88572be94c6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.03.22 18:26, Thomas Huth wrote:
> On 21/03/2022 17.14, Hanna Reitz wrote:
>> On 23.02.22 10:38, Thomas Huth wrote:
>>> Though "make check-block" is currently already run via the meson test
>>> runner, it still looks like an oddball in the output of "make 
>>> check". It
>>> would be nicer if the iotests would show up like the other tests 
>>> suites.
>>>
>>> My original plan was to add each iotests individually from meson.build,
>>> but I did not get that done reliably yet [*], so here's now a cut-down
>>> version to improve the situation at least a little bit: The first three
>>> patches are preparation for the clean-up (long-term goal is to get rid
>>> of check-block.sh, though we're not quite there yet), and the final
>>> patch adds the iotests not as separate test target in the meson test
>>> harness anymore. This way, we can now finally get the output of failed
>>> tests on the console again (unless you're running meson test in verbose
>>> mode, where meson only puts this to the log file - for incomprehensible
>>> reasons), so this should hopefully help to diagnose problems with the
>>> iotests in most cases more easily.
>>>
>>> [*] See v2 here:
>>> https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg01942.html
>>>
>>> Thomas Huth (4):
>>>    tests/qemu-iotests: Rework the checks and spots using GNU sed
>>>    tests/qemu-iotests/meson.build: Improve the indentation
>>>    tests/qemu-iotests: Move the bash and sanitizer checks to 
>>> meson.build
>>>    tests: Do not treat the iotests as separate meson test target 
>>> anymore
>>
>> What’s the status of this series?  I wonder why you split it apart, 
>> mainly.
>
> I've mainly split the fourth patch apart since Paolo mentioned that 
> the commit message should mention the meson bug (IIRC), and since QEMU 
> was entering soft-freeze, thus I doubt that a patch like "Move the 
> bash and sanitizer checks to meson.build" is still acceptable at this 
> point in time. The meson.build clean-up is rather something for 7.1 
> instead.
>
>> Patch 1 was already merged, and I took patch 4 today.  So what about 
>> patches 2 and 3?  They look sensible to me, but is this series still 
>> relevant and fresh, considering you sent new versions of patches 1 
>> and 4?
>
> If you think they are still ok for 7.0, you can certainly also pick 
> the 2nd and 3rd patch ... otherwise I'll respin them later for 7.1.

That sounds like you don’t really need to respin, so I’ve taken them to 
my block-next branch for 7.1:

https://gitlab.com/hreitz/qemu/-/commits/block-next

Thanks!

Hanna


