Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F74E248E08
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 20:36:05 +0200 (CEST)
Received: from localhost ([::1]:49464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k86Sq-00059Z-02
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 14:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1k86Ry-0004fv-Be
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 14:35:12 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:38095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1k86Rv-0007SP-Hm
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 14:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=jHswqOFl1IQcLDf8WMR19s5FKomkcxXrdfdxRjBNoyc=; b=QDCrLb1Ty4oPvu8yaD49ErZU74
 +hfYe7XiuQegt+yyrOHYnaGwJOf2uFjpXB7KLgwM8BYg8tuWIc5d3BYTNqZYUwBKGDeqKmMlGJiP7
 wa9LEkb7sg9fFf85lBK5DBk/3N41XUapHIDPWKEcOz5L2stkT7QxpHcBG2VV2hv+5T71YE/+O9RmC
 kccJO/bNPwk2/96WBBKKozRB2PWxgti4fjMJAj0laM4e4r7Bqg+nTYpemLEmFMTv8DYdFmdWhs4wL
 ZzpE+kfnJbpVxEEfZNPbB5onnsmT8FiyTRK8AqEy0DTjT0johprUbr4JPt9MwQWHWdlFrMRK6ixPq
 s/6rGoGw==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: David Vossel <dvossel@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
 Fabian Deutsch <fdeutsch@redhat.com>
Subject: Re: guest agent public ssh key add/remove support?
Date: Tue, 18 Aug 2020 20:35:02 +0200
Message-ID: <2310267.m5nKHIMqSz@silver>
In-Reply-To: <CAPjOJFsjqFg6jO==Y5ExhL2+mZXA0Z1vce2pmUCODLtyS6Z7Yw@mail.gmail.com>
References: <CAPjOJFsjqFg6jO==Y5ExhL2+mZXA0Z1vce2pmUCODLtyS6Z7Yw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 14:11:17
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 18. August 2020 15:25:56 CEST David Vossel wrote:
> - Guest Agent SSH add/remove Support?
> 
> As a PoC, I cobbled together some guest agent exec and file write client
> commands which can technically achieve the desired result of
> adding/removing entries in a /home/<user>/.ssh/authorized_keys file. It's a
> little unwieldy, but it works.
> 
> This got me thinking, an officially supported guest agent api for this ssh
> key management would be really nice. There's already a somewhat related
> precedent with the "guest-set-user-password" guest agent command.
> 
> So here's the question. What would you all think about the guest agent API
> being expanded with new commands for adding/removing ssh public keys from
> authorized_keys files?

There are two pass-through file systems in QEMU: 9pfs and virtiofs. Don't you 
think they would be sufficient for the use case?

Best regards,
Christian Schoenebeck



