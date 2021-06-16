Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3DD3A9EED
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:24:49 +0200 (CEST)
Received: from localhost ([::1]:45136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltXPM-0008KL-6n
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltXNx-0006x5-BA
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:23:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltXNv-0006Bb-Tj
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623856998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SHiTk8rwqLDSKrwpKSmUxTONMNDnxj19pyoMSxmU3kw=;
 b=REzOgoUI025cC3tKxr644v+CWkaHoVkq3zCYhICODKOe6dhGOhmrrv51yEnkO9p9iqVwJq
 7ZI6wnuZ9Ar6/HvPYrAFuRMyYO04mnk1r6kxOopcbacTtTwHA3oDbowahygfDt6tGjYx3z
 P/iI5yJuTf9mElqq+eK7ZMkFLTJlrwQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-pOoSjE-bPOmmON0ktM_hLw-1; Wed, 16 Jun 2021 11:23:17 -0400
X-MC-Unique: pOoSjE-bPOmmON0ktM_hLw-1
Received: by mail-qt1-f198.google.com with SMTP id
 z5-20020ac86c450000b029024e9a87714dso1832759qtu.2
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 08:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SHiTk8rwqLDSKrwpKSmUxTONMNDnxj19pyoMSxmU3kw=;
 b=LdowmxPZggPky1c4gIhpWdkhA0RPxl/VbYLf8Fqh8H3ZLy/MteMxLbGhNI4A7uyzao
 vOcWwE6OQecjK6bvNsVPtCYpwi8+BAdUKzQp19p0stnxpl/PBV0gQIV0SPCixUhe4tcd
 L1cGs6O/dvL4wReHPQb7cH+fj6Ruwq0WuxY8P99Ct/7ny5PF9SpKoNsVHRNLSsGXPdKm
 QIOS2SUbb2B+6bNX8S7N/w6W56f2n1+Rf11JG5EV53DyQLh8kcp95sCfe9eSQhbzARPC
 35aM477OkkAlY9O5wHe7PCTW/0ovbJWQY1sv/AIffop4C01nstS8YxaXqoiBtDPcGaCx
 fEaA==
X-Gm-Message-State: AOAM531Xrkz+kzHgN5y+ZfdU/YimBvB5sdwUsasCGjHhCNBeVP4+ZbXo
 juUjao/jZP0JsHY3ecbOwlICxdwAPV6agWT3gB8ks71S6LSDXMCsfgWa+H0pxEAqBNOY9/EQLUx
 OzPfMAemsrtp64uc=
X-Received: by 2002:ac8:684:: with SMTP id f4mr389151qth.79.1623856997184;
 Wed, 16 Jun 2021 08:23:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4WkeMN2MZ7SYPNUM4sPdQAfNNzb1nzv0vvgdEyLzX5VXEPkccwigtvtMutXbQa/cQfx3SXA==
X-Received: by 2002:ac8:684:: with SMTP id f4mr389126qth.79.1623856997005;
 Wed, 16 Jun 2021 08:23:17 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id g15sm1716459qkl.53.2021.06.16.08.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 08:23:16 -0700 (PDT)
Date: Wed, 16 Jun 2021 11:23:15 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v4 1/6] KVM: introduce dirty_pages and
 kvm_dirty_ring_enabled
Message-ID: <YMoXY8/lu5VX0NM5@t490s>
References: <cover.1623804189.git.huangy81@chinatelecom.cn>
 <32c3266ebfd75aaf3f2caaf6b5fad0fb6dd8a96a.1623804189.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <32c3266ebfd75aaf3f2caaf6b5fad0fb6dd8a96a.1623804189.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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

On Wed, Jun 16, 2021 at 09:12:27AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> dirty_pages is used to calculate dirtyrate via dirty ring, when
> enabled, kvm-reaper will increase the dirty pages after gfns
> being dirtied.
> 
> kvm_dirty_ring_enabled shows if kvm-reaper is working. dirtyrate
> thread could use it to check if measurement can base on dirty
> ring feature.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


