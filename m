Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524546C8976
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 00:57:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfrGJ-0006Qn-LD; Fri, 24 Mar 2023 19:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fw@strlen.de>)
 id 1pfrGG-0006Qb-7P; Fri, 24 Mar 2023 19:55:56 -0400
Received: from chamillionaire.breakpoint.cc ([2a0a:51c0:0:237:300::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fw@strlen.de>)
 id 1pfrGE-0002Is-Ii; Fri, 24 Mar 2023 19:55:55 -0400
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
 (envelope-from <fw@strlen.de>)
 id 1pfrG7-0004rZ-3T; Sat, 25 Mar 2023 00:55:47 +0100
Date: Sat, 25 Mar 2023 00:55:47 +0100
From: Florian Westphal <fw@strlen.de>
To: Eric Blake <eblake@redhat.com>
Cc: Florian Westphal <fw@strlen.de>, libguestfs@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, vsementsov@yandex-team.ru
Subject: Re: [Libguestfs] [PATCH 1/1] nbd/server: push pending frames after
 sending reply
Message-ID: <20230324235547.GC17250@breakpoint.cc>
References: <20230324104720.2498-1-fw@strlen.de>
 <ervljl6tt35qenv3z5lrjbklxuwezjvqpbwghtdntddpwa3glb@czoajnfpuxaa>
 <spo7scw4pvcloaoezcfdmssgg34unwqewoavs32tvaxuht3vns@4kjvbzlmuer5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <spo7scw4pvcloaoezcfdmssgg34unwqewoavs32tvaxuht3vns@4kjvbzlmuer5>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a0a:51c0:0:237:300::1; envelope-from=fw@strlen.de;
 helo=Chamillionaire.breakpoint.cc
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Eric Blake <eblake@redhat.com> wrote:
> On Fri, Mar 24, 2023 at 02:41:20PM -0500, Eric Blake wrote:
> > On Fri, Mar 24, 2023 at 11:47:20AM +0100, Florian Westphal wrote:
> > > qemu-nbd doesn't set TCP_NODELAY on the tcp socket.
> 
> Replying to myself, WHY aren't we setting TCP_NODELAY on the socket?

If the application protocol is strictly or mostly request/response then
I agree that qemu-nbd should turn nagle off as well.

