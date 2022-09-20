Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9A55BE7CD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:58:16 +0200 (CEST)
Received: from localhost ([::1]:47634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oadlP-0000EO-S8
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oabIp-0000zr-2O
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 07:20:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oabIj-0006Zt-0f
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 07:20:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663672826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NSqyQOsJHufVTFgOdKHhYe604XvGa3LgfdXODHa1Q0k=;
 b=asH1+3z/dlElNSTBkNrhfb2i561ukQo7y69NbWTdfqOcfFWnETOLE3jeyxG/VqGbFDb+Xm
 NX5QLJvy6PTW19oj6WBv+X5uq/FTWQB4nIcZV3MHGHl4aJWIss6iLZu/fu4B/W8KP73ygG
 wEBqTTfVCE3tW+VrsEm8lgWLIgkudbI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-Plu-8_MhOlinyKCHJgnzMg-1; Tue, 20 Sep 2022 07:20:23 -0400
X-MC-Unique: Plu-8_MhOlinyKCHJgnzMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E70171C1BD29;
 Tue, 20 Sep 2022 11:20:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F03C40C6EC3;
 Tue, 20 Sep 2022 11:20:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 79DCB180039F; Tue, 20 Sep 2022 13:20:20 +0200 (CEST)
Date: Tue, 20 Sep 2022 13:20:20 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH v2 10/39] hw/usb: dev-mtp: Use g_mkdir()
Message-ID: <20220920112020.vkt45ifukj2asakk@sirius.home.kraxel.org>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-11-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920103159.1865256-11-bmeng.cn@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Tue, Sep 20, 2022 at 06:31:30PM +0800, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Use g_mkdir() to create a directory on all platforms.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>


