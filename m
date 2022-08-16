Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06F1595581
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 10:44:35 +0200 (CEST)
Received: from localhost ([::1]:42716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNsBe-0001Ii-K3
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 04:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNs9z-0007HB-J2
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 04:42:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNs9w-0005ux-E5
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 04:42:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660639367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5lQ/NnnHLoJoC42Bv+WLmmifuSsM+8dLJTO5huLf+R8=;
 b=g6H1/temxtVc65Bv1Kj8ipZyOfTwTbya3PfEQ3NqGC/UFQy1IBZWU9SE2eVnmoZjfKiB60
 TAc0NouDg3z10Do8dG1Jud/rAd3uxpTPZquQsxnbrwDg15J6Y8HtnqjvmiWaDWI8Tpq1yj
 nt60fFPMEWR44xpezVO/YcQEREu6yS0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-372-iWVAij_JMdapqX480ZpBLw-1; Tue, 16 Aug 2022 04:42:45 -0400
X-MC-Unique: iWVAij_JMdapqX480ZpBLw-1
Received: by mail-wr1-f70.google.com with SMTP id
 x5-20020adfbb45000000b0021ee56506dfso1686018wrg.11
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 01:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=5lQ/NnnHLoJoC42Bv+WLmmifuSsM+8dLJTO5huLf+R8=;
 b=7yXBF/fEEQE4Xly+xLwMoT26Y1S6vUuvxjS7TQfxPWrpcTkqZs3eLhK8KcavXsE3E6
 U7B86+UtHDD4H8bSX/UvVxdTHoRsUg0EO4tALQL6KwHTeL35dGSLEDJWt5zQvPgK+6Yv
 /+B1a2qRJIOJeFe2AWDGESKZjBRf+CVzw5LMaZaGzX2wfhATB785KHZcW2LfJM2KnUUs
 DqCUbTNSn4BNCfF6e/CacCwVOoQMZzWj0axo8L1LD2Tg5xv1kK8Z0KaU3GGeDeMjZizH
 HPNpAB6yr+wv7/eIq1sO4FHWiv8MOwdf4mvh1usPaGCnrPBy3qGLm+UNADgi1xcp7KUu
 kLjQ==
X-Gm-Message-State: ACgBeo05lU74fOU1nuPKFGcdMt5xJ3dvPUW+81Ol0lLeQINtEVeGCcFT
 iWgZwE4RmqhRsT4yvf42RELTDtqhCn81pV7BSFoxzhD6E0L307VCRzI3EHEPiV14EcCLHqeRunw
 TFy4Nzyx+rOLXZPE=
X-Received: by 2002:a05:6000:178b:b0:222:c6c4:b42e with SMTP id
 e11-20020a056000178b00b00222c6c4b42emr11785726wrg.275.1660639364615; 
 Tue, 16 Aug 2022 01:42:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ZSmZJLni8AQ60iDvxbIGz3OIU0ch7cJlEF0HvuAL/ElkBdK4uwnnZs6cNPQxE6sFy3FY/6w==
X-Received: by 2002:a05:6000:178b:b0:222:c6c4:b42e with SMTP id
 e11-20020a056000178b00b00222c6c4b42emr11785708wrg.275.1660639364409; 
 Tue, 16 Aug 2022 01:42:44 -0700 (PDT)
Received: from [192.168.8.103] (tmo-096-168.customers.d1-online.com.
 [80.187.96.168]) by smtp.gmail.com with ESMTPSA id
 n6-20020a1c2706000000b003a511e92abcsm12155557wmn.34.2022.08.16.01.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 01:42:43 -0700 (PDT)
Message-ID: <2b40953b-3514-2e69-b2df-0790eb7fe4a3@redhat.com>
Date: Tue, 16 Aug 2022 10:42:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] hw/usb/hcd-xhci: Fix endless loop in case the DMA access
 fails (CVE-2020-14394)
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 mcascell@redhat.com, f4bug@amsat.org
References: <20220802134834.454749-1-thuth@redhat.com>
 <CAFEAcA_oZni8G7LeciOywasY2rcEnpo=v01xCaaCTBp5_pDTLQ@mail.gmail.com>
 <aaa3210f-0c81-5c4e-7757-10fa99f5ac27@redhat.com>
 <CAFEAcA8Nsa131yeONs7-3H4wq885r1yuCwwSs=O09SS_Q7xUdQ@mail.gmail.com>
 <d3880c4d-b100-b412-e1f1-4f5c650cc22d@redhat.com>
 <CAFEAcA9azLEWsK-ewXT_ovsc2u+2ykMMJNK8b9UXdfBZ49w6eA@mail.gmail.com>
 <d2c8abec-1f87-01e5-a882-8502d9547f39@redhat.com>
 <20220816083703.vopxgj2omjittb6j@sirius.home.kraxel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220816083703.vopxgj2omjittb6j@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 16/08/2022 10.37, Gerd Hoffmann wrote:
> On Thu, Aug 04, 2022 at 01:43:14PM +0200, Thomas Huth wrote:
>> On 04/08/2022 12.17, Peter Maydell wrote:
>>> That sounds like we do still have an unbounded-loop problem,
>>> then: there's no limit on the number of consecutive TRBs
>>> we try to read in that function. Maybe we're missing an
>>> error check of some kind (does the spec limit how many
>>> consecutive TRBs there can be somehow?) or else we need
>>> another artificial limit.
>>
>> I'm not an XHCI expert at all, but while at least having a quick glance at
>> the spec, I did not see any limit there. So I assume that we should enforce
>> an artificial limit? What would be a good value for this? Gerd, do you maybe
>> have any opinion?
> 
> Hmm, dunno.  Typical workflow is that the driver allocates a page
> (or multiple physically contiguous pages) for the TRBs, and when
> it reaches the end of the allocation it gets a new block and chains
> it using TRB_LINK.
> 
> Right now we have a limit for type=TRB_LINK only, having another one for
> all TRBs makes sense.  The number of TRBs for a transfer can be quite
> large (think usb-storage reads/writes), so don't set that too low, 64k
> maybe?

Yes, after some more reading, I found a remark in the spec (in chapter 6) 
saying that each segment should be limited by 64 kb.

I've sent a v2 with that limit check here (it has a slightly different 
subject, so it's hard to relate it to this v1 here):

 
https://patchwork.kernel.org/project/qemu-devel/patch/20220804131300.96368-1-thuth@redhat.com/

  Thomas


