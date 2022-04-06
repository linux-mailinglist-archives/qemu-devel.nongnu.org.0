Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7764F5D0F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 14:19:44 +0200 (CEST)
Received: from localhost ([::1]:42750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc4dS-0004lS-Vw
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 08:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nc4ca-0003zW-RP
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 08:18:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nc4cY-0002MB-5W
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 08:18:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649247524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JL+SYbue1/AKvypd8xzzyl0EL+X13Ku4REAq0dryNEM=;
 b=EW0ZcSod5aRI7G49iJFiL1pqrIq7zVCtyU5CiMjJRjlrgSLNshdBg/Os/z/R0Zm/gQC8Aq
 WYOcz5pzEpyZe1+njMUC/jTd4dcxHhfkOSFoEtravNtHbOR0tnF/ydqBERV9ihdFA+9nYc
 /ni2VqfFVLrJxC0XccgQuZ6S7qF3MqQ=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-dzSu9j3PM9ikaO2xLSU2mg-1; Wed, 06 Apr 2022 08:18:43 -0400
X-MC-Unique: dzSu9j3PM9ikaO2xLSU2mg-1
Received: by mail-il1-f200.google.com with SMTP id
 i14-20020a056e020ece00b002ca198245e6so1613902ilk.4
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 05:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JL+SYbue1/AKvypd8xzzyl0EL+X13Ku4REAq0dryNEM=;
 b=ppKDXa1pxw23SKI5TpRZ8argKNwiEXvs2Z/ZiwdcyYKOGrNc5VSbaRh1w7LKNL3n7k
 7b2xRDuZ3UE+5+fUQ7/1jl5U4YxgHASKJynuKkhUiRIoj94+W3NVxDGfqFqfZKbqtoOc
 GWkTaSdrSpIo6wG3pXIX2uGHtQJH3gQxHNB7s3Z5WT9c+XIhSz54O8SxDmO+2chCeeGm
 iswtlos2rxzjZ6+2ifiio21sNjbFDtF7fsjGTTDlmeYmXq7sutwvSWECms0TnyY/uzXS
 dU9Bb3ljmG4u7Sy+sH8BIFUEx3R/aySd+b1lbnzR96dCTCGj+WsrHkTtwXHraYrcddU4
 z9Vw==
X-Gm-Message-State: AOAM530tOLdL8S6vOPrLJ64ilUgIFo1XwyyonIu1LmqnjG6bqfhEm3Y8
 wpfytEimhFdN7Dyqc3cm8x+sNR/9F3X3Rp6ghtQbOG2qkZ+FaTx9uxzKpL+lLmk6DVdRBSPxFyQ
 fW/Wa2BY/h/bumqo=
X-Received: by 2002:a05:6602:185a:b0:645:d914:35e9 with SMTP id
 d26-20020a056602185a00b00645d91435e9mr3845045ioi.154.1649247522545; 
 Wed, 06 Apr 2022 05:18:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYGwA6CDEACWJp62n/OqJnfoLVGOEG4UrweVqycKyX7aXCHXWy39rvKo70mKRmCY4gfvC97Q==
X-Received: by 2002:a05:6602:185a:b0:645:d914:35e9 with SMTP id
 d26-20020a056602185a00b00645d91435e9mr3845037ioi.154.1649247522295; 
 Wed, 06 Apr 2022 05:18:42 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a92b74f000000b002c9cc44ede9sm9159407ilm.86.2022.04.06.05.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 05:18:42 -0700 (PDT)
Date: Wed, 6 Apr 2022 08:18:41 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH] migration: Fix operator type
Message-ID: <Yk2FIdSMF4LRoT8C@xz-m1.local>
References: <20220406102515.96320-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220406102515.96320-1-dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: leobras@redhat.com, qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 06, 2022 at 11:25:15AM +0100, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Clang spotted an & that should have been an &&; fix it.
> 
> Reported by: David Binderman / https://gitlab.com/dcb
> Fixes: 65dacaa04fa ("migration: introduce save_normal_page()")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/963
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


