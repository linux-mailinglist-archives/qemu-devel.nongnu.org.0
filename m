Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB14561B70
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 15:34:52 +0200 (CEST)
Received: from localhost ([::1]:33926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6uJn-0005Gs-Da
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 09:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6uGI-0002BA-46
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 09:31:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6uGC-0007qv-BH
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 09:31:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656595866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7SKGFt+Q3zHrl+E4aBkOi8/B/sZNyNG+pBxk0A2EJE=;
 b=Yi9mND23joDggHzyajwD4ueY0JpxLeF5W2aRjCwpmpycMZ4CN5gtu5iAY/bL9s1Lk7VGaG
 y7N5qLO08+fRzJUS+e7vhdAz/wggHgI6TkDIW0O3UldoFAlnlhSf+daLjOPQkOGfSmDDrn
 TNG/6mjT45KKo7DqCNxGMsCte7cEr1s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-75SjcBQdMKyj9pIdE7FFhA-1; Thu, 30 Jun 2022 09:31:05 -0400
X-MC-Unique: 75SjcBQdMKyj9pIdE7FFhA-1
Received: by mail-wm1-f71.google.com with SMTP id
 be8-20020a05600c1e8800b003a069fe18ffso1399965wmb.9
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 06:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=z7SKGFt+Q3zHrl+E4aBkOi8/B/sZNyNG+pBxk0A2EJE=;
 b=I8g5l3uJn7Boj9+YabvD8HP56aPuB+DGhZ2CAAr7XJ/1NvI72nh7b81tmApwC1WQuM
 CylBbY2UJ//312LJfra9oEmpPXrBjh6JF3NxvkylwAjR1lWff+bsj77t0op5dMaYCVFK
 Fp+WgQmEULdmA6mENWp4k1FN14CitfTm/U3RO33n+rG1Zc7xgLEdKt6lxLG9CKV1Uli+
 4A8TzJBr8OwYsxQZMOHFDUwTQUicvJwRHsa5Xe52phqB5FYktjiI94SzPmNLwSA2HzhV
 9me7DLNQOQcwTeAp4gsG/EqsgUfLYBX305QStgcrmggLBXK/cxPA7vDjaPeK79DhNzPF
 JK+w==
X-Gm-Message-State: AJIora95wkLlhOAZF5ZOGSBOnFMvYddZ63hE/Ygx04omP/MQ7OclPByK
 L713aslAo3xaZG6tGVJPO+QiMUyoICJuI5yAx/XGQOLfpetjTg1zCm3V47iSm0f9J0a39A3XrW+
 qWZ0PNmlp4XHqM+A=
X-Received: by 2002:a05:6000:1e10:b0:21b:98c7:d35e with SMTP id
 bj16-20020a0560001e1000b0021b98c7d35emr8967009wrb.30.1656595863823; 
 Thu, 30 Jun 2022 06:31:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u8Be/RuBBBDLi3LSv0t+QzwfViqKRkngWHqNJsjUIcrLM+8dJIO5w/gwqFFrmA9axuQidOZg==
X-Received: by 2002:a05:6000:1e10:b0:21b:98c7:d35e with SMTP id
 bj16-20020a0560001e1000b0021b98c7d35emr8966979wrb.30.1656595863574; 
 Thu, 30 Jun 2022 06:31:03 -0700 (PDT)
Received: from redhat.com ([2.55.3.188]) by smtp.gmail.com with ESMTPSA id
 m17-20020adfe0d1000000b0021b866397a7sm19850141wri.1.2022.06.30.06.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 06:31:03 -0700 (PDT)
Date: Thu, 30 Jun 2022 09:30:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Brice Goglin <Brice.Goglin@inria.fr>
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Liu Jingqi <jingqi.liu@intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v4 0/4] hmat acpi: Don't require initiator value in -numa
Message-ID: <20220630092934-mutt-send-email-mst@kernel.org>
References: <ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr>
 <20220630142347.22485226@redhat.com>
 <17551978-4608-f9e4-8aab-d5d7512dc5a7@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17551978-4608-f9e4-8aab-d5d7512dc5a7@inria.fr>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jun 30, 2022 at 02:40:13PM +0200, Brice Goglin wrote:
> 
> Le 30/06/2022 à 14:23, Igor Mammedov a écrit :
> > On Thu, 30 Jun 2022 09:36:47 +0200
> > Brice Goglin <Brice.Goglin@inria.fr> wrote:
> > 
> > > Allow -numa without initiator value when hmat=on so that we may
> > > build more complex topologies, e.g. NUMA nodes whose best initiators
> > > are not just another single node.
> > > 
> > patches looks fine code-wise,
> > however something wrong with them, i.e. 'git am' doesn't like them
> > nor ./scripts/checkpatch (which one should use before sending patches).
> > 
> > I've checked it's not my mail server/client issue(or whatever)
> > that corrupts them (ones downloaded from patchew are broken as well)
> 
> 
> I don't know what's going on. These 4 patches are in
> https://github.com/bgoglin/qemu/commits/hmat-noinitiator (rebased on master
> 10mn ago).

It's the commit log that's corrupted.

> Do whatever you want with them. I am not allowed to spend more time on this.
> 
> Brice

Maybe someone will fix up the log and repost. One can hope ..

-- 
MST


