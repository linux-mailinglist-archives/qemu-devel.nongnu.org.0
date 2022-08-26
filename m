Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03C45A2919
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:09:23 +0200 (CEST)
Received: from localhost ([::1]:50376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRa1N-0003PD-Fs
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZm4-0006wy-8Q
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:53:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZm1-0000gk-36
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661521999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vqElSHodHe5dMjXui5yc3jNaVfh8G1uXU43vY209xjE=;
 b=Xkpi5c7geWnexft3Zo2HtKjv6z97DjeXosf+DXOtW/XrlEBxI3744Pyz3fN8Ppif0Tpfe9
 G4tSIZo7FhfFAlYUDmKbfv4CusLPYUdRrlRS/aqkjeSBHgVZ59sW9AYy0Z0M6Fbb1OFhbG
 2TrgQj6szZQu2FHRhYvJGnQtUD/wXbY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-44-BrzLwy0gPnu47Ky7DcST6A-1; Fri, 26 Aug 2022 09:53:17 -0400
X-MC-Unique: BrzLwy0gPnu47Ky7DcST6A-1
Received: by mail-qt1-f198.google.com with SMTP id
 h19-20020ac85493000000b00343408bd8e5so1332458qtq.4
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 06:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=vqElSHodHe5dMjXui5yc3jNaVfh8G1uXU43vY209xjE=;
 b=qcy92U46vII8RiJgXuJb5WzhwBeSynokwEagVM/OCnWYPhH2dT5GqASHQSlTTmmeU5
 Z2pXv7ap5xNUNXq6h7tnS78RDywYxQ7LjLtsx8PgWApStu9qdX07xr/vizqvrmmcXLEd
 jBtyKAnqm2xjCY4isQ0n/vDr9mnaa0bwl5kJZ/mFDYmlxNpL55GxkImVSJp/0zyYtws+
 +UQFZsjEUb17Zni26C7/ewh/khqJ7bl5l49P972jVFIisxFN4FrTObGj9sQSApMPSqS1
 AAXoLjgcqi2KfPjtxwrMFg1BCekPJ1yRomhrja/pMV1G8pQ6AR1RxyrtMCM+eWodPpEw
 FHww==
X-Gm-Message-State: ACgBeo3ZJK/gCDkoXfrki9PGgTf0BaGcC7YKPMwQb4jqwg5EPMZRZ2d4
 Fs7pba+qRoxlFwCb5Sde1mbbuDcQKz5M121iztqrgG0I+tskPGlftzu3kmFT2tcvnENDlGuGHrT
 GKlYPqqIg5rlCpSQ=
X-Received: by 2002:a05:6214:da6:b0:496:f5f3:de93 with SMTP id
 h6-20020a0562140da600b00496f5f3de93mr8112627qvh.102.1661521997021; 
 Fri, 26 Aug 2022 06:53:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR77zCM0Fzzk4NBjoACaSmk35s2lT3gd6+6vVBZUUQhqRNfMiWWGfo0vptZAB3uoFOgVsxESSg==
X-Received: by 2002:a05:6214:da6:b0:496:f5f3:de93 with SMTP id
 h6-20020a0562140da600b00496f5f3de93mr8112615qvh.102.1661521996847; 
 Fri, 26 Aug 2022 06:53:16 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a05620a445300b006b999c1030bsm1965943qkp.52.2022.08.26.06.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 06:53:16 -0700 (PDT)
Message-ID: <68150651-2c28-c173-d737-df4961646cd2@redhat.com>
Date: Fri, 26 Aug 2022 15:53:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 2/2] kvm/kvm-all.c: listener should delay kvm_vm_ioctl
 to the commit phase
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
References: <20220816101250.1715523-1-eesposit@redhat.com>
 <20220816101250.1715523-3-eesposit@redhat.com> <874jy4prvl.fsf@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <874jy4prvl.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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



Am 22/08/2022 um 11:08 schrieb Cornelia Huck:
> On Tue, Aug 16 2022, Emanuele Giuseppe Esposito <eesposit@redhat.com> wrote:
> 
>> Instead of sending a single ioctl every time ->region_* or ->log_*
>> callbacks are called, "queue" all memory regions in a list that will
>> be emptied only when committing.
>>
>> This allow the KVM kernel API to be extended and support multiple
>> memslots updates in a single call.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>  accel/kvm/kvm-all.c       | 99 ++++++++++++++++++++++++++++-----------
>>  include/sysemu/kvm_int.h  |  6 +++
>>  linux-headers/linux/kvm.h |  9 ++++
> 
> Meta comment: Please split out any linux-headers changes into a [dummy,
> if not yet accepted in the kernel] headers update patch.

Thank you for pointing that out, will do.

Emanuele

> 
>>  3 files changed, 87 insertions(+), 27 deletions(-)
> 


