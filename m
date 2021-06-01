Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DB4397B72
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 22:50:53 +0200 (CEST)
Received: from localhost ([::1]:45222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loBLf-0004ky-K1
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 16:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1loBJo-00044r-Ap
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 16:49:01 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:40600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1loBJh-0008B4-T9
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 16:48:56 -0400
Received: by mail-qt1-x831.google.com with SMTP id i12so263157qtr.7
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 13:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=+HRE914D8dHkbXU+8Dps38YMtxOn3lUZFOlfe9iarjU=;
 b=KuIoSVe2vyVxG4isrqZLVlcFPKmX2QrU8gn4sesBXcN4EN+/y6+9RvFC+Y+5jhnjQY
 hfttmNwndyolzdUyTe7+vIng3maV16OyPwvRXnlRGqvdGCY/dd1fbOtKOfw2d0kmLJLW
 5QnpsYP6LiJ9q30wyxSPYYUeB9ftE/DHSEm+0MJ12ZYr+qzqEeM1oGIbz2oosATyYKOv
 NhLtSQBuzCUfzGmufvG3lWbqBAM+HHAD4iOgpw3iApMT7yeUm6IU2q/lfnhPXSyMSdTk
 eMq/gm1OUU1YzDQiEKZ/w4D2hxXLYGvmUEomx9v8yzKhQJQNrp/BVS4daNzuvVTsZrs1
 j1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=+HRE914D8dHkbXU+8Dps38YMtxOn3lUZFOlfe9iarjU=;
 b=ZiIwOPfkTm8JltEeZMmR6FvGods57PL3qVcEF6kNDruhx/KRXp1oJ5nrKsRq+m+If3
 MRn8s9KTFOSF4+MuVAYqimgeiunqoJ8RCtSF29qtyHIncj7ObX2JehjvVq6JCioHcYyv
 jCEWhlCEw/lvWMwogIFJ3gxpqH6l9dEQvLY+/71y+lEpRt5vYLlgMIDvo9ffpwRYlG6R
 nPMRKUql3IaAvLIBUq3nFVwZccIhZCoiG5dp1F/0UYKTATZAUTvY3VYaYekDSVSFCxNf
 K6ZHXVnSD54oNdLvnsO2cwGjcQQfpyn/bVaqizTF47Vcv5TSuOq3LiKSvBfetauIi9v2
 j8Mg==
X-Gm-Message-State: AOAM531MUSOxAL4wwGt3Q8T9HrADsW8xrX731pytPMcBPACwQLPVs8Xa
 YHjcB/ORqHu+XGJqifywa20=
X-Google-Smtp-Source: ABdhPJzeisFds9xpPMZjS3wR9TOkF74FgK8D8S3zJw0AQC2R5arCoVyWVJoABgOAQwt0Ll4RRiYxuQ==
X-Received: by 2002:ac8:5d93:: with SMTP id d19mr21504685qtx.289.1622580528668; 
 Tue, 01 Jun 2021 13:48:48 -0700 (PDT)
Received: from [192.168.1.106] ([177.193.53.28])
 by smtp.gmail.com with ESMTPSA id c26sm10956437qtj.41.2021.06.01.13.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 13:48:48 -0700 (PDT)
Message-ID: <bfff62aae4a7376d1f59de595a7f3f960202ebec.camel@gmail.com>
Subject: Re: [PATCH v3 1/1] yank: Unregister function when using TLS migration
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Peter Xu <peterx@redhat.com>, lukasstraub2@web.de
Date: Tue, 01 Jun 2021 17:49:09 -0300
In-Reply-To: <YLZJME3kiFe0rMRe@t490s>
References: <20210601054030.1153249-1-leobras.c@gmail.com>
 <YLZJME3kiFe0rMRe@t490s>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=leobras.c@gmail.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, berrange@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-06-01 at 10:50 -0400, Peter Xu wrote:
> On Tue, Jun 01, 2021 at 02:40:31AM -0300, Leonardo Bras wrote:
> > [...]
> >  inside migration_channel_connect() and
> > migration_channel_process_incoming() move yank_register_function()
> > so
> > it only runs once on a TLS migration.
> 
> Slightly inaccurate I guess, as it was run once too before this
> patch, but not
> paired for tls?

Yeah, I think I got confused over this:
I remembered having multiple instances of yank_register_function()
during TLS migration on qemu.org/master, but after re-testing it, I
think it was in fact something to do with V1 and V2.

So, yes, that's correct, in qemu.org/master there was a single
yank_register_function() and no pairing yank_unregister_function()
during TLS migration. 

> 
> IIUC when we call the 2nd time at below chunk we won't register
> again:
> 
>         if (object_dynamic_cast(OBJECT(ioc),
> TYPE_QIO_CHANNEL_SOCKET)) {
>             yank_register_function(MIGRATION_YANK_INSTANCE,
>                                    migration_yank_iochannel,
>                                    QIO_CHANNEL(ioc));
>         }
> 
> Because the 2nd call will be TYPE_QIO_CHANNEL_TLS, so
> object_dynamic_cast()
> will return with a failure, I think (note, TYPE_QIO_CHANNEL_TLS's
> parent is
> TYPE_QIO_CHANNEL, not TYPE_QIO_CHANNEL_SOCKET).
> 
> > 
> > Fixes: b5eea99ec2f ("migration: Add yank feature", 2021-01-13)
> > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1964326
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> 
> Thanks Leo!

Thank you Peter!




