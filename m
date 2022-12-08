Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FEE647716
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 21:15:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3NHM-000666-NG; Thu, 08 Dec 2022 15:14:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p3NHK-00065g-3L
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 15:13:58 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p3NHI-0006Vp-EM
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 15:13:57 -0500
Received: by mail-oi1-x231.google.com with SMTP id e205so2505039oif.11
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 12:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=nrqbANYxJrPD9V/WEnwzkgMTTrfXS4ZEZBQlRB9SQgw=;
 b=dNAXtj9wjXCb0AZqCO6N8XwWlqPemsx6EbaPXAopFi5GT0e3cyit6lmorc0cRv96OK
 4K+BR7n7KVeO5rbI8t4yRWPFlw+24L5PmuXwNB8rJBIM2Qz0dMY7aAGPBe0AsYC60O/O
 afrFOXeLrC4Jd+KBZ+1TeV0Jux01v38dhvIkGy6O8dWsC4E9MN+AUl4UV2BcgiIorD2h
 XY6emb96hjHCKl3f3+obZLPYyhobflN0Ao4BsIqAgk4ivOb+xISCAuhw8M27PDoyxILm
 vlQOe9MiVLRHS6W/aD967ZpjXYN9Czr2Bcv8UvrS318QKDW/aYq0iNFaBrWkbREhUk6t
 8ulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nrqbANYxJrPD9V/WEnwzkgMTTrfXS4ZEZBQlRB9SQgw=;
 b=UH9YnsNuKcSSmY9qqQHx+CaEUCV+RhkhywDZwCzdMfXFfey/HXhDUXkM0lLQ8lU9ET
 5NOgwszxZS9XL2viMeB47XpKDWx5VQ810ipZkrRqu7XiPJM/aS2SdSAjVhKYKXmTqP4a
 wWOcxqEVBFsum9kB81tS3yimX9i+dK4g3+u3z1F/uIQn63m4R/ufEPqkYYKegXXbrD+J
 BaeI01uPChuz1EEArvTO8ttguoQZ9FMbhfhRiAlTh8OpgoaoQu9r3zXCEBpNKbcxP8xE
 E7ZURzhUnjW8S2fQgqbtzzl7+m7ekPEiGxtvP8dh6/u0f8rCkm/FW79GtLDQYrhkJ0fQ
 Dj9A==
X-Gm-Message-State: ANoB5pmATFoqMvApBBOk4q1yScgZWVBgHKosDUAY3Vq5vDUFHdgxm2Qy
 vIM37OikO03Lf2nR4uhS6sU=
X-Google-Smtp-Source: AA0mqf6nVPezVhr54IXLB6JD2VKhZtLKwwQBBWciND1seOg5DtPJjnvpxWzNcP0veAELUqDRkWnXkw==
X-Received: by 2002:aca:2302:0:b0:35a:5645:16e6 with SMTP id
 e2-20020aca2302000000b0035a564516e6mr49126468oie.288.1670530435104; 
 Thu, 08 Dec 2022 12:13:55 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a4aab05000000b004a0c24bc68csm5382734oon.18.2022.12.08.12.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 12:13:54 -0800 (PST)
Date: Thu, 8 Dec 2022 12:13:53 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org,
 kbusch@kernel.org
Subject: Re: [PATCH v3 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <20221208201353.GA928427@roeck-us.net>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <20220616123408.3306055-2-fanjinhao21s@ict.ac.cn>
 <20221207174918.GA1151796@roeck-us.net>
 <Y5GPRiO0g2mgA3FS@cormorant.local>
 <Y5GbbF68N5ZiYNdv@cormorant.local>
 <20221208184740.GA3380017@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208184740.GA3380017@roeck-us.net>
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.229, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, Dec 08, 2022 at 10:47:42AM -0800, Guenter Roeck wrote:
> > 
> > A cq head doorbell mmio is skipped... And it is not the fault of the
> > kernel. The kernel is in it's good right to skip the mmio since the cq
> > eventidx is not properly updated.
> > 
> > Adding that and it boots properly on riscv. But I'm perplexed as to why
> > this didnt show up on our regularly tested platforms.
> > 
> > Gonna try to get this in for 7.2!
> 
> I see another problem with sparc64.
> 
> [    5.261508] could not locate request for tag 0x0
> [    5.261711] nvme nvme0: invalid id 0 completed on queue 1
> 
> That is seen repeatedly until the request times out. I'll test with
> your patch to see if it resolves this problem as well, and will bisect
> otherwise.
> 
The second problem is unrelated to the doorbell problem.
It is first seen in qemu v7.1. I'll try to bisect.

Guenter

