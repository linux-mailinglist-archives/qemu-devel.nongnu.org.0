Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0363D3B15C4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 10:22:03 +0200 (CEST)
Received: from localhost ([::1]:43596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvy94-0007aO-3f
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 04:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvy5R-00037g-O8
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 04:18:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvy5P-0001lb-I7
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 04:18:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624436294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yLY+e9wZ22Y2li6zxUFrcRDmJ6mejoRiPcBxDwdTHMw=;
 b=dBnDloTxTGq7+ScmE9bEQRT3LGXS0T5TxNQV1ZMJ4dYk7ZBCDh+tcxNq1eFmQRkPFsgeOy
 XWybRHLSOCYMqLMcQBNOxjT5OzufAXR64c9MCtAve4+7wte8k4gGC6xX5HFf9C/1NkmQvw
 8y6Zh+wtGujbl+zb4I6zRWn7Qqep0JY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-u32AksVMONKkQBQM51Y-8g-1; Wed, 23 Jun 2021 04:18:13 -0400
X-MC-Unique: u32AksVMONKkQBQM51Y-8g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBC69804143;
 Wed, 23 Jun 2021 08:18:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A644110246F1;
 Wed, 23 Jun 2021 08:18:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7956918007AD; Wed, 23 Jun 2021 10:18:09 +0200 (CEST)
Date: Wed, 23 Jun 2021 10:18:09 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v3 5/5] virtio-gpu: Add gl_flushed callback
Message-ID: <20210623081809.545vppehnfulpk52@sirius.home.kraxel.org>
References: <20210621192425.1188442-1-vivek.kasireddy@intel.com>
 <20210621192425.1188442-6-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210621192425.1188442-6-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 12:24:25PM -0700, Vivek Kasireddy wrote:
> Adding this callback provides a way to resume the processing of
> cmds in fenceq and cmdq that were not processed because the UI
> was waiting on a fence and blocked cmd processing.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


