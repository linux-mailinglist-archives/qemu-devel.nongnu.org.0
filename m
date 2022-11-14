Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3DA628DBC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:53:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijV-0003UX-5v; Mon, 14 Nov 2022 18:19:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ouieV-00039s-9h
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oue7Z-0006bo-G5
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 13:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668450229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x8ZTOXoqtNZPTikrzFboxUxSsp/TRG0qf+nuZCqnQAE=;
 b=M7Ismo9YHl0FztGt8SS3r13qtqWVbWpWQC5GwGzjLNlOOxf3fOdfe6CKJG5kWTFHp8OmTJ
 DwFh8VMznlGD7hCFT4QPpkiw5LSV/6xXTTIwC4macOJ5kJbchmJJNxKQSj2Sj1M6wmscWb
 Df5T7hXmncgmrbvuSH0s2B1lvDoYEEQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-hWySRrQdP3yWI13dq4roCw-1; Mon, 14 Nov 2022 13:23:47 -0500
X-MC-Unique: hWySRrQdP3yWI13dq4roCw-1
Received: by mail-ed1-f69.google.com with SMTP id
 w4-20020a05640234c400b004631f8923baso8719841edc.5
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 10:23:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x8ZTOXoqtNZPTikrzFboxUxSsp/TRG0qf+nuZCqnQAE=;
 b=DMuOcY5HRxwQBnK2lJACjBhZp3+/9qdcX1UalR2hPltMK9mD14IvqZ4xZjbSuq+Epp
 Nf04S1Zgf21NhaaEn+nyM5pRC50iiF1Xae8LaFh0PyDuMTyzrf2D9gYCJzzWkEkxrRb1
 7MlLjMHEgyT3NG4uG7S/WbvOYzsou5Vn9HnLvKSH42oX0+inWPFm/l3D9TREWW80oFbv
 /CioC8l0KFGTu3Azv9+327yTfKXB3PdJN51WQeRR815CvyZ+ruh2SQooe1krVmYtU7Mj
 77Ljazs8rYyXlx4eBJFj3ol12kdJ6FX93VwD6uv82JdvGunolgz4Nb5vCTE1flldKFuQ
 nb+Q==
X-Gm-Message-State: ANoB5pniA2pCmAsNjR/3w44FZ6Z1Xd5qMYt1/MM5hdLGpgqGZptPD9zz
 RnJDH8/GrwSmAnYgFT+Qi9WMIt2aQeV1ABOtRYNdmJsBZpNmpKVBT4hDqZ3lXIlUI0kHV68O8Xl
 ZO3LGNHjTZbe9MKo=
X-Received: by 2002:a17:906:ae98:b0:7ad:d7a5:6c2a with SMTP id
 md24-20020a170906ae9800b007add7a56c2amr10938372ejb.138.1668450226448; 
 Mon, 14 Nov 2022 10:23:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6DPAG2VKtgJIqWgGYZytPc+pMlxgHI++PfRJgnARp0wihxK+cpxFW51d5aBsJRjMbKZEN3YA==
X-Received: by 2002:a17:906:ae98:b0:7ad:d7a5:6c2a with SMTP id
 md24-20020a170906ae9800b007add7a56c2amr10938362ejb.138.1668450226295; 
 Mon, 14 Nov 2022 10:23:46 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 la11-20020a170907780b00b007030c97ae62sm4437365ejc.191.2022.11.14.10.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 10:23:45 -0800 (PST)
Message-ID: <74fe3b4c-6aa6-0a46-46be-ed91126a003e@redhat.com>
Date: Mon, 14 Nov 2022 19:23:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 11/13] block: Remove ignore_bds_parents parameter from
 drain functions
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-12-kwolf@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221108123738.530873-12-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 08.11.22 13:37, Kevin Wolf wrote:
> ignore_bds_parents is now ignored, so we can just remove it.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   include/block/block-io.h | 10 ++----
>   block.c                  |  4 +--
>   block/io.c               | 78 +++++++++++++++-------------------------
>   3 files changed, 32 insertions(+), 60 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


