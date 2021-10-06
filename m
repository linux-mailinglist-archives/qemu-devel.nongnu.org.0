Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C744542466C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 21:03:36 +0200 (CEST)
Received: from localhost ([::1]:44548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYCCV-0007ty-Ss
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 15:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mYC8W-0004wU-IT
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 14:59:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mYC8U-0004lr-3P
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 14:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633546765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Edci0FiKhWBAqTgMO1XQBM7kgF5WKujFYYg1FFazH/U=;
 b=G3n2L3BU/7/yZpCQcvJgEEyEvl5Msz4tdEvLDe2Imd4swAgfjKdKykl3zKOQ9YGvHYYeuq
 3HYrISkCT9JvxO73T8f7s8nh8ixjHW6HtBBx7lj4Ll0rqLwyhjCtx/DSoHwSLt+MmJELH7
 dWYRx8cVLhqrl2OXkyB0wHmpeojnvuY=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-RLPuvlgdM2Gb87jUQaUoYw-1; Wed, 06 Oct 2021 14:59:23 -0400
X-MC-Unique: RLPuvlgdM2Gb87jUQaUoYw-1
Received: by mail-pl1-f197.google.com with SMTP id
 h3-20020a170902704300b0013dbfc88e14so1928986plt.13
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 11:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Edci0FiKhWBAqTgMO1XQBM7kgF5WKujFYYg1FFazH/U=;
 b=nlEXZePg3BGKOUq80aTSoZ73d29mflbZc95dEL0g1tj30IGhyYnUJy79lRZVgCHxJK
 E9WDaV2U3XTx/W1EZkzCllmp5vXeuT20TBmqBHTVs/wzjaIVnuYVLJPOWePf8CrouPJF
 Oz42KtKeljy9mSvi4OK7FwZ4ff6fMEUqvHtDhQ9rQG2exd98CK2dvFZJsIr68ZNwsaW7
 vojX7SeyA3LixJdAt9CnmqgksguoU5UAIsTqwVC2gHo+XUtx2fJPRSOY+F0fjqJW9dWt
 qMjumXvXbUV3y+97WE4a65/NMtk1MKGRzq7wxHPi62Tu25qnXpAIlkHOZYtstTlyETuK
 V/EA==
X-Gm-Message-State: AOAM530pprAFN3cUPo6r5m0n6mkC4rmHdTzZ3B9uGmbndgzB8i86ZTyw
 sJ9GfIy4Oj+N4HFbrWBhp5vSGpYvKvorrCjD5UVHkOfEmEf0Bu7gtGnvUX9K6aMzhS8E13N+HsR
 954ei9oZMCubgbbyXy2XviEwB2Z3/+Fw=
X-Received: by 2002:aa7:8b56:0:b0:44c:10a:4ee9 with SMTP id
 i22-20020aa78b56000000b0044c010a4ee9mr35415590pfd.46.1633546762279; 
 Wed, 06 Oct 2021 11:59:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNNc44OZPPUj+PSDy2P9eGSu7afrXtrzwHmVOkNKYSMJZmVwzNL/Z6a6tOS5gScQZ+btlqoLXmfMcvHeDRMF4=
X-Received: by 2002:aa7:8b56:0:b0:44c:10a:4ee9 with SMTP id
 i22-20020aa78b56000000b0044c010a4ee9mr35415563pfd.46.1633546762089; Wed, 06
 Oct 2021 11:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210924185506.2542588-1-crosa@redhat.com>
 <20210924185506.2542588-14-crosa@redhat.com>
In-Reply-To: <20210924185506.2542588-14-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 6 Oct 2021 15:58:56 -0300
Message-ID: <CAKJDGDbxR7k8Vxw8OJTLfE=cbmSyT6Uc2SM_2e63sR_MbS33Lw@mail.gmail.com>
Subject: Re: [PATCH 13/16] tests/acceptance/boot_xen.py: use class attribute
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 3:59 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Rather than defining a single use variable, let's just use the class
> attribute directly.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/boot_xen.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


