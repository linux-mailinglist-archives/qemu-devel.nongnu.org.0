Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE0F5520B8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:26:04 +0200 (CEST)
Received: from localhost ([::1]:56380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JHv-0008Rh-Mx
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JDQ-0000as-Ur
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:21:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JDO-0001Y3-KU
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:21:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655738481;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jg0WfO0askDxBXHLNZd7Lr9szLzkJwUFVqjnJgZteF4=;
 b=KM3BhLlT4jeDkgOEvu3wFQ2O7AJ7GXxNX6O6UA4oXBL57IvAsBEbLveK7HMJ92F3g73WNR
 TUQwNiLEimgGvRc0gcXk6glKoBPYWGY5YFaNs9hqhUF6yrF/OFQP8Eng5UuDcUr+54Bl+H
 /tTbk8juKdh0veZHpFSFfeR8uUTFONc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-h62Qvd1YMmOZp0QcP5RMBw-1; Mon, 20 Jun 2022 11:21:20 -0400
X-MC-Unique: h62Qvd1YMmOZp0QcP5RMBw-1
Received: by mail-wr1-f71.google.com with SMTP id
 v8-20020adfa1c8000000b0021b81a553fbso1953894wrv.18
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jg0WfO0askDxBXHLNZd7Lr9szLzkJwUFVqjnJgZteF4=;
 b=X0qmueTf9wpgqjSbaWMfhN30mDEY6vcEkO3JCpVjU06lRx3H2r8SPQa90Z34em32Lk
 B0cIRUoqOjqHvAZicro3gIJdPy7GcJEeg1UQEwGjtZ2vLGeBNqJ3tdvdaIFLqvDs+g+Q
 43mUvGb6IyKnZpWKjGCOvvz6D+MPAPAtAfWGbgVd0ieoA/EcKBLYWEKpNgiOO0islEgr
 nhiXKbUGlxJ0ANoSghGZr/lfrpKBQwESQx3ArI8oZyj5WqM6E3pJtImLq550prQAawzE
 SFhjzpamRA5kNII62i/tQhm6sT4KqsaIfJh0WNFfu9rU2BcsBJN+Bg1ciZZQ9/tqdbdi
 d0tA==
X-Gm-Message-State: AOAM530FqjspWoOgEXNq/QOG+0wL2TloOpTdRWUIbtDIbh96eGPiVpHh
 nNStht/ZsR/oq8JUmuJSiG8YPajbHIHQQX/o5vyNoS3XMODAFTiah2xN4coKotlcYgJbfVV9z7Y
 6SU5U1oYH7VIJ/So=
X-Received: by 2002:a05:600c:3508:b0:39c:8240:5538 with SMTP id
 h8-20020a05600c350800b0039c82405538mr35247772wmq.165.1655738479000; 
 Mon, 20 Jun 2022 08:21:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQxZzGOvhv42NFi9eyzdQ0w0lpL0VoYpcEYMhR951FS6Hhg7aYqfL1EMOJlPMNsd7CD8i64w==
X-Received: by 2002:a05:600c:3508:b0:39c:8240:5538 with SMTP id
 h8-20020a05600c350800b0039c82405538mr35247759wmq.165.1655738478788; 
 Mon, 20 Jun 2022 08:21:18 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 l9-20020a1c7909000000b0039c96b97359sm15388683wme.37.2022.06.20.08.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:21:18 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 12/21] migration: hardcode assumption that QEMUFile
 is backed with QIOChannel
In-Reply-To: <20220620110205.1357829-13-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:01:56
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-13-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:21:17 +0200
Message-ID: <87zgi71hua.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> The only callers of qemu_fopen_ops pass 'true' for the 'has_ioc'
> parameter, so hardcode this assumption in QEMUFile, by passing in
> the QIOChannel object as a non-opaque parameter.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

nice cleanup


