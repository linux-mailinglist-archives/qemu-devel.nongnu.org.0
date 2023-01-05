Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38DC65F790
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 00:27:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDZca-00057q-Eq; Thu, 05 Jan 2023 18:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDZcY-00057d-1L
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 18:26:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDZcV-00071c-5R
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 18:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672961157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsHHM9u0YKqJ5nzdKmJkzaiVLH39UcthfZCvOfgo8P8=;
 b=W0WqtW7fsCbpkh0WXP4ckKQHh/lkppw//eD+PBWApTKD5Le1rtve0sYGgpXUoDEbRDPBH1
 8Zulsba1OPAS7Y6G7ios3gmlCDbNE/msc3Imot+TNIAgWLgjztfDbGSUhiMWb+jGl4pAI/
 g5OC0IRC2dS4QvKSLwvKm0Ouw+u2vAo=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-29-xdkjoijBN-SJQXLGWkDppA-1; Thu, 05 Jan 2023 18:25:56 -0500
X-MC-Unique: xdkjoijBN-SJQXLGWkDppA-1
Received: by mail-lf1-f71.google.com with SMTP id
 cf15-20020a056512280f00b004a28ba148bbso13468273lfb.22
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 15:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hsHHM9u0YKqJ5nzdKmJkzaiVLH39UcthfZCvOfgo8P8=;
 b=NsVUPrugqBOxIxdQ6i5bjaw84Emz/ER0OcL5/CYCafsXC/H50IGoqzxGqAeIz94Q9W
 CBUPWPOYSOoA9EBh1xjWdtWLANhOJlUuEDMs1EQQC2urB1b2w7nbCskvXWd8PXV4RJ6g
 ECGBOElNO7GW9b9yiQk7YjXqOw8k6QFTNgxG7b2cGJAz1IU/Pfx/ajfEAV6Ps5pHFVJD
 Vn81IQ+0Kkv8s/hSGYoZIxw7XToaxrp+lPmHvV1adJRXHtRnFv6VK4BzLKpph7Liz3Px
 bjIcaCFt7Yr4Qg8q3vKJL3zRdUeZM8bT2RtSYKDTauHaKYRFrf+2YohdMOFdovx7fjeT
 VcIA==
X-Gm-Message-State: AFqh2koROj09/VxleMndhu98Ta6kSo4YtxCZF6aaTZGnmpiCwSNsVih+
 IN/+gkqFvQ2WOl8f0N5XBro1tSrZ8S9Jq23GDEY6oGoMozLLngYH9nBD416MKs/Jr7vQIBR0NY4
 5AsdIDOQIbvcAtWBy/7RBqLQaW8HjSvM=
X-Received: by 2002:a2e:3010:0:b0:27f:c1e6:94c5 with SMTP id
 w16-20020a2e3010000000b0027fc1e694c5mr2183468ljw.6.1672961155019; 
 Thu, 05 Jan 2023 15:25:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu915SR8fRYxHaHx0H7Q8tc3Kfwf8k1hETVLZqfvIyqsf9RqRZVkzWgzCz8SkuoiY2/BKPAnw2sJl7cO9mwdDg=
X-Received: by 2002:a2e:3010:0:b0:27f:c1e6:94c5 with SMTP id
 w16-20020a2e3010000000b0027fc1e694c5mr2183465ljw.6.1672961154758; Thu, 05 Jan
 2023 15:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20221130015358.6998-1-zhangdongdong@eswincomputing.com>
 <1ceb5a68.dd0e.18518f40d8f.Coremail.zhangdongdong@eswincomputing.com>
In-Reply-To: <1ceb5a68.dd0e.18518f40d8f.Coremail.zhangdongdong@eswincomputing.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 5 Jan 2023 18:25:43 -0500
Message-ID: <CAFn=p-bnm5WgBO-eXTyuV+mPiCYaLM-rFaUVXY+kmU39GvwpZw@mail.gmail.com>
Subject: Re: [PING PATCH 0/1] Fix some typos
To: Dongdong Zhang <zhangdongdong@eswincomputing.com>
Cc: qemu-devel@nongnu.org, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Dec 15, 2022 at 10:22 PM Dongdong Zhang
<zhangdongdong@eswincomputing.com> wrote:
>
> Hi all,
>
> I would like to ping a patch
>
> https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg04568.html
> https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg04570.html
>
>
> > -----Original Messages-----From:"Dongdong Zhang" <zhangdongdong@eswinco=
mputing.com>Sent Time:2022-11-30 09:53:57 (Wednesday)To:qemu-devel@nongnu.o=
rgCc:jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com, "Dongdong Zhang"=
 <zhangdongdong@eswincomputing.com>Subject:[PATCH 0/1]  Fix some typos
> >
> > This patch mainly fixes some typos in the 'python' directory.
> >
> > Dongdong Zhang (1):
> >   Fix some typos
> >
> >  python/qemu/machine/console_socket.py | 2 +-
> >  python/qemu/machine/qtest.py          | 2 +-
> >  python/qemu/qmp/protocol.py           | 2 +-
> >  python/qemu/qmp/qmp_tui.py            | 6 +++---
> >  4 files changed, 6 insertions(+), 6 deletions(-)
> >
> > --
> > 2.17.1

ACK to this patch.

For fixes under python/qemu/qmp/, I need to relay these fixes over to
https://gitlab.com/qemu-project/python-qemu-qmp -- you can do it
yourself and send a small merge request, or I can do it for you, if
you'd like. Please let me know what you'd prefer, and then I will
stage this patch.

(Apologies that the code is duplicated in two repositories right
now.... I'm working on fixing that.)

--js


