Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4955085FC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 12:34:37 +0200 (CEST)
Received: from localhost ([::1]:57398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh7fN-0007Y6-Jf
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 06:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nh7Z9-00066q-F0; Wed, 20 Apr 2022 06:28:07 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:55091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nh7Z7-00065o-H5; Wed, 20 Apr 2022 06:28:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=E0tXZH8V2t/WvymWz7YEiRQ0qr1tdA7RjDc9MQYQAgo=; b=vrGJhGfvShk1lPrK+G1Tsm58nW
 jNyx5SXvqJ0DK+YpnCzJF7bpzX3NyXaCMK+CAO/ZzAGTUR9znPsZ+FpcBEc6vpd+2pL41CMEGSxiC
 lE5cTjguEnls3RcXnu1Y4dfVY5q6e3GH47gcgZqjwbVwAf9ahfPPkZg7n1QpC4Jf3DEkBokBsD4qv
 GVbxF1zax5qipTThxrJWcxz4+RLVxwPJN+d0ijeZR4SFQoEaxiyPPmhrHZXwtu25dbiTDw61CNU6z
 nqq0Qa2hPOnAz5p3DYQZDrV/OaxofmfVSDLFmqkh3qqXW5NJBHeVv0G70xV0zTt2esbm1Oi2cjfi8
 Uyq5mBlaeaVmNxXJjEpmIjZuKZexKdd3ft6WSlNus2MiW+fHIopfb91kFlImtO9S3ZXcRBhYZnaYD
 Vih1Z0NEVeXoWgzN3VbEugJiCQvMxXu3uR7io9MdULEGZxgWRX3lQqJNhK6rvZVJeiAgOoR3pVbfw
 G8j6TCXWrslvrOPv0kuuPX6g/yX0eCTBbRsVfae1k/3UuTn9wif80i8ffOUI0ziBuERpCQ5eEwPW3
 1mp4p0CGi8GlKhqt1sagP4lqFBPAluY2rG9CNLKrikFnFin8fCS5wklZtrmq2lFWLNOhKKD123sGd
 q+BT6Q+Ldy90hMZybYje6CddzmT+9v1TalalEhc08=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Date: Wed, 20 Apr 2022 12:28:01 +0200
Message-ID: <2487103.vv5bNdeIv8@silver>
In-Reply-To: <20220420110946.3dbe6f50@bahia>
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
 <2e88acab7b3f998ceff7232b5e3d6a8a6d2a6f8b.1650370026.git.qemu_oss@crudebyte.com>
 <20220420110946.3dbe6f50@bahia>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mittwoch, 20. April 2022 11:09:46 CEST Greg Kurz wrote:
> On Tue, 19 Apr 2022 13:41:03 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > mknod() on macOS does not support creating sockets, so divert to
> > call sequence socket(), bind() and chmod() respectively if S_IFSOCK
> > was passed with mode argument.
> 
> Hmm... thinking again about this one : QEMU on linux calls the libc
> version of mknodat() which doesn't seem to support S_IFSOCK according
> to the mknod(3P) manual page. So I'm not sure there's something to
> be actually fixed here... what's the observed behavior on linux ?

It's unclear to me where you got that from. In all Linux man pages I looked up 
so far it said S_IFSOCK was supported. But I also tested this now with 
security_model=none on a Linux host and it works as expected, i.e. it creates 
a file of type socket on the Linux host filesystem.

We are really talking about a Linux host, right?

Best regards,
Christian Schoenebeck



