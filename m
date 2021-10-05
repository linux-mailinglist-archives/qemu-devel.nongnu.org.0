Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC922422CF1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:51:21 +0200 (CEST)
Received: from localhost ([::1]:39086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXmiu-00034R-Jn
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmdf-0006EE-VT
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:45:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmdb-0001bJ-SD
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:45:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633448750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YeGWMzpYiDgYXqrgn9Sgx25jaiFx5oLxnDy4NLLQTaA=;
 b=A1hTX3qFrGbukmmEkciQn87R19xW/tPnkIkQqLwUE32QiNWgiWhBE8pD7N7h9Wk/j+jEQd
 Q3u0MESisjtjMdUhly8kwuLO357f1A+QpgOgmIKv365bGsmlpj/BlrGMpVCUcnJu/mu4K8
 qOHX6Skh8MLd28WxQwsonqwSQjvN/iQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-ySlOd_utMiCuF3uX1khLeg-1; Tue, 05 Oct 2021 11:45:49 -0400
X-MC-Unique: ySlOd_utMiCuF3uX1khLeg-1
Received: by mail-ed1-f69.google.com with SMTP id
 i7-20020a50d747000000b003db0225d219so3856010edj.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 08:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YeGWMzpYiDgYXqrgn9Sgx25jaiFx5oLxnDy4NLLQTaA=;
 b=RVWg/VmmchdD8uMcwR6XQFWfNObb3F3tFsa4H6dk6M7lB9uzCAMrYeRrjhPkNx57jx
 hhpsvfDscuyDe0fUwWr1IzaLTTVzWY4UnCjyQJizye/g38WhHHGJ17RrJgSv6lGiGCVI
 dAStzxwd+UnoxrvGKpNnNJlVXfFZkfwyvopv5H8qr5P7O3Sjxx7iLh9k9TLfVDBgceo5
 Yof9PhraJ7rGiBg89MQps0UJlMcEGJXN3dma9BoJBGsFkmgs6c3hLlKhsTzhMLVWTnCL
 vpCfsP+L8Ml2NC1PSNDKEpghsGNJDWruTGt7GhN3lAyum73DiX0s4RS/GLlkboPXhYAw
 Ccug==
X-Gm-Message-State: AOAM5327XiCNHUKLTtmYwYR9RzrICg3kEtZelEpQhFV4C3+XZ5T4qn7m
 7c6iSh/UgP2PiRnxvb6goXTZDTaAoIaNngK31pb7Gpwv0I3d4LUw/vVmCSZnq0n9HmFlz/IXYGB
 Sb0ppkLVyy8ZabEA=
X-Received: by 2002:a05:6402:1d49:: with SMTP id
 dz9mr13834525edb.55.1633448748392; 
 Tue, 05 Oct 2021 08:45:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytOcwE1lVpa7SDWWFTGM472iz0i07sVXmNAzqK+Ucum86Hl5cOlRvdHZowB4fxAYri9cZ32g==
X-Received: by 2002:a05:6402:1d49:: with SMTP id
 dz9mr13834491edb.55.1633448748165; 
 Tue, 05 Oct 2021 08:45:48 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id e15sm6549570ejr.58.2021.10.05.08.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 08:45:47 -0700 (PDT)
Date: Tue, 5 Oct 2021 11:45:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 00/11] virtio-iommu: Add ACPI support
Message-ID: <20211005113719-mutt-send-email-mst@kernel.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211001173358.863017-1-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, imammedo@redhat.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks like this can not be applied yet because the bypass bit
isn't in yet. what's up with that?

-- 
MST


