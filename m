Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340E212477D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 14:01:48 +0100 (CET)
Received: from localhost ([::1]:53872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihYxW-00014s-En
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 08:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41214)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1ihY5B-0000nG-0Q
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:05:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qemu_oss@crudebyte.com>) id 1ihY58-0007yE-OM
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:05:35 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:48601)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ihY57-0007u0-08
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=CIxJPz3+X44gxsGWP51xO+Ec/TQPhRnMUQygBKvIAoc=; b=RbI7uhec19yVhOYxUVIKNgoBSA
 LoKKZ7JgDIdl8mcnryaoCV89FkpRYpUahDKqK/rrHZtuNVOORN+UHPjiLUfAcUQHXdhL7zJHv41J5
 gAqsSFxexKPy5rb+QJis51GG2NiugYaZ1Qbns79XH15CqaYOHhC3miXvjVXk2zWhfkC4quPetS3vp
 MPyHu/6FXDu8apC0y+T2q7gw5bR2jxlChTNJb/sHyL0dYmlj0s+IFkwhUQO6UcQ+1T1qboHlAlSdy
 sIGWR03//7/TEjqZfXO/cXrgCR6QS0a3/QyFSSA1nwnGF05C+k5J6a6GQIl4iTRllGBuLKAaaq1uX
 95mfwihLtgMuCo2sbidWGLmfoniWj5DaHT/oL/NJnS8qvhEi2r9v8suylvDxjMLL9HK1RKA9cxn9k
 yOy826R2QqFADpZ59Nh44hxIoirKvryBxEHrlZXTbDiGzDklwku7E1zscbxl/A2r8B3tFrJCpbL6h
 +GwrltZuadjxOzUwUbowbFiz4N79XwDPKvQMQgZnzN0M4vSDZMpJBaBiqXGSCkFqkL95coA5ifBcF
 +V2O4nNbPt2mOZw0WpXwiy3ctPgK/8WC9TOmRtYU6cIojE5Z/LlO5Q1wU3c2//cggebLUp9I+6Yzu
 ETXiqku1cZXeGSi3W7qcEzuiM6mdIjzIt28oOtVZM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/9] 9pfs: readdir optimization
Date: Wed, 18 Dec 2019 13:05:29 +0100
Message-ID: <2173137.yh4lSEn6Y2@silver>
In-Reply-To: <20191218085937.53a59594@bahia.lan>
References: <E1ihMuX-00076B-Qf@lizzy.crudebyte.com>
 <20191218085937.53a59594@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.189.157.229
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

On Mittwoch, 18. Dezember 2019 08:59:37 CET you wrote:
> Hi Christian,
> 
> It seems that there was an issue with the posting of these series. Threading
> is inexistant. All the emails appear scattered and unsorted in my mailbox,
> between 12/16 and 12/18... which is a bit painful. I'll try to find some
> time to have a look anyway, but this greatly lowers the odds for these
> series to get multiple reviews, which seems problematic given the ** NOTE:
> ** section you've added to the cover. Please fix this.

Yeah, I accidentally dropped the --thread switch this night. Sorry for that.

If you want I can resend these patches as v2 or something? Like mentioned, 
except of fixing the threading, I won't have the time to do any more polishing 
in the next few weeks at least.

Best regards,
Christian Schoenebeck



