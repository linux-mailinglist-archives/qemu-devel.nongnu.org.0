Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98E2525334
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:06:38 +0200 (CEST)
Received: from localhost ([::1]:45896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npCGr-0005fn-8W
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1npCB4-0002r7-GA
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:00:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1npCB1-0000Yo-26
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652374828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sW8KhVHx86rGBBq1JfY+htZFjM9LT7zq/N5K8e+3SSo=;
 b=Jx5U+gUAlRJ0PX8QbX03XZdtttmZHcky5yWN25CqLJy8K/Q/c6OE0kB0dnu16lpIWlruri
 w8tkh9QodAwYvmAczFjg0pyh1lRP2XcIumd6MEpnUnJfHoMxkdRFRNGEJuaOFdN3QmJLmd
 ntWHEzIr3Zk5yzteiffwv5Yg7zI2afI=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-k2bJGYcVNvKrhaqUzHFyQQ-1; Thu, 12 May 2022 13:00:27 -0400
X-MC-Unique: k2bJGYcVNvKrhaqUzHFyQQ-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-2f8398e99dcso50340647b3.9
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sW8KhVHx86rGBBq1JfY+htZFjM9LT7zq/N5K8e+3SSo=;
 b=WrtJGQPwb7J7TLfyjGsLWby1wALRWKDLOJabrYwdqpL/tDHZ5XBoSUO7RNyFJKcpjK
 lEW7havS/CwDRQDvVwYWPnYWRcZKApnYJJDG6PlrzZYcGPbVdXDYnh14MKZWEAvU2ih/
 mLRXacRec0C30+UTZ6sMOWO5vcaKqxrWWlHhBqMvIUIGjzCUgW8BBMYEx0y9iWXNRCfW
 T+J8Wt6jPDyT5x8P3L6jk9l7XeKetcNxmzdmbtLStVCeRyo5SmB1GFkOYRtcDOmerwpy
 hkoRy1BMmzRyb0NI9/skKd9T1psIrSUYfbEmxkSFtNcY0xOD6S+fCPqypMIUfxpVx70w
 G99Q==
X-Gm-Message-State: AOAM531PwnCbSzQPYPipQnhGSyicGEh1EgQemlB7NWizHt3Fwh5UH7Mr
 /yeh8I7+qbPYi0uc7FMTSEcA8XYPiTf1zIU1VTChV0hP66/yaGt5KlvhmhJK8PAerFSbDdk1gGY
 fn3MM0pnvh13KzR8L7MxU445Of17HsF8=
X-Received: by 2002:a25:dc8e:0:b0:648:a3dc:fb8 with SMTP id
 y136-20020a25dc8e000000b00648a3dc0fb8mr772326ybe.101.1652374827120; 
 Thu, 12 May 2022 10:00:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmhRcdC8/GxyAPzjnjW2wtV6KiKczENM7dOD+rEMzOuIUKwjoGeogT2fzauU3WreiF5/SF8Gnk6LouMMTKMe4=
X-Received: by 2002:a25:dc8e:0:b0:648:a3dc:fb8 with SMTP id
 y136-20020a25dc8e000000b00648a3dc0fb8mr772311ybe.101.1652374826931; Thu, 12
 May 2022 10:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220512154906.331399-1-kkostiuk@redhat.com>
In-Reply-To: <20220512154906.331399-1-kkostiuk@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 12 May 2022 19:00:15 +0200
Message-ID: <CAMxuvaxsrPNdS928KtKghoFOHGi4nC3x7pRjN0v=LS5p4G0ADQ@mail.gmail.com>
Subject: Re: [PATCH] qga-vss: Add auto generated headers to dependencies
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
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

Hi

On Thu, May 12, 2022 at 5:49 PM Konstantin Kostiuk <kkostiuk@redhat.com> wrote:
>
> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> ---
>  qga/vss-win32/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
> index 26c5dd6e0e..9483ccd3b8 100644
> --- a/qga/vss-win32/meson.build
> +++ b/qga/vss-win32/meson.build
> @@ -7,7 +7,7 @@ link_args = cc.get_supported_link_arguments([
>
>  qga_vss = shared_module(
>    'qga-vss',
> -  ['requester.cpp', 'provider.cpp', 'install.cpp'],
> +  ['requester.cpp', 'provider.cpp', 'install.cpp', genh],

Looks fine, but could you tell which file was needed? (not qapi or
trace files, I suppose, so what else?)

>    name_prefix: '',
>    cpp_args: ['-Wno-unknown-pragmas', '-Wno-delete-non-virtual-dtor', '-Wno-non-virtual-dtor'],
>    link_args: link_args,
> --
> 2.25.1
>


