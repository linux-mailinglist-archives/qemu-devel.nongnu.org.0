Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB5F566466
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 09:57:41 +0200 (CEST)
Received: from localhost ([::1]:41920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dRE-00084N-Ke
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 03:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8dOp-0005y6-4K
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:55:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8dOl-00065A-Tu
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657007707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5tKYJtmJA+GmrUs4WIx57iJELlGTGT+wDeDmZUq5QM=;
 b=eJRUvyEAHqOf1himMslQZOzQsHXnLgOCgfz52ItdZFyCthq9/XXHqS6qDNhQSNhOHGQAoB
 HW5L5bvPwSCck/15VXWmkVP1/IfEaiNRaDIY57y5BCGfDhZxIlZPfMSAl7DgMnBiXNEbuw
 aBX0sYoHGK9sMwLnFSHDDmYHF81Kzf8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-fuBlHK2TN3CPJmN4FvZXew-1; Tue, 05 Jul 2022 03:55:06 -0400
X-MC-Unique: fuBlHK2TN3CPJmN4FvZXew-1
Received: by mail-ed1-f72.google.com with SMTP id
 t14-20020a056402524e00b0043595a18b91so8696209edd.13
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 00:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R5tKYJtmJA+GmrUs4WIx57iJELlGTGT+wDeDmZUq5QM=;
 b=apx/cLxKAKBLQOeO69A5VHyVPN4xLGo9yWOFsEm29Aevw+mL8sHmlR+GQvXCiDtK7w
 deE3VQjC+6FALZLfnd64mAACEG3q1bPLtPSa809YMp0L0k8O/SIreV6xM52WiyyZn3fO
 QiYkTPhXHnr9mu9hxGLs9rpiRZbjNaGG5kSyXyRLUjwKBnUX1fFVDw0yM7F55PLgJGcU
 5e2T0BCn46FrtmrFjlF8S2EQaHqThfHYPXC08WYBZx3Do8mAeJtrQPufKda5Vr3MM9UI
 Ixk+1iXKA8Blb8KZJVwUCXo5dm0rC3nY19IJpJMLkwcsaEMiy+7dBaoZL0Sh0i7Ekqho
 7TkQ==
X-Gm-Message-State: AJIora++TxPRAXSN9trQm3okRAOoePNtQoM0BjBbZQPns9gSe+pk3lhs
 JbcCE/KvrZ6TT6fp1hLWRPlB8nIJC3Bz6g3llWls7mGctjPNW8yrV045dBI+o7AJdVPlPruuZNv
 7liykmBJ0AhN6Knk=
X-Received: by 2002:a05:6402:43c4:b0:43a:6309:6c9b with SMTP id
 p4-20020a05640243c400b0043a63096c9bmr10737979edc.91.1657007705180; 
 Tue, 05 Jul 2022 00:55:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uyWp4REf6ZT7ZYPnKLEM71M491n3JS4WRP1zVmpP7OcRNQPb4FbOMeaW6yx7OSXImxJCCPFA==
X-Received: by 2002:a05:6402:43c4:b0:43a:6309:6c9b with SMTP id
 p4-20020a05640243c400b0043a63096c9bmr10737960edc.91.1657007704887; 
 Tue, 05 Jul 2022 00:55:04 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a056402241900b0043589eba83bsm12329156eda.58.2022.07.05.00.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 00:55:04 -0700 (PDT)
Message-ID: <cebd55ce-8139-c9ba-7284-8177c4d46e6c@redhat.com>
Date: Tue, 5 Jul 2022 09:55:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 07/18] block: Add blk_{preadv,pwritev}()
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113837.199696-3-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113837.199696-3-afaria@redhat.com>
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

On 17.05.22 13:38, Alberto Faria wrote:
> Implement them using generated_co_wrapper.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   include/sysemu/block-backend-io.h |  6 +++++
>   tests/unit/test-block-iothread.c  | 42 ++++++++++++++++++++++++++++++-
>   2 files changed, 47 insertions(+), 1 deletion(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


