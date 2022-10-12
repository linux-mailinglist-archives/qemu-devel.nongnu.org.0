Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EF65FCCB9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 23:04:36 +0200 (CEST)
Received: from localhost ([::1]:43618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiiu2-0006tW-GZ
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 17:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oiipk-0004h5-76
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 17:00:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oiipg-0008Gy-TC
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 17:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665608403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AqU111LWjOFqjoTfrmQqVcu//X/gjqxmB/CdlpFqVHY=;
 b=EntPO96gGPvbZ2Pu4IjpVUBX1Iw3Oke/Kc/o4U7zlbYbIcRJzAFm1zRFuojemerYv5fQtF
 bP2aEQcKfKvq7OFUZT5V1wDgKNHXLnpG4NYuGz5dmXa8E/ZcMqzjwy8tq+/fqtx2jALIQa
 R6AKtDwAJP4bWvXaRSUplPHEtmlDDjM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-88-v1oNsQHBM9Sr5Wbl55IYbg-1; Wed, 12 Oct 2022 17:00:02 -0400
X-MC-Unique: v1oNsQHBM9Sr5Wbl55IYbg-1
Received: by mail-wr1-f71.google.com with SMTP id
 g4-20020adfbc84000000b0022fc417f87cso3484258wrh.12
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 14:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AqU111LWjOFqjoTfrmQqVcu//X/gjqxmB/CdlpFqVHY=;
 b=UGQJfmNyQDwevU9WsTTMb4c+6eNN/puqk7YUsJgPT2bwpk+0HpN3PGz/Im7p1qutO6
 C8b+I6u5z6n4IQVmClY2f2iB3zwmMI6FHrTi5Y6NlkFg7LkjU0fCWyeg3kx1afSXuk7n
 yCGURjkpRHcpdJnT3EgCsRgUYYUK7U6orJuPIG6MhHsl42b+RNcNxAnlzECn10VnWmOD
 8gKCbyddSwzz0TAUOax+2TLsJnhtY3dudydWvMur5wyyTgkBwnF57hZ2PUYvl0WuLr8Q
 xHSZHACfVgIm9oHC1eyeDYzaNgBkPdjAoe7iLWEL8BMbJb53hURbGaPaxRnIsoo704V8
 GCEg==
X-Gm-Message-State: ACrzQf0QNGtvephaVkDcRpsBoiC0rkOiW27+q7ugPcL7zPNT+wFnFktI
 u0rUExy0KBKPl7p/yKZIBZ9zhvEhPvmj7lPZg1Dt3pgbyAtPAhqdSOxpW6CpaT0GqvQWEpu6GcI
 FdUNTOO2E11He65E=
X-Received: by 2002:a5d:6d02:0:b0:231:e6fd:153f with SMTP id
 e2-20020a5d6d02000000b00231e6fd153fmr3562194wrq.496.1665608400491; 
 Wed, 12 Oct 2022 14:00:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6zgXUaKEArKPDABAul9m1EmRFKa1SU5KLNlyyrMOyxibvMXBA+tJnUQKYYIEfGqjtABdSvbQ==
X-Received: by 2002:a5d:6d02:0:b0:231:e6fd:153f with SMTP id
 e2-20020a5d6d02000000b00231e6fd153fmr3562176wrq.496.1665608399852; 
 Wed, 12 Oct 2022 13:59:59 -0700 (PDT)
Received: from redhat.com ([2.54.162.123]) by smtp.gmail.com with ESMTPSA id
 r4-20020a5d4984000000b002285f73f11dsm626626wrq.81.2022.10.12.13.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 13:59:59 -0700 (PDT)
Date: Wed, 12 Oct 2022 16:59:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/55] pc,virtio: features, tests, fixes, cleanups
Message-ID: <20221012165418-mutt-send-email-mst@kernel.org>
References: <20221010172813.204597-1-mst@redhat.com>
 <CAJSP0QX9S-VgT9ooinu=BTF6ysrsMOJ29wRJMrDVY5ZbizXTSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QX9S-VgT9ooinu=BTF6ysrsMOJ29wRJMrDVY5ZbizXTSg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 12, 2022 at 04:04:31PM -0400, Stefan Hajnoczi wrote:
> On Mon, 10 Oct 2022 at 13:46, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The following changes since commit f1d33f55c47dfdaf8daacd618588ad3ae4c452d1:
> >
> >   Merge tag 'pull-testing-gdbstub-plugins-gitdm-061022-3' of https://github.com/stsquad/qemu into staging (2022-10-06 07:11:56 -0400)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> Hi Michael,
> Please update your .git/config with the https URL for future pull requests:
> 
>   https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git
> 
> The pull request is signed with your GPG, so modifications should be
> detected when verifying the signature. It still seems like a good idea
> to use https:// when possible instead of unencrypted git://.
> 
> Stefan

I don't think this is from .git/config, this is just a parameter
to request-pull. OK, I will switch to that.

-- 
MST


