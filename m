Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E8E43FB02
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 12:44:21 +0200 (CEST)
Received: from localhost ([::1]:50558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgPMy-0004re-Qx
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 06:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mgPL0-0003MT-7W
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 06:42:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mgPKy-0006Ku-B1
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 06:42:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635504134;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=fE9ihLbcinmY5vSnKB/JJnVoNS/EoK16XjAzZ3Zu50M=;
 b=JLw/V6y0/5rYRj0vrSyujgM+6GYiubcqRk+0FSTGTh4PKn6UGL8u3r2Uwo2AyIhr8KA5K7
 vZqNUI9eb4eC6J5E+VouAmorvc+Fx99FE64Fdrg7q/tPtePJMVrWMdoIocctVZwgI2R4CQ
 gBn6/5f7BGc+iSgZlA8EKYrJEvNVSQk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-am_588leOaePzn9cGWCT_Q-1; Fri, 29 Oct 2021 06:42:12 -0400
X-MC-Unique: am_588leOaePzn9cGWCT_Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 v5-20020a1cac05000000b0032ccf04ba2cso2283519wme.2
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 03:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=fE9ihLbcinmY5vSnKB/JJnVoNS/EoK16XjAzZ3Zu50M=;
 b=ge4Qu+HRUA5t6qQGSIaKk4pQYCUhpKTf2kA/Ucmd7ZaO3b9zQCtl/V0DUd3awG0CCn
 zk2M1UXy9ZRvIM5BNLapTa4+Fd5zOb6GAGdWGhVkkuAoMeVWn5Cy34xiJ/5UNiYDKfp8
 bctUOo3U//HFZdaDrd1495rU6FNecryApbxw0S+8SUCrqMQIKOtkNg00hz7PfEQFoqZr
 Ifx4nIl3xzKhXQ2Tf39rm9GWoo/3xaO2VP3oxIQwTx0Qg/80w5zqWT26EfEBZzAaAPx+
 N5HWrX69e7JufHjYz1cUa9lqL6Pi0pwjqyJSAF+FvtZirU6xy1CbpbjbMAxASW6490Mx
 FR0Q==
X-Gm-Message-State: AOAM531SSC5seY8ZwiWKnI82VyRPS+w0ZuT6thRwcuO97vdDTrzBSdWe
 ZMBnN9pL6+dyMxHZzHk8HsvGoiO5jGDH+hWqPjJVsxvqRI5TxMCZm9q9v7Yi44EYDNi/TRYYEVg
 OyPSCejFQ3pAymtk=
X-Received: by 2002:a5d:47a3:: with SMTP id 3mr13186375wrb.336.1635504131557; 
 Fri, 29 Oct 2021 03:42:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9aVrqa9DzYvaotlkSph7XCw9b5CAXh1Ad6zo7qRjbCxC96LfKJs/KAEvuXzGZsTT1w/HTig==
X-Received: by 2002:a5d:47a3:: with SMTP id 3mr13186342wrb.336.1635504131391; 
 Fri, 29 Oct 2021 03:42:11 -0700 (PDT)
Received: from localhost ([178.139.224.158])
 by smtp.gmail.com with ESMTPSA id q14sm5479759wrv.55.2021.10.29.03.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 03:42:11 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 5/9] qapi: Generalize struct member policy checking
In-Reply-To: <20211028102520.747396-6-armbru@redhat.com> (Markus Armbruster's
 message of "Thu, 28 Oct 2021 12:25:16 +0200")
References: <20211028102520.747396-1-armbru@redhat.com>
 <20211028102520.747396-6-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 29 Oct 2021 12:42:09 +0200
Message-ID: <87tuh0t8n2.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, kchamart@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, philmd@redhat.com,
 mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> wrote:
> The generated visitor functions call visit_deprecated_accept() and
> visit_deprecated() when visiting a struct member with special feature
> flag 'deprecated'.  This makes the feature flag visible to the actual
> visitors.  I want to make feature flag 'unstable' visible there as
> well, so I can add policy for it.
>
> To let me make it visible, replace these functions by
> visit_policy_reject() and visit_policy_skip(), which take the member's
> special features as an argument.  Note that the new functions have the
> opposite sense, i.e. the return value flips.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Reversing accept/reject make things "interesting" for a review point of view.


> + * @special_features is the member's special features encoded as a
> + * bitset of QapiSpecialFeature.

Just to nitty pick, if you rename the variable to features, does the
sentece is clearer?

Later, Juan.


