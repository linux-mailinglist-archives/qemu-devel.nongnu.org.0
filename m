Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A7F28A80A
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Oct 2020 17:47:39 +0200 (CEST)
Received: from localhost ([::1]:42672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRdZR-0004Ot-OA
	for lists+qemu-devel@lfdr.de; Sun, 11 Oct 2020 11:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kRdY2-0003x6-29
 for qemu-devel@nongnu.org; Sun, 11 Oct 2020 11:46:11 -0400
Received: from relay64.bu.edu ([128.197.228.104]:38994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kRdXy-0006wv-TU
 for qemu-devel@nongnu.org; Sun, 11 Oct 2020 11:46:08 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 09BFjOaT021704
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 11 Oct 2020 11:45:27 -0400
Date: Sun, 11 Oct 2020 11:45:24 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 05/16] fuzz: Declare DMA Read callback function
Message-ID: <20201011154524.wvq2vsff7eig27c4@mozz.bu.edu>
References: <20200921022506.873303-1-alxndr@bu.edu>
 <20200921022506.873303-6-alxndr@bu.edu>
 <6ed304a0-38ee-1013-7d85-7b0ae0e7c4d2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ed304a0-38ee-1013-7d85-7b0ae0e7c4d2@redhat.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 11:46:04
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.441, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: darren.kenny@oracle.com, bsd@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 201008 0939, Paolo Bonzini wrote:
> On 21/09/20 04:24, Alexander Bulekov wrote:
> > This patch declares the fuzz_dma_read_cb function and uses the
> > preprocessor and linker(weak symbols) to handle these cases:
> > 
> > When we build softmmu/all with --enable-fuzzing, there should be no
> > strong symbol defined for fuzz_dma_read_cb, and we link against a weak
> > stub function.
> > 
> > When we build softmmu/fuzz with --enable-fuzzing, we link against the
> > strong symbol in general_fuzz.c
> > 
> > When we build softmmu/all without --enable-fuzzing, fuzz_dma_read_cb is
> > an empty, inlined function. As long as we don't call any other functions
> > when building the arguments, there should be no overhead.
> 
> Can you move the weak function somewhere in tests/qtest/fuzz instead?
> Then you don't need an #ifdef because you can add it to specific_fuzz_ss.
> 
> Paolo
> 

If I understand correctly, specific_fuzz_ss is only used to build
qemu-fuzz targets. The goal here was to support building qemu-system
with --enable-fuzzing (ie CONFIG_FUZZ=y), where specific_fuzz isn't
used. If its too ugly, we could make a stub file under tests/qtest/fuzz
and add it to specific_ss when: 'CONFIG_FUZZ'.
-Alex

