Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 170DB2811F9
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 14:05:42 +0200 (CEST)
Received: from localhost ([::1]:44694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOJoj-0001oN-3q
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 08:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kOJn9-0001KU-1o
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 08:04:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kOJn6-0002Xj-RL
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 08:04:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601640238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Unjx43IKRlb+dr9cGg316D5EyujY/fVpEK3OHk6hdjU=;
 b=Xlp5bqEcfjvcHEnC+PhFfDeB5DdnMkYQMWVJKwI3KJqKJIlMgKBsmnU1Q0282RG2GVZ8ox
 BCFv92NgmNmNkluXevuu7rsuV2eK7RKswc4h1LIV1DCseLXW710NtMjAaZ0rakBAaAWFLS
 2Cboghl2mdYWnKsnFUKzNlQdn6R8jKs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-xdmjMzNdObyYeYhSjYyvfA-1; Fri, 02 Oct 2020 08:03:56 -0400
X-MC-Unique: xdmjMzNdObyYeYhSjYyvfA-1
Received: by mail-wm1-f70.google.com with SMTP id c204so342640wmd.5
 for <qemu-devel@nongnu.org>; Fri, 02 Oct 2020 05:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Unjx43IKRlb+dr9cGg316D5EyujY/fVpEK3OHk6hdjU=;
 b=cWoiAseZ/M1FcIYtIfHxDW1gVo/oVsA9QidpqzZOX72rHqM561vKq0SbEMwusIxgY8
 Kw9B+WXBZ6L90uKnwpGGT90dzzhis6bNLXeSmoJTBMsK0zdzt0frKo2bdfaZjFlObPJJ
 S0LS+Ra0DGTMBpyqzIckbBt8WMJe0Y2ojN20a8BygEiAY4u47c3dSSGVtGOGmsc9FJBc
 fQ08Vd7p0zJqgp7LKhjRcPjtQFtxqHbTexq1USQBBMFssccuATnBuaaJQ0LuJu87qyCm
 pUio3TlLjwVD1dMJvUh9AMx1l4XzcrYGQriczdtlPmh5DHEEFrJh4hpNDeJzLNWKN/G/
 HU3w==
X-Gm-Message-State: AOAM531LxFwsPLVOJoSXNsiWMuY2OwnhqJya55VHGqlJdfvymmMrX+my
 hkf1LCnkYMKwbt4l8rqGQIH5WP+dlVHe3ShVi+l3N7tsEIyG4/z9YzkxvN+FqyN28mdeUHNd49P
 UkfOx5QQ30TaGoQs=
X-Received: by 2002:adf:ea44:: with SMTP id j4mr2673657wrn.368.1601640235155; 
 Fri, 02 Oct 2020 05:03:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd9xcTpF2BVkWreYjeHPR1o5tACYVeJsSW0AY4OmjNrJzAOv1MYMStfOux+CnBur/JzDb1cg==
X-Received: by 2002:adf:ea44:: with SMTP id j4mr2673627wrn.368.1601640234906; 
 Fri, 02 Oct 2020 05:03:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:11eb:3314:c22:e3c7?
 ([2001:b07:6468:f312:11eb:3314:c22:e3c7])
 by smtp.gmail.com with ESMTPSA id l3sm1640479wmh.27.2020.10.02.05.03.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 05:03:54 -0700 (PDT)
Subject: Re: [PATCH] meson.build: Don't look for libudev for static builds
To: luoyonggang@gmail.com, Peter Maydell <peter.maydell@linaro.org>
References: <20201002105239.2444-1-peter.maydell@linaro.org>
 <CAE2XoE-v0w6Ck5BFfzGYtUZz2UUdUv=ycyveDsqjdjFFi59yAg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dc8f5244-103b-a7c9-c9b2-5bd0abd0985f@redhat.com>
Date: Fri, 2 Oct 2020 14:03:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE-v0w6Ck5BFfzGYtUZz2UUdUv=ycyveDsqjdjFFi59yAg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 23:37:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/20 13:15, 罗勇刚(Yonggang Luo) wrote:
> So the better way is pkg-config handling sttaic properly？

The problem is that you cannot handle it properly.  Consider for example
libmultipath, which requires the program to define a couple functions
for static linking to work.  A compile-time check that the library works
would fail, and therefore Meson (and configure) are just punting and
declaring it a user configuration issue.  Meson will warn about it, but
it will proceed anyway.

Paolo


