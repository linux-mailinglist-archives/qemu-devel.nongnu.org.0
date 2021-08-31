Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2243FCF1E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 23:26:08 +0200 (CEST)
Received: from localhost ([::1]:37818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLBGg-0004fl-F0
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 17:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLBFG-0003qX-VL
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 17:24:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLBFE-0002r5-Iu
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 17:24:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630445075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hVC/RjZC9IefF0j6W4wLawHhBKu72iiZK0zmh+Yxv0w=;
 b=R5xl4hDo87htt7izOjkUJKN0sbA6lRjkjiJJ05/kwRudvSifYO9/vN853lsPTvUqUEdUiM
 dzKKzmUJbJ+gYD2rTRa70fp582DfG1JvNWcLrtyaxfhcnw4YHgAWiwRX5QC9USaKuWXiBf
 w785kAznGeCtEboBq7zCmqTCQd6hgf0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-ahxkgiWnOHy__N8coEIAhQ-1; Tue, 31 Aug 2021 17:24:34 -0400
X-MC-Unique: ahxkgiWnOHy__N8coEIAhQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 x11-20020ac86b4b000000b00299d7592d31so1149720qts.0
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 14:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hVC/RjZC9IefF0j6W4wLawHhBKu72iiZK0zmh+Yxv0w=;
 b=BUIzX2MeWnJ0CRFNk2XLwkgBR9olfMKaZEhB2zUinHaEQguIliCEin/biqLcc4+W8N
 X1X3cQ6XeEtK5999eSGAwKfhSUuY/JMeaO9B7ocwI6AzqIA5epM92u49HTx8c6LL7Cng
 9THSFy333KMZ+81th9TwWfl/y675xlgVdSXYAaIHxIaAfhUBvGK0fZtSgqC8nTLSB28V
 4X+vmyEz9H7EQ8i3PIZ+Qs9ByRBEikRFYktq3QgAaF0TQCUI11T6TPqSyZAOXAOoO6zi
 EZfwN0Jq6Tu1f1qojKw3Q+W1xItgkToCPPnZ2fX86BBCLgHX1EJhEIqevS4FhudVV55p
 nrsg==
X-Gm-Message-State: AOAM532kiEudNWV7YlZV+lIwZLDxJPb4PNBx/9ZeUJYPtwhtfT//wcbc
 3685rO9Z/UszwTfWqhgEFMgYhcIeCQ3aogpqpo8SFkMeSlYIAS94uWXOuq83XkKERC9n42Gfh25
 bhSHibDoawvBOjyw=
X-Received: by 2002:a05:620a:2549:: with SMTP id
 s9mr5159968qko.256.1630445073524; 
 Tue, 31 Aug 2021 14:24:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/Sz+/voOCW4+eWzFqzeqZ8lwbavG4ycHCAEfIfZJUejtRQjwwsYNSvtSunOC2en8gWfIfCQ==
X-Received: by 2002:a05:620a:2549:: with SMTP id
 s9mr5159950qko.256.1630445073278; 
 Tue, 31 Aug 2021 14:24:33 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id 10sm1580291qtu.66.2021.08.31.14.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 14:24:32 -0700 (PDT)
Date: Tue, 31 Aug 2021 17:24:30 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v1 0/3] QIOChannel flags + multifd zerocopy
Message-ID: <YS6eDrEmgq49i+1H@t490s>
References: <20210831110238.299458-1-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210831110238.299458-1-leobras@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 31, 2021 at 08:02:36AM -0300, Leonardo Bras wrote:
> Results:
> So far, the resource usage of __sys_sendmsg() reduced 15 times, and the
> overall migration took 13-18% less time, based in synthetic workload.

Leo,

Could you share some of the details of your tests?  E.g., what's the
configuration of your VM for testing?  What's the migration time before/after
the patchset applied?  What is the network you're using?

Thanks,

-- 
Peter Xu


