Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F72D48E8FE
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:14:00 +0100 (CET)
Received: from localhost ([::1]:38932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KWt-0000by-6q
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:13:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1n8KI7-0006zD-4Z; Fri, 14 Jan 2022 05:58:43 -0500
Received: from [2607:f8b0:4864:20::933] (port=42700
 helo=mail-ua1-x933.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1n8KI4-0002Ct-F8; Fri, 14 Jan 2022 05:58:42 -0500
Received: by mail-ua1-x933.google.com with SMTP id p1so16232010uap.9;
 Fri, 14 Jan 2022 02:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cU/MDS19N/vdVKWZhLGczm9vCsUkhvGtzg+BwxovWwU=;
 b=UYoFFXDjn0Uolaxm21gxcWlRDnQnhS+t82G6xVpnmrEIzcF+NHcLf4KZju9Vg7c3u2
 Mkx8iUTRLvCq0hNOsoHn0LGKwHbVwBuEXUWTk8Wog/T9x36GoXxbcyE5Mx5m/hnllTJC
 5GJ2NYwAxO9xy/+dI9lebgdBHI14gUxLE5CZt5hEF34pKdFkPg4HMH1c8u1vrw2+NKRd
 e8trfxPoAB5BiKfsyF2m5C58YZndE34RSX6pcEX7OqhX6iRq/yT/zHF/fw2XmjxKZ7nP
 4nvj/Z6fpZ76pntslHA7pfC1caZM3pP4BLlLigKQTwzOREe+lnrodFvEn+4MMjqLe9aW
 eODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cU/MDS19N/vdVKWZhLGczm9vCsUkhvGtzg+BwxovWwU=;
 b=kM4iI/OxZtWIOXOrLSFIa+BpeZX9u/HSsH/d6AJ/SKg9GHX+Bfm4PUtSpQotZVI9tt
 MlpTcVgdOQ3Wvqeps+gthQsrFlqMapdFor/VmaGdc1FytC69TWPWNnHY9xCD6pevmZxe
 hnV66JUq0bMbH6lEjeHW+/KuUVBc1JD1UkUqo91Ui3KSTu6DJa1IaTZ3n7ZAlQgY8F+M
 UPBQBZSmBgN6y4VMcPFzyAvBd6BLGv5BQTjzn5rpvvcGHOOzdllQzPUIgGbEdfWAc3iE
 f5qtGprndHNcyQAvn52+/Uz1S8ljhi0Vh4RLCeXM3yHKuwwUy7qJ4wYClqpP4KqI+2EJ
 e+mw==
X-Gm-Message-State: AOAM5334dzk6fTBFVcHEkUb2k9Z6WOPcAZJmtLmCYF6r3Yy7BPxhbmIA
 /b3J+oLGPrjhyVnNvxz+1Nqvz9gUA4fmO4j0UdXOtfgjPyI=
X-Google-Smtp-Source: ABdhPJzieRAoA9mGV5gV5IS+SdKyCWhm8qbz5MVIH14hsROe26geeUOQA9/Ju7nnugCUCpH8J1ePv5lyCg93WKm6ESs=
X-Received: by 2002:a67:ef1c:: with SMTP id j28mr3914985vsr.13.1642157919306; 
 Fri, 14 Jan 2022 02:58:39 -0800 (PST)
MIME-Version: 1.0
References: <20220113144426.4036493-1-pl@kamp.de>
In-Reply-To: <20220113144426.4036493-1-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 14 Jan 2022 11:58:40 +0100
Message-ID: <CAOi1vP9r3_aWPdvxWxcivC57f74G418=7esi6xd5ydBeOENmQQ@mail.gmail.com>
Subject: Re: [PATCH V2 for-6.2 0/2] fixes for bdrv_co_block_status
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::933
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=idryomov@gmail.com; helo=mail-ua1-x933.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu block <qemu-block@nongnu.org>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 3:44 PM Peter Lieven <pl@kamp.de> wrote:
>
> V1->V2:
>  Patch 1: Treat a hole just like an unallocated area. [Ilya]
>  Patch 2: Apply workaround only for pre-Quincy librbd versions and
>           ensure default striping and non child images. [Ilya]
>
> Peter Lieven (2):
>   block/rbd: fix handling of holes in .bdrv_co_block_status
>   block/rbd: workaround for ceph issue #53784
>
>  block/rbd.c | 52 +++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 45 insertions(+), 7 deletions(-)
>
> --
> 2.25.1
>
>

These patches have both "for-6.2" in the subject and
Cc: qemu-stable@nongnu.org in the description, which is a little
confusing.  Just want to clarify that they should go into master
and be backported to 6.2.

Reviewed-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

