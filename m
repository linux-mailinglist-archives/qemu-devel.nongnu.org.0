Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A54C589930
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 10:20:35 +0200 (CEST)
Received: from localhost ([::1]:40410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJW5q-0001vH-8u
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 04:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJVmo-0002nO-4f
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:00:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJVmk-0000AV-E9
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659600049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vcJSpIaViiq75JA3DmBsuortmX15jMuoIYadmuaJkTk=;
 b=WkWt4ekrbnWoZUapg9+pgCvRAgI1f6+z7uCDgvMxW/mFqKjV2lxq9alnZpAwxZw7C2RdN0
 TTLWANGZVSyuPgMpBGoA/je8NB9LJ2l2Zavup/cMNHaxBnTx63gmDlvfaqGHV2vB0vuu4x
 boFvaxFnoFpRJOMYrihGffuKKDUYlv8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-Il91qMizN9aYImFxEvioeg-1; Thu, 04 Aug 2022 04:00:45 -0400
X-MC-Unique: Il91qMizN9aYImFxEvioeg-1
Received: by mail-wr1-f72.google.com with SMTP id
 t13-20020adfe10d000000b0021bae3def1eso4549513wrz.3
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 01:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=vcJSpIaViiq75JA3DmBsuortmX15jMuoIYadmuaJkTk=;
 b=4GQtr2M0bp1l5oSpsqFzxAGF693TbbV7V1S99QD5O8dLGMv3jRWjFbXYzj3lkhsLRg
 CmfiKmSBTKSutrs6d4YGF0qMg9GDFShTbTPJrnGExjknpCyjJi1Y3YdNAQeHC56hgqF7
 FvEB/DuHiD+5+8TH2mlNCWww/dBMU3rltgNOkMmMNT9Iio40ES2jSf5q1VQa6Ri3r8qv
 3z8e5xrVdShq/1EaninZ3TGNDb9CLlDbw1NxyHs7/Zh3y7nySJSIo5nNGAgO6nluDMiZ
 VLAOafxxa6x23pS5oxR5n2pieSQWy5eEHN0RClwQg8dsQT805ZoLNgYh8a6mq00VJ+BP
 IPsQ==
X-Gm-Message-State: ACgBeo1tmDLukfBQmrbpzaF7GQPHhz3JExRbmhHsMCY7LnbLapjb5E+v
 UBd2dnFp+5F1vp6MA5IFg36C/IuVvojxAvMWqiILiPa3fPE3oLuzkvLVKUaPfsPd4O/ssKFhiWP
 AHZ3vYmHTzfSQwjs=
X-Received: by 2002:adf:f10d:0:b0:220:7e4f:ceb6 with SMTP id
 r13-20020adff10d000000b002207e4fceb6mr542488wro.316.1659600044336; 
 Thu, 04 Aug 2022 01:00:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4/msjr7kGr2ggC5W8nLJm35CubzCP1CgQp7GG3PQSTgF+u8vVnQfUKljaofCEXVLa5VxYLdA==
X-Received: by 2002:adf:f10d:0:b0:220:7e4f:ceb6 with SMTP id
 r13-20020adff10d000000b002207e4fceb6mr542471wro.316.1659600044044; 
 Thu, 04 Aug 2022 01:00:44 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-112-229.web.vodafone.de.
 [109.42.112.229]) by smtp.gmail.com with ESMTPSA id
 k7-20020a05600c0b4700b003a2fc754313sm513654wmr.10.2022.08.04.01.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 01:00:43 -0700 (PDT)
Message-ID: <aaa3210f-0c81-5c4e-7757-10fa99f5ac27@redhat.com>
Date: Thu, 4 Aug 2022 10:00:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 mcascell@redhat.com, f4bug@amsat.org
References: <20220802134834.454749-1-thuth@redhat.com>
 <CAFEAcA_oZni8G7LeciOywasY2rcEnpo=v01xCaaCTBp5_pDTLQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] hw/usb/hcd-xhci: Fix endless loop in case the DMA access
 fails (CVE-2020-14394)
In-Reply-To: <CAFEAcA_oZni8G7LeciOywasY2rcEnpo=v01xCaaCTBp5_pDTLQ@mail.gmail.com>
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

On 02/08/2022 16.09, Peter Maydell wrote:
> On Tue, 2 Aug 2022 at 14:53, Thomas Huth <thuth@redhat.com> wrote:
>>
>> The XHCI code could enter an endless loop in case the guest points
>> QEMU to fetch TRBs from invalid memory areas. Fix it by properly
>> checking the return value of dma_memory_read().
> 
> It certainly makes sense to check the return value from
> dma_memory_read(), but how can we end up in an infinite loop
> if it fails? Either:
> 
> (1) there is some combination of data values which allow an
> infinite loop, so we can hit those if the DMA access fails and
> we use bogus uninitialized data. But then the guest could
> maliciously pass us those bad values and create an infinite
> loop without a failing DMA access, ie commit 05f43d44e4b
> missed a case. If so we need to fix that!

No, as far as I can see, that's not the case.

> Or (2) there isn't actually an infinite loop possible here,
> and we're just tidying up a case which is C undefined
> behaviour but in practice unlikely to have effects any
> worse than the guest could provoke anyway (ie running up
> to the TRB_LINK_LIMIT and stopping). In this case the
> commit message here is a bit misleading.

So from what I understand, this is happening: The guest somehow manages to 
trick QEMU in a state where it reads through a set of TRBs where none is 
marked in a way that could cause the function to return. QEMU then reads all 
memory 'till the end of RAM and then continues to loop through no-mans-land 
since the return value of dma_memory_read() is not checked. Since 
dma_memory_read() was not able to fetch the memory, the "trb" struct does 
not get updated, i.e. continues to contain data that does not cause the 
function to return. Thus the while(1) loop in xhci_ring_chain_length() 
happily runs through the whole 64-bit address space range, failing to read 
memory and thus leaving the loop. Maybe the loop is not really endless if it 
wrap-arounds the 64-bit address space at one point in time and finally finds 
another chunk of memory in the real RAM that causes the loop to exit, but it 
would still certainly take a long time where QEMU is just completely 
unresponsive and busy stepping through the no-mans-land.

Does that make sense to you now? If so, I can respin a v2 with an improved 
patch description if you like.

  Thomas


