Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CE5E4D42
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 15:59:10 +0200 (CEST)
Received: from localhost ([::1]:60342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iO07R-0002cv-Rd
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 09:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37365)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1iNzyZ-00074Q-7M
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 09:50:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1iNzyX-0001Sj-3u
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 09:49:58 -0400
Received: from [192.146.154.1] (port=9418 helo=mcp01.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1iNzyW-0001S3-Ub
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 09:49:57 -0400
Received: from raphael-norwitz.user.nutanix.com (unknown [10.41.25.241])
 by mcp01.nutanix.com (Postfix) with ESMTP id CA3B3100785A;
 Fri, 25 Oct 2019 13:40:41 +0000 (UTC)
Date: Fri, 25 Oct 2019 06:40:41 -0700
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: mst@redhat.com
Subject: Long term approaches to mitigate device reset issue in vhost-user-scsi
Message-ID: <20191025134041.GC109271@raphael-norwitz.user.nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 192.146.154.1
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
Cc: qemu-devel@nongnu.org, felipe@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi MST,

We are trying to develop a long term fix to the following issue with
vhost-user-scsi:

When a live migration starts, Qemu sends a SET_VRING_ADDR message to
update the VQ's flags (turning log on). We can't distinguish that
message from the first SET_VRING_ADDR message sent after a device
reset (given that vhost-user backends are not notified about resets).
That distinction is important because we need to know whether to
refetch the used ring from guest memory.

A while back we sent a patch [1] (which we still use internally) to introduce a
message which tells vhost-user backends about device resets. No one
ever responded to that patch. They are getting clunky to maintain
and we would prefer to converge on a solution which is inline with
upstream.

[1] https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg05077.html

Vhost seems to support the concept of a reset through the reset_device
callback in the VhostOps struct. Currently, the vhost-user VhostOps
reset callback sends RESET_OWNER message.

The docs currently state, though, that this message is obsolete. Looking
at the history, I see change d1f8b30ec8dde0318fd1b98d24a64926feae9625
actually changed the message name to RESET_DEVICE, although it was
subsequently changed back to RESET_OWNER.

With this in mind, we think the code should be improved by:

1) Stopping qemu from sending the RESET_OWNER message on the
vhost-user device_reset callback.
2) Amending the docs to better align with the code.
3) If you agree with 1), adding a separate DEVICE_RESET message.

If you agree with 1) and 3) would you reconsider patch [1]? If so, I will
have to update the patch because the message/features numbers
are now taken. Should I update the patch and resend?

If you don't plan on stopping Qemu from sending RESET_OWNER,
I'd like to post a patch allowing vhost-user-scsi benefit from
the RESET_OWNER message (as it currently don't offer a device
reset callback).

Thanks,
Raphael

