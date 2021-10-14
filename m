Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994A742E4DF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 01:47:40 +0200 (CEST)
Received: from localhost ([::1]:45924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbARn-000456-NU
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 19:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mbAOA-0007cu-Ro
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 19:43:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mbAO6-0005Hq-Vb
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 19:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634255027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Q/40x6ZR7hGuiaSlenMlLKJXVAOEXoiRGWgxLO+vJ8=;
 b=U5GRUe1GsyZrUVdjf7EcWXtj8vGIFavCe72t4kUA0n4Fie+aV5c7TBN6Q9ZVArv8FOlEF5
 +9K3izbHK0C6HE5qoRPTgkVsolps0M5agMRejjM949TBuFoINPp7nk1V0GxvJ+es3rbOUh
 7fWuQlhVkfjmVJj5bSBn19jiBa+8y4E=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-iuAxjygdPNe73q1mHMRkhQ-1; Thu, 14 Oct 2021 19:43:44 -0400
X-MC-Unique: iuAxjygdPNe73q1mHMRkhQ-1
Received: by mail-pl1-f198.google.com with SMTP id
 o6-20020a170902bcc600b00138a9a5bc42so3019390pls.17
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 16:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0Q/40x6ZR7hGuiaSlenMlLKJXVAOEXoiRGWgxLO+vJ8=;
 b=QgecUlSj2iQarCs6vqtlMRMDhYJ6PxkKX0dvXKph3ArnRewws3vXVFkd4nTG/U6Wjt
 xv2XoDn7Q+irSad/FSISALz+0CJNECfpy/ss/3ODSurMkIqsIKMUUFFZQlGk01+YcSVN
 gA4RSNQkdP8PYDKW/Q9jj56PzReSTQV0O0qlkXCK08UvCi/HK09S3XyVsGxDLaMPtDth
 Z1KsJWxBeBPuuEuL0t85Ggz47CMTRr+QjzhkI/KMmYPhzS2gDHysnQ6PCXkNnnnF1aWt
 D5uLqF0/Mpb0XMffpMCkQBRuFZHV6ciNUNDRhSBbPXdvD0ys3ir34BzgdQP8+LcMYO5L
 DuEQ==
X-Gm-Message-State: AOAM530cnPsWTgXxbocGj7vhW9N+DW3vqHVj0sDniAUgt7Esz2u0pJcf
 reexuCWlS+ge0Q/NYLdJhbZFIqypiaqMGJRuThcplxBA1z8NezIx1Cf1dBflFVwFlfRWRZEhFE9
 rLSqbHdYm+K+epk8=
X-Received: by 2002:a17:90a:ad46:: with SMTP id
 w6mr23508522pjv.68.1634255022897; 
 Thu, 14 Oct 2021 16:43:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDr9vi/8ap3IadDrRKD0BnwMd1kvHdz/6uuPLAgTN4RM+3sAL/8uf/caGu73EfRaropvFWJw==
X-Received: by 2002:a17:90a:ad46:: with SMTP id
 w6mr23508494pjv.68.1634255022623; 
 Thu, 14 Oct 2021 16:43:42 -0700 (PDT)
Received: from t490s ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id lp9sm3827955pjb.35.2021.10.14.16.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 16:43:41 -0700 (PDT)
Date: Fri, 15 Oct 2021 07:43:37 +0800
From: Peter Xu <peterx@redhat.com>
To: Lin Ma <lma@suse.com>
Subject: Re: [PATCH 0/3] Postcopy migration: Add userfaultfd- user-mode-only
 capability
Message-ID: <YWjAqX13PYhBgbVh@t490s>
References: <20211014091551.15201-1-lma@suse.com>
MIME-Version: 1.0
In-Reply-To: <20211014091551.15201-1-lma@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 14, 2021 at 05:15:48PM +0800, Lin Ma wrote:
> Since kernel v5.11, Unprivileged user (without SYS_CAP_PTRACE capability)
> must pass UFFD_USER_MODE_ONLY to userfaultd in case unprivileged_userfaultfd
> sysctl knob is 0.
> Please refer to https://lwn.net/Articles/819834/ and the kernel commits:
> 37cd0575 userfaultfd: add UFFD_USER_MODE_ONLY
> d0d4730a userfaultfd: add user-mode only option to unprivileged_userfaultfd sysctl knob
> 
> This patch set adds a migration capability to pass UFFD_USER_MODE_ONLY
> for postcopy migration.

Then it's at least no KVM, no vhost, am I right?  Could I ask is there a real
user behind this?  Thanks,

-- 
Peter Xu


