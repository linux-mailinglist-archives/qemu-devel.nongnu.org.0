Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CD54F2BB6
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 13:18:10 +0200 (CEST)
Received: from localhost ([::1]:50694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbhCL-0000Pe-8I
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 07:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nbh59-0003TW-4j
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 07:10:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nbh56-0004zd-E9
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 07:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649157039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PA+6dUq+g45Fw6xKoiNzttttZED/DJNhnKzQqiHxzbU=;
 b=Om6m42s5NpyYSkJYl60FY/qzskn/MQ7QXta+dDJvI4GyImBO3IwDOD/pbXeHzU4U0+qSvv
 0RboAjtDwjKo7UaA9pCaRBdiDjoWSux8duwfmcvupnqLHcm6WUU5okWSrr3Sq0XWS4QgBk
 bpQxEAS/ujmMrlWrnSTeXUSCjMI+n3s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-pfSP0D4xMuiO4TSCdFjt_Q-1; Tue, 05 Apr 2022 07:10:38 -0400
X-MC-Unique: pfSP0D4xMuiO4TSCdFjt_Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4393E101AA4D
 for <qemu-devel@nongnu.org>; Tue,  5 Apr 2022 11:10:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17885402D8F;
 Tue,  5 Apr 2022 11:10:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AD54C1800916; Tue,  5 Apr 2022 13:10:36 +0200 (CEST)
Date: Tue, 5 Apr 2022 13:10:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Mauro Matteo Cascella <mcascell@redhat.com>
Subject: Re: [PATCH] display/qxl-render: fix race condition in qxl_cursor
 (CVE-2022-4207)
Message-ID: <20220405111036.7pik35u3ynln3luv@sirius.home.kraxel.org>
References: <20220405103505.106034-1-mcascell@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220405103505.106034-1-mcascell@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 05, 2022 at 12:35:05PM +0200, Mauro Matteo Cascella wrote:
> Avoid fetching 'width' and 'height' a second time to prevent possible
> race condition. Refer to security advisory
> https://starlabs.sg/advisories/22-4207/ for more information.
> 
> Fixes: CVE-2022-4207
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


