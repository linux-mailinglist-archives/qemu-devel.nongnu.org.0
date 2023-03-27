Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 966506CAA91
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 18:29:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgphv-0004lO-DQ; Mon, 27 Mar 2023 12:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pgpht-0004lB-1p
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:28:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pgphr-0004nc-4L
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679934503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8wXAx1beCu5BiTV+cVnIyCdYTlRLOxiy9FH6TUA2buA=;
 b=DmUFb1pS2qdfnaPx/8+UIGzyrf1cKs7Y8adUWo3BD260W+nOJO4BOmbqeHeVHG8OvYxj3C
 VdtCW4hCp0H+PrVfjppf2/1lW4SsTaoNxWl3FiGQbrC0FAhlgyT36qMpGUnbrmm/zr53i0
 rTS9qLQJD+BCpSph9Rza1becffz6404=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-ro-0ZZcNPym7fQvRDNg7dA-1; Mon, 27 Mar 2023 12:28:22 -0400
X-MC-Unique: ro-0ZZcNPym7fQvRDNg7dA-1
Received: by mail-qk1-f197.google.com with SMTP id
 72-20020a37044b000000b0074694114c09so4234154qke.4
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 09:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679934501; x=1682526501;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8wXAx1beCu5BiTV+cVnIyCdYTlRLOxiy9FH6TUA2buA=;
 b=J3ECMcdsVHiefUxqOJZyLmNB4PPbV/rKodbsZx3D0JmYzMaCKWrwQfrZV29KlKsroe
 hxZ3cQBdc6IEGu0ieDmbpIf5IyHpppk0gzmxV2BKybsbk8QLMJdfWydSwQ1OkS7SCiA2
 PQbfFrrlXuRPLHkIdrGbDg26wQGJeg+6sQbRGXAt6e3sywFL1ct7z+YOiAZr4/JfvzX6
 QDH5CAc8TMjjJOAOdR6ykwg7gHmdx8fGGHnMOPzvjdisFpmKguaNDrlR0eKC7f6RWo8l
 3hCid7ZpwrREKSfya8t7akKGqan1JotOz/WSWC3FBd6TcTcB4w3/eqSHlKGT+QR8edL+
 QObw==
X-Gm-Message-State: AAQBX9eY4ZROLPjn9vBdBw2zaTW0t8J8vP7TmUnPTs2U5VJwirUnraVB
 Nr06viXGHqbaDXArsChjAJ2p0fdBGRH8j84ufaZhJB/Q4eN4M4IoktglsUgsfuHnx0fv3iBP9U3
 H0e/FzV2xmWYZuoA=
X-Received: by 2002:a05:6214:300f:b0:5da:b965:1efd with SMTP id
 ke15-20020a056214300f00b005dab9651efdmr19757382qvb.2.1679934501501; 
 Mon, 27 Mar 2023 09:28:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZAmWBiiIivSgm9Wz63JsMd2Tk8In0/hQeUr/WjVr5lYwtcoNP4uNhH1NL5b+mZnjmcleGpLQ==
X-Received: by 2002:a05:6214:300f:b0:5da:b965:1efd with SMTP id
 ke15-20020a056214300f00b005dab9651efdmr19757357qvb.2.1679934501249; 
 Mon, 27 Mar 2023 09:28:21 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 kr9-20020a0562142b8900b005dd8b934577sm3083621qvb.15.2023.03.27.09.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 09:28:20 -0700 (PDT)
Date: Mon, 27 Mar 2023 12:28:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v1 1/1] migration: Disable postcopy + multifd migration
Message-ID: <ZCHEI52qczGkkRxt@x1n>
References: <20230327161518.2385074-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230327161518.2385074-1-leobras@redhat.com>
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

On Mon, Mar 27, 2023 at 01:15:18PM -0300, Leonardo Bras wrote:
> Since the introduction of multifd, it's possible to perform a multifd
> migration and finish it using postcopy.
> 
> A bug introduced by yank (fixed on cfc3bcf373) was previously preventing
> a successful use of this migration scenario, and now it should be
> working on most cases.
> 
> But since there is not enough testing/support nor any reported users for
> this scenario, we should disable this combination before it may cause any
> problems for users.
> 
> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


