Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280275B2142
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 16:52:17 +0200 (CEST)
Received: from localhost ([::1]:54252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWIt5-0007nz-QE
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 10:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oWIox-0004C7-Nz
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 10:47:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oWIot-0000vb-VA
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 10:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662648472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6QrRLh/6ODCOckIEriX4j0Cppmbj39Lcso2mbLqFM8s=;
 b=PJ8qksHmIwM3Wlv/aeFn0w9wpWvz18RA++eMasChuzExt21RvD4k7t4pTBfNpAxYoytGGe
 mYw/nhIVy4z8MJiUgP1aWMadgRu7etJavF4xT0OfsYr+fxIb9SJEgqF76HXLweUzi0D55p
 kqkfZ29yM5LczmNRWui5CCgoSFR+GFM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-399-UJazX-UyO6ic_IG6hFCMbA-1; Thu, 08 Sep 2022 10:47:50 -0400
X-MC-Unique: UJazX-UyO6ic_IG6hFCMbA-1
Received: by mail-qk1-f198.google.com with SMTP id
 bk21-20020a05620a1a1500b006be9f844c59so14745526qkb.9
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 07:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=6QrRLh/6ODCOckIEriX4j0Cppmbj39Lcso2mbLqFM8s=;
 b=34y52mrC0qpZDgl1lxOHo5/YK9w7G8zY3ifeaBkHIvcmjRxfWZw8siBAHGq75vyhl5
 5VS9spXvOVOHFr3mTDLVgSUkRRAXtObfkYmG9lIG8mMrLaBWHodHArtY4kfmpYcWrGJA
 gfuBj/P4MZ9oC+Km/8BPJWXEbkIJ9tyibbAlJ+YOFiGGPdbaVbUFkreuKmW9lWkrN2Aa
 aG9TfEiXZcQXQvTCw5mkNHuzdD9XFMj91HCF4i5YfwflhCgaAhQh4+Bh/Isqc68BWDQc
 0cOObsNRZePRP/NdhjimO2tm1rblIsg1l93dvs01YAKGhjbftpONfOCVINwjx3FoAnAz
 hg+A==
X-Gm-Message-State: ACgBeo0zWDP6LVpFP4Uc6AwSajLPiLIVKlxJJApfC0lRb8OuTE6rtwXR
 wITMRLDDFc8OWrsN3T1C8ncGfXEDR0ajkmP2UIsQJOPBc58ys3T4fQPoDPgFcOZPEsnMMc5vifS
 Gx6eWF4QiMMLJlmU=
X-Received: by 2002:ad4:596a:0:b0:499:105:1d8f with SMTP id
 eq10-20020ad4596a000000b0049901051d8fmr7876561qvb.71.1662648469836; 
 Thu, 08 Sep 2022 07:47:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6F3fgLe9tHFmY+0PAEaLgSUZlann1TwNrY85u5loE+3jvUAVph3ktsdm97PCnkxYcpA1KYiw==
X-Received: by 2002:ad4:596a:0:b0:499:105:1d8f with SMTP id
 eq10-20020ad4596a000000b0049901051d8fmr7876543qvb.71.1662648469682; 
 Thu, 08 Sep 2022 07:47:49 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 bp33-20020a05620a45a100b006b8e049cf08sm16522681qkb.2.2022.09.08.07.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 07:47:49 -0700 (PDT)
Date: Thu, 8 Sep 2022 10:47:47 -0400
From: Peter Xu <peterx@redhat.com>
To: Hyman <huangy81@chinatelecom.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v1 4/8] migration: Implement dirty-limit convergence algo
Message-ID: <YxoAkwLnnTtltEI/@xz-m1.local>
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
 <4b42dedc0d1ed336ef39c604f3aa1611745a3917.1662052189.git.huangy81@chinatelecom.cn>
 <Yxevn7rSCKaPHQfd@xz-m1.local>
 <7022f34e-76d5-7287-74eb-846ae62e0f42@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7022f34e-76d5-7287-74eb-846ae62e0f42@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yong,

Your recent two posts all got wrongly cut-off by your mail server for some
reason..

-- 
Peter Xu


