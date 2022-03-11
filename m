Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663954D57A6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 02:53:50 +0100 (CET)
Received: from localhost ([::1]:35464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSUTV-0000r5-GA
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 20:53:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUQn-0006Y6-Vm
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:51:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUQm-0004Np-Hm
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:51:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646963460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O76iypipIIa3kyHAgLCJLKsFvDrF8T+mg6HK1a1U1NA=;
 b=Vw4RRw4pPHSVJArulnqy7uBKRjlrHqmbnyYTDeHGOdyh3Cfi3GpVfr8qM9d9slxWNLkoQz
 e7EBr6Aa3p0diyNETa8F2U+z+QofjSFT2yyGFNjBlX+ebACqnHkv6Abb7Dqjk5OFuwkzBU
 taR+Dp7JV+jNyULaJHSKB5GTB6hXppI=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-TsAYLR5TOgW8Z1OWSxMlLA-1; Thu, 10 Mar 2022 20:50:58 -0500
X-MC-Unique: TsAYLR5TOgW8Z1OWSxMlLA-1
Received: by mail-pf1-f198.google.com with SMTP id
 f18-20020a623812000000b004f6a259bbf4so4313228pfa.7
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:50:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=O76iypipIIa3kyHAgLCJLKsFvDrF8T+mg6HK1a1U1NA=;
 b=tUCjy1Shxah2oUXgs5WO94Z/uB4zFGOYF+Dd7XiKWoUkcTvKtYmJg15QDHsZyo/4SF
 JuZFMr6pYjWzd7kuueKEJenTrVzju8ZuTVt37mgyZQARD2QW2TvXAzxBj7OcphbkL5YU
 ux+N+doi3iZvAHUWfL3MlPx5ZzQ6VQYjiyfSHzKb8xJJaAH8bMBKTX4inOpgcN1hatsC
 80OQg+qg6buZxbCjIEk+3ep/jTakkDnKK1oVeIkALUaPYpa1LW81sV96YZP980PIBz00
 nIo8CdQI3IGRmOh4vhSIpk3PVJE0D+q+Xw0wXZHcipFAD3A+yzbIsjSMxhLZW+bepjGP
 Fwtg==
X-Gm-Message-State: AOAM530dzGeZ8DRso1pwCZuDllqFI1t0hb3XuN1p1LDgAAThAVU4JkGW
 QV38RDW8MFIG2+x0Uf/tHNJkoSq/1t46behWPZaAO/4kkE5NPh1uWY7Lc8Obcfea+UfJ1y7cn7k
 adBk1Dc8ZxxVytNY=
X-Received: by 2002:a17:90b:1812:b0:1bf:2395:8d53 with SMTP id
 lw18-20020a17090b181200b001bf23958d53mr8114988pjb.178.1646963457816; 
 Thu, 10 Mar 2022 17:50:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXHjvhKtBwDgSWrFEo3qOc9IXecvuVCP1XbOXMG+fLZOQhcKmvyIvcaV+28xuOrjkSqy371Q==
X-Received: by 2002:a17:90b:1812:b0:1bf:2395:8d53 with SMTP id
 lw18-20020a17090b181200b001bf23958d53mr8114975pjb.178.1646963457566; 
 Thu, 10 Mar 2022 17:50:57 -0800 (PST)
Received: from xz-m1.local ([191.101.132.227])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a056a00080700b004f6ff260c9dsm8794209pfk.154.2022.03.10.17.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 17:50:57 -0800 (PST)
Date: Fri, 11 Mar 2022 09:50:51 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 15/18] tests: convert multifd migration tests to use
 common helper
Message-ID: <Yiqq+xXIUBaQ55U5@xz-m1.local>
References: <20220310171821.3724080-1-berrange@redhat.com>
 <20220310171821.3724080-16-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220310171821.3724080-16-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 10, 2022 at 05:18:18PM +0000, Daniel P. Berrangé wrote:
> Most of the multifd migration test logic is common with the rest of the
> precopy tests, so it can use the helper without difficulty. The only
> exception of the multifd cancellation test which tries to run multiple
> migrations in a row.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


