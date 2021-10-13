Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB1942BEE4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 13:28:41 +0200 (CEST)
Received: from localhost ([::1]:54250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1macR6-0003oW-MR
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 07:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1macPQ-00029R-VP
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 07:26:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1macPO-0002XB-F3
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 07:26:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634124411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oqwfSXEziPxd/XKla7XgGTo3P0Mzth2Rrp9AlOYdf9M=;
 b=FZbGahuRjN1cWmAYR3IZ9OcWiJPbWLXun7pfB0XwPYnwLX48c0Ofw4e1NRjgJRRLeH3lvk
 1LuXwMu2/FvxwTEEOoe1zOAHgujdSBbABkG3o1UMK3g5ZizN4OsuvEMsOYjKy4ghGoJrQo
 0yzWQZGfy74s7yAxMD7hCA8lQ14kGbw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-rYiRCDVRMwqNouOsaKW1GQ-1; Wed, 13 Oct 2021 07:26:50 -0400
X-MC-Unique: rYiRCDVRMwqNouOsaKW1GQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 s18-20020adfbc12000000b00160b2d4d5ebso1735663wrg.7
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 04:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oqwfSXEziPxd/XKla7XgGTo3P0Mzth2Rrp9AlOYdf9M=;
 b=VB1o9QskOzgXz1OsEuor659VLJ7k0mqhd2qKnr6CDGHcI5JvBzenHtBwfYOM4LZ4H2
 yZK9pjgFp+TGQYf/i1YxEgBJiKF+GdFVO93StWdEM5gX9J/6qaOJxW+eCFt1di4ZDZfw
 a01taGo3ejxR8KBgikv1mfqA4jax53kjGghu3WatYKx7UtS8PZsYYTa7VNoXTdq7+Qfp
 EAeqvhuLWnqFGZwpOOa5Qmt+meEKriNxiHjLyirCF/BHu8lJklNLt5yQz0QaMDROrBYS
 CWa5BOh4VL/h9I9NCzWi8yh5VegH6D9MFfexYWUDj88YrzsYFAAGNbGlIFjlbwIPhS8X
 oqbA==
X-Gm-Message-State: AOAM531jwBbbsVER8M7e/44lFDJooKz9u3D64Q7/vzeuWelEJDBD0+/k
 5yG8fx/Bq+gfm9x4pR5jiAT0Qsh2hnBndxky2I8eV0g47zeWz/YnfHSUYKgN2SybBkBhlN4Wp26
 all+b/HwGSwBEkjc=
X-Received: by 2002:a7b:c938:: with SMTP id h24mr12286200wml.126.1634124409823; 
 Wed, 13 Oct 2021 04:26:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8TY86oxPwQ8TNQPkGzhHMvbqFU/HWuU5ODKMQ/KgvrMaYCtCTCcTCtJYnBfTchTQMbCOruA==
X-Received: by 2002:a7b:c938:: with SMTP id h24mr12286172wml.126.1634124409600; 
 Wed, 13 Oct 2021 04:26:49 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id b2sm5060268wrv.67.2021.10.13.04.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 04:26:49 -0700 (PDT)
Message-ID: <9720b050-a806-fe18-8f24-8a128762cf45@redhat.com>
Date: Wed, 13 Oct 2021 13:26:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 08/13] iotests/297: refactor run_[mypy|pylint] as generic
 execution shim
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211004210503.1455391-1-jsnow@redhat.com>
 <20211004210503.1455391-9-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211004210503.1455391-9-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 04.10.21 23:04, John Snow wrote:
> There's virtually nothing special here anymore; we can combine these
> into a single, rather generic function.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/297 | 46 +++++++++++++++++++++++-------------------
>   1 file changed, 25 insertions(+), 21 deletions(-)

Acked-by: Hanna Reitz <hreitz@redhat.com>


