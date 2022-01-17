Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94934909BD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 14:49:45 +0100 (CET)
Received: from localhost ([::1]:36884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9SOF-0005sx-N4
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 08:49:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n9Rq8-0002Vp-64
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:14:28 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:52695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n9Rq6-0006l9-9L
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:14:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:References:In-Reply-To:
 Content-ID:Content-Description;
 bh=vTEky9BDOStxKnCc6yQ5S2ylotdvRrWjvZ/HWT6LBQQ=; b=P+fsRJJnfX0aW0n3G6GrtW66/U
 dkyEQmsgvXAOk83vIxJ9yFmAocQ0tEsVAP7PeKWFRuTxjYEdruEfaPi93AnMAdopchoXO1vEm1o4M
 QKBIicfgdNU51pjPc9xcChH+9w6bicX2E5L4UOmAlyHkGEATHSwovqokbI5yeBfRthTb4AqAl0SmR
 +BOAGk79O2RBsVnVaSmR0VQ4wIWukPL9AgpzRe4+giZ8XMGCfPlQK/Kte3+It2nekGimW1j+dLQ1I
 lqYszh4bAClqhY4fdu1FkMzxUakmg8N8Wlyuw2P4oePFMrHBIFjg7yaAZCCUter+isQNdzToKYcZ2
 7pJ6dryd4FfRwC2ouNwnmpzQ9tgPDOd8vxaSlpoXW8vNBnk3MLYZ7VDq68Mg/P+i/0zbTBzFsxufR
 bJOOamW1vl8wyKTjVwB4cxlU/caYHPNsRTv16H0OkJRUSQKLUcS2OCPPzmFn7J5WFDOySt3d3DLzm
 C6A+KnPBmaf7nnJnXC9w8EAnR0jn1TNHA1Sg9dQuhTGeOWVNo0sCERnFq168qrv2j701dEGQ8Axgp
 WVC3PvSEPQFfONlPrwmucFWxIcLteFW/oio0l6/oVjlzoC7KyggwYj06yFGRYuy8SeJUog1yrnk0s
 rXNF811nRUb/7X1pQlszcVZN0Oei+Wf+0TvDJPJfo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: 9p root fs HOWTO
Date: Mon, 17 Jan 2022 14:14:21 +0100
Message-ID: <2785520.nJZE4KsnAZ@silver>
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

As I was still reading claims on the net that 9p was not usable for more 
complex use cases, I decided to write a complete HOWTO for installing and 
configuring an entire guest OS (with Debian 11 "Bullseye" as example) on top 
of 9p being guest's root fs:

https://wiki.qemu.org/Documentation/9p_root_fs

With this being setup this way, I am not encountering any issues no matter 
which software I am additionally installing and running.

Best regards,
Christian Schoenebeck





