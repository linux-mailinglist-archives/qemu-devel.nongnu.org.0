Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D3E3126E9
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 19:47:12 +0100 (CET)
Received: from localhost ([::1]:50634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8p5S-00062U-VZ
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 13:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l8p1h-00033Z-IY
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 13:43:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l8p1d-0004Hp-G6
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 13:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612723389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/DlRknGDm8ztpJbw/VJVI857aGO9KwH1Q+65xG4ueUM=;
 b=cxQfjA/CP0VQ1RNwkCC7Nelld/tSUewMkseuW2+eq1wn5juI3XIbINuwD7qlHAhbsDZh5o
 XzHCmdkUzHQx5tIn1dzVM2d2KLkKLU8NP+PqCCN5HGt9iRLWHQV2jm2IJGojuuKbkCR6Dh
 E/coQvvR4I5c0OCNTMrVO6YaR2SALoE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-1G9R84rMMLSA5OxdDXTktw-1; Sun, 07 Feb 2021 13:43:07 -0500
X-MC-Unique: 1G9R84rMMLSA5OxdDXTktw-1
Received: by mail-wr1-f69.google.com with SMTP id f5so1252414wro.7
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 10:43:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/DlRknGDm8ztpJbw/VJVI857aGO9KwH1Q+65xG4ueUM=;
 b=VdX8Lgsh0SfXU+Li0L1kC351SM2OMoue05c6h1KjuXFTTx2goUEH1N0V6dI382LObm
 MS02uiiXlwPm1syNZ6uNdGrAeAi0R7Hsa5lpzr4hj2Skc4n21sI1YT4zJ00BpGCDUsVG
 xYjlXSdVPHeQb43YWRNFz0V7uki6PF6cJDT30T5VSS4AW3U51MG5EIEL1y6NTh+aVTBw
 MsKMiW0X7qSedZG1UR3IERr1bbOLQnFb9u29u0c5bZRYVqcfDxQEE7oHxkQfhcCzC4HX
 r7VOLZmG1dyEbQVeCyd3aoc0Hv+ZxFWTfZWjdhZkYmGw7tLRVdj/59qRgcXPbMWjRmPe
 nPNQ==
X-Gm-Message-State: AOAM532eZ36hBD9jBKTmeBtr/kd7vNa5qFR5g7Y0RNPDY19bYEI6SBld
 Rhd85lxTqLTXST+rbQrIE6SRqwqCkRa2nVjvXzMSLpHNdP0DR6FFZwb4HVEdAQYvAGQUpRWqzYi
 RIzOB1oNz4JhfWxU=
X-Received: by 2002:a05:6000:1542:: with SMTP id
 2mr16360285wry.356.1612723386565; 
 Sun, 07 Feb 2021 10:43:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvotwlZPcHagFk3ndWmzSgTFkrv9sT2FeIOPWs5Pjk7Yb5GWn5oAKIXKpVp+63eqUI/UOQCg==
X-Received: by 2002:a05:6000:1542:: with SMTP id
 2mr16360263wry.356.1612723386320; 
 Sun, 07 Feb 2021 10:43:06 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id b13sm22525604wrt.31.2021.02.07.10.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 10:43:05 -0800 (PST)
Date: Sun, 7 Feb 2021 13:43:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Marian Postevca <posteuca@mutex.one>
Subject: Re: [PATCH v4 2/5] acpi: Permit OEM ID and OEM table ID fields to be
 changed
Message-ID: <20210207134214-mutt-send-email-mst@kernel.org>
References: <20210119003216.17637-1-posteuca@mutex.one>
 <20210119003216.17637-3-posteuca@mutex.one>
 <20210205082049-mutt-send-email-mst@kernel.org>
 <87h7mnzqhm.fsf@mutex.one>
MIME-Version: 1.0
In-Reply-To: <87h7mnzqhm.fsf@mutex.one>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 07, 2021 at 08:23:33PM +0200, Marian Postevca wrote:
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> >
> >
> > I queued this but there's a lot of code duplication with this.
> > Further, the use of g_strdup adds unnecessary dynamic memory
> > management where it's not needed.
> > I'd prefer
> > -   a new struct AcpiBuildOem including the correct strings
> > -   use sizeof of fields in above instead of 8/6
> > -   move shared strings and code into a common header
> >
> 
> So how should I approach this since the patches are queued? A new patch
> with the suggested changes, or resending the original patches?

A patch on top please. They are merged so really easy, just basing on
masted should be good.

-- 
MST


