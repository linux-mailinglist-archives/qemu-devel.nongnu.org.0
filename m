Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2606F4432A8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:24:59 +0100 (CET)
Received: from localhost ([::1]:48184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwao-0000AT-9z
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhwYg-0004sw-KQ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:22:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhwYY-0001qy-Bj
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:22:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635870157;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Z+Qqw2cCw+Gix37xW7e4CylNRMaq4FtsirGaqKhOgPA=;
 b=UZNPoKRHOks80FqnKTY9THgGWVFnK/AIwvGrcARj+SmW/3tTaxQb0B0CUVhs6l7ntwnC1m
 DNzN1vVBQTYH/e2mvqDrSUpl53EG2Rjann3sdYA1+os4nPNIYVNyKOsL4237dR784RrUih
 irr1W9zULKXU0EvbYd1yrTSiU6ugQgY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-O0M2UhZRNOWqLk9FpC-fcQ-1; Tue, 02 Nov 2021 12:22:36 -0400
X-MC-Unique: O0M2UhZRNOWqLk9FpC-fcQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso1412666wmb.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 09:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Z+Qqw2cCw+Gix37xW7e4CylNRMaq4FtsirGaqKhOgPA=;
 b=wQxWDNdhy/Tr7BQveV2nPibxebQUB3aMdDKermS8e43LBGxYWyCHhYqupTDBQWf2rc
 nVfffpYVqRO2T3VyWvl7s7tbOy+NmjYQnQsdrYwNAFS2C5ZXpNArT3E3aMvib6KuA2sK
 t0TcUXOyEwzJ89nuy1UdhIxRGobwxuHjXAC8Z6DE7hPD/85PtHluk2NgG4PFtCPWNDF9
 QEmYA3nFQ7VuBa7zV4t47WgHsjC+VVz85ivU52FQ3rqOSxmplzYHWa1nfeLHDKEntWSr
 XXRZJT2lNkRZx5xITrgyCOmYPbsjpibIdAwfD+mPLVl+UexZpsngSRLLzSXll4kr45KT
 Tp+A==
X-Gm-Message-State: AOAM530XmJT1nV9LZf+8rowD/i+r4zuvS8UW/eYf/FzxZiFpgeRWAItd
 LSSQ8eVqvs7PmXRna/XTaS1prq1QBkz6Rok8D2/kl/9LGbsiiuAFNe4/vq+gd5T/HCOuORU5W04
 QF9sBXvBxPYkJtuA=
X-Received: by 2002:a5d:6501:: with SMTP id x1mr20027250wru.390.1635870155485; 
 Tue, 02 Nov 2021 09:22:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdHYpVU/9dP2MRtB9JRhMDsqIP115YDGd407ycJiQfPniGNUUChuUMcHgF36U9QU4zlVW3RQ==
X-Received: by 2002:a5d:6501:: with SMTP id x1mr20027222wru.390.1635870155283; 
 Tue, 02 Nov 2021 09:22:35 -0700 (PDT)
Received: from localhost ([188.26.219.212])
 by smtp.gmail.com with ESMTPSA id n32sm3208450wms.1.2021.11.02.09.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:22:34 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH v2 7/7] Optimized the function of fill_connection_key.
In-Reply-To: <1635753425-11756-8-git-send-email-lei.rao@intel.com> (Lei Rao's
 message of "Mon, 1 Nov 2021 15:57:05 +0800")
References: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
 <1635753425-11756-8-git-send-email-lei.rao@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 17:22:33 +0100
Message-ID: <87cznih6ie.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: lukasstraub2@web.de, zhang.zhanghailiang@huawei.com,
 lizhijian@cn.fujitsu.com, jasowang@redhat.com, dgilbert@redhat.com,
 qemu-devel@nongnu.org, chen.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Rao, Lei" <lei.rao@intel.com> wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
>
> Remove some unnecessary code to improve the performance of
> the filter-rewriter module.
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> Reviewed-by: Zhang Chen <chen.zhang@intel.com>

As Chen has already reviewed it:

Reviewed-by: Juan Quintela <quintela@redhat.com>

But I think that you should change in a following patch:

s/int reverse/bool reverse/

Later, Juan.


