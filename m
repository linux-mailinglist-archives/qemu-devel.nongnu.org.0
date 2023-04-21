Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E140D6EA713
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:35:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppnAN-00031O-I0; Fri, 21 Apr 2023 05:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppnAJ-0002kO-Os
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:34:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppnAI-0003B9-9p
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:34:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zkhZsenSyq1FmF5tpquDpHbnBZ8BYf1pzoXgDFvHtyU=;
 b=Fmd/iGP322+uUT3vcuqpbhLTvDbLCPndJGVuQHWAPWP35odqTovFfeIg/f5X22Um9IGNN+
 lWJkrg8QByPQFA1KiPm8hasfLXx3LuGEWd97z/faZBXwz8XmDa1o4uv9AKQZYl21jAqVAU
 +liC1mD3rGuvT0SH/Rdj/IZLDZEii7k=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-OLSmU71-NTicU22ck3lOJw-1; Fri, 21 Apr 2023 05:34:47 -0400
X-MC-Unique: OLSmU71-NTicU22ck3lOJw-1
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-771d11ea8cdso1113276241.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069687; x=1684661687;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zkhZsenSyq1FmF5tpquDpHbnBZ8BYf1pzoXgDFvHtyU=;
 b=MLCyw/7rINtkpGD0EruUaoUMRfzvzWpeYuQ0T9db0j/NZ1uxHuvkuOYp1WC+Mju9pa
 6QK0cd8MBHd6XYm2buEkQwdA9afoTT2xldrxZrsB0bH6E5wkGV15eNMZhzMaThhcNaBq
 jw4cCq0y24XJgOmJrl/ihHnTGooGJsx9ij+eaXG+qjHxobGj64Ivg7yrCezBHelyNQqs
 tLZOxDBQRVYkEkAtGmqSU1Uo9lcqSUfAiET8DKB/XgUW9iIwv/GmYzo4Fee5Ru5P7PeL
 G4hjDzVmtNlXHtFnlDJDVp6JP+cPDrsnQphHiDc4hM4ldeZVhXxfc5w+JlWGkbG2RS+c
 9XrQ==
X-Gm-Message-State: AAQBX9dXoqJBJ511DWCCn1nU7QvdmwCeEOzTe6CFW+6PygNVf38xK37F
 uxY8Sjq44lI58wDcZIH2u3ohfpexGW44cqlf36rsez6Z9j2IUzQDlm7sg0OZfgGS2IjlI8MQfE4
 fJgUb8FACWvGnEoSXEyg0n8aEEyl59gRFU47Ml5NNIA==
X-Received: by 2002:a67:fa55:0:b0:42e:4c9f:50b6 with SMTP id
 j21-20020a67fa55000000b0042e4c9f50b6mr2055793vsq.11.1682069686818; 
 Fri, 21 Apr 2023 02:34:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350az7Bfjh65GUv9TP0vwSKC8qGWWYVnW0wc1hxTIdmjx6iJ53GrdmFHLSJakrOpMsgdkqQZoaZlz2uB+LNzuu8k=
X-Received: by 2002:a67:fa55:0:b0:42e:4c9f:50b6 with SMTP id
 j21-20020a67fa55000000b0042e4c9f50b6mr2055789vsq.11.1682069686591; Fri, 21
 Apr 2023 02:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230405103216.128103-1-pbonzini@redhat.com>
In-Reply-To: <20230405103216.128103-1-pbonzini@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 21 Apr 2023 11:34:35 +0200
Message-ID: <CABgObfZe=6i5orJd25VH_oYZU4+UK-M-R++Ov6dO_61Pu0NVhA@mail.gmail.com>
Subject: Re: [PATCH 0/4] block: clean up coroutine versions of
 bdrv_{is_allocated, block_status}*
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Ping.

Paolo

On Wed, Apr 5, 2023 at 12:32=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> Provide coroutine versions of bdrv_is_allocated* and bdrv_block_status*,
> since the underlying BlockDriver API is coroutine-based, and use
> automatically-generated wrappers for the "mixed" versions.
>
> Paolo
>
> Paolo Bonzini (4):
>   block: rename the bdrv_co_block_status static function
>   block: complete public block status API
>   block: switch to co_wrapper for bdrv_is_allocated_*
>   block: convert more bdrv_is_allocated* and bdrv_block_status* calls to
>     coroutine versions
>
>  block/copy-before-write.c |  2 +-
>  block/copy-on-read.c      |  8 ++--
>  block/io.c                | 87 +++++++++------------------------------
>  block/mirror.c            | 10 ++---
>  block/qcow2.c             |  5 ++-
>  block/replication.c       |  8 ++--
>  block/stream.c            |  8 ++--
>  block/vvfat.c             | 18 ++++----
>  include/block/block-io.h  | 30 +++++++++-----
>  9 files changed, 69 insertions(+), 107 deletions(-)
>
> --
> 2.39.2


