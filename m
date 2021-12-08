Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329F246D44B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 14:20:46 +0100 (CET)
Received: from localhost ([::1]:39858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muwsG-0000wF-Nx
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 08:20:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muwfR-0008MO-A6
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 08:07:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muwfE-0001dL-00
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 08:07:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638968835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w58mvq4dgbIoW2/NaOIFPnSlRZ5XglRW3rRfvGw7FZw=;
 b=JwZVk+PSXXSVjM9ddFHMjAJGGTD9R1NCrEwy/U+7/DqDjl7CNnh3NrCWENXkwtiv76J4ut
 GPaCYEQsJnt+RotS+51H/umJgFJC0msxd0WqRtlb3f02614nwYXa6avYQWi6YvhLQ42UmC
 8v76PrQJjLYVxiFr+QcBDafEKq5G3OU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-Z4XKb8U8NeOeqLiN52tW9A-1; Wed, 08 Dec 2021 08:07:12 -0500
X-MC-Unique: Z4XKb8U8NeOeqLiN52tW9A-1
Received: by mail-wm1-f70.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so1265966wmj.7
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 05:07:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=w58mvq4dgbIoW2/NaOIFPnSlRZ5XglRW3rRfvGw7FZw=;
 b=deLHFgnGCSru9FnQr9tSu1DG+C9QfqgwxqdP8xBjiQ9GR6C05tWsZiyBLw//4KWOiL
 zZ2DKUHxf+fItjAaK51oT2asF9XvXpPdCMHcvqQXf2PpQnN5pRPLN5Vm2PDJKuon+/Tq
 nY6Z1E0YDoKj1G2h49t1SNRacvH4SSyV1wpRh0FFhjVdNgz+cgYkbvhPA37as14fY1aw
 6pKqzfxv1p7dNUXDY8WWdrNk4ISSkQkeA53QvXNaYVzDPaUDJruJoaomD3xxvLxFX2oW
 0z4LLx0PumfCgTCGpMPp1cq1HF+D1ssJNYTLtp9a6yjlZb9eTlMqrTCh2Quwy3o/5eyu
 57bQ==
X-Gm-Message-State: AOAM532cNhrbIX84IFtb7YOQjL7HIQEwBxNep0NyvXCB4utotKNg39OK
 Q1uu4tESOenw3SXiRd9XEaUlGGrVYjQ+dIrW0xpJnn0U1cZ7jwaplADncY+N/MP2toLknTe0cED
 7K3KQTvB+oLWvWG8=
X-Received: by 2002:a1c:a7c3:: with SMTP id q186mr16445498wme.20.1638968831200; 
 Wed, 08 Dec 2021 05:07:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOIb4gK0H84FLZ75nnkKDm2TgGHOD1UL2JvpCPTbn51vbubSx8++nl5BTfnbSni2u3v81M1w==
X-Received: by 2002:a1c:a7c3:: with SMTP id q186mr16445469wme.20.1638968831012; 
 Wed, 08 Dec 2021 05:07:11 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id r7sm2621889wrq.29.2021.12.08.05.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 05:07:10 -0800 (PST)
Message-ID: <d6005c8e-d007-2a66-00f3-5f9d3f30e420@redhat.com>
Date: Wed, 8 Dec 2021 14:07:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/ppc/ppc405_boards: Change kernel load address
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211202191446.1292125-1-clg@kaod.org>
 <d8119266-e6f1-969c-d440-d511951178f6@redhat.com>
 <8d21273b-0b81-5041-cfc4-704307aa37cc@kaod.org>
 <32012645-274e-9ee9-2d8a-a3d87c4a6bf5@csgroup.eu>
 <599e5aa0-d7a9-b89c-2da9-5e7c909a6064@kaod.org>
 <75b27dfe-cb8f-d40c-c1bd-79415264a87f@redhat.com>
 <CAFEAcA9OQ=nFaMXgFi22BSuchP35OUiTwteG_yxFSnLXFHNTbQ@mail.gmail.com>
 <f29e3aba-a1d7-484d-2aa2-b676113c4f43@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <f29e3aba-a1d7-484d-2aa2-b676113c4f43@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 LEROY Christophe <christophe.leroy@csgroup.eu>, Greg Kurz <groug@kaod.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/12/2021 13.25, Cédric Le Goater wrote:
> On 12/3/21 11:40, Peter Maydell wrote:
>> On Fri, 3 Dec 2021 at 10:32, Thomas Huth <thuth@redhat.com> wrote:
>>> I guess it's an accidential NULL pointer dereference somewhere in the u-boot
>>> code ... which will be quite hard to track down when the first page of
>>> memory is marked as writable... :-/
>>
>> Attach a target-arch gdb to the QEMU gdbstub and put a watchpoint on
>> address zero ? (Or if you suspect something inside QEMU is doing it
>> then run QEMU under gdb and watchpoint the host memory location
>> corresponding to guest address 0, but that's more painful.) Nothing
>> in the pre-kernel part of the boot process will have set up paging,
>> so the watchpointing should be pretty reliable.
> 
> That's the guy:
> 
>    
> https://gitlab.com/huth/u-boot/-/blob/taihu/arch/powerpc/cpu/ppc4xx/sdram.c#L199 
> 
> 
> There must be an error in how get_ram_size() restores the RAM values :
> 
>    https://gitlab.com/huth/u-boot/-/blob/taihu/common/memsize.c

There is definitely something wrong in that function. Seems like they tried 
to fix it once here:

  https://source.denx.de/u-boot/u-boot/-/commit/b8496cced856ff411f

but that patch got later reverted without a replacement later...

  Thomas



