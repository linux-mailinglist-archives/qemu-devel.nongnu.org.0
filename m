Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FF0680557
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 06:02:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMMJ4-0001Sz-5S; Mon, 30 Jan 2023 00:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMIx-0001Nr-C0
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:02:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMIu-0008Qf-6i
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:02:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675054921;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=S2Fnf2PaEdCVCS+mxW4Au2dWcnC+Xhsfx6SSyIRDSko=;
 b=XJjyAd9XnmpGRedMrZKAfPA45jXl8TLbqRWhgdfqaQswR4S2aX76u7J1/13X6+hFwZTe0r
 fm5HxudUV4+MuqKv/8a3NbcxOIXxgmRUGDuxex2zvJzO6ipJy3f02U/SxkEg1lanNRrA5l
 sdbGR4mJGIZN1qh6n/0fGgD34IZ2+h0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-125-eF-U4jABMi2qkobazLHAdw-1; Mon, 30 Jan 2023 00:01:58 -0500
X-MC-Unique: eF-U4jABMi2qkobazLHAdw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j24-20020a05600c1c1800b003dc4480f7bdso3883605wms.5
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 21:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S2Fnf2PaEdCVCS+mxW4Au2dWcnC+Xhsfx6SSyIRDSko=;
 b=FL5RlQ4su2PGbgYIa3ont0HJQWRE04FDtYo2qTtCKFyc3AeWaMnSOFeEWTbD3lvhKt
 Z24GTGww1FShY0VON5WYrqlNKFgnlZcxUgC3NBaVqcD/GecWV+fDZlWtBFqeFhb3rZk7
 x2yY/xHfRe9DFdwMoZNj6iMXFCqy8FEFComeVxwXmxcnjqQuh8NIfGoXI86MSY9hf5IJ
 mqotCqvbZG1mN2i9JD7ivnfIsVJviiDgKe+61i3dW58/apruZQ3WT+MmZEKVGtQMRj0T
 QzI8MzLG0AZ+4Pi97xx/ZsV5Mhr1n7p5xWZz5qF6aLH3RXnwDD36C1DflV/hLcnYNovm
 aDIQ==
X-Gm-Message-State: AO0yUKVDfX6MjmEYdyyv0bGo4sXKNTpUGcDYdA10v6Vm2+IlOY34tXIv
 /mibrcsYXADRbJ2xYAsTG97wGyov5ohJyWDyh0+pmy7wPPN4PYHS3ZS7J4TTa/af6L2Kw9Y5S0Z
 NJIg8BuLiUKXw3+g=
X-Received: by 2002:a5d:534a:0:b0:2bf:e272:4862 with SMTP id
 t10-20020a5d534a000000b002bfe2724862mr5480307wrv.25.1675054917084; 
 Sun, 29 Jan 2023 21:01:57 -0800 (PST)
X-Google-Smtp-Source: AK7set++reWmC50nfGG3m/uvKkdreQLoR1tmSX4tKfDP68vA7c9LKHPQ1lY5igUkZj1IEWB/G47JTA==
X-Received: by 2002:a5d:534a:0:b0:2bf:e272:4862 with SMTP id
 t10-20020a5d534a000000b002bfe2724862mr5480294wrv.25.1675054916872; 
 Sun, 29 Jan 2023 21:01:56 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 q3-20020adff503000000b002bfae1398bbsm10845953wro.42.2023.01.29.21.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 21:01:56 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 05/21] madvise: Add QEMU_MADV_SPLIT
In-Reply-To: <20230117220914.2062125-6-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:08:58 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-6-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 06:01:55 +0100
Message-ID: <87lelkk43g.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> MADV_SPLIT is a new madvise() on Linux.  Define QEMU_MADV_SPLIT.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

You can maintain the reviewed-by even if you collapsed with next one as
David suggests.


