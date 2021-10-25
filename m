Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF01439749
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 15:13:12 +0200 (CEST)
Received: from localhost ([::1]:35888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mezmo-0007iG-QL
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 09:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mezk2-0003ZG-Mf
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 09:10:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mezjz-00055G-N8
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 09:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635167413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a9N5Q6AlyUM/TFSfI0Dd9uI2sBbwOjU0+BXRIgAnEbM=;
 b=jJV3xm/0eWBZvgMDHqkf7168rrmK+60hMqGvtcS2gKBwUdoDqPPIt9Yw1/zzz38cO0jwyI
 8rEeFPuLF08OOF3idylOGKItRViSLvXsRQ/qyUwkJMIDk5Mv4QtzPhVXyO1E3zQwA1NS7V
 04+BVsMW0+mhapzbyESbgQfcrko9m68=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-LvGqnEBxNXiBPGoX4gAhNQ-1; Mon, 25 Oct 2021 09:10:12 -0400
X-MC-Unique: LvGqnEBxNXiBPGoX4gAhNQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 f1-20020a5d64c1000000b001611832aefeso3197853wri.17
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 06:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:references:cc:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a9N5Q6AlyUM/TFSfI0Dd9uI2sBbwOjU0+BXRIgAnEbM=;
 b=x3/X5oCWGuGU9EdmfBrUcq6gCB8sbvuRrx02hdFOd+TLDtdqPUwSYTVsMhzBYsQw2M
 ZDS2e//T9/BS+dXelcpRAKy4aTB4PXs1woRBn6Zv4k+J873KsiRm09/gM55K5ZbU9jYM
 7DsO+jMLR9tVDOXlg4EjrHpT3zStsINAOEnDKTCRGWHTpwz3X1hkPeigFqrwz1s8FI3P
 OIunJZS9VUIxaB2mlquSg5OF6w33U0qD04vhtYUC56PH3+HhwIgFPL1BxHntdZlO1dLO
 iq9S1wCsimNBc7anbp11SVD5/8Z2EuGGD6iRaHkWx2rkWUai840bFfA9uWG4ilWYmSbE
 J7SQ==
X-Gm-Message-State: AOAM532jV44BSLHZYVhndQNYfaquENHBm4KcwJR7N43CFU81zsnYQjVw
 6kp9OzoM4PAB+YrECE2INQFgWBkWrw88CuCn5UzYtlj1s/UprPAhPsKDlFi37F5OTK+pmEm67l0
 zzRe7B2BROT9cqCo=
X-Received: by 2002:adf:a183:: with SMTP id u3mr23485785wru.330.1635167411114; 
 Mon, 25 Oct 2021 06:10:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ6t6wMvJRney9c9rRO6+H+Y7r3NCDzViWYQ9KrSr3ag5P5pNkXmQqUW0z5W6VxivBN2Z+KQ==
X-Received: by 2002:adf:a183:: with SMTP id u3mr23485740wru.330.1635167410816; 
 Mon, 25 Oct 2021 06:10:10 -0700 (PDT)
Received: from thuth.remote.csb (tmo-096-150.customers.d1-online.com.
 [80.187.96.150])
 by smtp.gmail.com with ESMTPSA id v6sm2338298wrx.17.2021.10.25.06.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 06:10:10 -0700 (PDT)
To: Owen LaGarde <olagarde@gmail.com>, qemu-devel@nongnu.org
References: <CACDcNnWWbzkH5-h6=BoXdA92DyVfTD7Kp=Spoz62yXw5t+tLGw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: configure --extra-cflags and --extra-ldflags values not
 propagating to meson?
Message-ID: <a105f305-b1e8-f97a-fa09-f083190e34cb@redhat.com>
Date: Mon, 25 Oct 2021 15:10:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CACDcNnWWbzkH5-h6=BoXdA92DyVfTD7Kp=Spoz62yXw5t+tLGw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/10/2021 13.20, Owen LaGarde wrote:
> Am I using --extra-cflags and --extra-ldflags wrong in the configure call?
> 
> I'd like to source build several pre-reqs specific to supporting the qemu source
> build.  I'd specifically not like to install neither the qemu or re-req builds
> at the system level.  Normally I'd expect the --extra-cflags and --extra-ldflags
> configure options to do this but they do not appear to propagate to meson.  
> There
> was an approved meson patch back in 2018 for extra-cflags / extra-ldflags 
> and qemu
> is currently using meson >5.8(?) but it doesn't look like configure is 
> adding the
> args anywhere in the build tree.  There are a number of ways to do this, what's
> appropriate / future-proof wrt building qemu from source?  And why is configure
> supporting --extra-[c,ld]args but not doing anything with the values?

I see a similar behavior with netmap now - I've got the corresponding header 
file in a non-standard directory, and up to commit 837b84b1c078bf3e909 it 
used to work fine to do:

.../configure --enable-netmap \
     --extra-cflags=-I/path/to/netmap/sys

but since the conversion to meson, this does not seem to work anymore.

Paolo, any ideas?

  Thomas


PS: As a work-around, it seems to be fine to pass the flags via the CFLAGS 
environment variable instead:

CFLAGS=-I/path/to/netmap/sys .../configure --enable-netmap


