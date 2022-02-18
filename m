Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A5C4BBDAD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 17:40:21 +0100 (CET)
Received: from localhost ([::1]:51224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL6Iu-00056G-Rb
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 11:40:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nL6HL-000421-5S
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 11:38:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nL6HJ-00069F-Lf
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 11:38:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645202317;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lXzFCd7En+3fvXTCCFOrYbQNsxzkBdEcH7CQrSmVGhM=;
 b=cDD+D0EglUIZTmt1c2TvTEt+vHhiHJbjJBxQYr/0aaTBWyhKsjOzEAb8H8QvGvaKG3fmMx
 mIJ/4vhHC00NA/LPG+gbUdsY2l/s8gLPFllYI0cddDXj7X9nDsThF2U62PO52sQHBJ2rBc
 VanJu/4P+WnbCDQSbAkY+Mh0UdgwxtE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-WX8Ng8lXOh2WOPPA142Ffg-1; Fri, 18 Feb 2022 11:38:36 -0500
X-MC-Unique: WX8Ng8lXOh2WOPPA142Ffg-1
Received: by mail-wm1-f70.google.com with SMTP id
 a8-20020a7bc1c8000000b0037bc4c62e97so3052455wmj.0
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 08:38:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lXzFCd7En+3fvXTCCFOrYbQNsxzkBdEcH7CQrSmVGhM=;
 b=uQklv6qnaxSjyl0QtZPt8hjbxkMAQkuKkhx2Rpm9DbxldJKrspgud1wi1aRbim3jBS
 MvID9nvcx2naMch59BN/b+QCpZCQD7669IS48BVx69bo3efJbkehvpmXO+uImc/IcwvE
 szR1OtLdH6n7mIwouaauNhX0zkejDxNsDRlgv7EB/rGofwu/6XIzKqL4tI2G+Y9hE3+C
 f8MS9Xds9TV0Jm6VGcJdT3plZGdGoaoJWg99QfK2IXqJLydvGK6nZmzE+5bQh6IBKtqa
 BNjZFQjSmQD0lQVgL1DipzZm3UrfGsStEs1wROijCLyTklho1rPvkdhF4/UXbZ1IeEnK
 h7IA==
X-Gm-Message-State: AOAM530CS6xrJMx16PyVSC0VbhAgImU4RWRtp3D3mACECqItIyuC5jGK
 nOOr4u/VgYTgfGDwFEPLKUIKE7TmaxQ9BnTtoWPo7KY+kfcb71uyAHE/yL72vERDTqP6yGgYFQ6
 +6Nn7o5++QXSOh+0=
X-Received: by 2002:a7b:c341:0:b0:37b:c619:c9f4 with SMTP id
 l1-20020a7bc341000000b0037bc619c9f4mr11406053wmj.38.1645202315190; 
 Fri, 18 Feb 2022 08:38:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfrd5C4Oq5+nhkMN8gznegXev7RzO3ISKeaEhlM6ujcZLVMw9igKkfdGnMRmcrcg/ZtkVbOQ==
X-Received: by 2002:a7b:c341:0:b0:37b:c619:c9f4 with SMTP id
 l1-20020a7bc341000000b0037bc619c9f4mr11406029wmj.38.1645202314954; 
 Fri, 18 Feb 2022 08:38:34 -0800 (PST)
Received: from localhost (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id f18sm5224739wre.66.2022.02.18.08.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 08:38:34 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v8 2/5] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
In-Reply-To: <20220201062901.428838-3-leobras@redhat.com> (Leonardo Bras's
 message of "Tue, 1 Feb 2022 03:29:00 -0300")
References: <20220201062901.428838-1-leobras@redhat.com>
 <20220201062901.428838-3-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 18 Feb 2022 17:38:33 +0100
Message-ID: <87o834cepi.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Bras <leobras@redhat.com> wrote:
> For CONFIG_LINUX, implement the new zero copy flag and the optional callb=
ack
> io_flush on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
> feature is available in the host kernel, which is checked on
> qio_channel_socket_connect_sync()
>
> qio_channel_socket_flush() was implemented by counting how many times
> sendmsg(...,MSG_ZEROCOPY) was successfully called, and then reading the
> socket's error queue, in order to find how many of them finished sending.
> Flush will loop until those counters are the same, or until some error oc=
curs.
>
> Notes on using writev() with QIO_CHANNEL_WRITE_FLAG_ZERO_COPY:
> 1: Buffer
> - As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid c=
opying,
> some caution is necessary to avoid overwriting any buffer before it's sen=
t.
> If something like this happen, a newer version of the buffer may be sent =
instead.
> - If this is a problem, it's recommended to call qio_channel_flush() befo=
re freeing
> or re-using the buffer.
>
> 2: Locked memory
> - When using MSG_ZERCOCOPY, the buffer memory will be locked after queued=
, and
> unlocked after it's sent.
> - Depending on the size of each buffer, and how often it's sent, it may r=
equire
> a larger amount of locked memory than usually available to non-root user.
> - If the required amount of locked memory is not available, writev_zero_c=
opy
> will return an error, which can abort an operation like migration,
> - Because of this, when an user code wants to add zero copy as a feature,=
 it
> requires a mechanism to disable it, so it can still be accessible to less
> privileged users.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


