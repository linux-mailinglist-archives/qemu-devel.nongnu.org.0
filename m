Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5C23FF6CF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 00:04:10 +0200 (CEST)
Received: from localhost ([::1]:45942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLuob-0008VM-J7
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 18:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLugl-0002Wj-3b
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 17:56:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLugj-0001jj-4h
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 17:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630619758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tD7bp5BZ3luGVqewahNw3+rCRf9Sm+M99Zy9jziyUts=;
 b=eI1tcQlrHkYtbysNdPb6f+owV6+GZemwPNMkQGNeuuxe5/hrBlnj7YHiwEiae8Lpdj0tk7
 aDa5nf9UYNA+DhJzTlD4+bfo5WolSurTgQvL5zrZquT+x70z3OM8sq2tClRUhTPaFqiVbq
 gdeNqtJk+mYnCEi3eFYfX0X0VcXIQBY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-XF9o-vDbO72lIxGvBjDVQA-1; Thu, 02 Sep 2021 17:55:55 -0400
X-MC-Unique: XF9o-vDbO72lIxGvBjDVQA-1
Received: by mail-qk1-f200.google.com with SMTP id
 g73-20020a379d4c000000b003d3ed03ca28so3869915qke.23
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 14:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tD7bp5BZ3luGVqewahNw3+rCRf9Sm+M99Zy9jziyUts=;
 b=AaHfmBRdfaF7dB+r4DM4f0Xq+HCXE+E4eP/S0rMyIRt8QygQoiY/W/GnHQ3jzHgF6X
 v8W4TdGGtq9LE1SUECDts6GEFh7UHkeBIXsWoUg2uWbo9ugJedPIyM5ewZ9i34uRMy1u
 h/xacc0vBewOxr73iM7dqrsQCeIXKUdptiAzKa+C/XS4fQGV6SEnVUAliqDCPft9Z8zD
 PTnOhsh+t/yavm9EOsw8eMAiinS/kbffiU0pEOo8lzRVi3JLNI7ToVzA48fY4YaKy99m
 e36Ok3AKan1XgVH3B5F2Gh0ngZ85N1Q7UiGsHE6GmlIKSxPtmI0vM9zJUfi5rKcCnPlw
 MP2w==
X-Gm-Message-State: AOAM530KbYzXK/cPsRB7kbdwba7mb0cgQMVir0KP13vaorQq5S2lbSuG
 Tml/J/fBBoH0h5Ax9wCaUDGr+B8/+5RjXL7O5lg18Xfo8jZsFd7E+fmJO/52Gbt1GqsveUms2AM
 UyzPmPAodaNqljmI=
X-Received: by 2002:a37:6303:: with SMTP id x3mr282483qkb.214.1630619755401;
 Thu, 02 Sep 2021 14:55:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb6ajyVptwc9323PAM5pLNG9+9ob7Mz/Bq+eMoLrAf5YqCiYOJsx8l5C2eqUULF180GadB8g==
X-Received: by 2002:a37:6303:: with SMTP id x3mr282467qkb.214.1630619755205;
 Thu, 02 Sep 2021 14:55:55 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id d20sm1877914qtw.53.2021.09.02.14.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 14:55:54 -0700 (PDT)
Date: Thu, 2 Sep 2021 17:55:53 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 1/2] memory: Split mtree_info() as
 mtree_info_flatview() + mtree_info_as()
Message-ID: <YTFIaXhoncPaze6u@t490s>
References: <20210902062604.182620-1-philmd@redhat.com>
 <20210902062604.182620-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210902062604.182620-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 08:26:03AM +0200, Philippe Mathieu-Daudé wrote:
> While mtree_info() handles both ASes and flatviews cases,
> the two cases share basically no code. Split mtree_info()
> as mtree_info_flatview() + mtree_info_as() to simplify.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


