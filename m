Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EFB2F5D58
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:08 +0100 (CET)
Received: from localhost ([::1]:52104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzywF-0008D6-Ht
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 04:29:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kzyv4-0007OI-Is
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:27:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kzyv2-00083V-U2
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:27:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610616472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SVaaXxy4Bjas8E4/L1BceDrFZspcCRfIZ2yJyVoxkPI=;
 b=LyYvoRAo6p4Nwv3vadysHlp0Fpmmpz2tbDlspKxPHJbDPFTjQiWoCt2VGxwLbhWZQ1mwpa
 42oX64mk5rUvHjNfqXwvDYGFLSI8yazpZ2qzfhWzYMTAPXZ2Ll9dZOYOZ9/PFwgPyen+GY
 vI6ign8dqLDlaTA7rSJ27ulSvTD+xKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-mO_arQwmMbGwAVnzRoy_3w-1; Thu, 14 Jan 2021 04:27:48 -0500
X-MC-Unique: mO_arQwmMbGwAVnzRoy_3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 253E1800050;
 Thu, 14 Jan 2021 09:27:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA35E5D9DD;
 Thu, 14 Jan 2021 09:27:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 30D1218000B4; Thu, 14 Jan 2021 10:27:45 +0100 (CET)
Date: Thu, 14 Jan 2021 10:27:45 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Zihao Chang <changzihao1@huawei.com>
Subject: Re: [PATCH] vnc: fix unfinalized tlscreds for VncDisplay
Message-ID: <20210114092745.3nbmfxuqozjztxso@sirius.home.kraxel.org>
References: <20210111131911.805-1-changzihao1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210111131911.805-1-changzihao1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: oscar.zhangbo@huawei.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 11, 2021 at 09:19:11PM +0800, Zihao Chang wrote:
> In vnc_display_open(), if tls-creds is enabled, do object_ref(object
> ref 1->2) for tls-creds. While in vnc_display_close(), object_unparent
> sets object ref to 1(2->1) and  unparent the object for root.
> Problem:
> 1. the object can not be found from the objects_root, while the object
> is not finalized.
> 2. the qemu_opts of tls-creds(id: creds0) is not deleted, so new tls
> object with the same id(creds0) can not be delete & add.
> 
> Signed-off-by: Zihao Chang <changzihao1@huawei.com>

Added to UI patch queue.

thanks,
  Gerd


