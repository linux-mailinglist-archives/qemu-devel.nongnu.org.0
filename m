Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0226C5665CD
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 11:05:33 +0200 (CEST)
Received: from localhost ([::1]:60942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8eUu-0005oB-47
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 05:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8eSM-0003dm-E7
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:02:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8eSG-0000HL-1I
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:02:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657011767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nzl51AWVWRGW/7rcExy6iN7mSArqdWNlk9rsjmROwb4=;
 b=GlKeM8mgzPBEQAfpBz6yERxpp4pe2JyfyvAEZZBWvmZWMkqDqCnuj/4jOoZEkw46Vr2Wjt
 GiWliyq3UR48l0P/59hyd5Sm+ZZwfTQRWAoJtpZngta49CLJE2JzK5tEGTCQFv8p1FlqzQ
 39GAJD6ZoK1JllpK18UWNBtLHE8esrc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-Yh9jpe8DOTm4UTfe7hWhwg-1; Tue, 05 Jul 2022 05:02:45 -0400
X-MC-Unique: Yh9jpe8DOTm4UTfe7hWhwg-1
Received: by mail-ed1-f69.google.com with SMTP id
 v16-20020a056402349000b00435a1c942a9so8927154edc.15
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 02:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nzl51AWVWRGW/7rcExy6iN7mSArqdWNlk9rsjmROwb4=;
 b=KVt7rxGp+u5ZKWLBYbBD5XKZtaCHZk6PAy7+E9BEFaKJc0FFxGkG66MSPe0LJh2lUf
 1mw4vBvhJwdBu/Cfv3cczsP/s6Eer3jt5axYgq45vRc/wR8AzGMIwLBuulFA4RZM56E9
 Y5qlulcdzuvwq73Q3IM9XMEbE6Qbxo/aMSKhVDaw32oVmzCej/Suxp9CDOiOt0XwA0H+
 zabr4YdChI9sG240P3u37gcqZdpnTzHttDy5tPe+s6vWDUiHM3G2JQEuw5NxANmXGsDT
 dNLPsAc318PIkoKCg/Q2FsS4Vw3xJD7rFj4MGONLPndFJ5RxBjEEhYXzhU3kIxYjD6b/
 Nj3A==
X-Gm-Message-State: AJIora/pdgyP+NQXytPZsgA32dJk4aCCuW5f2x1IVYjSOidUUflWGVC9
 R3w4l1AvO+GTEZpKYOc4tT2q83PbMuRonIv0PyH9WQcxnIPJSRQ4bNmYH2kHh0GMPMOgZkxVu+7
 96I226X/rNSz7UkM=
X-Received: by 2002:a17:907:2d9e:b0:726:a03a:16c4 with SMTP id
 gt30-20020a1709072d9e00b00726a03a16c4mr31189256ejc.742.1657011764373; 
 Tue, 05 Jul 2022 02:02:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sgW4GIpGBujXAN4WVFA7DfrLj2kOhun3aB/DojeR3na5virh7f3XYebjzDLszNMz3g0LlSwA==
X-Received: by 2002:a17:907:2d9e:b0:726:a03a:16c4 with SMTP id
 gt30-20020a1709072d9e00b00726a03a16c4mr31189220ejc.742.1657011763992; 
 Tue, 05 Jul 2022 02:02:43 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a170906505100b006fece722508sm15404201ejk.135.2022.07.05.02.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 02:02:43 -0700 (PDT)
Message-ID: <32dba151-25a6-0349-135e-88ae1bb3e212@redhat.com>
Date: Tue, 5 Jul 2022 11:02:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 15/18] block: Add blk_co_ioctl()
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113907.200001-4-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113907.200001-4-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 17.05.22 13:39, Alberto Faria wrote:
> Also convert blk_ioctl() into a generated_co_wrapper.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             | 7 ++++---
>   block/coroutines.h                | 6 ------
>   include/sysemu/block-backend-io.h | 5 ++++-
>   3 files changed, 8 insertions(+), 10 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


