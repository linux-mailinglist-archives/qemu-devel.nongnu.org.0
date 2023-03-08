Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFC36B0C04
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 16:00:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZvFz-00063q-3s; Wed, 08 Mar 2023 09:59:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pZvFt-00063R-Ro
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 09:59:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pZvFs-0000KJ-1T
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 09:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678287538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uvMo1/qcuRR4ePsbRyGVZn/wQv8q0jLXoezCyvtT9+E=;
 b=S19fCMkCasV0RuXhN1qdcdtsKfHS1wFuCBH7lXfsWHXUCDgsRvIyErYArKSw/Xia2SWwrk
 k14mO8tixGkiRHdRaJ5NF19Jfk5XUcqKdPU7Y2ma/4/0YqDS720Y4v9KM86IUzL+/f7VVb
 Hsm1IMzwz4//OVW7mbnXcJZfgReKvbU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-pm7u3yhGPXe_b05PZKka6g-1; Wed, 08 Mar 2023 09:58:57 -0500
X-MC-Unique: pm7u3yhGPXe_b05PZKka6g-1
Received: by mail-qk1-f198.google.com with SMTP id
 ea22-20020a05620a489600b00742cec04043so9563836qkb.7
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 06:58:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678287537;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uvMo1/qcuRR4ePsbRyGVZn/wQv8q0jLXoezCyvtT9+E=;
 b=rS862TT+e/MMYYtrGxAgP3y5A2n4ykvXepotnUx934sOArzDWZGxKqvXk1h+AqC+kl
 iOBJVtCxMdZx2G67KeqCM6giRJykm7wN3mitaKjLFXx2/TpAulhK5uPF1QQ8LoVE038J
 uzzt2KHtO+YUOHGE+clq4WLWLBJb+691L7ZXtDSsbQJKTtK5/FyzYeURAa4dhM1tdAVE
 CH4oiJ6WsNH4Zv9+kSnY9t6g3qDQG/BOAsoWKZH2tFIGTZBzXvu7jAAHPucBgX66pLi8
 +/uwjAOalqzBVGvtXGE28KBnRfvbQJTty5U3k3h93tQ/pW1xqCV8vQMQ+1UNMZPHYIKl
 dRPw==
X-Gm-Message-State: AO0yUKWPppt6xRrL3K9XQ20YzTN8ved4kD1lUO8a21MpFndR8XtTubf/
 bEK5E3mgu/HetyLI39MJfx4k0B/w3ZicPv/JYry8jIkjR6z8lVyREcZpjo6XTCq/AmJbWRcH3Cu
 3IvFXE1IiDoZx67I=
X-Received: by 2002:a05:622a:1307:b0:3c0:3d68:5411 with SMTP id
 v7-20020a05622a130700b003c03d685411mr9576852qtk.4.1678287537054; 
 Wed, 08 Mar 2023 06:58:57 -0800 (PST)
X-Google-Smtp-Source: AK7set+CpLjdtKt9+qwc7G1A/vg1wqXyle0VSBFh24tgGUQtkGRqZbFAWBvFigL3DPSznkuTaLahKQ==
X-Received: by 2002:a05:622a:1307:b0:3c0:3d68:5411 with SMTP id
 v7-20020a05622a130700b003c03d685411mr9576829qtk.4.1678287536832; 
 Wed, 08 Mar 2023 06:58:56 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 p7-20020ac84087000000b003b62e8b77e7sm11724426qtl.68.2023.03.08.06.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 06:58:56 -0800 (PST)
Date: Wed, 8 Mar 2023 09:58:55 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [PATCH RESEND v6 0/5] migration: reduce time of loading
 non-iterable vmstate
Message-ID: <ZAiir3qXiYr/Stma@x1n>
References: <20230303105655.396446-1-xuchuangxclwt@bytedance.com>
 <ZAUSPo9bJO0udf9p@x1n>
 <1ea4db90-7535-1dc3-a2ae-d44113a24e29@bytedance.com>
 <ZAZRn9eNG1TEoEl1@x1n>
 <f6e36da0-d20b-af80-4239-5bb59b97f530@bytedance.com>
 <ZAdupAAJjbSbJiss@x1n>
 <CALophus_dTA6U3zGP6u0YnRr65GrhF665mBtX7SkBdLMVJKxBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALophus_dTA6U3zGP6u0YnRr65GrhF665mBtX7SkBdLMVJKxBw@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 08, 2023 at 06:03:45AM -0800, Chuang Xu wrote:
> IIUC, Do you mean that different ways to get flatview are tricky?

Yes, and properly define when to use which.

> As you said, it's slightly beyond what this series does. Maybe it would be
> better if we discuss it in a new series and keep this series at v6?
> what's your take?

Quotting your test result:

                        time of loading non-iterable vmstate
before                                  112 ms
long's patch applied                    103 ms
my patch applied                         44 ms
both applied                             39 ms
add as_to_flat_rcu                       19 ms

If introducing address_space_to_flatview_rcu() can further half the time,
maybe still worth it?

The thing is the extra _rcu() doesn't bring the major complexity, IMHO.  It
brings some on identifying which is really safe to not reference a latest
flatview (it seems to me only during a commit() hook..).

The major complexity still comes from the nested enforced commit() during
address_space_to_flatview() but that is already in the patchset.

Thanks,

-- 
Peter Xu


