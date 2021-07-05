Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3258E3BC274
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 20:03:13 +0200 (CEST)
Received: from localhost ([::1]:60932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Sw3-00073S-MB
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 14:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m0Sty-0005f0-TF
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 14:01:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m0Stw-00041b-5r
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 14:01:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625508058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fH/V7Xp9gG9u5LTBay9cH0zTja9T525YKP5vdFXjB0Y=;
 b=a2lalxrS9FAzey3c3+3dYEeW0phKLGCpddXTY7TR8PTQiNEYs+y+ab0RL/NYFoHjQyvgQs
 L3LcbuN0qfNcPctQSTej8TvpTpmGEMcTXjxkZ6YfSKxGyBObz1StcV9ZjOmwfRN6rBGfU9
 mQvxP7VegYfvsx3s4Ucl3zz/OrhJDvY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-c1Fd3K5KNW2MSzDu46bZ_A-1; Mon, 05 Jul 2021 14:00:56 -0400
X-MC-Unique: c1Fd3K5KNW2MSzDu46bZ_A-1
Received: by mail-wr1-f71.google.com with SMTP id
 j2-20020a0560001242b029012c82df4dbbso5576097wrx.23
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 11:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fH/V7Xp9gG9u5LTBay9cH0zTja9T525YKP5vdFXjB0Y=;
 b=Rwqtda/Q1v+OIPgU/VNp4l9wtHSUKyemY9We6KdAdB6f0bSmUOU2py5vsTp//ux49q
 8o1fdrbhKuB0iwe/RRw+IBMj+s9nEt3kPJvIkLLmEFMVdRAzmgKebPjlH0OsllI06Lgh
 6zhv093Efnzskssxni6duEOLy4NbdiYb6hcBk4cSsYjJW0fQHwt4fQdnkGQNgfBMbcsD
 UmUeyNGZ9ln0Lcz1AAY6ckc8mO0iQn92Ror29OriuJGfiviD5qqnsLCzZolsLKVLBysI
 2XdTdWLQ2x8m8qYtqGNbzxSY+P6Vo+Dl3G1RqvzVH8kK3w828HX/uttj2Ir6gbhpA1T/
 umAw==
X-Gm-Message-State: AOAM530WNpzw3lumw0eiUjkwfXVU9kg7ULVY47vyK2v8TcvQ/NYOZvIy
 Ts6+feg5lsucbPNDu+/JaUfiHxD5781McP1bbvqQiljaIKGz6YVI1AkhwJKTD177SexJQHfwU0e
 IrB0lZf1wwYGQmqw=
X-Received: by 2002:a5d:4590:: with SMTP id p16mr17549483wrq.253.1625508055872; 
 Mon, 05 Jul 2021 11:00:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvDCcVMezKJgwHZzjxFBqVkQkJN2W2Aca/j2UGICLAIjaxoT1w0CXStN+YvCoOJvRKDNHFhw==
X-Received: by 2002:a5d:4590:: with SMTP id p16mr17549471wrq.253.1625508055699; 
 Mon, 05 Jul 2021 11:00:55 -0700 (PDT)
Received: from redhat.com ([2.55.8.91])
 by smtp.gmail.com with ESMTPSA id v2sm13510288wru.16.2021.07.05.11.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 11:00:54 -0700 (PDT)
Date: Mon, 5 Jul 2021 14:00:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 00/53] acpi: refactor error prone build_header() and
 packed structures usage in ACPI tables
Message-ID: <20210705140002-mutt-send-email-mst@kernel.org>
References: <20210625091818.1047980-1-imammedo@redhat.com>
 <20210702104548-mutt-send-email-mst@kernel.org>
 <20210705095618.69fed068@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210705095618.69fed068@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 05, 2021 at 09:56:18AM +0200, Igor Mammedov wrote:
> On Fri, 2 Jul 2021 10:47:20 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Fri, Jun 25, 2021 at 05:17:24AM -0400, Igor Mammedov wrote:
> > > Highlights:
> > >   * drop pointer arithmetic in ACPI tables code
> > >   * use endian agnostic API
> > >   * simplifies review of tables. /in most cases just line by line comparision with spec/  
> > 
> > 
> > A hue amount of work, thank you!
> > To make it easier to merge, how about splitting it up a bit?
> > E.g. I think first 10-11 patches make sense on their own, right?
> 
> I think you've meant 01-11 patches, and answer is yes, it's in-depended
> of actual ACPI refactoring as was mentioned is cover letter, see below.
> 
> [...]
> > > 
> > > Series also includes optional qtest patches that add missing acpi
> > > tests for tables that I'm touching to verify conversion changes.
> > > That includes an alternative build time based impl. of
> > > qtest_has_accel() API. So if we start bike-shedding this qtest_has_accel()
> > > we can safely drop all tests included, till the time discussion settles
> > > and some form of a qtest_has_accel() is merged, at which point I'd respin
> > > depended tests.
> [...]
> 
> it's ok to split tests into a separate series if that's what you prefer.

Let's start with a smaller series that still makes sense.
I'll merge that we'll look at the next chunk.

-- 
MST


