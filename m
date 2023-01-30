Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8511768168B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 17:38:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMXAI-0002fg-Ne; Mon, 30 Jan 2023 11:37:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pMXA6-0002YH-DH
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 11:37:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pMXA4-0003gV-DT
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 11:37:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675096658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i0Djd/W1KFtk2QRvVkjQwL1PZERBJ/cg89Slliwf6Uo=;
 b=EpBPFYi23plKgrXS/pjI0jFvLPOi6s9FBIt6nMmX8oVFuhtLIaq6KED2K5Up3l1ZpUjpP1
 NQh5wfDaJztm3ZdJHQ6hOZhWkuIZAD2QGxHcrMHGCbHeELK/hTFsDCqLD2XPbrbh21hz8E
 ywZ+voJAJCThOn1r1gZW3g1mbbXswuI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-341-YHCUgcihP_e0WJX2_iK_Qw-1; Mon, 30 Jan 2023 11:37:36 -0500
X-MC-Unique: YHCUgcihP_e0WJX2_iK_Qw-1
Received: by mail-qt1-f200.google.com with SMTP id
 f22-20020a05622a1a1600b003b8674f2302so1434953qtb.7
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 08:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i0Djd/W1KFtk2QRvVkjQwL1PZERBJ/cg89Slliwf6Uo=;
 b=zYNjBcDx9FXVZO8Vj5doHfwcoXmAB11CYn4B8d/g2sJ3Mf3RmKfQcpHjArbEUEBhdu
 i44Z6Qx2BX/9NSXguQ5sw2RxFbJefH+xJHcR0yPWLriW7WyQpFIfHEC1U1O1sdrd7HHj
 hke8+0VQdzxVhA6TOcAzobMn5YPvUf0ODNUwI9ZCLhcC81fsFe4R+EIpXwkymLowrkfb
 xMB2egpwkY+zxnEjT899A36BXbFtYt2c+XJHfsWMHTAuv6vkoCDZBFq8cj2pbLEht6xx
 a8Vv5OLmSrk/C6OLU0Q0r5/eMLl6u/UMRsJtUWICLXXqsZwzex7RO2sLH10rbIE6Mapc
 NUtA==
X-Gm-Message-State: AO0yUKXatpacAr6VY3QD9rkL9JKeDICo65o/tUs5xZNNNhJzdcsY3um5
 12pOblkRLFERm2TvdPKkAU57xDQnwVPDOBLS48nxsfk80U8mjEnl5tsmB/H60VXfFFFXh5lyLGO
 1MvDpXjNqU84AEok=
X-Received: by 2002:ac8:5711:0:b0:3b8:6b75:c901 with SMTP id
 17-20020ac85711000000b003b86b75c901mr5904963qtw.20.1675096655806; 
 Mon, 30 Jan 2023 08:37:35 -0800 (PST)
X-Google-Smtp-Source: AK7set94zKke51ouThxwf0yIgM1vFBoxKbEmpodr1lZf6wK2WIiB1wr+GW0NHR2JkzAr2c++x1MO8Q==
X-Received: by 2002:ac8:5711:0:b0:3b8:6b75:c901 with SMTP id
 17-20020ac85711000000b003b86b75c901mr5904929qtw.20.1675096655545; 
 Mon, 30 Jan 2023 08:37:35 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 c17-20020ac81111000000b003b7e8c04d2esm8237733qtj.64.2023.01.30.08.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 08:37:34 -0800 (PST)
Date: Mon, 30 Jan 2023 11:37:33 -0500
From: Peter Xu <peterx@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH] softmmu: Use memmove in flatview_write_continue
Message-ID: <Y9fyTXNxebzZAm00@x1n>
References: <20230130135152.76882-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230130135152.76882-1-akihiko.odaki@daynix.com>
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

On Mon, Jan 30, 2023 at 10:51:52PM +0900, Akihiko Odaki wrote:
> We found a case where the source passed to flatview_write_continue() may
> overlap with the destination when fuzzing igb, a new proposed network
> device with sanitizers.
> 
> igb uses pci_dma_map() to get Tx packet, and pci_dma_write() to write Rx
> buffer. While pci_dma_write() is usually used to write data from
> memory not mapped to the guest, if igb is configured to perform
> loopback, the data will be sourced from the guest memory. The source and
> destination can overlap and the usage of memcpy() will be invalid in
> such a case.
> 
> While we do not really have to deal with such an invalid request for
> igb, detecting the overlap in igb code beforehand requires complex code,
> and only covers this specific case. Instead, just replace memcpy() with
> memmove() to torelate overlaps. Using memmove() will slightly damage the
> performance as it will need to check overlaps before using SIMD
> instructions for copying, but the cost should be negiligble, considering
> the inherent complexity of flatview_write_continue().
> 
> The test cases generated by the fuzzer is available at:
> https://patchew.org/QEMU/20230129053316.1071513-1-alxndr@bu.edu/
> 
> The fixed test case is:
> fuzz/crash_47dfe62d9f911bf523ff48cd441b61c0013ed805
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


