Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D477843AFC7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:12:44 +0200 (CEST)
Received: from localhost ([::1]:46744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJRj-0001BB-Nz
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfJPO-0008Op-UD
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:10:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfJPN-0008QY-5i
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635243016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=itutP4hXQhYuzRcGfawZqNdwUf8YbZ3i48OMMYOnDXM=;
 b=VjcNFQLfi/VCIdMT+AuWHSu9WYHApTIDT2fFhOvd0SXYdaCG/Br+BbJM+WFU6pWsPC5pPq
 LypwhY0qluP3c6ge9oWGMZWsXlB3dhov8v81yLEdBE3yOARE2wkL4kjgR6NTvXq1p0MrHU
 SQ7UddBusAHAU4f07H1yxnK+TvlCp6k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-YiplFjdaMzm1DMWsnq0Flg-1; Tue, 26 Oct 2021 06:10:14 -0400
X-MC-Unique: YiplFjdaMzm1DMWsnq0Flg-1
Received: by mail-wr1-f71.google.com with SMTP id
 s1-20020adfc541000000b001645b92c65bso3854498wrf.6
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=itutP4hXQhYuzRcGfawZqNdwUf8YbZ3i48OMMYOnDXM=;
 b=txk9dazP7dYLJse+dKwlmKqf3oIRkTr/JDdeqv+ChwveiQvIw7731K1b80nSJ/IMJk
 UkAPPAeYbxuRWs0N/NrSDhX7lcKL+/OGCk4rkEg1zNH/ZdYQ36CG20PeVNhRR5xRVBbO
 UtxtHfq2mjuOIl92lTPwUu86Bg7W8+paDAWOhZGDSLl/5rMEEsF3QQc1+ZHSe/pLoO5h
 RtPWnd750tJGvsNRrjunPN/SnRiNjyKCCP7/TZPQ6lW1OrwhdvY03ELcV/YBsJvf/V+t
 MnAsFuZOcBxoCmlYmasO92VakXXa9pdbmjviN90Rn2R5s3pOGjnYl02GAB0wxerGfoSQ
 amXA==
X-Gm-Message-State: AOAM530qzx1UpoXAYuPIEr2QHsmJ5k9R7MdVFGhUtzhOA1jCvjjfGlTx
 y79BbQ6S2QtwX7cqZ/Q1zxjQqaYbgm4kVD8WGSp11R/5eJhOPnOAZO/kYVL+nrSz1W6hQx+XWGD
 IA78WsFZpRikhCZQ=
X-Received: by 2002:a5d:5191:: with SMTP id k17mr20331664wrv.166.1635243013642; 
 Tue, 26 Oct 2021 03:10:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeRQmS2tFQnaKKAl0hH4oU2CmQHGAjpPrACKH3W5AROTTfuSaYWe8nDGEuIGgE9ciT8MGk4A==
X-Received: by 2002:a5d:5191:: with SMTP id k17mr20331640wrv.166.1635243013473; 
 Tue, 26 Oct 2021 03:10:13 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id h1sm157017wmb.7.2021.10.26.03.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 03:10:13 -0700 (PDT)
Message-ID: <6944915c-4bd8-9201-3cbd-7c670036383d@redhat.com>
Date: Tue, 26 Oct 2021 12:10:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 08/15] iotests/297: Change run_linter() to raise an
 exception on failure
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211019144918.3159078-1-jsnow@redhat.com>
 <20211019144918.3159078-9-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211019144918.3159078-9-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.10.21 16:49, John Snow wrote:
> Instead of using a process return code as the python function return
> value (or just not returning anything at all), allow run_linter() to
> raise an exception instead.
>
> The responsibility for printing output on error shifts from the function
> itself to the caller, who will know best how to present/format that
> information. (Also, "suppress_output" is now a lot more accurate of a
> parameter name.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/297 | 24 ++++++++++++++----------
>   1 file changed, 14 insertions(+), 10 deletions(-)

Thanks! :)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


