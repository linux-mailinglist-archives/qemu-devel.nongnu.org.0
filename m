Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5D741EBEA
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 13:29:49 +0200 (CEST)
Received: from localhost ([::1]:57264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWGjb-0007u3-Cz
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 07:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mWGba-0001oG-S2
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 07:21:30 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:55677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mWGbZ-00059Y-4J
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 07:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:References:In-Reply-To:
 Content-ID:Content-Description;
 bh=GLJzNmvayTyxVO+njPurvJCngd6ocnalF/bnk+Rjaec=; b=ZzZdroeEtsliF8+9gOXC3b52oy
 YO8qdxGxTgjaj5tnLBTe2kGNlgkieEi4iynBSH3BIeYVuwNBtdT+PT8YxkmggFqhANi+xJJYJVpB8
 AbH+Wk3n3KYlwJoNyO0JwPlpSE2Y5s5OOp8eY9JL7G+yqutwkbGFDtaDIC9XJWpIHcFNwWYsT2wpB
 3JOmUBh3lSrFQCk7FhctCGM5O8Wz6uqHH1W23xVvkv1Lwk9awbt+b1e3/rq38t6dzgt2P8vnewusg
 Y4lK5IZfTeFz2aF8aR3PXyWJJJZy5S7LA95ChkwAFvr+hhgEeJNSU1LZUMDIZlJnUNif4xc/bTANL
 53nU/I/GosTVcPUJzheNQNkaSxsI9DOjCf9Qhh11vqQk2hc0UhptxRIn3vtmp2PzmL4bYTNM7mMZP
 h5ORAptpOqEyLyNJFG/gpvdTc6AoD/rHaLFO8zhCpAkMPglemA4rL0liHDqFVJRLGabyUP3UH0jMW
 dLuz8Jpi43BOZ3AGslQkc+g35SGM04cahdAW6ECj/7B3mfPd80uPmcOyiT9GfXErP0JIznvfSgwk3
 fL/SNNvYUSO5+isXT9nEype4YbDYXLuv2pOXivSXug08qIyoUmH0HlIdPE2sg9ut83+QExehUYZuA
 Fdh4Uw068bca0g2E3uFLWqxUEUMyOmuWLtFovvztw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>
Subject: virtio 4M limit
Date: Fri, 01 Oct 2021 13:21:23 +0200
Message-ID: <2311207.AWRhmksWK6@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

while testing the following kernel patches I realized there is currently a 
size limitation of 4 MB with virtio on QEMU side:
https://lore.kernel.org/netdev/cover.1632327421.git.linux_oss@crudebyte.com/

So with those kernel patches applied I can mount 9pfs on Linux guest with the 
9p 'msize' (maximum message size) option with a value of up to 4186112 
successfully. If I try to go higher with 'msize' then the system would hang 
with the following QEMU error:

  qemu-system-x86_64: virtio: too many write descriptors in indirect table

Which apparently is due to the amount of scatter gather lists on QEMU virtio 
side currently being hard coded to 1024 (i.e. multiplied by 4k page size => 4 
MB):

  ./include/hw/virtio/virtio.h:
  #define VIRTQUEUE_MAX_SIZE 1024

Is that hard coded limit carved into stone for some reason or would it be OK 
if I change that into a runtime variable?

If that would be Ok, maybe something similar that I did with those kernel 
patches, i.e. retaining 1024 as an initial default value and if indicated from 
guest side that more is needed, increasing the SG list amount subsequently 
according to whatever is needed by guest?

And as I am not too familiar with the virtio protocol, is that current limit 
already visible to guest side? Because obviously it would make sense if I 
change my kernel patches so that they automatically limit to whatever QEMU 
supports instead of causing a hang.

Best regards,
Christian Schoenebeck



