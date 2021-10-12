Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE67442AF15
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:37:50 +0200 (CEST)
Received: from localhost ([::1]:42282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maPT2-00083X-0L
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1maPQy-0005kQ-5A
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:35:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1maPQt-0000wk-3G
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:35:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634074531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=29q75LC+JUVOOjoifmxp49BhYm2mlSeaookr7bh2p+o=;
 b=XDrZfNJ1zZOMw644Ylnc1Aidu9ii+g2WrpPyYfnOt/P3DBv81TrClZnUY4zhu3DRFwtMcx
 KD6onKxcnvdaX2H0ZE7drEm0MJysciNz56Tfabx4G64e5FVks35/CN4I+TkqJc8YJn1SnR
 XgFSOTn472qcC31MCQffiLJ0leRgnQw=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-yU7F5omNOA2QuFRk-vI3eQ-1; Tue, 12 Oct 2021 17:35:30 -0400
X-MC-Unique: yU7F5omNOA2QuFRk-vI3eQ-1
Received: by mail-pg1-f198.google.com with SMTP id
 p19-20020a634f53000000b002877a03b293so204165pgl.10
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 14:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=29q75LC+JUVOOjoifmxp49BhYm2mlSeaookr7bh2p+o=;
 b=70vx+XoEY5yIFKcT+wuGCzgvjeND6g5gTAyuLRTynzPUs40ZFRv1I/F/+qWIPiWw0Y
 VuopmJWTjrB/WkwkscJzatOHcr4mQwMU0RWNjcMcVIUvl22LAW2D1TT8V+TBZarjy82X
 eHGqhyBAuM9g9ZbpEo7IUkUI2BhYID/kWB1xH/OhuKXpNdV091od9tHrqPV+iHGHIZ3N
 2+6qdVWPL7I0Gd3wjRaaxMtJPyi8ERfKQxL2qtus6bMb23sz0EHRFcmySe7vuw2UlW7z
 5NPsdLSSJK0A5K0upVKycH5XgzmxNhdRO2irk2k6utaXnmUGXRoeUtOFDI46kL196TQo
 y8vw==
X-Gm-Message-State: AOAM533ut0iCtvDmLAA58q7dY+TRjADc+h384K6bKAAfNFl1Y0iJqcXJ
 3rpft0hDklhD4N6+Ude7YGvcQvtu3BaZua/K8doamhMPDZz5xPfuy3xoJow6Ym+p9oLDGgTDzuE
 50g0TnL5GTa9sZnY=
X-Received: by 2002:a17:90a:b105:: with SMTP id
 z5mr8620999pjq.64.1634074529674; 
 Tue, 12 Oct 2021 14:35:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbtIA7CRu85YrxRnC8SI796MK+lRwLt8ZAMt4DEeh+GVkzbltlrFcTiWo0Ge1UB30qy9ttNg==
X-Received: by 2002:a17:90a:b105:: with SMTP id
 z5mr8620966pjq.64.1634074529379; 
 Tue, 12 Oct 2021 14:35:29 -0700 (PDT)
Received: from t490s ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id x15sm6701475pgo.48.2021.10.12.14.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 14:35:28 -0700 (PDT)
Date: Wed, 13 Oct 2021 05:35:21 +0800
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [PATCH 1/1] util: Make some iova_tree parameters const
Message-ID: <YWX/mWSZSs1zvKVz@t490s>
References: <20211012155001.811160-1-eperezma@redhat.com>
 <20211012155001.811160-2-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012155001.811160-2-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 05:50:01PM +0200, Eugenio Pérez wrote:
> As qemu guidelines:
> Unless a pointer is used to modify the pointed-to storage, give it the
> "const" attribute.
> 
> In the particular case of iova_tree_find it allows to enforce what is
> requested by its comment, since the compiler would shout in case of
> modifying or freeing the const-qualified returned pointer.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


