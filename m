Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06881CCCFD
	for <lists+qemu-devel@lfdr.de>; Sun, 10 May 2020 20:46:20 +0200 (CEST)
Received: from localhost ([::1]:44018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXqxv-00030R-Do
	for lists+qemu-devel@lfdr.de; Sun, 10 May 2020 14:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1jXqw7-0001K7-T7
 for qemu-devel@nongnu.org; Sun, 10 May 2020 14:44:27 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:40001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1jXqw6-00075K-Gn
 for qemu-devel@nongnu.org; Sun, 10 May 2020 14:44:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=rHVcn77k6CsXf82ouWmyt4zE1aIA+5IHVEoShkgUKFw=; b=wLtaQXwEYHO/yYZA2aAEGNsX47
 ++BGiSb2QzwnDoDDYsA9sBAlPWo3KdCKwwrrHkAElmzs5jS8RpDyAjMO6Sb3LSzDqWxqK0cedeTOo
 rpPTsY3qDiFGFkwx+knzR9TNUb+0oyHJF3M0VeO5u3Dga/mfIpV2n9rlNEwd0x1jomrPx2ZM6S9ZN
 mMyqgj+Bt29IVAB/w9l4nu2TBKzu0Z/XqvRczNhECnu64FGdoj09WbxLOkL7fQUV/6bJAunxWAF76
 dti9Go9glxvkRR855jKUoo0r4OYLB9l6fEbWc+UbUKxRy+k0OH4PtGNKQIHwvI5D0mRsmOn4fBYqJ
 46DL5xK2H19qcmJRpZ958qc+4bZPM4LcKOgsWYwJa8O6SpljP4HLnXf1PzEAh4TouoK0z52TOWoy8
 BMoPcA19i9782fnstPoaSXD7r1QO/Qtg70ugtyQYAbDKWd/ileMpvabDpwlx7iV2oJizRSPyv9RF+
 ssCSxTj8w35er58VdeZw2QdGj2yRVeoXuofqJVE2MdBTjI7K7IUOfukQ6mgrMlNoDiNMEhj4RSmWX
 9Tj4UdTl3vPGqN3hqSzepGioOMVYgndOFvjFTIiwwsVnfFtrVmRks1HMwbrdBjI1oxvqfgvsm0SgI
 EnDqIEEzwh4Y7MJTBXYnNuBM1/C5Twf7nvTG4E1TY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 2/2] 9pfs: fix init_in_iov_from_pdu truncating size
Date: Sun, 10 May 2020 20:43:41 +0200
Message-ID: <2111838.FFCTJPLGb3@silver>
In-Reply-To: <54f3b9c9f05a77ccdd6103bd46c828fcb675cbac.1589132512.git.qemu_oss@crudebyte.com>
References: <cover.1589132512.git.qemu_oss@crudebyte.com>
 <54f3b9c9f05a77ccdd6103bd46c828fcb675cbac.1589132512.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/10 14:44:23
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On Sonntag, 10. Mai 2020 19:18:21 CEST Christian Schoenebeck wrote:
> Commit SHA-1 16724a173049ac29c7b5ade741da93a0f46edff7 introduced
> truncating the response to the currently available transport buffer
> size, which was supposed to fix an 9pfs error on Xen boot where
> transport buffer might still be smaller than required for response.
> 
> Unfortunately this change broke small reads (with less than 12
> bytes).
> 
> To address both concerns, check the actual response type and only
> truncate reply for Rreaddir responses, and only if truncated reply
> would at least return one payload byte to client. Use Rreaddir's
> precise header size (11) for this instead of P9_IOHDRSZ.

Oops, that should have been "Rread's" of course, not "Rreaddir's". Apparently 
I already spent too much time on readdir() code.

If there's not more to do, then maybe you could just amend this log message 
typo Greg? I would appreciate it.

Best regards,
Christian Schoenebeck



