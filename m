Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574046BA102
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 21:53:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcBcr-0006Pw-Uj; Tue, 14 Mar 2023 16:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pcBcm-0006PR-H8
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 16:52:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pcBck-0001kS-89
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 16:52:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678827112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JYgycS6/+FGybxIXL0+DD8Evzg+Wjx86hnT0VIee8mM=;
 b=LHvI960OL0BTwFgNtalDKBI1jKN+QvNRPBWFON+aR6d4GHq3x00q5c1EbxovzQE1MqLMX3
 4YUMskqXk2XtIpgsDDDBFZOICc25nhBS81u3nOsHweTcJXM8MSvJZl84V76juYk59DLPAt
 n7pJEMkk3EaiqWqJg3VgKsYzY41u/II=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-ntPXj0e2OCG_nVJZDLawug-1; Tue, 14 Mar 2023 16:51:42 -0400
X-MC-Unique: ntPXj0e2OCG_nVJZDLawug-1
Received: by mail-qk1-f197.google.com with SMTP id
 b28-20020a05620a127c00b00745f4772ca0so319753qkl.7
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 13:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678827101; x=1681419101;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JYgycS6/+FGybxIXL0+DD8Evzg+Wjx86hnT0VIee8mM=;
 b=fzz9ve1gwWfWIsu+1sUIRr+J57abzxCLMxUIY/CXaKW9ofXp3H+XtpoUwcfr6b8pJt
 MaMGrVZk9BpCoA3l1nBZ8zaVuc/ao5PdSb48tuZioQIanKQJWJ/YpH6nIn7PIfJ9KY8e
 IU6c+dDHxGT2QzM8iX3AHJHmhQWa8t/uoCUbGVhxOul9JTh/XasHwAmocPbWGGZjkMZR
 CaNIw+ejYeskgm0ciHaKpJUg2XJAcvtVAw04opRIyyXnsUdXoI9Yqj1eiQsLQhft4y0+
 KgFePK6y5Vh+3iyrEdE/R68niH0eUExafI8KFbEFHelYf6GPL0CwKdBIZVBIajsD6LZz
 pHmg==
X-Gm-Message-State: AO0yUKWDVYlEpcnkPRkvmZM8bCsfXmYJnkD6YPQX/8TZ5fNSRaVpUsQ3
 CHEEHWZugjT7dSJj698jUehW2TcQhkMBSkpQtbkT9z4X09kJjZrFOsS9jiz2uTkoJ0iuo+iyio6
 jsBl/rpuFHJBIPoY=
X-Received: by 2002:ac8:5906:0:b0:3bf:daa8:cacc with SMTP id
 6-20020ac85906000000b003bfdaa8caccmr29923473qty.3.1678827101673; 
 Tue, 14 Mar 2023 13:51:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set8ojUFCI3J5bGqbCv0MG2mL4RC5/oNKj1+hhbQ3RNTyNbg8OWPlWMHh7Yx1rtlcKNN7f18PKw==
X-Received: by 2002:ac8:5906:0:b0:3bf:daa8:cacc with SMTP id
 6-20020ac85906000000b003bfdaa8caccmr29923447qty.3.1678827101419; 
 Tue, 14 Mar 2023 13:51:41 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 17-20020ac84e91000000b003bfeb30c24dsm2595777qtp.39.2023.03.14.13.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 13:51:40 -0700 (PDT)
Date: Tue, 14 Mar 2023 16:51:39 -0400
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
Message-ID: <ZBDeW3zxuXRNBIid@x1n>
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <CAFEAcA_Pf11W3FuaLHvzQ7yrkh6KC556HDfvXpZYaHqN4iMvsg@mail.gmail.com>
 <CAFEAcA92kLBwgJoAc9HCr4oX=S0V=RmdO4+rOnKPJn32hQAf4Q@mail.gmail.com>
 <CAFEAcA-UaJsoA-rqmwEqh1j6xcCc=ifCctvN-jaW40VckRdp9Q@mail.gmail.com>
 <CAFEAcA-q1UwPePdHTzXNSX4i6Urh3j6h51kymy6=7SzDAFU87w@mail.gmail.com>
 <ZBBIaX+cZD5Ud2wQ@work-vm> <ZBCk6rMT5wmxwIuZ@x1n>
 <CAFEAcA8C9SjtvejcyJwEp+PkWLU+jZG+1fE53OYc2NmVFaSDpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA8C9SjtvejcyJwEp+PkWLU+jZG+1fE53OYc2NmVFaSDpA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Tue, Mar 14, 2023 at 07:31:38PM +0000, Peter Maydell wrote:
> On Tue, 14 Mar 2023 at 16:46, Peter Xu <peterx@redhat.com> wrote:
> > I've attached that simple fix.  Peter, is it easy to verify it?  I'm not
> > sure the reproducability, fine by me too if it's easier to just disable
> > preempt tests for 8.0 release.
> 
> If you all are happy that the fix is correct, I think the easiest thing
> is just to get it into master (via the usual migration tree, or I can
> apply it directly if you like), and we'll see if it helps.

I'll leave that to you maintainers to decide.  In all case, let me post a
formal patch then.  Thanks.

-- 
Peter Xu


