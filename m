Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381CB43700A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 04:34:36 +0200 (CEST)
Received: from localhost ([::1]:40136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdkOA-00071y-Qe
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 22:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdkNA-0005vX-TB
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 22:33:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdkN8-0003vu-F0
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 22:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634870009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GN8pBMlLBoW1Ptw0FTtSaD59zgOHq4O71m6I8051YBs=;
 b=cekRjVvkqMp/47VytM5wOY2RGVQKTT4cZ8/ITT5fXXi1S3DNgEgltJt21MJAo8SiydGv2s
 MOrRGCShnpanZd0qiBauFRNEBNc+i+THZ3M4Zf51bzEfO3emd4RX/86QM6rjT0/JBRFKl0
 tnnEKQ3VYp7gqeImCKcih0oKGLV0VoM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-G4EdXSAtP1KROnC0gxSQKw-1; Thu, 21 Oct 2021 22:33:27 -0400
X-MC-Unique: G4EdXSAtP1KROnC0gxSQKw-1
Received: by mail-pj1-f69.google.com with SMTP id
 lw18-20020a17090b181200b001a10ecde3d3so491459pjb.4
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 19:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GN8pBMlLBoW1Ptw0FTtSaD59zgOHq4O71m6I8051YBs=;
 b=lzGf+ZNR+q5Vs8UwO+3/2Du/TaGCMKAmc/GR2J1aO4Rz/TKWIxmScVB2xBZJwsvPPY
 egHTcz4tZQiAsk508Y5OrJbFKKohSditWPN0ysbc/GWNaP6PTpU+AGBYEOUOiYQKnv+1
 nvuRGiyEdaWmZLmGbbKnij3GYL+x1Hxj9IT5qd+qMcmm03oAzFi2DAExlzs1aTD5t76h
 e/j8M2LNHfZKnbYAt0T4N4acczDDNpUVF/ThBbvbPuwEqx+9HJJ1ptETn6n8F9rLSuj6
 LCiGwSC5fnuHARrKWCbCNWNaxHiWhkeAjxlApby40pUmamabuGeEccqaMxbZPm7QgDSZ
 Adew==
X-Gm-Message-State: AOAM531cbn0VfVcM6/Ujh6jbvBfuydTAmaJj+jTwbaiNY8a3MY3Iyfug
 u/utVV/wMJGDre9c9BRFnOcVuoJI/KATdayOfYCTr40HkyalZGm0DyBVil7ME3xGy8SZr+su73A
 qve/FeYYM/BfC0Z0=
X-Received: by 2002:a05:6a00:1398:b0:44d:3234:dc31 with SMTP id
 t24-20020a056a00139800b0044d3234dc31mr9248079pfg.7.1634870006055; 
 Thu, 21 Oct 2021 19:33:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxRAtbtzrVbHk/K7Rcdya0aTE4oZJlUd4ajWLrjtQb0LF5S44TO2tmEHw5KdaHp5hbchhIXg==
X-Received: by 2002:a05:6a00:1398:b0:44d:3234:dc31 with SMTP id
 t24-20020a056a00139800b0044d3234dc31mr9248057pfg.7.1634870005764; 
 Thu, 21 Oct 2021 19:33:25 -0700 (PDT)
Received: from xz-m1.local ([94.177.118.50])
 by smtp.gmail.com with ESMTPSA id on13sm7740892pjb.23.2021.10.21.19.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 19:33:25 -0700 (PDT)
Date: Fri, 22 Oct 2021 10:33:15 +0800
From: Peter Xu <peterx@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 7/8] pci: Add pci_for_each_device_all()
Message-ID: <YXIi65J4XiVcdYeZ@xz-m1.local>
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-8-peterx@redhat.com>
 <20211021064948-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211021064948-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Michael,

On Thu, Oct 21, 2021 at 06:54:59AM -0400, Michael S. Tsirkin wrote:
> > +typedef struct {
> > +    pci_bus_dev_fn fn;
> > +    void *opaque;
> > +} pci_bus_dev_args;
> 
> code style violation. CamelCase for structs pls.

OK.

> > +/* Call 'fn' for each pci device on the system */
> > +void pci_for_each_device_all(pci_bus_dev_fn fn, void *opaque);
> 
> Instead of hacking pci making initialization o(N^2),

Why it's O(N^2)?  One vIOMMU walks O(N), and we only have one vIOMMU, or am I
wrong?

> can't we add a variant of object_resolve_path_type ?

Could you elaborate?  Here what we want to do is to make sure there're no
specific PCI devices registered, and potentially it can be more than one type
of device in the future.

Thanks,

-- 
Peter Xu


