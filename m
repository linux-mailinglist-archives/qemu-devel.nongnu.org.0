Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C14539B55
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 04:45:49 +0200 (CEST)
Received: from localhost ([::1]:50220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwEMl-0000Ar-Qr
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 22:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nwEKg-0007Bz-Pq
 for qemu-devel@nongnu.org; Tue, 31 May 2022 22:43:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nwEKd-0007HW-TA
 for qemu-devel@nongnu.org; Tue, 31 May 2022 22:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654051414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mc0XlBXezEOWTYYs0ArYqoUft7LWjnc/1pRxneoxFjM=;
 b=fWm4BQgWZHfRi/O1Ju8z9ykA50Uk9mkJ8dKysCJLRt4vRmJFUNWHOrqNVbj5LFLowUoo0m
 0oXBvoCUcDU4cVm4gwDOw9SFHet7ZQ9VCxzjwWEIoYQhWqqPhpq7Nplox4z+S9aF7LuY6r
 U8/W2DtnG8IK45+RZWH+yAKxT0P2bdE=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-a6U3HvYZN66DhQAscJJQoQ-1; Tue, 31 May 2022 22:43:33 -0400
X-MC-Unique: a6U3HvYZN66DhQAscJJQoQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 j4-20020a056512398400b0047866b0b823so199409lfu.19
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 19:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mc0XlBXezEOWTYYs0ArYqoUft7LWjnc/1pRxneoxFjM=;
 b=q9jx/4ybA1OIKSqVWCNf4Tc4WNST3P86qUlpAo9ewl80C6zgorhikaAzhZwadGJ+6O
 pBlIdwamMt+4SXKrdzBkEUMiKG79uckqld9Qe+kcoE13gjfVirUKY2ayu053khjFutpo
 Wki5d4TmUrKkIp4RGSFZC1bm5xYxkATFgxeSFwPegKW9wvC1bm7Bw1Yh5kS98Oj4BTld
 7f9t9PYTcJGorXYRbYAZlaJSbMCdYY1yu1Mapuj+2S8ogPRFEsGy2GFKoI37ef/2N3Bv
 InJzoEHLMYQcSWeCN2KawfVLOIQQo9V5g09e1L0jx+SnYxxbJlrIG5GsXQ6XAeoo0BzV
 FWMw==
X-Gm-Message-State: AOAM531eYN7wUcaN8uTZajLy9K077G68v4DC8VCjYI0EF2ueP6GRNf8E
 +RbpfqNdF04770UzfYSy1VBxpvVoDywZDhZRoxFPQzCoXyKNdj3rYRuEL6w5Zljy4mPS6cq/rRG
 m36/kTZeES5myh34U6GO5RTKbTma+XXI=
X-Received: by 2002:a05:6512:a95:b0:478:82fb:7783 with SMTP id
 m21-20020a0565120a9500b0047882fb7783mr30223338lfu.471.1654051411929; 
 Tue, 31 May 2022 19:43:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW9puqoqXeeq8REaEC0PuzfIqxSj342fgov38abfGummzzJGkjKUDjuJlH9zOcptMJC8y/aPQyKS992i5keRE=
X-Received: by 2002:a05:6512:a95:b0:478:82fb:7783 with SMTP id
 m21-20020a0565120a9500b0047882fb7783mr30223327lfu.471.1654051411685; Tue, 31
 May 2022 19:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <CACGkMEvhBWkcQwJD3eqY7f2=nqxC6RPBdhMq0iq=qi7NpuJ_3w@mail.gmail.com>
 <21248AC5-C4D2-43DB-B096-DDFE9312BBE1@ispras.ru>
In-Reply-To: <21248AC5-C4D2-43DB-B096-DDFE9312BBE1@ispras.ru>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 1 Jun 2022 10:43:20 +0800
Message-ID: <CACGkMEtj5LdnAJW+QXU1xn64e9_mhXXtNq=9reqqkrngJZLYQA@mail.gmail.com>
Subject: Re: [PATCH v2] net: fix multicast support with BSD (macOS) socket
 implementations
To: Vitaly Cheptsov <cheptsov@ispras.ru>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Daniel P . Berrange" <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 31, 2022 at 7:28 PM Vitaly Cheptsov <cheptsov@ispras.ru> wrote:
>
> Hi Jason,
>
> This patch fixes socket communication with QEMU -> host and QEMU <--> QEM=
U on macOS, which was originally impossible due to QEMU and host program ha=
ving to bind to the same ip/port in a way not supported by BSD sockets. The=
 change was tested on both Linux and macOS.
>
> Basically after applying this patch one will be able to communicate with =
QEMU when using "-nic socket,mcast=3D230.0.0.1:1234,model=3Dvirtio-net-pci"=
 from QEMU or macOS itself.
>
> Best regards,
> Vitaly

Would you mind resending the patch with the above as the changelog?

Thanks

>
> > On 31 May 2022, at 10:02, Jason Wang <jasowang@redhat.com> wrote:
> >
> > =EF=BB=BFOn Wed, May 18, 2022 at 3:40 PM Vitaly Cheptsov <cheptsov@ispr=
as.ru> wrote:
> >>
> >
> > Hi Vitaly:
> >
> > We need a changelog to describe why we need this.
> >
> > Thanks
> >
> >> Cc: Jason Wang <jasowang@redhat.com>
> >> Cc: Daniel P. Berrange <berrange@redhat.com>
> >> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >> Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
> >> ---
> >> net/socket.c | 18 ++++++++++++++++++
> >> 1 file changed, 18 insertions(+)
> >>
> >> diff --git a/net/socket.c b/net/socket.c
> >> index bfd8596250..583f788a22 100644
> >> --- a/net/socket.c
> >> +++ b/net/socket.c
> >> @@ -239,6 +239,22 @@ static int net_socket_mcast_create(struct sockadd=
r_in *mcastaddr,
> >>         return -1;
> >>     }
> >>
> >> +#ifdef __APPLE__
> >> +    val =3D 1;
> >> +    ret =3D qemu_setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, &val, sizeo=
f(val));
> >> +    if (ret < 0) {
> >> +        error_setg_errno(errp, errno,
> >> +                         "can't set socket option SO_REUSEPORT");
> >> +        goto fail;
> >> +    }
> >> +
> >> +    struct sockaddr_in bindaddr;
> >> +    memset(&bindaddr, 0, sizeof(bindaddr));
> >> +    bindaddr.sin_family =3D AF_INET;
> >> +    bindaddr.sin_addr.s_addr =3D htonl(INADDR_ANY);
> >> +    bindaddr.sin_port =3D mcastaddr->sin_port;
> >> +    ret =3D bind(fd, (struct sockaddr *)&bindaddr, sizeof(bindaddr));
> >> +#else
> >>     /* Allow multiple sockets to bind the same multicast ip and port b=
y setting
> >>      * SO_REUSEADDR. This is the only situation where SO_REUSEADDR sho=
uld be set
> >>      * on windows. Use socket_set_fast_reuse otherwise as it sets SO_R=
EUSEADDR
> >> @@ -253,6 +269,8 @@ static int net_socket_mcast_create(struct sockaddr=
_in *mcastaddr,
> >>     }
> >>
> >>     ret =3D bind(fd, (struct sockaddr *)mcastaddr, sizeof(*mcastaddr))=
;
> >> +#endif
> >> +
> >>     if (ret < 0) {
> >>         error_setg_errno(errp, errno, "can't bind ip=3D%s to socket",
> >>                          inet_ntoa(mcastaddr->sin_addr));
> >> --
> >> 2.32.1 (Apple Git-133)
> >>
> >
>


