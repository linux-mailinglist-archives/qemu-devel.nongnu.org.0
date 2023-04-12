Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118AD6DEC39
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 09:06:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmUXG-0002it-Tp; Wed, 12 Apr 2023 03:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmUXD-0002ic-2b
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 03:04:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmUXA-0008Lt-CG
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 03:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681283087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UD0SZyjl6Ky0q7QljOM6f+bxzYppVSpTCTHwBJjyHg8=;
 b=doEIrpdSiSpkP7jmIw2uqj4i5xxEzTMRS6GV6EiMdYSEJhkxWDxsXY4aVvuv+igyEO9Wxx
 u6/8x3cbOqZM4zg72lLlbzIFf8Sian8tqgx0PRD5HIXeszi+ZiRnJrFQa46t4M+jtl9Vu9
 wtUB53uht5esh4bnAHCXsS7PzJp1RXA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-1tJd-fvNMc6iTwZ6DCepZw-1; Wed, 12 Apr 2023 03:04:45 -0400
X-MC-Unique: 1tJd-fvNMc6iTwZ6DCepZw-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50470d68f1eso1986010a12.0
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 00:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681283084; x=1683875084;
 h=content-transfer-encoding:in-reply-to:subject:from:cc:references:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UD0SZyjl6Ky0q7QljOM6f+bxzYppVSpTCTHwBJjyHg8=;
 b=HdBj0NXVW4H9x2fV10CrQpg4D3fK62bV1cgAgGNvSI2MS0SmJ4UvcACcLstUenvdUQ
 f2vwW3JByr/9H0a7uY7jvdYI2S4zwbrIW7Bz53E2NlfnUyfkIbvcWuqNWPfXuYEwZ6mm
 ZixiWvHPZG9Bs6933c9lKKO/fkcZEJNAUZrwO/0flZGdaMMFdQw2WVvZHklW8qrKNFbO
 ByGB3OdRWyYxH8iuOeEvw/QmxVX6192jnhVLTxAZVLTe0fBz6l56UxaT/beNxtQOjWbJ
 y4eG/yjIwK9ikUM1kHK0iBeYDjxuuqq/MYUbE4sW2vxUHU38HBkbvl57+2XzuJE6fMoO
 4pTA==
X-Gm-Message-State: AAQBX9cYlxY8NrhNHmRxpkKhKTSlZrK40Ds7Ukr9bxiKNGVgMVWSvBBY
 /8xh6QcMshw90wmOuCIo4BJ0E1hKOuKJS5gHXG1xoc/ED6eqdb6oqYvU6p8yoql3uUdwwcr3FAQ
 7IFLday3C8ZDlqqA=
X-Received: by 2002:a05:6402:1117:b0:502:2494:b8fc with SMTP id
 u23-20020a056402111700b005022494b8fcmr13758133edv.7.1681283084413; 
 Wed, 12 Apr 2023 00:04:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZgY2hwwrmolt+MJAFAz572uoU/Oh//RG77WW8GOanbUn+Woh73fzRkah8R70if1QOTQX8kow==
X-Received: by 2002:a05:6402:1117:b0:502:2494:b8fc with SMTP id
 u23-20020a056402111700b005022494b8fcmr13758124edv.7.1681283084060; 
 Wed, 12 Apr 2023 00:04:44 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-153.web.vodafone.de.
 [109.43.179.153]) by smtp.gmail.com with ESMTPSA id
 d7-20020a50f687000000b00504803f4071sm5009962edn.44.2023.04.12.00.04.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 00:04:43 -0700 (PDT)
Message-ID: <533d2093-68f7-4d5d-f1cf-3ff88d0173f1@redhat.com>
Date: Wed, 12 Apr 2023 09:04:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: mikestramba@gmail.com, qemu-devel@nongnu.org
References: <CAA5vqSbgTTeF-tiUtK7pCYkyQXJEV3WuZuXEK=4GjigPLf=X7A@mail.gmail.com>
Cc: qemu-s390x <qemu-s390x@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: How to write a zIPL section in IPL2 record on a raw disk
In-Reply-To: <CAA5vqSbgTTeF-tiUtK7pCYkyQXJEV3WuZuXEK=4GjigPLf=X7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.17, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/04/2023 04.22, Mike Stramba wrote:
> I have a CKD file, created with the Hercules dasdinit program.
> It's a  (hercules) 3350 uncompressed file.
> I've put a small "hello world" IPL program on it, and it works fine with 
> Hercules
> 
> When I try to run it with qemu-system-s390x I get :
> 
> LOADPARM=[        ]
> Using virtio-blk.
> Using guessed DASD geometry.
> Using ECKD scheme (block size  4096), CDL
> No zIPL section in IPL2 record.   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
> zIPL load failed.
> Could not find a suitable boot device (none specified)
> Failed to load OS from hard disk
> 
> The qemu script is :
> qemu-system-s390x -m 16 -drive format=raw,file=test-ipl.3350.un,if=virtio 
> -nographic

  Hi Mike!

I guess you're the first person who's trying to do this ;-) ...
QEMU's s390x emulation has been developed with only Linux guests in mind, so 
the boot "firmware" also only supports disks that have been prepared by the 
bootloader that is used for loading Linux on s390x - i.e. zipl.

FWIW, you can find the sources of the "firmware" in the pc-bios/s390-ccw/ 
folder of the QEMU source tree if you want to have a look.

But if you just want to load a small kernel into QEMU, you're maybe better 
off by using the "-kernel" option to load an ELF file.

> I found this link re:  the zipl command.
> https://www.ibm.com/docs/en/linux-on-systems?topic=u-modes-syntax-overview 
> 
> Where is that command   and  / or its source ?

zipl is part of the s390-tools that are available here:

  https://github.com/ibm-s390-linux/s390-tools

(there should also be a package for this in each decent s390x Linux distro).

  HTH,
   Thomas


