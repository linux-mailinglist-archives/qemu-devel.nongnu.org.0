Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2A169244E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 18:20:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQX4A-0001zc-44; Fri, 10 Feb 2023 12:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQX46-0001zK-VH
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 12:20:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQX44-0000bN-1G
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 12:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676049599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DRaL47+ogTD5ZQB8cWEoGTxmwFyHhj4D6ep64+k7WEc=;
 b=WSP7BDN6AWVnJHa7Yrp/EVk2vhwH1iLOOkWhPl+7F5prkgWPDQpT1QLpWFlOmWw7BI/8DV
 DnTuBRYk3Mo3R1s54VhT80iRbmYcARq7GI/7q/HPiUL87XrEcWhDJkObMBQ6o8vUM0ZTiT
 2R/keSruAYp3yQRWCvwMhN4Rd9Skec4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-196--C7SN4fCOSqjeb8PrD37LA-1; Fri, 10 Feb 2023 12:19:58 -0500
X-MC-Unique: -C7SN4fCOSqjeb8PrD37LA-1
Received: by mail-qv1-f72.google.com with SMTP id
 kd28-20020a056214401c00b0053cd4737a42so3512128qvb.22
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 09:19:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DRaL47+ogTD5ZQB8cWEoGTxmwFyHhj4D6ep64+k7WEc=;
 b=Jqur0loCQQZBAu1qfZ5MMTSbZSWVNgEVua1z9QOHA3nodUoTN9Wy5dwKiBPqkuWVQB
 BjiTNdpIRLdG7lvWQ4ZfdN/vVWqP0QPkBeEjYyR5hHL2j2XH2VyiaKZ5yuSQTFt/bWGe
 n0TwVhPDmtkNfJKevsXSkDe7hnLpx8ChSUothyFTibX4EtWjiTBG4MjbLI/a2KzhQPOO
 rE7JZjkA/bgXpAchL6i16ckvo3972vWpj9r8/dq4LPrb9vjYVohzFXuGfmCBA6ZnowAo
 NpwWkEvG1EfeNgqAZLhSbi4ljolDoY6BQy1X2mgte634biMNKSY4m8yKKA9zb5xmfrTq
 BrWQ==
X-Gm-Message-State: AO0yUKVmQXSf8fdPed6t/TaHNbu6brlSGINvMQt46xituci5ffNVTT0N
 Rx4tnyPogU0ssz6M1vWhagLsh8vvQJuc4CdbKNIwAMXC7bXaG+mmg3aUT81sASet/MjNSE3tyTf
 2V+GVrN9gHz54jRU=
X-Received: by 2002:a05:622a:1d5:b0:3b6:309e:dfe1 with SMTP id
 t21-20020a05622a01d500b003b6309edfe1mr29306806qtw.3.1676049597872; 
 Fri, 10 Feb 2023 09:19:57 -0800 (PST)
X-Google-Smtp-Source: AK7set8+M1iTp+1HbLSczWtkKmSMVaLe5za4D/KTqSUQYfsQBpLOPBKPABVlgDCnRFVypq9y6YBNUQ==
X-Received: by 2002:a05:622a:1d5:b0:3b6:309e:dfe1 with SMTP id
 t21-20020a05622a01d500b003b6309edfe1mr29306770qtw.3.1676049597616; 
 Fri, 10 Feb 2023 09:19:57 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 p18-20020ac84092000000b003a7eb5baf3csm3693151qtl.69.2023.02.10.09.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 09:19:56 -0800 (PST)
Date: Fri, 10 Feb 2023 12:19:55 -0500
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 2/4] migration/multifd: Remove unnecessary assignment
 on multifd_load_cleanup()
Message-ID: <Y+Z8u5bcNI0I+so3@x1n>
References: <20230210063630.532185-1-leobras@redhat.com>
 <20230210063630.532185-2-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230210063630.532185-2-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Fri, Feb 10, 2023 at 03:36:29AM -0300, Leonardo Bras wrote:
> Before assigning "p->quit = true" for every multifd channel,
> multifd_load_cleanup() will call multifd_recv_terminate_threads() which
> already does the same assignment, while protected by a mutex.
> 
> So there is no point doing the same assignment again.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


