Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F94691336
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 23:22:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQFIa-0007kR-Rj; Thu, 09 Feb 2023 17:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQFIV-0007kC-Tb
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 17:21:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQFIU-0007SF-Fr
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 17:21:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675981301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2PrYPtERKfqhCat5qk6P4wHWEhN6MWcGTr/BO291Ohc=;
 b=EPnCJqqmYPwmedRUJ4AsiyGJ1Nq+uQogSmbkDTon/cDEz9Esi01lDYXnFFqDQKGusp5GYa
 pS+GtkEKfLSLr1bXmVVSUK/+RDn+r6VbHgl82utdrdn0T/6A8WT8Hum3N5yu4dkNbfVchP
 hrg16CzXTtV5N1avPj9mWTY/yp8yDSI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-447-SuP-_UfgMvupL1p_z8GqYw-1; Thu, 09 Feb 2023 17:21:39 -0500
X-MC-Unique: SuP-_UfgMvupL1p_z8GqYw-1
Received: by mail-qt1-f199.google.com with SMTP id
 a24-20020ac84d98000000b003b9a4958f0cso1981337qtw.3
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 14:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2PrYPtERKfqhCat5qk6P4wHWEhN6MWcGTr/BO291Ohc=;
 b=g/DyE0kKyCYKdRzc7wlJqwlV3w+jdZkDOuZQss+GQkkKJfVCTPH4yNjAE+/lxHgBkm
 JmmtGc7B1iYcmnqCwQN6LsoKdsE4xMSRt1gABa22QtOG9/KxQ7uMNp9dtizR/mERl+aP
 q+HnImxpuKdHDTejbQELqdtJlELA9YiRsTDEvrfXFIAMBZ2gasKLBAC5h9+i1oXMQmVZ
 SFnggjnbtWesK9mqPqtm1RbUScpZ2JFH7N/kBqzRRYByNKj4kjF6Cr9x+GeybA/lX20j
 2D5CU5lypNC4LUzHbKq6YwjPlkK17S2votc7GFsRvy+uBA7Mfu/6nK+gHNx3WHg4s5x/
 2YHQ==
X-Gm-Message-State: AO0yUKWccNTcUyZ3xxd5hf9KZKSXpDq4ZmD0/kAt5tQ3AmCfaRRFfzXR
 di22KdhShfl8up/lYGmJ+FxJZQ7X7a0YTlgS3p/79r0J/i8wRsL1AlYC/PjUs0Odd9JK3TphQ+e
 nUyEH8LmMPq4sWUU=
X-Received: by 2002:a05:622a:1392:b0:3b8:ea00:7020 with SMTP id
 o18-20020a05622a139200b003b8ea007020mr23088002qtk.3.1675981299389; 
 Thu, 09 Feb 2023 14:21:39 -0800 (PST)
X-Google-Smtp-Source: AK7set/C3c2LbahDEc6DDOnXW7Tk5kpy4av3IjXXA2IaDqDmGXQnW+FTCYh9bMzWNKxNA99U1v/pdQ==
X-Received: by 2002:a05:622a:1392:b0:3b8:ea00:7020 with SMTP id
 o18-20020a05622a139200b003b8ea007020mr23087964qtk.3.1675981299135; 
 Thu, 09 Feb 2023 14:21:39 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 o62-20020a374141000000b0072ad54e36b2sm2203087qka.93.2023.02.09.14.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 14:21:38 -0800 (PST)
Date: Thu, 9 Feb 2023 17:21:37 -0500
From: Peter Xu <peterx@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH 07/18] util: Extend iova_tree_foreach() to take data
 argument
Message-ID: <Y+Vx8Y2WT8IRLc1w@x1n>
References: <20230126184948.10478-1-avihaih@nvidia.com>
 <20230126184948.10478-8-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230126184948.10478-8-avihaih@nvidia.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 26, 2023 at 08:49:37PM +0200, Avihai Horon wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Extend iova_tree_foreach() to take data argument to be passed and used
> by the iterator.
> 
> While at it, fix a documentation error:
> The documentation says iova_tree_foreach() returns a value even though
> it is a void function.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


