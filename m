Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCC0579891
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 13:34:30 +0200 (CEST)
Received: from localhost ([::1]:46522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDlUj-0006YO-Dg
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 07:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oDlSn-0004E9-Hl
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 07:32:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oDlSm-0003pv-0J
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 07:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658230347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fR0hodvTjtt/CJs6yTdxbva20Eeolg5hovwNMaRZdWs=;
 b=g2d7GiOEbLRMJGVKiVVIa8mWDiBJbnwPNo/hK3opBS1qrzG+owjhFgdUwS14fDG2f0oo4Q
 06e36FVBD+3QrHJoO3vMbkaBPmX+VwfBqGi5bgt/iCfcuX8+tpRS4dmuVbaS6BRnAroSDz
 bOuoTXHVcpWa3bKz+JYiPuCzydCGeWY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-ZYvNJYaTOgGf8FcjWE6ySg-1; Tue, 19 Jul 2022 07:32:18 -0400
X-MC-Unique: ZYvNJYaTOgGf8FcjWE6ySg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n18-20020a05600c501200b003a050cc39a0so6705109wmr.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 04:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fR0hodvTjtt/CJs6yTdxbva20Eeolg5hovwNMaRZdWs=;
 b=CsAI147hiktT80txy2kIIFTKGxOnWVsdnSzvUZOtWq+4fd1A8IPz3ApyhX1gsLYFhS
 aN9ihX/t1ZgsyBoTcSlaunYnnAut6pqSfO/YZXBc47Gd2zbVgyhRY5fM/XaSa0kAz+Vl
 0zhZB9PIb2lCyP/6JfcdfK2Js0m2yOyPZkiZKMaK+QDHxxfJiWBHK0PHhaIEA1VCKWkb
 LRYPqK4v8EKb2iduqzDmGyf4QTNPDUWoBRQv8qXzKOHhFOwKpBAwhj5Ax4uODdWqE9s0
 dCRnqaC1lOFwzaGsdp9j5zc0FD9rqaYSHCvK53l9x7Iai/Cho2ktoI69vyN6N3S53eY7
 RYYA==
X-Gm-Message-State: AJIora8OEoDJ4pjHViZ5nuyNK6RExJxJqGemlzwy2DgeIOJAHkGNyFZE
 wFNaV4+91t68JOvCQpm1SXCGTAIR7oWWvifCAe1wNFTfi1GGKOlemedrQJjN1LgzsosZO7Fo9GI
 MbUh3bd4X8BbTJk0=
X-Received: by 2002:a05:6000:1567:b0:21d:abc4:29f9 with SMTP id
 7-20020a056000156700b0021dabc429f9mr26120741wrz.181.1658230337391; 
 Tue, 19 Jul 2022 04:32:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vRe6gRKorm5eE8OAfm4JHOCtn0OznT7CZDN99vavgQm/fYvg30f9K8CyLHFWYYLrj6aIv/0A==
X-Received: by 2002:a05:6000:1567:b0:21d:abc4:29f9 with SMTP id
 7-20020a056000156700b0021dabc429f9mr26120727wrz.181.1658230337205; 
 Tue, 19 Jul 2022 04:32:17 -0700 (PDT)
Received: from redhat.com ([2.55.25.63]) by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c500f00b003a2e655f2e6sm18940751wmr.21.2022.07.19.04.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 04:32:16 -0700 (PDT)
Date: Tue, 19 Jul 2022 07:32:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: Igor Mammedov <imammedo@redhat.com>, xiaoguangrong.eric@gmail.com,
 ani@anisinha.ca, dan.j.williams@intel.com, jingqi.liu@intel.com,
 qemu-devel@nongnu.org, robert.hu@intel.com
Subject: Re: [QEMU PATCH v2 4/6] nvdimm: Implement ACPI NVDIMM Label Methods
Message-ID: <20220719073152-mutt-send-email-mst@kernel.org>
References: <20220530034047.730356-1-robert.hu@linux.intel.com>
 <20220530034047.730356-5-robert.hu@linux.intel.com>
 <20220616143210.21605b6a@redhat.com>
 <8a6a574aa3708f8f07c2dcc3fd84f6028ff1219f.camel@linux.intel.com>
 <78ce72a9f041f3bc0dcdebcee2888a3f2010d5cf.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78ce72a9f041f3bc0dcdebcee2888a3f2010d5cf.camel@linux.intel.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 19, 2022 at 10:46:38AM +0800, Robert Hoo wrote:
> Ping...

Igor could you respond? It's been 3 weeks ...


