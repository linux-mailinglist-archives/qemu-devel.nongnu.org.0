Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE6C355996
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 18:50:44 +0200 (CEST)
Received: from localhost ([::1]:49040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTouZ-0001e9-R2
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 12:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lToqq-0007U4-B1
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 12:46:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lToqn-0004Hn-Ea
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 12:46:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617727607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RyE9J8maOc+p6iAoBWiEMpiv2RhOmPA31/Y1kijC70E=;
 b=Fq77LkW60LjqHAfr8nU1FkpqgW9licSdi2UWIBRKNkWkj6BhtdWQWqnI9eB3v2qR9+duzN
 JPKnV5oiZouv8kAmocIsDozQLOI40gOLN848+aV5Uf9XXTj4QeG2rq5ORXjJh89oG/tsWF
 mIwmvfKuNfytq69qlimRi3fqv5myykY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-fKz7kNpoMTOQpoV8RlNmCA-1; Tue, 06 Apr 2021 12:46:45 -0400
X-MC-Unique: fKz7kNpoMTOQpoV8RlNmCA-1
Received: by mail-qt1-f199.google.com with SMTP id a16so10558132qtw.1
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 09:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RyE9J8maOc+p6iAoBWiEMpiv2RhOmPA31/Y1kijC70E=;
 b=hB/ENhiosOT/SypqGuVOClwozB0shdRZADQKpT6MV3QsriXf/F7+Ot2rKb5l0zuhNX
 8hvVKumVleL4FGcGxq3/ophufwxvkwccs9Lo7uoRctlKb4KbgjfvM3wubjdP6k4ndzYZ
 QMS3Z/Z773Lcc+9uh0ax9qOGdyug1OA6KbBv9ymZ4OIug91pUlAx2AYlTrE1KQW1JUlK
 TauJdMMUF6u/yezVVe8JiAJcAbIGQ5lAL/QR10rwSu553JSRNoRdT9hQyJk1WJzchLy6
 xncRfeBsxv6IzSoatencTmEXKHLFxWRKXvaX1RgvQzSavy6YmTF47tqbpmgTMdhW17/0
 Ch3Q==
X-Gm-Message-State: AOAM531+7ptIXl2sWBBOypLdT1NV/lVYqME9VWv4jYIzWs53D2pNsWY2
 gd/Me12cd5kZn6tEkSFYB0V3tbdFHZm72ACu7ALbB3Bb9w3LgSbSivTFE5hHfgEVg7uZ8rUen3K
 DbZqvXVQAmwlfymQ=
X-Received: by 2002:ac8:46cc:: with SMTP id h12mr28940942qto.105.1617727605088; 
 Tue, 06 Apr 2021 09:46:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWtDJt7Llnvm51kjBFBcbtZRaAaIMHEev05eGZXphI38jRYbwddPP554CMP1zOKJ0xs86xyg==
X-Received: by 2002:ac8:46cc:: with SMTP id h12mr28940928qto.105.1617727604889; 
 Tue, 06 Apr 2021 09:46:44 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id m13sm15847535qkm.103.2021.04.06.09.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 09:46:44 -0700 (PDT)
Date: Tue, 6 Apr 2021 12:46:43 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH for-6.0 v1 0/3] softmmu/physmem: shared anonymous memory
 fixes
Message-ID: <20210406164643.GJ628002@xz-x1>
References: <20210406080126.24010-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210406080126.24010-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 06, 2021 at 10:01:23AM +0200, David Hildenbrand wrote:
> Fixes related to shared anonymous memory, previously sent as part of

The series looks good, but maybe 6.1 material? Since 06329ccecfa ("mem: add
share parameter to memory-backend-ram", 2018-02-19) is introduced in 2.12.

-- 
Peter Xu


