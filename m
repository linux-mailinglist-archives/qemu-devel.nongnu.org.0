Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EDD2325A6
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 21:51:16 +0200 (CEST)
Received: from localhost ([::1]:60100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0s6d-0003DW-M3
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 15:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0s5Q-00021L-RV; Wed, 29 Jul 2020 15:50:01 -0400
Received: from charlie.dont.surf ([128.199.63.193]:34386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0s5O-0007GY-V0; Wed, 29 Jul 2020 15:50:00 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 09DD3BF616;
 Wed, 29 Jul 2020 19:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1596052196;
 bh=y7/j5dCp1hTkN/mNt+1TruYCNBHa8LozMpG+mfzV4bc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bmZn8xcK+r7grY8D7EmSSomrypnois5Q3oLlXq2E0NdwffVBoj99iQQ0LfaIgPLza
 BfNi2EqL0MHODc4/L6YuncqCBNINHnmwhRNrwkWn+ARsB0CgIX7kfreKPCHT18viv8
 +mBShFZgyssOCe9OH8PLAdHAyig39jt3JqZv8tT0edYXwDZPCMUfHjOAPv7FjPt5kh
 rUydd5xh9fdByCeMO4hAFTn47qJwNOQn5HL0d4BFDrhc4Xs/Wk+k4cpcL2iSSHVTWf
 4/VwJqnP4uCvaKiRUi7X23/QysW+BJlGrAoGF+pokupKoEIM/2anNmfwghgZbKfz5x
 pQJjjllHVqNqw==
Date: Wed, 29 Jul 2020 21:49:54 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH 06/16] hw/block/nvme: pass request along for tracing
Message-ID: <20200729194954.GC293496@apples.localdomain>
References: <20200720113748.322965-1-its@irrelevant.dk>
 <20200720113748.322965-7-its@irrelevant.dk>
 <20200729154936.GE14876@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200729154936.GE14876@localhost.localdomain>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 14:23:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jul 30 00:49, Minwoo Im wrote:
> Klaus,
> 
> On 20-07-20 13:37:38, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> > 
> > Pass along the NvmeRequest in various functions since it is very useful
> > for tracing.
> 
> One doubt here.
>   This patch has put NvmeRequest argument to the nvme_map_prp() to trace
>   the request's command id.  But can we just trace the cid before this
>   kind of prp mapping, somewhere like nvme_process_sq() level.  Then we
>   can figure out the tracing for the prp mapping is from which request.
> 
> Tracing for cid is definitely great, but feels like too much cost to
> pass argument to trace 'cid' in the middle of the dma mapping stage.
> 

Good point Minwoo.

I ended up dropping the patch and just replacing it with a patch that
adds tracing to nvme_map_prp.

