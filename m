Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12654E46AC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 20:30:14 +0100 (CET)
Received: from localhost ([::1]:53618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWkCr-0008C1-E0
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 15:30:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWkBk-0007N4-SK
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 15:29:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWkBi-0003Xm-8s
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 15:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647977341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NZ0M7TWAVbeeQPjyu7qbhgvsVCGswB/zEBbvxYHri4c=;
 b=aK39GZdaj4jLSSJZz+NS63g2L2wBqK1D1LcYCre9p4iQQgVkKN03pP00D0RCv59WbTfO86
 /kx0PUKnZxQ49go9zplOpu0TGN81QOw2BeXK46LYCEAi7F90B8idzFZScISDcFFhQW9kr7
 usWh7IN18P47/jBKCmpySoUS14vIITM=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-egCO5_q2NO-_uC0V05_q6A-1; Tue, 22 Mar 2022 15:28:59 -0400
X-MC-Unique: egCO5_q2NO-_uC0V05_q6A-1
Received: by mail-vs1-f71.google.com with SMTP id
 g20-20020a67dc94000000b003253f7908dbso456663vsk.13
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 12:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NZ0M7TWAVbeeQPjyu7qbhgvsVCGswB/zEBbvxYHri4c=;
 b=ieX70Spfeys/dBh82FPAyw8SGvF5HR8bW5c4zVwkObUNtq3gdMHysiRYaj2YffTybE
 /0uQz9KoxgZWcnm07EvVIU6qYVZYOMH1Jq51WAEQXMUYsg+hBZXMthVUb13Nb3iGkcQa
 bkzoh7bJDS7X0E2okQCvFPRDuSlBZlmv/AfMOFc79URo1DQWYBWmUdBjR0lGz2cZEwr4
 xAABrcbVFBY1x8aZXMF525bqBcDXF9edbYtPXZVCAla3kTsnejCymrfgTV/lGy+/2Rte
 QQAFwDLfacwVAks3hDmjDRnNoExfX1NgNfQpXFVMF203LtqfsDwsScPx97hVBx0irB5f
 TqIg==
X-Gm-Message-State: AOAM533xdpCyDXq38d25IihDEBRDdmkJvVlJ7JTSzEcZNkLWcZfUDUQA
 9AXtaze+fUJbk8hBhGItw1F82k5/TYnesk8VyWEJ70LZNEh4vfyJOR9Ppv4PNQUn9EiLjIFfsbP
 Fr/Mt/tuEtilM6zUaeBMYOtB+mbag/Pw=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr10952707vsa.38.1647977339303; 
 Tue, 22 Mar 2022 12:28:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN/J6F6rGpMDXS/dZLKBBbUR/RkUpKyzOC9v/nNJZPFoAUvolydNNoxWSiJTyzdu8189+t6T9o+lFTpr0/UAo=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr10952698vsa.38.1647977339116; Tue, 22
 Mar 2022 12:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-14-jsnow@redhat.com>
 <6ce9a930-3a89-dae0-4a43-c00af005fbbf@redhat.com>
In-Reply-To: <6ce9a930-3a89-dae0-4a43-c00af005fbbf@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 22 Mar 2022 15:28:48 -0400
Message-ID: <CAFn=p-ahhsR2suoA9rN6a3Sro-3BvjyEtT4f7oYR1s0JcNgA9Q@mail.gmail.com>
Subject: Re: [PATCH 13/15] iotests: remove qemu_io_pipe_and_status()
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 22, 2022 at 12:39 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 18.03.22 21:36, John Snow wrote:
> > I know we just added it, sorry. This is done in favor of qemu_io() which
> > *also* returns the console output and status, but with more robust error
> > handling on failure.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/iotests.py           |  3 ---
> >   tests/qemu-iotests/tests/image-fleecing | 12 +++---------
> >   2 files changed, 3 insertions(+), 12 deletions(-)
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>

I goofed this patch -- some of the failures in this test are expected
and this patch breaks the test. Dropping the R-Bs. v2 will explain
what's up in the commit message.

--js


