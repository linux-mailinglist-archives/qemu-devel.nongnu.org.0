Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB48692456
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 18:21:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQX5Y-0002kV-JY; Fri, 10 Feb 2023 12:21:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQX5W-0002k7-8h
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 12:21:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQX5U-0001BT-VR
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 12:21:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676049688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6l8gtY4loc5Bm3SMJsBMNGTITnL1P0+vSJYEBsCyRMU=;
 b=A5dbmVf6dgpTbiVHoKJlqu+9+qOuYMYNSZEqO1ezqP2ov5XVVpSZI/Tfy7xeVxxK/JeqTe
 XpPMJVecJ46QcMsLqFMlytKaTkP/oGGY4+UA97LPnFDjOQYRjjUH6MRyAwlEO1qBKAUMRq
 k8S8r/63m6EvWDfZts9YB0UGJaNDESM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-175-gjbMvutNOWaoGEjpR3DlWw-1; Fri, 10 Feb 2023 12:21:27 -0500
X-MC-Unique: gjbMvutNOWaoGEjpR3DlWw-1
Received: by mail-qk1-f197.google.com with SMTP id
 j10-20020a05620a288a00b0070630ecfd9bso3704173qkp.20
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 09:21:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6l8gtY4loc5Bm3SMJsBMNGTITnL1P0+vSJYEBsCyRMU=;
 b=0A7qF3jCWosVVhbcMCgstRgJzTrNJUoezgmWh0auxunAxUn8N27uzSZodnpbHpyPc1
 63b5hjvzHecZGej1kqzl5YCneiKNXWWCRrS92OoCDBsgyCtJr1GWYMdsOPPWz+mj0JuH
 xDTqf+YnBG33JAOO3bltXus4P5TKU5hbajgnAOg/gNxKbsDpidNSkPgTaZKC0FaK6iqD
 GB9VcGz5N2Y8BRWrlhylv9uutitYlRGYbmdbMKXje0Jwiqz03U0PjnHooGXCWNYRLpxA
 26EfLEDDpKbQJX3D4EBlO5hqA5dyZbp7ysPJaoipWCmdgbxrRGBISKC7jxv3cjfBbH2W
 XiGg==
X-Gm-Message-State: AO0yUKUCZMCOcKRz7C77ewq2kINLO4HRLxUVudpMNNUeBI7g2G8WviRx
 8rlhzpIRrSWMImHcWP3E6Dk8xa6M8XJIcGPDzHZ/7oKMihkFsAjCRZm6WetzuNeLwB9zovWinxc
 HAEkIzJFWB3vWF7o=
X-Received: by 2002:ac8:4e8d:0:b0:3b8:5f47:aac2 with SMTP id
 13-20020ac84e8d000000b003b85f47aac2mr31403812qtp.1.1676049686574; 
 Fri, 10 Feb 2023 09:21:26 -0800 (PST)
X-Google-Smtp-Source: AK7set/Hw1T8eQQXZbG3G9Zuld92H5cPYf8Xwq9LtGZNviY0DTxPSS82/07fTtvJK9hx2CAqaxevbA==
X-Received: by 2002:ac8:4e8d:0:b0:3b8:5f47:aac2 with SMTP id
 13-20020ac84e8d000000b003b85f47aac2mr31403790qtp.1.1676049686358; 
 Fri, 10 Feb 2023 09:21:26 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 z5-20020a379705000000b00705cef9b84asm3821465qkd.131.2023.02.10.09.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 09:21:25 -0800 (PST)
Date: Fri, 10 Feb 2023 12:21:24 -0500
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 3/4] migration/multifd: Join all multifd threads in
 order to avoid leaks
Message-ID: <Y+Z9FBYXQjYhGEjc@x1n>
References: <20230210063630.532185-1-leobras@redhat.com>
 <20230210063630.532185-3-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230210063630.532185-3-leobras@redhat.com>
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

On Fri, Feb 10, 2023 at 03:36:30AM -0300, Leonardo Bras wrote:
> Current approach will only join threads that are still running.
> 
> For the threads not joined, resources or private memory are always kept in
> the process space and never reclaimed before process end, and this risks
> serious memory leaks.
> 
> This should usually not represent a big problem, since multifd migration
> is usually just ran at most a few times, and after it succeeds there is
> not much to be done before exiting the process.
> 
> Yet still, it should not hurt performance to join all of them.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


