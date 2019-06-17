Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95FF48D5C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 21:03:09 +0200 (CEST)
Received: from localhost ([::1]:51216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcwuK-0006IR-UD
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 15:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34320)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hcwNY-0001uX-Ai
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 14:29:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hcwNW-0001GA-Js
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 14:29:16 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33139)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hcwNW-0001FN-DX
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 14:29:14 -0400
Received: by mail-wr1-f68.google.com with SMTP id n9so11114060wru.0
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 11:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JipREjB8Xp2KShvWTIcJG/AGcNKLF8lVkPuv1Hf5WHk=;
 b=UXGBiABji6PDIjRUodA9k6HtXubpr877KH2c5J+zFZb/R55YPj9aSx+ROOqrWqQJtg
 bCCVLmV1qc8uZqba+0angBE1eJIwUkLhjpfsKUOCYdf30Sdwrrr0T5IQuxo6x0c5TEOV
 Cp4o4xvYmvcS/kudMKOfpqGIWCJiBtKRTUxEPpFL3F+9dChVsev8tjDtGW/ALZvvziVH
 unnIvP3/I6kfUms6rQ/b7JWMvUkVysRtOHrllKwk+KNLBLHU7QYBB/J1ti9fY0A0ueKp
 g3SqAQlpnjLJgHkocOm6kRCuu4gImi7yZ0RdK29qzfECxguAVD577o7OzRZbNuoisgWG
 OpaQ==
X-Gm-Message-State: APjAAAW93DhXxOwgWgKZc/CrKeEt2cC4m8QuP52zhQIcJ+mLLcWhtTvv
 ZsKV/qxkUfwuAP1IpyVPDjRHNw==
X-Google-Smtp-Source: APXvYqzJ90dZ39SZtSxfoLiRqclYId1UB0Of8dqrtWvCxDHlDZfaOB0kt5KKnoCWV0d1Ffg/2T7KNw==
X-Received: by 2002:a5d:484e:: with SMTP id n14mr13113382wrs.348.1560796153248; 
 Mon, 17 Jun 2019 11:29:13 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id y44sm12808815wrd.13.2019.06.17.11.29.12
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 11:29:12 -0700 (PDT)
To: Kevin Wolf <kwolf@redhat.com>
References: <20190612120421.20336-1-stefanha@redhat.com>
 <20190617122922.GG7397@linux.fritz.box>
 <25ad60d8-8860-b535-a42b-03d4d63d0802@redhat.com>
 <20190617175840.GO7397@linux.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6080d608-fd8d-1f09-6f40-735e212fbf9e@redhat.com>
Date: Mon, 17 Jun 2019 20:27:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190617175840.GO7397@linux.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH v4] virtio-scsi: restart DMA after iothread
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/06/19 19:58, Kevin Wolf wrote:
> Of course, this makes me think that maybe for the actual proper
> solution, VM state change handlers should really be a feature that qdev
> provides for devices. Then if a HBA doesn't have anything else to do,
> the qdev core would just recurse into the children right away; if it has
> something to do, it would disable the device after its children, and
> re-enable it before the children.

This was more or less my reply to this version of the patch. :)

Paolo

