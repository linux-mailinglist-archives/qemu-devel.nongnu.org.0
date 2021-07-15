Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631863CAE56
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 23:02:11 +0200 (CEST)
Received: from localhost ([::1]:35348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m48Uk-00074O-FB
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 17:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m48Sr-00062Q-J2
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 17:00:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m48Sq-00029B-3D
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 17:00:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626382811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KSeofyEBmF0cfz0hrM+3u9hPftpHAXrhS6g58V8P8W0=;
 b=ibv8c3huolh+GXAiZZ19CmvtWM9Mp7qRm3uc+AGr2pr+vxJ0GmcKN1qCq6G6MBvNMeElSd
 NoZpXsh/7VnF5Er+/S/ornoT/l2sFC0El6NAqBxasGizg4J2S+Q2CmF5+Bx4ziFig4z2vS
 59EJZSwhNSZXsccutEIrnZ7TuNeTRVc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-bi59zs9gNculMreBXta44A-1; Thu, 15 Jul 2021 17:00:10 -0400
X-MC-Unique: bi59zs9gNculMreBXta44A-1
Received: by mail-qk1-f198.google.com with SMTP id
 y5-20020a37af050000b02903a9c3f8b89fso4792265qke.2
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 14:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KSeofyEBmF0cfz0hrM+3u9hPftpHAXrhS6g58V8P8W0=;
 b=pU1KAolxfwPNJmFq2BsSKBG9kkNg9ZLZd5ELlIsBZ2kBjNP7Ues4h3JsLENZqc7qAm
 8praH3Rw0P1/ECqP6kOiPymV5MliKnFbFTMToK5GaoR4LtlXCTU6j6UU5/elA9hTClsD
 VzpTW2MNB2lFeGk7tYSp6NgUVQdxPSaZku+n3hD+/ZSV3zNwcRfoF1K2M/sHY4F5gJuL
 iCbsrKud8E3R5lPddZm4a8CePcdlN/JrRRc1Nu3h77kQOMS0/9vcprdqT+GkkPJ6EvMM
 G0jsGYdDFZ5QBHS5ETzPdKl/5B/A5Mp9YGT9ZK3zf1tDi67PX+qY07mzW/VfhxCAl1tl
 aJ8g==
X-Gm-Message-State: AOAM5308pROHo1YGP/he9q41CS76hxJo4JTSONz6rpZRncvCh3XeBO/U
 h2c5wdOFaxi4/Uvh+BTHUsYJ0ZFQdC9KEOl6ryalfnpTzt2zRp5XDcHIgKmTumHdUmTWzTZOkr9
 TmXN+rn7xXW72Euo=
X-Received: by 2002:ad4:4ae5:: with SMTP id cp5mr6334458qvb.38.1626382810010; 
 Thu, 15 Jul 2021 14:00:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+cEM5a+M4mVtgu4MFZXPyVIOEFRS4mN/6LjyN1vdEerPExJ+AIQdtgJxv5QMOsSYrJ9Jkfg==
X-Received: by 2002:ad4:4ae5:: with SMTP id cp5mr6334435qvb.38.1626382809815; 
 Thu, 15 Jul 2021 14:00:09 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id y10sm2462777qta.35.2021.07.15.14.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 14:00:09 -0700 (PDT)
Date: Thu, 15 Jul 2021 17:00:07 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v3 0/3] support dirtyrate measurement with dirty bitmap
Message-ID: <YPCh12e+L3ORKZKb@t490s>
References: <cover.1626354884.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <cover.1626354884.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 15, 2021 at 11:51:30PM +0800, huangy81@chinatelecom.cn wrote:
> Hyman Huang(黄勇) (3):
>   KVM: introduce kvm_get_manual_dirty_log_protect
>   memory: introduce DirtyRateDirtyPages and util function
>   migration/dirtyrate: implement dirty-bitmap dirtyrate calculation
> 
>  accel/kvm/kvm-all.c     |   6 +++
>  hmp-commands.hx         |   9 ++--
>  include/exec/ram_addr.h |  19 ++++++++
>  include/sysemu/kvm.h    |   1 +
>  migration/dirtyrate.c   | 118 ++++++++++++++++++++++++++++++++++++++++++++----
>  migration/trace-events  |   1 +
>  qapi/migration.json     |   6 ++-
>  7 files changed, 145 insertions(+), 15 deletions(-)

Yeah this diff looks much nicer. :)

I still have a few last comments here and there, please see each patch.  Thanks.

-- 
Peter Xu


