Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B57552192
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:50:06 +0200 (CEST)
Received: from localhost ([::1]:38334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JfB-0001kP-KT
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JcS-0008VQ-00
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:47:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JcQ-0006bv-BL
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655740033;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fyjQ/V2v3bnipHP/hcB7aGW5mrimo4Kby6BpF6syFoA=;
 b=MEofb5Y5AEgIfh+FvThr78GfgX8jIRrKMhWzyF3HqUZQo1JKaZwkGneXMFRhrRHCbm/Tzh
 TIX00fD1KmeG9BdxZepcUdtNnVF1YkXZRvYWZz6b2vU0nlU2SiiK4wS7WryjSkEUv/70V4
 ai9fPqZuwNDFzVqUF0ioyYbSR8mB5Zk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-Xsp0rHAsPuGl_GySYRs4Tg-1; Mon, 20 Jun 2022 11:47:12 -0400
X-MC-Unique: Xsp0rHAsPuGl_GySYRs4Tg-1
Received: by mail-wm1-f70.google.com with SMTP id
 p24-20020a05600c1d9800b0039c51c2da19so5969692wms.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fyjQ/V2v3bnipHP/hcB7aGW5mrimo4Kby6BpF6syFoA=;
 b=eCV2hFyuje7spMAOyf8CuIczloWcpXqmKSl1Y1kCYKBp794IuOJLeWwHipb0BDQfjo
 EX3D0NjrUPPTqBahOQFVSf9kYLw5xNPrAvw/GK0SSS0y5NmCueKRMRV6/erwa3JS7Keb
 J/RMjneUKsJ1B6sxaZ8LbA1CsZk1FGW/KojZS3HWD37n3/R3txwQkJRH4E3wgbKg9Z+1
 2bIWl4RhECpaYNFAl6HXD+WbB6auJDK8Vs6FsymCMtFuejB7/jRn4SXDM3O5E0y6akM/
 qM+pOzOIhQX3R4JPRSsqRmRCysIS87dgwpShD+4S3QPM97ggPYjY8iA8eF/3aFHcWpq3
 OQaw==
X-Gm-Message-State: AJIora+ASly3/OqF3a9D6IGYTv88vlEgmaPsnF2l0m8YW6pAcFKvtmRe
 VwO3OO2dJ43nN9H3BxcDzm8KQ1qk7Q2KgqUrb6lvP5mnVl/084aXOG4OuKNyIbTXN/1XqRz226N
 NSfRkrjLFoGtFuxY=
X-Received: by 2002:adf:decc:0:b0:21b:8915:36da with SMTP id
 i12-20020adfdecc000000b0021b891536damr10687264wrn.261.1655740031173; 
 Mon, 20 Jun 2022 08:47:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vpWu/ognJqBj0Vgm18NACmeKgdd2+kHg7LwVsDwRHpEqE92nYWMt8UcD222+qMYdbpijmQPg==
X-Received: by 2002:adf:decc:0:b0:21b:8915:36da with SMTP id
 i12-20020adfdecc000000b0021b891536damr10687244wrn.261.1655740030962; 
 Mon, 20 Jun 2022 08:47:10 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 b1-20020adfe301000000b00219b391c2d2sm16649127wrj.36.2022.06.20.08.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:47:10 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 21/21] migration: remove the QEMUFileOps abstraction
In-Reply-To: <20220620110205.1357829-22-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:02:05
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-22-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:47:09 +0200
Message-ID: <87wndbz69u.fsf@secure.mitica>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> Now that all QEMUFile callbacks are removed, the entire concept can be
> deleted.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


