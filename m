Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D965414DF7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 18:18:40 +0200 (CEST)
Received: from localhost ([::1]:35236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT4xD-0004bk-4W
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 12:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mT4nH-0003vF-QS
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:08:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mT4nD-0007ak-Ig
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632326898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JwuQYYmREihEezL2rpcg8g9c+5JldAgejKACnvIU4uY=;
 b=Omlg1J1Re/JsVGcyFwxPLhmzKS26yckTN1KvsoiNbzyqs8rSOdi4xIhGoPD88uB6CXm3En
 8TL8OyfTJp83YuR8ZpgZBCg9OdCEXPrpTLPTeAHWqoFJV0UzpLR0G21Ol0sG7l3LofGP+i
 rwI0PAVGqKkgZLM173q6YXUc0HILE78=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-ilzD16u4N0ShJ4UhMlSciA-1; Wed, 22 Sep 2021 12:08:17 -0400
X-MC-Unique: ilzD16u4N0ShJ4UhMlSciA-1
Received: by mail-qv1-f69.google.com with SMTP id
 r18-20020ad454b2000000b00380e8260f8eso11964391qvy.20
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 09:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JwuQYYmREihEezL2rpcg8g9c+5JldAgejKACnvIU4uY=;
 b=vgyhNmxZhYRdGbr4Uji8E3jPSn+u2UXbc1bMW+yU8aF6VwKK5RUyzeKb6t/yzLx1xo
 aqD3D5XWY8+DjsasVinnwoO25ozWlXlZo6u/2wsusFlm9vQYCoErL/mLe7X7tSnCO/Up
 SdjHRahkriVlzo0AbOtxvmRh+ac9qH88jz/GljhyEdW+w4m97LkqxUwhbBK/7hrBBmXn
 KEEDyPigYxjfKPrR9AoSTaZqi8nqfS21d7Gw8K1bJHChYOv4edxnlEfmMn06dxPtB0bA
 pqpJJytnDeIcf1LI2E3YABotrNJsGX2HV7ITX5K6LpLB9aDxFTWdiCQLEyLpOKQnu2En
 Ru4w==
X-Gm-Message-State: AOAM531IZtIdCzPk2h/BY3Lws5t+wjkXm7euFvTUMwX+MnkUCSApfJY+
 65gyb32F1XC3/oLImT/wmUMFy29AmntEr5jxRrW2rRZdH1Ooxeea8KAPqD0pGxYeW4uRFzw5j53
 EKCof8DWdRHgppeEfZNs5leLAz8ghRWEUOdXxc4cj1f4xHyxf6JrhMXxmydiNQoTg
X-Received: by 2002:a05:6214:50b:: with SMTP id
 v11mr538988qvw.41.1632326896735; 
 Wed, 22 Sep 2021 09:08:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbsK41Z/5ZDnwD07NyOnR/or9huAVgEJXQRiPFdTGgW1jz7VGpcnNFIMsdatfasRaXhiQgxg==
X-Received: by 2002:a05:6214:50b:: with SMTP id
 v11mr538963qvw.41.1632326896429; 
 Wed, 22 Sep 2021 09:08:16 -0700 (PDT)
Received: from t490s ([2607:fea8:56a2:9100::d3ec])
 by smtp.gmail.com with ESMTPSA id t194sm2200442qka.72.2021.09.22.09.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 09:08:15 -0700 (PDT)
Date: Wed, 22 Sep 2021 12:08:14 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/2] Makefile: A few fixes to tag generation
Message-ID: <YUtU7sjakW6zGPiQ@t490s>
References: <20210804132328.41353-1-peterx@redhat.com> <YTeZbVXvYdXxlo8a@t490s>
MIME-Version: 1.0
In-Reply-To: <YTeZbVXvYdXxlo8a@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 07, 2021 at 12:55:09PM -0400, Peter Xu wrote:
> On Wed, Aug 04, 2021 at 09:23:26AM -0400, Peter Xu wrote:
> > I didn't squash patch 1 because they fix different things at different places
> > (patch 1 removes the "meson" dir warning on master branch already for gtags).
> > Patch 2 is the same as posted previous on the list.
> > 
> > Please have a look, thanks.
> > 
> > Peter Xu (2):
> >   Makefile: Fix gtags generation
> >   Makefile: Fix cscope issues on MacOS and soft links
> > 
> >  Makefile | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> Ping - Anyone would like to pick this up?   Even on linux I still see:
> 
> cscope: cannot find file subprojects/libvhost-user/include/atomic.h

Ping?

-- 
Peter Xu


