Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E2C691335
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 23:22:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQFIg-0007lH-AW; Thu, 09 Feb 2023 17:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQFIe-0007kt-PA
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 17:21:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQFId-0007WU-5v
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 17:21:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675981310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k8E078saC7a1AyICHApYzPBFJhrpucVw8EBwLdezb2A=;
 b=GoFvkNIG0Zml8IPnDKaLkzm7iYpBMO50VlKR/XplOUIlf684AbIofOMcFi3zG8kL2YVK8d
 pOOb/Bfdcd/GIdLKGAtwcxXM3dRNr9aazsYzQKBDhYdX88UlV6ilh+zSqS9yWR3ZNiwgUS
 kS+9OT5GxHKJLza4K0t4Tlhc+mQy+mY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-257-UxJE392IP_KIZiKE7fNAQg-1; Thu, 09 Feb 2023 17:21:49 -0500
X-MC-Unique: UxJE392IP_KIZiKE7fNAQg-1
Received: by mail-qt1-f197.google.com with SMTP id
 s4-20020ac85284000000b003b849aa2cd6so1964329qtn.15
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 14:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8E078saC7a1AyICHApYzPBFJhrpucVw8EBwLdezb2A=;
 b=LLjJm3o+1RfPWQJBet05slYkwB7fM+A4Mq7gnLN5XXae2xvs9glQc02pWpqPh2KutS
 Pc4jSZzwaoyvc72qlxJW2wb3QCwlk3zoxxoh7rioczPrxvk8pEpEZUz1oZFDqddO6UnE
 YmMcI6rS9JM066QkMuYqT0t9gBOlscimI/I9wvZslb/qLOU8+cerCfKRA/5J2JqQWcXc
 gnYQikOYH2YP9J+bUDB9Bs7CUy057dHJlkxzxmxD+9oFoMXQi8G6u/G9rdu2GAFY6ZYC
 pLQz4zgiZfcuW1KzuHeEzULNVi5uWLKL6rXV7UHoCmShaTXqudVe3DYvpDQbxfNm5ktC
 DBUQ==
X-Gm-Message-State: AO0yUKWelNQ/7q6FX/qWq31iYogaFpV8nGVvjvW99U7n8LOGpm5giJbh
 TqDOfGqBtjugVaMQVAyDbUTVHgEhA/IKa4Aay56pUW48vKk+aqBLp2NsZZyRWQ3kvaAUzakr/Q0
 NIAyGRwK78FFf6oE=
X-Received: by 2002:ac8:4e8d:0:b0:3ba:1ace:8bae with SMTP id
 13-20020ac84e8d000000b003ba1ace8baemr23191423qtp.0.1675981308792; 
 Thu, 09 Feb 2023 14:21:48 -0800 (PST)
X-Google-Smtp-Source: AK7set9FLdWFhcXZ8luOkyASL1K+6kbTrcumWL6Q0opjX+IH1JUOTKAqAEhDcD65R/VK5CqQQ086JA==
X-Received: by 2002:ac8:4e8d:0:b0:3ba:1ace:8bae with SMTP id
 13-20020ac84e8d000000b003ba1ace8baemr23191387qtp.0.1675981308541; 
 Thu, 09 Feb 2023 14:21:48 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 h7-20020ac85047000000b003b9a50c8fa1sm2018753qtm.87.2023.02.09.14.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 14:21:47 -0800 (PST)
Date: Thu, 9 Feb 2023 17:21:46 -0500
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
Subject: Re: [PATCH 06/18] util: Add iova_tree_nnodes()
Message-ID: <Y+Vx+ugPkQy1txrs@x1n>
References: <20230126184948.10478-1-avihaih@nvidia.com>
 <20230126184948.10478-7-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230126184948.10478-7-avihaih@nvidia.com>
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

On Thu, Jan 26, 2023 at 08:49:36PM +0200, Avihai Horon wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Add iova_tree_nnodes() which returns the number of nodes in the IOVA
> tree.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


