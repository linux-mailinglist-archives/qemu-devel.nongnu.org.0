Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17B66F7160
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:44:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoW-00079H-Fw; Thu, 04 May 2023 13:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puaQI-0002n5-0D
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:59:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puaQG-0000LP-7l
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683212347;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=cIn6Bgttk1pVHVjCqPrZTa9M15GePNBoCNPYtxyt/gw=;
 b=ONLfBNTFhcVsqQFgt22PJzSD1cFVIQEDVtMjyx1rPUPEEbv48bY0MMsHtA/KNez2N/omw8
 FMf93Frhkvv5PkypNrcbAug53TLBkFYlfIgNAMsyxNoO51Z7+zJswdzRZQF9+3+JTMbxmd
 kf2+MffQTP6HJpBDqrcfZkiNYJ6LHsI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-dOaIow_INACjXZmjfMHRKA-1; Thu, 04 May 2023 10:59:06 -0400
X-MC-Unique: dOaIow_INACjXZmjfMHRKA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f1757ebb1eso2530765e9.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 07:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683212345; x=1685804345;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cIn6Bgttk1pVHVjCqPrZTa9M15GePNBoCNPYtxyt/gw=;
 b=iXROo7dFuT+BktOcrCGUjSw/IaI0twwcsXSGlr+TV0JW1p1v/A2Kmkwe8pmw2hTJZm
 ooqJ2/LtRuyfDHVhZNMcqZvJ1/wzFVr1LFVaF9pRAJDurxPTBFBRbe3QC/cyoxPIO8tH
 tC1gc/u+7QhBSmsJdn/c8QI9fXTO6AWx2iRAAIwQdD5jVp9PCuD/EZ6ikeZ22cXFvtGG
 lYssrqz5pQAfSTScEIrjl8Rsi+otulr0t8CGoUXX+9CSk7F8kTPWEy3YLGp5yhcnwjZj
 BZ+Wn2nlhpZqqZCSzypDTqE+q+aRVlxiMypgAmA6SzI4WzLyN/2DiMMxo9BjFXeJdvbz
 H+Rw==
X-Gm-Message-State: AC+VfDxYgR68Ty7pSuSBW4EnwE1emhxDXrHzhO30wcY3EYr86M+akJbh
 GH+68AY01Xo4ZiOJt4CwhByg1NSGwpeZouGiF+37tufaW4FiuzRlo2EnHLMug/2mBsLFUzxI4pc
 2H2b8A9j0Q/xsHhwzaKILYLDDN/7N
X-Received: by 2002:a1c:f707:0:b0:3f1:93c8:4a79 with SMTP id
 v7-20020a1cf707000000b003f193c84a79mr16645051wmh.29.1683212344986; 
 Thu, 04 May 2023 07:59:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5MsyoVVDJoNPpj4WjqfhFW6xyUFT0uR/hyrk2Og16HxNFKyw0+Ife64cdL12o2H2V1bZcX0Q==
X-Received: by 2002:a1c:f707:0:b0:3f1:93c8:4a79 with SMTP id
 v7-20020a1cf707000000b003f193c84a79mr16645038wmh.29.1683212344675; 
 Thu, 04 May 2023 07:59:04 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 q6-20020a7bce86000000b003f1836c98b7sm5083309wmj.48.2023.05.04.07.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 07:59:04 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Leonardo Bras <leobras@redhat.com>,  Fam Zheng
 <fam@euphon.net>
Subject: Re: [PATCH 9/9] qemu-file: Account for rate_limit usage on
 qemu_fflush()
In-Reply-To: <ZFPElx61bhgRf87L@x1n> (Peter Xu's message of "Thu, 4 May 2023
 10:43:35 -0400")
References: <20230504113841.23130-1-quintela@redhat.com>
 <20230504113841.23130-10-quintela@redhat.com> <ZFPElx61bhgRf87L@x1n>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 04 May 2023 16:59:03 +0200
Message-ID: <87pm7gp2h4.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> On Thu, May 04, 2023 at 01:38:41PM +0200, Juan Quintela wrote:
>> That is the moment we know we have transferred something.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> There'll be a slight side effect that qemu_file_rate_limit() can be
> triggered later than before because data cached in the qemufile won't be
> accounted until flushed.
>
> Two limits here:
>
> - IO_BUF_SIZE==32K, the real buffer
> - MAX_IOV_SIZE==64 (I think), the async buffer to put guest page ptrs
>   directly, on x86 it's 64*4K=256K
>
> So the impact should be no more than 288KB on x86.  Looks still fine..

This was on purpose.  We are counting data as sent when it has not been
sent yet.

With this change, we account for the data written when we do the real
write.

And yes, I fully agree that with the size that we have it shouldn't make
much of a difference in the speed calculation.

The difference here is that I will move that counter somewhere else, and
the less places that I have to use it the better O:-)

> Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks.


