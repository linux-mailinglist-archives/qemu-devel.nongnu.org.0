Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEDD61EC63
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 08:47:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orwp6-0007iK-Rf; Mon, 07 Nov 2022 02:45:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1orwp1-0007gu-Pa
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 02:45:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1orwp0-0004nE-4G
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 02:45:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667807129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aj3uTnqZQnqOGp5UGLXuBRtzlALbVd9ne9dPex4vt2g=;
 b=c2WL6/wxNsCNxtKO/GtDb7unG0xaRp2oQIQGc4XfY5wAq+/zMcZBRpDbKO8rm9SJZCpC4E
 G9GUnCZWAhZlRmY1UYj34Y4+oY0qv3hilJIhegziIn1coa2TxaTEj5p6O2CBzM8owXydn1
 sFQ/OH8/Gs/DlpoF5e545DbVMtAcXc0=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-191-2EfwoGrtM6KMyt4SPRrjeA-1; Mon, 07 Nov 2022 02:45:27 -0500
X-MC-Unique: 2EfwoGrtM6KMyt4SPRrjeA-1
Received: by mail-ot1-f72.google.com with SMTP id
 r17-20020a056830135100b0066c3ca9c6d8so5302207otq.15
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 23:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aj3uTnqZQnqOGp5UGLXuBRtzlALbVd9ne9dPex4vt2g=;
 b=YH7RTafNGUdU9CpIQLN+PMrwYEC3jW+4sLA/XQUAppWTWLcGAn0wiUgyw2VAM3sexi
 twzEJgRz0w8KeM2CzGgVAGyVNnxpkptypzb38J2hBpn/qEcxS3+8tbpmpEIqlwGJHiTA
 Iw8eXFRD+/ytspjugqpZgVji35kyQhKY9r1oq/KTCnZDDGxtsJIAlOcQMhRahvKqms9L
 qr+WygdTs/A3Ivsdd+V4klhjZxjhK0aiED13hjWDUyBGcQKp7pUAhoRZztqhuirAbtkX
 JoaQgNKEFtUO8Z1EAGBsyMO7VpozdkCW1oAdo/ensgyrf3GYsoo3rbMGhdubzzlf3fN5
 h6JA==
X-Gm-Message-State: ACrzQf1Wdz/vLL140rjGvaABEjBUzoRv2mUafcpPy1O8cNm7gok1oyrS
 gzbJFzzOOcyW8n4CkTCowUG6O5/N5WUX26Kjb40QbdpY3kk/UQx830AyGtXBXh5UzUbl/ToYskF
 myEPjNoSfC+04Un4T+ihCGS8/F8VbTFk=
X-Received: by 2002:a05:6830:16c5:b0:66c:6a63:dd4c with SMTP id
 l5-20020a05683016c500b0066c6a63dd4cmr16046872otr.201.1667807127135; 
 Sun, 06 Nov 2022 23:45:27 -0800 (PST)
X-Google-Smtp-Source: AMsMyM56ltRN5SAih3JHToCBIr3XHsr+WZXmBw+sgMQL4J+WwlEpbBQPu2YbWSI+Wi1oxRwNA24ts31qPCGJGP8s4Ac=
X-Received: by 2002:a05:6830:16c5:b0:66c:6a63:dd4c with SMTP id
 l5-20020a05683016c500b0066c6a63dd4cmr16046864otr.201.1667807126974; Sun, 06
 Nov 2022 23:45:26 -0800 (PST)
MIME-Version: 1.0
References: <20221013055245.28102-1-akihiko.odaki@daynix.com>
 <ee90e31f-1036-1ce8-d1c1-174cc58cf0e0@redhat.com>
In-Reply-To: <ee90e31f-1036-1ce8-d1c1-174cc58cf0e0@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 7 Nov 2022 15:45:15 +0800
Message-ID: <CACGkMEvgYOkW5d=ubxcAFBpZo-dMRz6jDuGjPDHKP7ny=cgn-Q@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/libqos/e1000e: Use e1000_regs.h
To: Thomas Huth <thuth@redhat.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-devel@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Yan Vugenfirer <yan@daynix.com>, Yuri Benditovich <yuri.benditovich@daynix.com>
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

On Tue, Oct 25, 2022 at 10:54 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 13/10/2022 07.52, Akihiko Odaki wrote:
> > The register definitions in tests/qtest/libqos/e1000e.c had names
> > different from hw/net/e1000_regs.h, which made it hard to understand
> > what test codes corresponds to the implementation. Use
> > hw/net/e1000_regs.h from tests/qtest/libqos/e1000e.c to remove
> > these duplications.
> >
> > E1000E_CTRL_EXT_TXLSFLOW is removed from E1000E_CTRL_EXT settings
> > because hw/net/e1000_regs.h does not have the definition and it is for
> > TCP segmentation offload, which does not matter for the implemented
> > tests.
> >
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > ---
> >   hw/net/e1000_regs.h         |   1 +
> >   tests/qtest/libqos/e1000e.c | 119 +++++++++++++-----------------------
> >   2 files changed, 45 insertions(+), 75 deletions(-)
>
> Acked-by: Thomas Huth <thuth@redhat.com>
>
> I can take it through my testing-next tree:

Acked-by: Jason Wang <jasowang@redhat.com>

>
>   https://gitlab.com/thuth/qemu/-/commits/testing-next
>
>   Thomas
>


