Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C4C47EE49
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 11:36:53 +0100 (CET)
Received: from localhost ([::1]:45990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0hwS-0003gI-4k
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 05:36:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1n0hu2-0002dj-5Z
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 05:34:22 -0500
Received: from rev.ng ([5.9.113.41]:54355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1n0hu0-00008V-6J
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 05:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oJQ/SwB8ZfAmdY5GiVPPu+sVsZRT01PY67ZlWwNIdSE=; b=oOqbqY99Cs5Mf+nG4C8aFk7Sc7
 w1wkxK9LWLi9Kr9hmx5tAz//rJrHTw18Y2nwbqvDryHZe8o5R+vvDDuB5oIZRqgVHjocBzESVOSXP
 G9i7V8cesZ+xh8TUQZjbeaScx7Vo0AZvMRWQWtMSynv2gfWXjM3wAguey7EuZbTlboXI=;
Date: Fri, 24 Dec 2021 11:34:02 +0100
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: tsimpson@quicinc.com, Anton Johansson via <qemu-devel@nongnu.org>, Brian
 Cain <bcain@quicinc.com>
Subject: QEMU CI failure of cross-i386-* targets (meson picks wrong glib for
 native target)
Message-ID: <20211224113402.6d2d54f9@orange>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

Hi Paolo, I'm trying to get the QEMU CI run successfully for the
idef-parser patchset. However I'm facing an issue I haven't been able
to work around with meson. Maybe you can help?

The failing tests are cross-i386-*

    https://gitlab.com/carl.cudig/qemu/-/jobs/1437392669
    https://gitlab.com/carl.cudig/qemu/-/jobs/1437392673
    https://gitlab.com/carl.cudig/qemu/-/jobs/1437392671

I think the problem is that we're adding a new build-time dependency:
glib. However glib is also a run-time dependency and, AFAIU, when cross
compiling for x86 on a x86-64 machine, if you create a native
executable, meson picks up the x86 version of glib (as opposed to the
x86-64).

I've been fiddling with this for a while, unsuccessfully.

Relevant portion of the code:

    https://gitlab.com/carl.cudig/qemu/-/commit/c020958c37fa723f7e933a58b1bb1c3668ff4cff#8145a41027f26ff426d5a2c8b00c56f227943165_198_202

Happy holidays!

-- 
Alessandro Di Federico
rev.ng Labs Srl

