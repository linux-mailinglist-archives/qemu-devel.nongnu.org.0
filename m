Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B5B4D579B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 02:51:12 +0100 (CET)
Received: from localhost ([::1]:57650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSUQv-0005CX-Te
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 20:51:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUOH-0003m3-Al
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:48:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUOD-0003iT-O8
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646963295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oBkGUbPCma3UoroWwyRBmZXGOjT8wUSfyVysICmPlZw=;
 b=Lcj6JtoPDPtL0UAcIG/EJiCW9L0u/WzoO1Df/dEntCwUe9Kd5wJDAEOTBaMMyU/4JDEa70
 qv11W6fxQqQofUpbKI5f2+rFHHguHbWcO4UKnxnSUL2tLd18LNQAey0UruvBJffhluw6fr
 mPMko0ROeMbi3KMk5kaDWkUOlSKDY10=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-2OPPLB8IONqLDODejw1rNA-1; Thu, 10 Mar 2022 20:48:14 -0500
X-MC-Unique: 2OPPLB8IONqLDODejw1rNA-1
Received: by mail-pg1-f199.google.com with SMTP id
 bj8-20020a056a02018800b0035ec8c16f0bso3901738pgb.11
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oBkGUbPCma3UoroWwyRBmZXGOjT8wUSfyVysICmPlZw=;
 b=FoAtB1ugvRhvx+S2KRlF2zjHMFnCVrcSFakj1zcmjCIbq07AhOV7JHv+oyrTOA2RCG
 Ni2/7yk5Mu0TUWue4za8cgGTXeaCtsZJYoxTYzF5ckxvDKbIHVTIw2mX9LdTNAtMwMKb
 voXD3tZJfniIKNgihOZDfy7rfDqm4vIL7QKHVHdLb4qzuF5i+I4nBGbJ26bSbYL+k/pU
 n1iUBcMXLQRVkOHkXyH7DjLdMHPHdlO1Rqvgo2AzqOzKkHMWqO/ZEjKT75Lo1hZEkrrJ
 2YGoGFCOsDef5lstjympy2OCYFENfVRmfZHab2x4Zi8aJnM5eXElLJFbJZu4XLUouOUj
 Gpmg==
X-Gm-Message-State: AOAM531SBVaQbgB3eApldk04EZ1XFg9uMKCnq0LwoRL6GNq9lInht6FY
 8wyRHIG4pKuroHBPbKjd3lekLybe2Z3M0QBSQxT7Yo7F+4uvvMES61YMYERhUNss1BSksfJsxyu
 4qEFhhViN0VehHTQ=
X-Received: by 2002:a17:903:11cc:b0:151:71e4:dadc with SMTP id
 q12-20020a17090311cc00b0015171e4dadcmr7927734plh.78.1646963293314; 
 Thu, 10 Mar 2022 17:48:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZRzxqdLzvrf3AS9cVKFafP7iq+0iL4iuu2DRT3m6ImPqGzdvlFS9NPzN8ypACOKhoAh9PYQ==
X-Received: by 2002:a17:903:11cc:b0:151:71e4:dadc with SMTP id
 q12-20020a17090311cc00b0015171e4dadcmr7927717plh.78.1646963293031; 
 Thu, 10 Mar 2022 17:48:13 -0800 (PST)
Received: from xz-m1.local ([191.101.132.227])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a056a001ad400b004f6e8f8f90bsm8256824pfv.109.2022.03.10.17.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 17:48:12 -0800 (PST)
Date: Fri, 11 Mar 2022 09:48:07 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 07/18] tests: switch MigrateStart struct to be stack
 allocated
Message-ID: <YiqqV2GElhofm9zz@xz-m1.local>
References: <20220310171821.3724080-1-berrange@redhat.com>
 <20220310171821.3724080-8-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220310171821.3724080-8-berrange@redhat.com>
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

On Thu, Mar 10, 2022 at 05:18:10PM +0000, Daniel P. Berrangé wrote:
> There's no compelling reason why the MigrateStart struct needs to be
> heap allocated. Using stack allocation and static initializers is
> simpler.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


