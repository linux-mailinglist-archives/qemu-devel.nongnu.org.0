Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AADE044541F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 14:39:43 +0100 (CET)
Received: from localhost ([::1]:39182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1micxy-0002Eo-IY
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 09:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1micrG-0002gk-Us
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 09:32:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1micrC-0004Ab-7E
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 09:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636032761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XD5l7D1iYXdvGZDZ3H9kYSkRcGpQYxJk6wO2Lk3sbDY=;
 b=HhR2pOdG2MTWZnegEP4ylqYFF9RqDsyjg/3Q3FpjAx1sAqfiCCA4gxoctYLj/M579nnsV3
 h4IpiKlSc1y+0pN6ySYZcGIA2SZPSUzzuCtt019CrVaazIfK6dNUEHRchBuPV4v9YgufWQ
 uW0u24pMC/oxjMNR7ihR4vH8GdcjvL0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-SLcZmV64O2-9KWUuDo5QOg-1; Thu, 04 Nov 2021 09:32:38 -0400
X-MC-Unique: SLcZmV64O2-9KWUuDo5QOg-1
Received: by mail-wm1-f72.google.com with SMTP id
 c1-20020a05600c0ac100b00322fcaa2bc7so2613064wmr.4
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 06:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XD5l7D1iYXdvGZDZ3H9kYSkRcGpQYxJk6wO2Lk3sbDY=;
 b=ehn9Ll88DLOA2o/qG0yfoF1yp2dRN5EiEmIfGpIof72lW+0wssaCxIelZyetpHGCrP
 fDWPsLv+e/rm3HqLROHZ3jisbvG27RARX+Op48/w/6ThRXFLdAv0BnhwzwRV8yOiHedF
 IFuKfBd2Hr/5DGeE5q/2NxVMFdSKGAc6uMatVxOfjBjMo3sLlebwmCz/460gkfwYZZFQ
 hkETldteCJhIE8RyrcZzOsBfKzC/NnHg1jA0lUo5x8Itvl7RIEot23/KSmReRAMkrFT/
 DBzOva8FoUd3YxRY5bD5ZbJlmZGlXTQQLshuEnjqn5GTD1hCIfpWggPJhXA39S/A2Xgl
 qoBw==
X-Gm-Message-State: AOAM530yZTM5mQqmrBCyAYqgCU0iXDXxXaYhitoMOeCGJZUTDohP4Hom
 FuGg92ev3w4MRDDjFBTrQIuKehBN8GyS5iV8bagrund5iJDmrKqiB2hw476pM41H4ZhDi2AaLNx
 vykuuyUjKRds85yY=
X-Received: by 2002:a5d:6151:: with SMTP id y17mr57918477wrt.275.1636032756884; 
 Thu, 04 Nov 2021 06:32:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPMuh7VSgsK8P7SJvu2xRhabYX3cP03/K6S5BUURRlQ4qphqI9CAmRcP6fHqd1YJUhW1vF/A==
X-Received: by 2002:a5d:6151:: with SMTP id y17mr57918436wrt.275.1636032756626; 
 Thu, 04 Nov 2021 06:32:36 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id n7sm4979166wra.37.2021.11.04.06.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 06:32:36 -0700 (PDT)
Message-ID: <0d682c41-8ac3-28b7-5cf6-aa8377ae3d65@redhat.com>
Date: Thu, 4 Nov 2021 14:32:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] file-posix: Fix alignment after reopen changing O_DIRECT
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20211104113109.56336-1-kwolf@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211104113109.56336-1-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.11.21 12:31, Kevin Wolf wrote:
> At the end of a reopen, we already call bdrv_refresh_limits(), which
> should update bs->request_alignment according to the new file
> descriptor. However, raw_probe_alignment() relies on s->needs_alignment
> and just uses 1 if it isn't set. We neglected to update this field, so
> starting with cache=writeback and then reopening with cache=none means
> that we get an incorrect bs->request_alignment == 1 and unaligned
> requests fail instead of being automatically aligned.
>
> Fix this by recalculating s->needs_alignment in raw_refresh_limits()
> before calling raw_probe_alignment().
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block/file-posix.c         | 20 ++++++++++++++++----
>   tests/qemu-iotests/142     | 22 ++++++++++++++++++++++
>   tests/qemu-iotests/142.out | 15 +++++++++++++++
>   3 files changed, 53 insertions(+), 4 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


