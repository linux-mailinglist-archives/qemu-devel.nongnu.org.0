Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD434F98F5
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 17:04:29 +0200 (CEST)
Received: from localhost ([::1]:50862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncqA0-00011n-RW
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 11:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gouicem@in.tum.de>) id 1ncncL-0001Il-22
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 08:21:33 -0400
Received: from mailout1.rbg.tum.de ([131.159.0.201]:54115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gouicem@in.tum.de>) id 1ncncI-0007WT-Jc
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 08:21:32 -0400
Received: from mailrelay1.rbg.tum.de (mailrelay1.in.tum.de
 [IPv6:2a09:80c0:254::14])
 by mailout1.rbg.tum.de (Postfix) with ESMTPS id CC6B8294F;
 Fri,  8 Apr 2022 14:21:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=in.tum.de;
 s=20220209; t=1649420486;
 bh=EqsXjj4w5Q7sWWaS8T1m7qSERKd80tQqz/osrjXoOL8=;
 h=Date:To:Cc:From:Subject:From;
 b=foBnSXUO/gYyUhVjKWZrpOK8N4hkQe+gvPXEOSzXsw1uUP+voVxD+WmcnzSyf3GYu
 H58auy00gDEt+cZpMWYEVMLTC+Xpp5/20SSWzYZqsCsEcDS9HS48zi8tQXR2oxFQ6k
 MXYkS7OeEMLh/tPMuyCLwX+kno0TbIc+aHtp43o84WvZN9qOwy5FD399rrfiQ2wDEu
 tliJLGXMvdZcRrL8HE3CPl00/4oFglm0mT4tQehSHFktNZ5JuK8iFY89UlLiOi5m4+
 FDFQMcW3MdAYPz+IkV5As/NPHdGF6DzcqGa7h5OrYm37/p4MTAWpfVyGhua1SLpFhn
 4ARJt1mRgz48Q==
Received: by mailrelay1.rbg.tum.de (Postfix, from userid 112)
 id C7D14254; Fri,  8 Apr 2022 14:21:26 +0200 (CEST)
Received: from mailrelay1.rbg.tum.de (localhost [127.0.0.1])
 by mailrelay1.rbg.tum.de (Postfix) with ESMTP id A52AD252;
 Fri,  8 Apr 2022 14:21:26 +0200 (CEST)
Received: from mail.in.tum.de (mailproxy.in.tum.de [IPv6:2a09:80c0::78])
 by mailrelay1.rbg.tum.de (Postfix) with ESMTPS id A1CDA24E;
 Fri,  8 Apr 2022 14:21:26 +0200 (CEST)
Received: by mail.in.tum.de (Postfix, from userid 112)
 id 9D36B4A0549; Fri,  8 Apr 2022 14:21:26 +0200 (CEST)
Received: (Authenticated sender: gouicem)
 by mail.in.tum.de (Postfix) with ESMTPSA id 34C084A03BB;
 Fri,  8 Apr 2022 14:21:26 +0200 (CEST)
 (Extended-Queue-bit xtech_td@fff.in.tum.de)
Message-ID: <648878dc-67c6-d919-c2a0-b7c6c5d613e2@in.tum.de>
Date: Fri, 8 Apr 2022 14:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: qemu-devel@nongnu.org
From: Redha Gouicem <gouicem@in.tum.de>
Subject: Support for x86_64 on aarch64 emulation
Organization: Technical University of Munich (TUM)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=131.159.0.201; envelope-from=gouicem@in.tum.de;
 helo=mailout1.rbg.tum.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 08 Apr 2022 10:23:08 -0400
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
Cc: d.g.sprokholt@tudelft.nl
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are working on support for x86_64 emulation on aarch64, mainly
related to memory ordering issues. We first wanted to know what the
community thinks about our proposal, and its chance of getting merged
one day.

Note that we worked with qemu-user, so there may be issues in system
mode that we missed.

# Problem

When generating the TCG instructions for memory accesses, fences are
always inserted *before* the access, following this translation rule:

    x86   -->     TCG     -->    aarch64
    -------------------------------------
    RMOV  -->  Fm_ld; ld  -->  DMBLD; LDR
    WMOV  -->  Fm_st; st  -->  DMBFF; STR

Here, Fm_ld is a fence that orders any preceding memory access with
the subsequent load. F_m_st is a fence that orders any preceding
memory access with the subsequent store. This means that, in TCG, all
memory accesses are ordered by fences. Thus, no memory accesses can be
re-ordered in TCG. This is a problem, because it is *stricter than
x86*. Consider when a program contains:

    WMOV; RMOV


x86 allows re-ordering independent store-load pairs, so the above pair
can safely re-order on an x86 host. However, with QEMU's current
translation, it becomes:

    DMBFF; STR; DMBLD; LDR

In this target aarch64 code, no re-ordering is possible. Hence, QEMU
enforces a stronger model than x86. While that is correct, it harms
performance.

# Solution

We propose an alternative scheme, which we formally proved correct
(paper under review):

    x86   -->      TCG    -->    aarch64
    -------------------------------------
    RMOV  -->  ld; Fld_m  -->  LDR; DMBLD
    WMOV  -->  Fst_st; st -->  DMBST; STR

This new scheme precisely captures the observable behaviors of the
input program (in x86's memory model). This behavior is preserved in
the resulting TCG and aarch64 programs. Which the inserted fences
enforce (formally verified). Note that this scheme enforces fewer
ordering than the previous (unnecessarily strong) mapping scheme. This
new scheme benefits performance. We evaluated this on benchmarks
(PARSEC) and got up to 19.7% improvement, 6.7% on average.

# Implementation Considerations
 
Different (source and host) architectures may demand different such
mapping schemes. Some schemes may place fences before an instruction,
while others place them after. The implementation of fence placement
should thus be sufficiently flexible that either is possible. Though,
note that write-read pairs are unordered in almost all architectures.
 
We see two ways of doing this:
- extracting the placement of the fence from the 
  tcg_gen_qemu_ld/st_i32/i64 functions, and have each architecture
  explicitly generate the fence at the correct place
- adding two parameters to these functions specifying the strength of
  the "before" and "after" fences. The function would then generate
  both fences in the IR (one of them may be a NOP fence), which in
  turn will be translated back to the host


We are eager to see what you think about this change in TCG.
Cheers!


-- 
Redha Gouicem
Post doctoral researcher
Chair of Decentralized Systems Engineering
Department of Informatics, Technical University of Munich (TUM)

