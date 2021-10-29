Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E4F43FBD6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 13:53:57 +0200 (CEST)
Received: from localhost ([::1]:35158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgQSK-0004pq-8k
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 07:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mgQNg-0002CP-1L
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 07:49:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mgQNZ-00021I-Oh
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 07:49:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635508140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JO0b2Gmc3Rx9/uRSa7SG7RZnDpGZ1XE9EExjlpzAFvo=;
 b=BzG9uAhS9SBmYSSnqwnLSkZMjxJmCQexRSg19rS708E8ALo7V/fED8fJI8sVSGRgsN9YzH
 3T5kC+KxM2Z61wOP1RqbQIQqIw+CSaULE+ZraMKXF8asI2UqVE82QNmjzTgliQQ6TXyJA6
 tx1XhDGsMnjHwdfYIdbnBAPTa9enKWs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-BUCdo48TPWGTXFae5RBakw-1; Fri, 29 Oct 2021 07:48:59 -0400
X-MC-Unique: BUCdo48TPWGTXFae5RBakw-1
Received: by mail-ed1-f71.google.com with SMTP id
 c25-20020a056402143900b003dc19782ea8so9026815edx.3
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 04:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JO0b2Gmc3Rx9/uRSa7SG7RZnDpGZ1XE9EExjlpzAFvo=;
 b=dadv7+Da7mgUuCJ9kyAEppU0GBTYIkhaaBOxPdvVdD34Z5Sk4TOgJIPgsKoqSqBr7Q
 mTPtSNCEahvLT/zL/R70uWouJI2wduis7d7vcLIi/SG2APyNTeXMNiPZY2W62h1wmebb
 rKNq7Y32L66o2ezzamvsoRiftnHItlt3QP1fzitJ7Z2561tjInhE+dr/75ZnmlGbqGNm
 pmY9joabit1aeteau4J4Yv9T5LFHvTalV6mW8ADVC4rIaQEScTfVFKtLet6dZVejzSt8
 QdjXhsngL5A/oHbV4ecmjwhiJKDI0G1fkoOpeIzeoq1I9md+Ldd0D2frlWvitO65On1m
 WvGg==
X-Gm-Message-State: AOAM532RuZanrguYP8W4X4Kz2kMUtfcA7WnmawKpYXp7KXCWiJrlAKiQ
 mBSLzNbLrGaD08kCsQ5nJfe/0fBjTx8/QCa7h2jKvQCbwdYI8cBQlz/eovbYFxoztoCWTBFxYha
 xr//Uow6bX7Oc5rY=
X-Received: by 2002:aa7:cac2:: with SMTP id l2mr14635216edt.168.1635508138557; 
 Fri, 29 Oct 2021 04:48:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR7R7/F+ooZsouFtmYM6ebjLcZfydRV0mxOvP+9kPnqN6VvvpAQasxene509jPp5Hk5jC4Ag==
X-Received: by 2002:aa7:cac2:: with SMTP id l2mr14635188edt.168.1635508138343; 
 Fri, 29 Oct 2021 04:48:58 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id m10sm3441104edi.72.2021.10.29.04.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 04:48:57 -0700 (PDT)
Date: Fri, 29 Oct 2021 13:48:56 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qtest: fix 'expression is always false' build failure
 in qtest_has_accel()
Message-ID: <20211029134856.6e198416@redhat.com>
In-Reply-To: <4a5fcb6e-2c8a-397b-2e60-95b3c45b05d0@redhat.com>
References: <20211027074542.2607865-1-imammedo@redhat.com>
 <4a5fcb6e-2c8a-397b-2e60-95b3c45b05d0@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Oct 2021 17:59:44 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 27/10/21 09:45, Igor Mammedov wrote:
> > If KVM is disabled or not present, qtest library build
> > may fail with:
> >     libqtest.c: In function 'qtest_has_accel':
> >        comparison of unsigned expression < 0 is always false
> >        [-Werror=type-limits]
> >           for (i = 0; i < ARRAY_SIZE(targets); i++) {
> > 
> > due to empty 'targets' array.
> > Fix it by compiling KVM related part only if
> > CONFIG_KVM_TARGETS is set.  
> 
> Another possibility is to add a trailing NULL to the array and change 
> the loop to "for (i = 0; targets[i]; i++)".

Thanks,
I've sent v2 with Michael suggested approach,
it seems to me a bit more cleaner.
 
> 
> Paolo
> 


