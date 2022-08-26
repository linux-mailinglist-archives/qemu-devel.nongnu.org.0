Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 794685A29ED
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:47:27 +0200 (CEST)
Received: from localhost ([::1]:59620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRacI-0005jb-IB
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oRa5u-0001wS-PA
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:13:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oRa5r-0004EU-Hy
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:13:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661523233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GQ+6AbMK/VzzgwCX5/3G69+rKn+A93ZLmXM6dTBFuQY=;
 b=RIRZidokG//VIp02lCUdQwqOubl3mmvyOFg3Q/LTdwawnDBsin4J5kojny3SYVumHtiPb9
 NnhuJ4RqUlMgtCgX2Vhn5JhyYL0MX+qbVD+9p+TdiGcYF+4zYJyE+w8XopmAB+xuL8bMhz
 oEP1TKnxzpDwSi726XzRLUNVlhuMyHA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-7HogS4rFMROwxgWGpjE8OA-1; Fri, 26 Aug 2022 10:13:50 -0400
X-MC-Unique: 7HogS4rFMROwxgWGpjE8OA-1
Received: by mail-qk1-f198.google.com with SMTP id
 w17-20020a05620a425100b006b97978c693so1318609qko.19
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 07:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=GQ+6AbMK/VzzgwCX5/3G69+rKn+A93ZLmXM6dTBFuQY=;
 b=UaSxlx/lhnWUGG44njKV26QWFMyLCIHTYmKig5URWvt9/BzSBkVO1kIWEQc0khbToQ
 4ZTxcqZOHdTOv879e2ndD0IWElvTJ8x3CFYtQ1TF2dzz4yWhPnuY0VDjTCF9kkHLkh67
 JX60hytTfi+PHPD8TGvYlJ9G2FBjJ4OizlCLlzc4c9StLF80xtyjJoxazeXUpqmJDp6W
 Y5qMcFn8XrVaT3rrcnXCjjP2F2Juk5Jg5983QHWubf/XyL27CzGthhsulOK0/dcSCAFn
 VF0PiMp2Dnncm78G3I+pJEqJB11XVo1CrUktlINncmEcR6KfNh3kYUS1m6waWK0bhodd
 3fqQ==
X-Gm-Message-State: ACgBeo3/NF64ow+ziImKoUkqpNBxFRzjSlo8yeaeb4N19q1F2P2JcidR
 grc6gzE825VTuepswsFseA9541z7ccsQ05e3eRGtQfj2WlK4LlUb3RMd8Xmizt+v0m4OqPqJPdN
 ecRzuPzOVtelpi0w=
X-Received: by 2002:a05:622a:1343:b0:343:5b7:ffb with SMTP id
 w3-20020a05622a134300b0034305b70ffbmr8165265qtk.91.1661523229880; 
 Fri, 26 Aug 2022 07:13:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4jReA0QpSlG/6gNrVfZ7v6crpcmNYSzbMoyGBauyk17ML/pe15D/kCE+6aUCVDOP6AseSh8Q==
X-Received: by 2002:a05:622a:1343:b0:343:5b7:ffb with SMTP id
 w3-20020a05622a134300b0034305b70ffbmr8165236qtk.91.1661523229665; 
 Fri, 26 Aug 2022 07:13:49 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a05620a268300b006bb0f9b89cfsm1905603qkp.87.2022.08.26.07.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:13:49 -0700 (PDT)
Date: Fri, 26 Aug 2022 10:13:47 -0400
From: Peter Xu <peterx@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] softmmu/memory: add missing begin/commit
 callback calls
Message-ID: <YwjVG+MR8ORLngjd@xz-m1.local>
References: <20220816101250.1715523-1-eesposit@redhat.com>
 <20220816101250.1715523-2-eesposit@redhat.com>
 <Yv6UVMMX/hHFkGoM@xz-m1.local>
 <e5935ba7-dd60-b914-3b1d-fff4f8c01da3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e5935ba7-dd60-b914-3b1d-fff4f8c01da3@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Fri, Aug 26, 2022 at 03:53:09PM +0200, Emanuele Giuseppe Esposito wrote:
> What do you mean "will empty all regions with those listeners"?
> But yes theoretically vhost-vdpa and physmem have commit callbacks that
> are independent from whether region_add or other callbacks have been called.
> For kvm and probably vhost it would be no problem, since there won't be
> any list to iterate on.

Right, begin()/commit() is for address space update, so it should be fine
to have nothing to commit, sorry.

> 
> I'll implement a new macro to handle this.

Sounds good.  Thanks,

-- 
Peter Xu


