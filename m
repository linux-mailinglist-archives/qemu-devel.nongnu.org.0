Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8CD3656ED
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:56:40 +0200 (CEST)
Received: from localhost ([::1]:59998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYo3c-0003M0-10
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lYnyt-00007v-Gv
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:51:47 -0400
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168]:38476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lYnyo-00042l-Cr
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1618915902;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r2GvvTFs1FzifLgk5G62sYYj93zFWYsDLtHCLOMWAdY=;
 b=c8sTzrCnZ33suJMWnwKtxpX+HRnlDqtDId7gS9GYgIGtA2eVjS8mj3OP
 KRzZp8/A4+JDPi9FvhWB4Exk+yUieviNzu07/p4SG7P8nVbJDTDXK/bRj
 uuBrxMkNzfYMP9QhuoD/j0V9ZKkIXzA7xy1QKZ2LA+GViX/ewYbixn2Q/ Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: FGkKX9wB4UugATYgZTNpiMY0igFSNGJREYzTy8bX5Fq3sWrChHI1kBFJDL3KdgfNqExizNhDtJ
 odIvYaRELlNyMbmnLZ/t0YM9G4IxFNX6qOQ+5QGxc1lUu7mKzt3fNb72c1sJIu+qtSBRR8Z4Uy
 YeQ262k6swB3JX8WjSHWz40WgFR0mIC0MHWWZf4/8Uvx1FyD+h2Z4B2zz7ZFfJJNFyif+Dgua5
 lTz0J5OBKzXb8whXhfxX+L2zZ5187Db8Q+LSPVcuHa6npgNcKV9eD+zzRkqx/I7KAKe0k4ugJo
 QdU=
X-SBRS: 5.1
X-MesageID: 41799571
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:GMsmdqpM5h64NcpKirjuIAcaV5q6eYIsi2QD101hICF9WObwra
 GTtd4c0gL5jytUdXE7gNabOLSBR3S0z+8T3aA6O7C+UA76/Fa5NY0K1/qH/xTMEzDzn9Qw6Y
 5OaK57YeeeMXFbioLA7BC8A5IcxrC8gcaVrMP/61socg1wcaFn6G5Ce2OmO2l7XhNPC5Z8NL
 f03LslmxOadX4abtu2CxA+NoCpzbD2vanrbhIcCxks5BPmt0LL1JfAHwWFxRBbajtTwN4ZgB
 H4ujbk7aauuezT8H/h/lLUhq45pOfc
X-IronPort-AV: E=Sophos;i="5.82,236,1613451600"; d="scan'208";a="41799571"
Date: Tue, 20 Apr 2021 11:51:35 +0100
To: Igor Druzhinin <igor.druzhinin@citrix.com>
CC: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>,
 <sstabellini@kernel.org>, <paul@xen.org>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <pbonzini@redhat.com>,
 <richard.henderson@linaro.org>, <ehabkost@redhat.com>
Subject: Re: [PATCH] xen-mapcache: avoid a race on memory map while using
 MAP_FIXED
Message-ID: <YH6yNxOtvuFcuQsy@perard>
References: <161888998361.15979.8661085658302494664@72b6d80f974b>
 <91dc07bd-fc34-56fa-4c3e-684626a2e8d5@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <91dc07bd-fc34-56fa-4c3e-684626a2e8d5@citrix.com>
Received-SPF: pass client-ip=216.71.155.168;
 envelope-from=anthony.perard@citrix.com; helo=esa5.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

On Tue, Apr 20, 2021 at 10:51:47AM +0100, Igor Druzhinin wrote:
> On 20/04/2021 04:39, no-reply@patchew.org wrote:
> > === OUTPUT BEGIN ===
> > ERROR: Author email address is mangled by the mailing list
> > #2:
> > Author: Igor Druzhinin via <qemu-devel@nongnu.org>
> > 
> > total: 1 errors, 0 warnings, 21 lines checked
> > 
> 
> Anthony,
> 
> Is there any action required from me here? I don't completely understand how
> that happened. But I found this:

No action, I just need to remember to fix the patch's author before
submitting a pull request.

Citrix's policy is just too strict and don't even allow space changes in
some headers.

-- 
Anthony PERARD

