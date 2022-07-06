Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B65568562
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:22:56 +0200 (CEST)
Received: from localhost ([::1]:41548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o92BL-0004Jk-B2
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o91mn-0005F7-7x
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:57:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o91mk-0004YI-DG
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657101449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cmNGDVIJ1cRWEwJ0HMvgO6nty0rF0RH+7QHhMeXAXMc=;
 b=A4YkyP/hcisMDNf8lelIA3Ep68vrbVfKTnJ+5JlI+HFmpkV0o7g4C3mbXA3lDeYhcKg/MX
 k9E3D8TJIWdY88p8n1IZ+CriDF4hNe2tBHHHoaNELRBRf8fcs5WMuzaQVVtLGfqHC1qZZ5
 6IwkU4i/i5zUorAxBoYhdHsXr6iwQ4s=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-4Zk3uRSHPuyrqfzuq6fYWA-1; Wed, 06 Jul 2022 05:57:26 -0400
X-MC-Unique: 4Zk3uRSHPuyrqfzuq6fYWA-1
Received: by mail-il1-f200.google.com with SMTP id
 x11-20020a056e021cab00b002dada9d2a50so7345461ill.15
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 02:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cmNGDVIJ1cRWEwJ0HMvgO6nty0rF0RH+7QHhMeXAXMc=;
 b=WmveCuQHEEkQFIQGyKDUbKn5oh2/3iViIXXuEIzNqFS32tYjCc0RuZKZ6XHG9mVE+J
 RxQYEAWpXnGwNiWdQKjZbNoWuPZPHTj+nqHIytTisWQtYNO6QWMn64Yu6dXoC43Opuzs
 +a0BqBQrYneMRqKazPcsVE3GGe0wNaHGm64SfjPhu+z0MQURbo5JtOHpDIQ3OeIzYIZY
 8OCommEIaOe879/iYWyOWkmLnK+8+0lHXUwgAE/q6SOfU6DibLLCPGQ8sSYWH0FrsIYu
 ZXAZ72xQJL9lhIUBNyLokKL5h0wkXXosiiAhwwoGXdx9Of7xL56cgh9awxf2duf2x78F
 Xt7w==
X-Gm-Message-State: AJIora8I3/qRaoKNGYpbXVo74XLuktxlYkk6wUGaORoep+FPRCJIOcwz
 3As5ccXlP+w5S375jZshILsxqgu4cHCsz9bLV1snjbixdpEy6sKxMyk81Aj8opEDGyHbZMwvyFV
 EZx/fP1KwsHlc5JaZebHYYl3H4laIRfg=
X-Received: by 2002:a05:6638:4088:b0:33c:dbe4:e84 with SMTP id
 m8-20020a056638408800b0033cdbe40e84mr22006443jam.130.1657101446167; 
 Wed, 06 Jul 2022 02:57:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vw8yCyjnIr2DdpEeW9Y0E03pxVCncep0gV94MzRLma6+ouybBlPXZINuaH38pEC9XMwPkptLNvjhJ5SBI/SAU=
X-Received: by 2002:a05:6638:4088:b0:33c:dbe4:e84 with SMTP id
 m8-20020a056638408800b0033cdbe40e84mr22006418jam.130.1657101446020; Wed, 06
 Jul 2022 02:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220702113331.2003820-1-afaria@redhat.com>
 <YsRjK0S+EywKWgp8@redhat.com>
In-Reply-To: <YsRjK0S+EywKWgp8@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Wed, 6 Jul 2022 10:56:50 +0100
Message-ID: <CAELaAXxhr9K2m_wK0GwbQ4J+yr8VSxAr4ATnFBz_zdg0seTE+A@mail.gmail.com>
Subject: Re: [RFC 0/8] Introduce an extensible static analyzer
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Peter Xu <peterx@redhat.com>, Alberto Garcia <berto@igalia.com>,
 John Snow <jsnow@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Markus Armbruster <armbru@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 5, 2022 at 5:13 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
> FWIW, after applying this series 'make check' throws lots of failures
> and hangs for me in the block I/O tests, so something appears not quite
> correct here. I didn't bother to investigate/debug since you marked this
> as just an RFC

Thanks, it appears some coroutine_fn functions are being called from
non-coroutine context, so some call conversions from bdrv_... to
bdrv_co_... introduce problems. These changes are only intended as
examples of using the tool for the time being.

Alberto


