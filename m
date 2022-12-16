Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB81864E7D6
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 08:38:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p65IU-0002sX-UV; Fri, 16 Dec 2022 02:38:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p65IT-0002sK-Ar
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 02:38:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p65IQ-0007zQ-Ti
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 02:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671176298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vevrVtu3Eu3d8iVfFQuHfZyy2YxpvSyCz+rC6bfszyg=;
 b=ON123T4/SQM7G1lFr0+uEAjVA91avFyGpM7plFqN7413ou1n0Knqb7y/8gR055xXBdye3Y
 4mk5d801v+O+/5Fh+hPr93wBknr5+DfilNhsizFYGrNyAx99BGXDeyfiwlNR0iIx29c5fh
 slhydyUCbGExTu1rmoamKscEcYNJFOM=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-581-h9sclBhrPKqO-LePIbPEaQ-1; Fri, 16 Dec 2022 02:38:16 -0500
X-MC-Unique: h9sclBhrPKqO-LePIbPEaQ-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-143d68edfa1so947783fac.11
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 23:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vevrVtu3Eu3d8iVfFQuHfZyy2YxpvSyCz+rC6bfszyg=;
 b=dg+Q1Wimk9oc8SBVMrHxQbWJVkngK5AhnHKs4cIWu1gskHn9zVZh33mPCFLV3NZlhG
 29YDPuLgO4Nx0pbf+ZvBherf8yjyEGeouASUBrBWcPQUqHXCmfA3kW6IzZ/2c7CSe7Yk
 awKQUHcxcDgeCEvsAaf4V4w1DMd2nqt45ViaXT62Mytcnv29LqgJLLIneg7mY1EFW8Tk
 6vN5kU7nEjhdQUDqBLmlCSmcLXU/e4TQO4YM+n/9Jq6T3ikDMqroTTFyWF/YPFChHbGx
 Q5ZwfOibidRrkU8FsDBVtfk8dTtCLUEwmlv7mXuTRY7eN/YkdVXqenr22tSaiH+DDN1y
 dcPQ==
X-Gm-Message-State: ANoB5pliBuNGnoQhwY1hLM+BhtPMycP/NbnTX/atuJunGNAZgWwvnDHU
 QJHLQwIDjMf6Lxu5VY0YEjhjARty5GOXHWNFIvu0FWtrPctCi/i4trQ/Xbu5KmNnjNFHG+06BRG
 u0dAG/vGzNQu4vy+qDQfnCxnFjL/Uz2c=
X-Received: by 2002:a05:6870:9e8f:b0:144:a97b:1ae2 with SMTP id
 pu15-20020a0568709e8f00b00144a97b1ae2mr349752oab.35.1671176295863; 
 Thu, 15 Dec 2022 23:38:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7EFL2eDb1jOagHZfm055TcJ0SCtQP1lCI32gMjg6YWuN9cNv7cq9zH4kunye6iw1PGiGimXM9CSEHjZH45iPw=
X-Received: by 2002:a05:6870:9e8f:b0:144:a97b:1ae2 with SMTP id
 pu15-20020a0568709e8f00b00144a97b1ae2mr349744oab.35.1671176295649; Thu, 15
 Dec 2022 23:38:15 -0800 (PST)
MIME-Version: 1.0
References: <20221110125224.99596-1-thuth@redhat.com>
 <ac836d36-16ab-7fca-da0b-dc9ec93ee38f@redhat.com>
In-Reply-To: <ac836d36-16ab-7fca-da0b-dc9ec93ee38f@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 16 Dec 2022 15:38:04 +0800
Message-ID: <CACGkMEsPciyeTovtDExNAgNmA1LyqiAiW9eZOTw6x710_5Tggg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Fix the "-nic help" option
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 pbonzini@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Claudio Fontana <cfontana@suse.de>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Thu, Dec 15, 2022 at 11:23 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 10/11/2022 13.52, Thomas Huth wrote:
> > Running QEMU with "-nic help" used to work in QEMU 5.2 and earlier
> > versions, but since QEMU 6.0 it just complains that "help" is not
> > a valid value here. This patch series fixes this problem and also
> > extends the help output here to list the available NIC models, too.
> >
> > v2:
> >   - Add function comment in the first patch
> >   - Add Reviewed-by in the third patch
> >
> > Thomas Huth (3):
> >    net: Move the code to collect available NIC models to a separate
> >      function
> >    net: Restore printing of the help text with "-nic help"
> >    net: Replace "Supported NIC models" with "Available NIC models"
> >
> >   include/net/net.h | 14 +++++++++++++
> >   hw/pci/pci.c      | 29 +--------------------------
> >   net/net.c         | 50 ++++++++++++++++++++++++++++++++++++++++++++---
> >   3 files changed, 62 insertions(+), 31 deletions(-)
> >
>
> Friendly ping!

I've queued this series.

Thanks

>
>   Thomas
>


