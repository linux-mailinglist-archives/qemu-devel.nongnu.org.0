Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2833DB992
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 15:46:29 +0200 (CEST)
Received: from localhost ([::1]:56158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9SqK-0006M6-4T
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 09:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m9SoU-0004vn-RQ
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:44:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m9SoS-0004lD-8J
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:44:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627652670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W/PM3vKbHG2+tg/J8eFc8GsP+EVqusqoArXDyqXy7qc=;
 b=WRLThBTv6Q9+2rdkmAB8sOuqlrmp58o63ljCxrlGEefPJ75C9T3IHdG1yDkSgA/RPNuK/Z
 eYLn2vb3Bj9uxxk+oamKEK02Pb+f3iuW/WG5Setu/zqFry6gOMcQNfzd715aRxL7DsJZge
 aLOx4i7uyAmIYgOqAeuG8mlFwAt8dQI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-VLGVaQjoOvSRmm3khjrc-A-1; Fri, 30 Jul 2021 09:44:27 -0400
X-MC-Unique: VLGVaQjoOvSRmm3khjrc-A-1
Received: by mail-qt1-f197.google.com with SMTP id
 z16-20020ac87cb00000b029025bf786be09so184657qtv.20
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W/PM3vKbHG2+tg/J8eFc8GsP+EVqusqoArXDyqXy7qc=;
 b=UK9vcZ8jTpdQpJjPBZlTDeQ0H5cIdupHi2i0D+L2cMvhFKBzeUhUeRVs+CF86YzP5C
 A7d408fpfz14N+1/7x/WBhhyRQi16jJ6/4O60pkC/Q5DcZ14xc++ItIILsrzoBHF8HHy
 PaG8NZ2WXBRlNnLkz2s5zyolGcQbBmLUGwHLiqTswkVQSljsFecUmO6Cvqyo5de5bwcE
 SlinYnxINZAJqAgmqjhPyDl1P8bpPdS/Kvap1qaKI1YDcXxNt7JX/nEx0tCim8hW8ykO
 vtbGrqn8tBdo08MBi1189Ocl9mLrTGJz/RosirJRDZ6/ZAXa5IfkLpoqrsTTYYFmUBqr
 DaaQ==
X-Gm-Message-State: AOAM533UfHaR3p5r/vFP0qrc902NC4KhQZc+FiNOCAYp4qBF4jJj6V4r
 f+rhDa+Kze1IclBJgCOS9MjzNimjqgsFPe5R5HC5E+C+d/hSpaJoc6JzkTCccfWCbC5tfq7s2UT
 CwQpFddY3fet5c+E=
X-Received: by 2002:a37:aa4d:: with SMTP id t74mr2362699qke.349.1627652667458; 
 Fri, 30 Jul 2021 06:44:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9tvpL7V4pHAOgteWmfCnO8PhZLg9F25u+wiRZ6dd+mkak5cL+PfHxYsfJTBQ8gIGQcMthTA==
X-Received: by 2002:a37:aa4d:: with SMTP id t74mr2362683qke.349.1627652667220; 
 Fri, 30 Jul 2021 06:44:27 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id s81sm901779qka.82.2021.07.30.06.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:44:26 -0700 (PDT)
Date: Fri, 30 Jul 2021 09:44:25 -0400
From: Peter Xu <peterx@redhat.com>
To: Cai Huoqing <caihuoqing@baidu.com>
Subject: Re: [PATCH] intel_iommu:  Fix typo in comments
Message-ID: <YQQCOQPeqc69egJE@t490s>
References: <20210730014942.2311-1-caihuoqing@baidu.com>
MIME-Version: 1.0
In-Reply-To: <20210730014942.2311-1-caihuoqing@baidu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 30, 2021 at 09:49:42AM +0800, Cai Huoqing wrote:
> Fix typo:
> *Unknwon  ==> Unknown
> *futher  ==> further
> *configed  ==> configured
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


