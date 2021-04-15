Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1E93612EC
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 21:34:39 +0200 (CEST)
Received: from localhost ([::1]:33108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX7l8-0007Bd-Ba
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 15:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lX7kA-0006gG-L3
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 15:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lX7k8-0006vE-6H
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 15:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618515214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lNFaIwOrUyYhklOPnp1cguu2CWnjxYkJQw3F6YghBp8=;
 b=btDo1/Ef2llWE44TClNY2LiFAkoZVdp6qyagrnrTtvN3m1WqWCEixdC4lInCMLs6ECnqOg
 tpY3wkLr+9xRLrkCd8P542VLiK4Ozc/WUdAabth7pEFdIaZXrvgJFg0ucmt6mi+RCuel4K
 zBitUnkBXfShzGYJflKpRaDZ9APFecQ=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-jGw3XIiYMFCQHiEPJc8sFA-1; Thu, 15 Apr 2021 15:33:32 -0400
X-MC-Unique: jGw3XIiYMFCQHiEPJc8sFA-1
Received: by mail-oi1-f199.google.com with SMTP id
 r204-20020aca44d50000b029013da91480a0so8191838oia.17
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 12:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lNFaIwOrUyYhklOPnp1cguu2CWnjxYkJQw3F6YghBp8=;
 b=XiVoxKS0Tqc5Y/VlWJVoxZ3rsfQMmgGkhh/JYq2/LfOyH4tCxYXlHSZstRHMmI33iE
 Uco/9FF7iOmR8gYX+SPYpq79IHEHLPlRFgrn7zCPXRLcV4T1PmyoCMEwUcBR3uctH5Ls
 jkTkh57t2b8wWTuygxSKJgaAORNsf6W1y9tAGdezjzR5rn62H3E3fKKxPKtxqcl9uBKV
 zgqhp7A1uf9p6oTX0SXUfpUziib7LvEyBXAJgYBNVoyaSMyeS2JJWMWbGuyaSqdESNbz
 FuL4ykGXlQxYo9pVsEZrlICBHV4kqUh7pzxTuzG/P7oJeJZPb0HOsULKN6JP0YS3Sdpl
 iCUw==
X-Gm-Message-State: AOAM533wOAFkSAJGUwN0J//pqHtN4KBB1tEXMaFusAttYhQRqNAbjAHa
 zGX9nWQzQIwEGx7wtnUUrKfg2VCfYdsTmxBOMwZP5xcs8mQjLddnl9MmdhRTc+Jy9BNYn175WNj
 lrT2NmWEZEo47l1I=
X-Received: by 2002:aca:308a:: with SMTP id w132mr3801660oiw.110.1618515211861; 
 Thu, 15 Apr 2021 12:33:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpIjFqmVw82dhGsA3mQO4JoV/57d0FfLpLhygFsUIz1bBUfgyuktqrmVniyF72eQ/GUohOzw==
X-Received: by 2002:aca:308a:: with SMTP id w132mr3801647oiw.110.1618515211630; 
 Thu, 15 Apr 2021 12:33:31 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 l22sm815267oib.15.2021.04.15.12.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 12:33:31 -0700 (PDT)
Subject: Re: [PATCH 0/5] block, migration: improve debugging of migration
 bdrv_flush failure
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210415135851.862406-1-berrange@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <1395f960-2620-9361-4bb1-25f3a620c756@redhat.com>
Date: Thu, 15 Apr 2021 14:33:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415135851.862406-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 8:58 AM, Daniel P. Berrangé wrote:
> I spent a while debugging a tricky migration failure today which was
> ultimately caused by fdatasync() getting EACCESS. The existing probes
> were not sufficient to diagnose this, so I had to resort to GDB. This
> improves probes and block error reporting to make future diagnosis
> possible without GDB.
> 
> Daniel P. Berrangé (5):
>    migration: add trace point when vm_stop_force_state fails
>    softmmu: add trace point when bdrv_flush_all fails
>    block: preserve errno from fdatasync failures
>    block: add trace point when fdatasync fails
>    block: remove duplicate trace.h include
> 
>   block/file-posix.c     | 10 +++++-----
>   block/trace-events     |  1 +
>   migration/migration.c  |  1 +
>   migration/trace-events |  1 +
>   softmmu/cpus.c         |  7 ++++++-
>   softmmu/trace-events   |  3 +++
>   6 files changed, 17 insertions(+), 6 deletions(-)
> 

For the series:

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


