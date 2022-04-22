Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DF050B895
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:34:59 +0200 (CEST)
Received: from localhost ([::1]:38218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtR4-000343-FM
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nht2B-0005cg-8G
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:09:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nht27-0004zQ-Dg
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:09:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650632939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pmUXIiXwVBV6zKfVaNCfB6hgi3fvdo/HAGWwpKkUrqU=;
 b=UES9OdKIM/CRIvt/JFxMALKnNWdJCuPp7dfaqjwn9pvGixt3Y46vEzg8XhlxVLW3U6eNCo
 UqscGUqOnlhGFZQSf9AIcKK+B3UbgyCbUA8n30D+QzlO3/hTjnriTMWrLxmUwS7Qa1aeP+
 4DdPjYRwfZDyZE85hMZQ9svL7Dha8OQ=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-d-6teyxEN426UnM8MmUmEw-1; Fri, 22 Apr 2022 09:08:58 -0400
X-MC-Unique: d-6teyxEN426UnM8MmUmEw-1
Received: by mail-il1-f197.google.com with SMTP id
 l13-20020a056e021c0d00b002cc38cb4554so4393597ilh.10
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 06:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pmUXIiXwVBV6zKfVaNCfB6hgi3fvdo/HAGWwpKkUrqU=;
 b=Cel70foZeR5G5CXv5j6JRpUdqbIzuLThSPtSTyT4CKQYBj/M3vn6GYakGjrBkC9GI3
 mo04mxLiRKNZPi1arp0gKgczyehX8YUG/T0Iv/aqjOwGe0yFAAhlliVmGHMf/2yNSQG8
 M8qkzjPXd2i/Sbz0vpY6/rrqq/UKQ9JLYBKc743+HBJcFiyk6dhZIaj/1v3rQ7YOBoBx
 xNUcF0xKPnI6rEHxNX54KuO4nBg83E4NxoAxzobdFZk4EadVftNlq5LBGrMfjUw1tfnQ
 9DPAipPRr7/rWrR1PBT+1YstzWtIDEs/wXKPtnPisQsiQBHLf1npOcefFO00BiP60MOT
 k/qA==
X-Gm-Message-State: AOAM532jCYiWbagBhZINy0G0SK//S54xG740sRyCY00wj9hSyZ37sUsG
 tH2CiCeql3SUlHxeEHDHkxuCVHmJIXzFVq6juGuO/PfCcOLJzqFkLmcGF6FUiWVWpaxhpLn7oGY
 RyESEOSXC2hgnaWM=
X-Received: by 2002:a05:6e02:1888:b0:2c8:713f:dcff with SMTP id
 o8-20020a056e02188800b002c8713fdcffmr860861ilu.289.1650632937202; 
 Fri, 22 Apr 2022 06:08:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMzpPe6N1OGj45El/9GOHe+AKoQfkpg3zGN9wnMJ7G/vVDCz9oKpb2bYEPU4GWLt7arMescQ==
X-Received: by 2002:a05:6e02:1888:b0:2c8:713f:dcff with SMTP id
 o8-20020a056e02188800b002c8713fdcffmr860842ilu.289.1650632936949; 
 Fri, 22 Apr 2022 06:08:56 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a056602134300b0064620a85b6dsm1594581iov.12.2022.04.22.06.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 06:08:56 -0700 (PDT)
Date: Fri, 22 Apr 2022 09:08:55 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 3/4] intel-iommu: convert VTD_PE_GET_FPD_ERR() to be a
 function
Message-ID: <YmKo55ac4CKB23Ir@xz-m1.local>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-4-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220321055429.10260-4-jasowang@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Cc: yi.l.liu@intel.com, yi.y.sun@linux.intel.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 21, 2022 at 01:54:28PM +0800, Jason Wang wrote:
> We used to have a macro for VTD_PE_GET_FPD_ERR() but it has an
> internal goto which prevents it from being reused. This patch convert
> that macro to a dedicated function and let the caller to decide what
> to do (e.g using goto or not). This makes sure it can be re-used for
> other function that requires fault reporting.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


