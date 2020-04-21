Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3FF1B2C95
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Apr 2020 18:26:01 +0200 (CEST)
Received: from localhost ([::1]:32846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQvii-0006Q2-8l
	for lists+qemu-devel@lfdr.de; Tue, 21 Apr 2020 12:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54502)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1jQvh0-0004za-0u
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 12:24:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1jQvgz-0005Zn-Fc
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 12:24:13 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34975
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jQvgz-0005Z1-1I
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 12:24:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587486252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nD6Xgis+AtOMo5t38LdT8ti6K6xmbUZCGpzlp8PIipM=;
 b=KRcajJoqjjgcIVgn1ff3Ry4oC6iASRBWDl5ZboBGHqaK8Q0Hwemh4jDWznvWtCYT7kqomN
 1j94et8ztGgtl5gnZoTUwuAmz8BF7OU8QgCyxG/eFHRu+Xf82aAjsNNLVRzWZKmudggdjT
 bWONqR0jEkgizt9m31zzBMrXk9BdoZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-ksC5DvlDMRCgVxaqBWUYsw-1; Tue, 21 Apr 2020 12:24:10 -0400
X-MC-Unique: ksC5DvlDMRCgVxaqBWUYsw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F7A1107B7D4;
 Tue, 21 Apr 2020 16:24:09 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3E6F5C1B2;
 Tue, 21 Apr 2020 16:24:06 +0000 (UTC)
Message-ID: <62d6f58d5ce0ea62fda8b66e53563449e7ebe7cf.camel@redhat.com>
Subject: Re: [PATCH v2 00/16] nvme: refactoring and cleanups
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org
Date: Tue, 21 Apr 2020 19:24:05 +0300
In-Reply-To: <20200415130159.611361-1-its@irrelevant.dk>
References: <20200415130159.611361-1-its@irrelevant.dk>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 01:28:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Javier Gonzalez <javier.gonz@samsung.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2020-04-15 at 15:01 +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Changes since v1
> ~~~~~~~~~~~~~~~~
> * nvme: fix pci doorbell size calculation
>   - added some defines and a better comment (Philippe)
> 
> * nvme: rename trace events to pci_nvme
>   - changed the prefix from nvme_dev to pci_nvme (Philippe)
> 
> * nvme: add max_ioqpairs device parameter
>   - added a deprecation comment. I doubt this will go in until 5.1, so
>     changed it to "deprecated from 5.1" (Philippe)
> 
> * nvme: factor out property/constraint checks
> * nvme: factor out block backend setup
>   - changed to return void and propagate errors in proper QEMU style
>     (Philippe)
> 
> * nvme: add namespace helpers
>   - use the helper immediately (Philippe)
> 
> * nvme: factor out pci setup
>   - removed setting of vendor and device id which is already inherited
>     from nvme_class_init() (Philippe)
> 
> * nvme: factor out cmb setup
>   - add lost comment (Philippe)
> 
> 
> Klaus Jensen (16):
>   nvme: fix pci doorbell size calculation
>   nvme: rename trace events to pci_nvme
>   nvme: remove superfluous breaks
>   nvme: move device parameters to separate struct
>   nvme: use constants in identify
>   nvme: refactor nvme_addr_read
>   nvme: add max_ioqpairs device parameter
>   nvme: remove redundant cmbloc/cmbsz members
>   nvme: factor out property/constraint checks
>   nvme: factor out device state setup
>   nvme: factor out block backend setup
>   nvme: add namespace helpers
>   nvme: factor out namespace setup
>   nvme: factor out pci setup
>   nvme: factor out cmb setup
>   nvme: factor out controller identify setup
> 
>  hw/block/nvme.c       | 433 ++++++++++++++++++++++++------------------
>  hw/block/nvme.h       |  36 +++-
>  hw/block/trace-events | 172 ++++++++---------
>  include/block/nvme.h  |   8 +
>  4 files changed, 372 insertions(+), 277 deletions(-)
> 
Should I also review the V7 series or I should wait for V8 which will not include these cleanups?
Best regards,
	Maxim Levitsky


