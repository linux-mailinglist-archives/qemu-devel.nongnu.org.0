Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B16380DAD
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:56:46 +0200 (CEST)
Received: from localhost ([::1]:41630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaBB-0007IL-QU
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lha64-00005C-VL
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:51:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lha61-0007h8-Ss
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621007483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fCsqNY7Kryr3zeQTlg1WAHpm82I+ztZqWhsOsfyye4Q=;
 b=ewnF0b0PZxz0D8c3WfnUz29aU0UJs40kwbeRF+BPoUlGesWaAShewDtBrr9VWXsYma0n9a
 J7nlBAWzIQNkvm9eKq0dA7SCR2zK4F3SNmZ5pqhSBGoiinYQWm9vbOKK0zrNL6YvLs+gif
 mwusFEpvW8mAjzdGNDrwk0er7AxxohU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-Ql_jOl8UOd-EkKM9mbexSA-1; Fri, 14 May 2021 11:51:22 -0400
X-MC-Unique: Ql_jOl8UOd-EkKM9mbexSA-1
Received: by mail-qv1-f69.google.com with SMTP id
 w6-20020a0cdf860000b02901ec995d8822so3226705qvl.23
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fCsqNY7Kryr3zeQTlg1WAHpm82I+ztZqWhsOsfyye4Q=;
 b=XB1knUv6xcvl0u40/AN8dbdbOb0k+NZ9JulwgjDDGv2iull0XlGOSbADyhZMUUHD9E
 weCcYMcB+anHqWtHwNPArRryabYdMrsjPcYzKPrAednuiIND4fxq5yd4sTloORsl6jbh
 F51I5mwrsapd/19usERuqFHQtgbwtE+dKRNkX3PVirwgADyziLO+hx5saXTAf+85BhY8
 1iHzLzOPC57OHylNwaGyjY5/c5jcrE9+gdBBGKf8OjIkKJLC8FnCy+1UXsUBa5L8l3Ha
 YPh1U4cprhnfv9xMyBldFnQcd8yYg/usIg3iK5XW7ijVYTpp5rKSnx0YXGyOvuMoSgg7
 oRYQ==
X-Gm-Message-State: AOAM532/bMg9g/wKSsn+RqPnQGQRri/sQLD9QLKOllX+wXSAdW2Bs9U7
 J2kIVySUpuWex5lQAbdxpyj300OhnqowCxBubeIzmEWizthFEiAQqiN3Y5G7tfm8SxtOnKpsq56
 7prIHNbXUkjqodJA=
X-Received: by 2002:a0c:e486:: with SMTP id n6mr46612138qvl.21.1621007481688; 
 Fri, 14 May 2021 08:51:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw48qQ26neETLE8pYLjgwzFAsxirlW9MyjOxCJvtexIvbzc1YsaZJGf1Q6jrcmZSijNDoWKEA==
X-Received: by 2002:a0c:e486:: with SMTP id n6mr46612119qvl.21.1621007481508; 
 Fri, 14 May 2021 08:51:21 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id w4sm4902377qki.57.2021.05.14.08.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:51:19 -0700 (PDT)
Date: Fri, 14 May 2021 11:51:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v7 00/10] KVM: Dirty ring support (QEMU part)
Message-ID: <YJ6cdzDqu7q5Y3iE@t490s>
References: <20210506160549.130416-1-peterx@redhat.com>
 <dac5f0c6-1bca-3daf-e5d2-6451dbbaca93@redhat.com>
MIME-Version: 1.0
In-Reply-To: <dac5f0c6-1bca-3daf-e5d2-6451dbbaca93@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hyman <huangy81@chinatelecom.cn>, Keqian Zhu <zhukeqian1@huawei.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 05:38:17PM +0200, Paolo Bonzini wrote:
> On 06/05/21 18:05, Peter Xu wrote:
> > This is v7 of the qemu dirty ring interface support.
> > 
> > v7:
> > - Rebase to latest master commit d45a5270d07
> 
> Queued, thanks!
> 
> I only made a small change to rename the property from dirty-gfn-count
> to dirty-ring-size, since (assuming the user knows what gfn means)
> it's not clear that it's related to the ring buffer support.

Yeah previously the only concern was to be clear it's for entry count rather
than size in bytes, however with the man page and all places describing then
looks good.  Thanks Paolo!

-- 
Peter Xu


