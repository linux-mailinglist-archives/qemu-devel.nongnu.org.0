Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652AE425270
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 14:03:52 +0200 (CEST)
Received: from localhost ([::1]:45672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYS7q-0003Lu-VR
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 08:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYS4a-0001V9-Ek
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:00:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYS4Y-0002Tc-OT
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633608026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wVCTqPmnMZRay4cLPJPpB+6EI0y0e28SIsF2qfBgBd0=;
 b=TGiHqlKUSmZs9h8Hpiykuf4aEHeHPg+entAxDwKjMHySozv7M+zGTaR/Ow6T6UnBQ8aJt3
 2D6SfitvxQkLaQAzupeOHGTFm0PldQdy5Rg9pxATYpDVQx7raAuVACfCjUVfYzb19/hKD3
 xWh+GKqIax0Eu8k7ChX8zsj/UOYsDxM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-GgIjVppwOnewqvneHvTbPw-1; Thu, 07 Oct 2021 08:00:25 -0400
X-MC-Unique: GgIjVppwOnewqvneHvTbPw-1
Received: by mail-wr1-f71.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so4515561wrh.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 05:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wVCTqPmnMZRay4cLPJPpB+6EI0y0e28SIsF2qfBgBd0=;
 b=MuqKkTCF4KKysnvLBV24Lanr/jzmN6ieXm6+yFcen7RZydDQ2bwJYt41nEdl8AMz4A
 fyRZ584D78fbLdAcZ+kHBru547Cdweuf2bjdXt10zSw5rmfvko8dN8WEEgaevbAybgHF
 rJBLhZ6Xg0yBxre3xTIunc6AxAgPoc/8lJkUS/laXjkkp2+KlYkJ3WnOdDus6VzG/5dy
 y2IoU7yNYGtLluVB3MAIE9vogJR+G36GkiGlgZ52CehSLMugZscD8WdiC3nRwfrBJYxn
 yW4WQ9Fq2h357aYDX48fCw2SgKHyT1dmOyqbAZ9Ff/VdQBfyUYNOar5AnjZTV9mQwLlh
 nCyg==
X-Gm-Message-State: AOAM533udrZS/xp2xWH1OvCu2Te49VMgZgTe4Mm4OWKYC+NcZu5W4JlG
 OBDMNLAlhb3KRwKfz21Zto0VyyEO70ews2XJD/aYmZV5aM2i0dQEWjr9XLJEklL25Ru/3NMbqjL
 7Bz6orYNZxvHrcZI=
X-Received: by 2002:adf:f481:: with SMTP id l1mr4718852wro.411.1633608023977; 
 Thu, 07 Oct 2021 05:00:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykfP1umuUykEw6ni6lho83aRHAyVSHavOv9Jw94/j6XUDNwenq/r9raPxrCGo96W2xEeZcmw==
X-Received: by 2002:adf:f481:: with SMTP id l1mr4718800wro.411.1633608023692; 
 Thu, 07 Oct 2021 05:00:23 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v10sm25056483wri.29.2021.10.07.05.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 05:00:23 -0700 (PDT)
Message-ID: <4f1377cb-dd5d-0e73-15c1-f47971d0f7e1@redhat.com>
Date: Thu, 7 Oct 2021 14:00:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 13/25] include/systemu/blockdev.h: global state API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-14-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211005143215.29500-14-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/10/21 16:32, Emanuele Giuseppe Esposito wrote:
>   DriveInfo *drive_get_next(BlockInterfaceType type);
>   
> +DriveInfo *drive_new(QemuOpts *arg, BlockInterfaceType block_default_type,
> +                     Error **errp);
> +
> +/* Common functions that are neither I/O nor Global State */
> +
> +DriveInfo *blk_legacy_dinfo(BlockBackend *blk);
> +int drive_get_max_devs(BlockInterfaceType type);
> +
>   QemuOpts *drive_def(const char *optstr);
> +
>   QemuOpts *drive_add(BlockInterfaceType type, int index, const char *file,
>                       const char *optstr);
> -DriveInfo *drive_new(QemuOpts *arg, BlockInterfaceType block_default_type,
> -                     Error **errp);

drive_add and drive_def touch global state (QemuOpts).  But really 
neither should be in this header: drive_add can be moved to 
softmmu/vl.c, while drive_def can be inlined into its two callers.  With 
that changed,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


