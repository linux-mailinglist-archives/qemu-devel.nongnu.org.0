Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980964D15E8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:11:24 +0100 (CET)
Received: from localhost ([::1]:34148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRXkR-0007Ex-O5
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:11:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRXiW-0005cp-Fm
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:09:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRXiT-0001HL-CK
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:09:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646737760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KBp2gp1abaxUnkN7haiud1YSCDwr9/GGkjgmdW66tLc=;
 b=Cl9zRI/CqiJqt6/+alruuueZhod9ZuwbIhe87q9PF17su/HQRCgbItyJkv6J++tnBC9SQs
 UzE7Sr1fZFK1jT8dM3y7FFgyPRZRlNnIFDN/7mANnPGPnR3qqC1A/k6lkjzUiI8RTZ1/oz
 Wc9jhFgV+lkaKT9mXCphNdLEOBNuknc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-FsNkNc0sNP6DWr_vH1SC0A-1; Tue, 08 Mar 2022 06:09:19 -0500
X-MC-Unique: FsNkNc0sNP6DWr_vH1SC0A-1
Received: by mail-ed1-f70.google.com with SMTP id
 i17-20020aa7c711000000b00415ecaefd07so8032625edq.21
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KBp2gp1abaxUnkN7haiud1YSCDwr9/GGkjgmdW66tLc=;
 b=EO2FpPz1ZaWXhIE19N50jP2L8Q159IYVR03qCGDHlbWfH3+zw48uWfC8jpxDOY/PbQ
 1cefQ+pmw7pqM+pj2IJ22Uu54QtPGYZbGzKI3P6pbthsA7imfPAXi14mrvQwyYfOILzw
 hCKq133JzlpfuV5PkVq42olIp5ngSuaL7v7gn0nAt07qhvO7UT8u5QMWWNX1EGrQaTUD
 SxWxaNYJwWOBrfTTGqm+uXfFhKZLbBFQlcMKYaD+xbHJ8q2V8URwazkEsxsrkAXVxmb9
 xDbJ6Ma05/fFnOK0XYcKERb1iRi3ezhMq1MdPwuqiTfsarWYCHsJDJGwoUR1ptvMkoEE
 GF8g==
X-Gm-Message-State: AOAM5338+J9yk2y40YwEGkjLOd/o2/BmnCQjQEXyHI7UfUf9zeNqr81l
 PsaELjX8aJ2isOgh16VH5v/Dr4ytI10S8GCtHfUOitLcNc3BQiYmXGhy1qWOBrXhIEVrW4z/d/U
 4Aq/uDZddlIotXHA=
X-Received: by 2002:a17:907:96a8:b0:6db:4c68:1393 with SMTP id
 hd40-20020a17090796a800b006db4c681393mr1799723ejc.87.1646737758294; 
 Tue, 08 Mar 2022 03:09:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxEwTkCqYfFIiO1lOpwA9mwIwKHd7xJqyvs2ZqWkbbtHd6zy4bL/80ubCpOTSbWMLloaSjnTw==
X-Received: by 2002:a17:907:96a8:b0:6db:4c68:1393 with SMTP id
 hd40-20020a17090796a800b006db4c681393mr1799691ejc.87.1646737757975; 
 Tue, 08 Mar 2022 03:09:17 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 l20-20020a1709062a9400b006ce71a88bf5sm5709789eje.183.2022.03.08.03.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:09:17 -0800 (PST)
Date: Tue, 8 Mar 2022 06:09:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 3/4] tests/qtest/vhost-user-blk-test: Temporary hack
 to get tests passing on aarch64
Message-ID: <20220308060823-mutt-send-email-mst@kernel.org>
References: <20220307211439.213133-1-eric.auger@redhat.com>
 <20220307211439.213133-4-eric.auger@redhat.com>
 <YicprIn75glZ0zYe@stefanha-x1.localdomain>
 <d85bd084-2856-87d6-3b98-148b2a7fa03a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d85bd084-2856-87d6-3b98-148b2a7fa03a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eesposit@redhat.com, jean-philippe@linaro.org, qemu-devel@nongnu.org,
 Coiby.Xu@gmail.com, qemu-arm@nongnu.org, clg@kaod.org,
 Stefan Hajnoczi <stefanha@redhat.com>, pbonzini@redhat.com,
 eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 08, 2022 at 11:09:13AM +0100, Eric Auger wrote:
> Hi Stefan,
> 
> On 3/8/22 11:02 AM, Stefan Hajnoczi wrote:
> > On Mon, Mar 07, 2022 at 10:14:38PM +0100, Eric Auger wrote:
> >> When run on ARM, basic and indirect tests currently fail with the
> >> following error:
> >>
> >> ERROR:../tests/qtest/libqos/virtio.c:224:qvirtio_wait_used_elem:
> >> assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
> >> Bail out! ERROR:../tests/qtest/libqos/virtio.c:224: qvirtio_wait_used_elem:
> >> assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
> >>
> >> I noticed it worked when I set up MSI and I further reduced the
> >> code to a simple guest_alloc() that removes the error. At the moment
> >> I am not able to identify where ths issue is and this blocks the
> >> whole pci/aarch64 enablement.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> ---
> >>  tests/qtest/vhost-user-blk-test.c | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> > What is the plan to identify the root cause?
> To be honest, I have no precise plan yet. However I commit to work on it
> within the next weeks.
> 
> If maintainers prefer to delay the introduction of qtest libqos
> pci/aarch64 tests until this gets fixed, I would understand though.
> 
> Eric

Given soft freeze sounds like a good plan.

> >
> > Acked-by: Stefan Hajnoczi <stefanha@redhat.com>


