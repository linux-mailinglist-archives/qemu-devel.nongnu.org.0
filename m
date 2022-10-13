Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0543E5FDC29
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 16:13:45 +0200 (CEST)
Received: from localhost ([::1]:52328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiyxz-0002a5-7J
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 10:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixun-0004LJ-1c
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:06:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixuj-0001Pm-LI
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:06:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665666377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GxFd+lRRPEKdLzM1DiS0NeCe/S4UvD6o4vpLiQ1s4yA=;
 b=Cp44uYyExOYyOXIOyn1h44soLadnjkbcH3fRLhiieCtHB45DgUBGLUfu16k+eNnnr0jfS4
 ovoDMq3pI5p9O3txKRkfTMbVf1uZneHxeU/gXKZTntXiTOwWD15L6P7HYHrR0oTS8KCKml
 rxyi3n+tGuMG91h8roBeF7K4RhGt8es=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-164-JxmYBTU6M-qmznteG-0YAg-1; Thu, 13 Oct 2022 09:06:16 -0400
X-MC-Unique: JxmYBTU6M-qmznteG-0YAg-1
Received: by mail-ed1-f69.google.com with SMTP id
 f18-20020a056402355200b0045c13ee57d9so1483623edd.20
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 06:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GxFd+lRRPEKdLzM1DiS0NeCe/S4UvD6o4vpLiQ1s4yA=;
 b=nA/0G5dFTfkdo30SFlN3TXc+mAjtdkfmffkCTTvUkylRDimyQDUoh0I352Njtb+NBV
 728KEsMsaMb53OUGZckKyOx8Lqmdf+geCtNm9kFkRv8dEjA0gvw+wEWW6pHf6YZYvdyv
 qZ4V09ygzBxm6ih/nkuoKx5lRXGba+vZeSwNk4fHG9jADW1sz84geF1UNATy9jMXTfMr
 lnfnFNCooNPmLMuhB/aVJP70CYrqMtARUPTIIPbQnfXstcX6gd460z3Jkhbi7SNDMjxJ
 sgH5ayt6ZVqXOjS0knl5bdHimx+4WkF3tb7HbGNqVglFdfpkx9R+OeSoNeT6nUSfOCDP
 77pQ==
X-Gm-Message-State: ACrzQf1N+hMs7t3O/Qr+WqabVDDES8WWz11q8Oi3paEwuLh60Ha1yXaN
 8pzeTh02Qy2+GDkZEgO5UJ9J2us4EzJAvUZ5D9T73HEakk+buBpNli0PpoBglyVkhWEiHcJkE/G
 3hTADloZPRktusJ4=
X-Received: by 2002:a17:907:e88:b0:78d:fb98:6f5d with SMTP id
 ho8-20020a1709070e8800b0078dfb986f5dmr5069493ejc.5.1665666374809; 
 Thu, 13 Oct 2022 06:06:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4TTx5e1P4hlyHDX0oMKCOeQiux+9FcGlEDGWfsz/pGYkw+lnkGpTye36HImLhmfbCeqWYH4w==
X-Received: by 2002:a17:907:e88:b0:78d:fb98:6f5d with SMTP id
 ho8-20020a1709070e8800b0078dfb986f5dmr5069474ejc.5.1665666374616; 
 Thu, 13 Oct 2022 06:06:14 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 y12-20020a17090614cc00b0078194737761sm2961305ejc.124.2022.10.13.06.06.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 06:06:13 -0700 (PDT)
Message-ID: <a6e941b0-ce20-916b-7ea1-d575056d8282@redhat.com>
Date: Thu, 13 Oct 2022 15:06:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] blkdebug: ignore invalid rules in non-coroutine context
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, qemu-block@nongnu.org
References: <20221013093523.586361-1-pbonzini@redhat.com>
 <87a660yosv.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87a660yosv.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.25, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/13/22 12:56, Markus Armbruster wrote:
> rule_check() is called from blkdebug_co_preadv(), blkdebug_co_pwritev(),
> blkdebug_co_pwrite_zeroes(), blkdebug_co_pdiscard(),
> blkdebug_co_block_status() (all marked coroutine_fn), and
> blkdebug_co_flush() (which looks like it should be marked coroutine_fn).

Yes (separate patch sent, 
https://lore.kernel.org/qemu-devel/20221013123711.620631-11-pbonzini@redhat.com/T/#u).

> Ignorant question: how could it be called outside coroutine context?

You're right, only blkdebug_debug_event() can be called outside 
coroutine context.  I confused process_rule() (called by 
blkdebug_debug_event(), both inside and outside coroutine context) with 
rule_check() (called in coroutine context).

> Also, code smell: reporting an error without taking an error path.  But
> let's worry about that only after I understand the problem you're trying
> to fix.

Unfortunately there's no way to know in advance if an event will be 
called inside vs. outside a coroutine.  I can keep the abort() if you 
think it's preferrable, so what you get is still a crash but with a 
nicer error message.  Since this is debugging code either solution has 
pros and cons.

Paolo


