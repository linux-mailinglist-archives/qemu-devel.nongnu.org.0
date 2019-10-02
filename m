Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B2DC8E26
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 18:21:09 +0200 (CEST)
Received: from localhost ([::1]:57478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFhNA-0006v5-0n
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 12:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58685)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iFhKp-0005Ju-RU
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 12:18:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iFhKp-0001eD-00
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 12:18:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59888)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iFhKo-0001dW-Pn
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 12:18:38 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E2EA588309
 for <qemu-devel@nongnu.org>; Wed,  2 Oct 2019 16:18:36 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id z205so3227413wmb.7
 for <qemu-devel@nongnu.org>; Wed, 02 Oct 2019 09:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6ZhITsPneL94qWoRluv41le5MvhMUSrgfy0ZbZ3MNWY=;
 b=dPo8sih4Bfavh76bK5CcDbn8/oFth8dY0kPVpVul8LVO5RBrXEPdZy6O/tbo2GvOQx
 IifEHfWQlHMmaok8dJoB8fMERupABe5sdLdBdvIYK3z1u6y1QrfJz0WIwEGD9WVzoPQR
 eoJpBPAc2nWVgal+t1vF7H2jSJ8UT59plJDIbd5CWfnU3v5DdCHMDAfFDNqe2AUlisuq
 UyTxAFo8VKCdNgmwHzcGnL3euUd+BqKQd6ou7llqxxGSJcf8WIO+xnMXJtFaH7QSouS6
 sWiRVRRnincUTMmNA7gkAtITGn35cd2s5ddsjvMg4ByxRG5alxiSMncUdAlYuSe4TI1f
 gGcw==
X-Gm-Message-State: APjAAAUgsblUm1CB932I3sfCYd1D41Nji1pzBOI8g5AJMHYlia5ciObd
 iKKMFInPzVlmsezRKYFKi3/12qioYgMQo+TzZpft9eHg6b1z4EmCXgMog1WbIGkzm3/ef0IActX
 rl91E2rOgflgzS5A=
X-Received: by 2002:a1c:f30d:: with SMTP id q13mr3275206wmq.60.1570033115585; 
 Wed, 02 Oct 2019 09:18:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxhi8AW/TlHHusqE7QUZP3nNGuJAIE/3gdUje0swYiiC/Z/59HcyM8JyxdUXcsXbx3NseHOw==
X-Received: by 2002:a1c:f30d:: with SMTP id q13mr3275192wmq.60.1570033115335; 
 Wed, 02 Oct 2019 09:18:35 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id 79sm9828724wmb.7.2019.10.02.09.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2019 09:18:34 -0700 (PDT)
Subject: Re: [PULL 09/12] kvm: clear dirty bitmaps from all overlapping
 memslots
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20190930131955.101131-1-borntraeger@de.ibm.com>
 <20190930131955.101131-10-borntraeger@de.ibm.com>
 <20191002160120.GC5819@localhost.localdomain>
 <9e483c65-0ce8-e8cf-6a98-532d82105cfc@de.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <7bb4a1aa-9a34-da98-325f-b3ff78142a3b@redhat.com>
Date: Wed, 2 Oct 2019 18:18:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9e483c65-0ce8-e8cf-6a98-532d82105cfc@de.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 kvm@vger.kernel.org, Igor Mammedov <imammedo@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Collin Walling <walling@linux.ibm.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/19 18:13, Christian Borntraeger wrote:
> Does 
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index aabe097c410f..e2605da22e7e 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -712,7 +712,7 @@ static int kvm_physical_log_clear(KVMMemoryListener *kml,
>      KVMState *s = kvm_state;
>      uint64_t start, size, offset, count;
>      KVMSlot *mem;
> -    int ret, i;
> +    int ret = 0, i;
>  
>      if (!s->manual_dirty_log_protect) {
>          /* No need to do explicit clear */
> 
> 
> fix the message?
> 

Yes, I'm sending shortly a pull request.

Paolo

