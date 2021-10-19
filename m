Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DCD433404
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 12:57:05 +0200 (CEST)
Received: from localhost ([::1]:40956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcmno-0004r0-RC
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 06:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mcmlt-0003X2-TF
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:55:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mcmlr-000494-DF
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634640902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6UQYMAnTo3GFLDghztdCQsVGTCmCmSGW1iH6vTHyns4=;
 b=Kjo8iy8vLDEDoURZDPgFnj9FiMng2jF4N1mO3VJFCyzlzcvfwfShvMhaANrnLaWFNsDGXr
 dJOfmTez8mGnlOPcnMQTWJroTOU7AfNkZ8T+ATv2iDA+daNP2H7qZK8ZPHMUziVVvCF03Y
 ZJ4Sojvb7/gxRQvam6YZX805wSO3BdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-Z_H7LPmqPmyIbxLq3VNmIg-1; Tue, 19 Oct 2021 06:55:01 -0400
X-MC-Unique: Z_H7LPmqPmyIbxLq3VNmIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F7E41006ACF
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 10:55:00 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B0B619C59;
 Tue, 19 Oct 2021 10:54:56 +0000 (UTC)
Date: Tue, 19 Oct 2021 12:54:54 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 0/2] failover: fix a regression introduced by
 JSON'ification of -device
Message-ID: <YW6j/sURMaQ/WIGs@redhat.com>
References: <20211019071532.682717-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019071532.682717-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.10.2021 um 09:15 hat Laurent Vivier geschrieben:
> Kevin's series "qdev: Add JSON -device" has introduced a regression
> in failover by removing the QemuOpts parameter.
> 
> This series fixes that (see PATCH 1) and also makes some cleanup
> in the hide_device function caller to remove the failover specific
> code from qdev_device_add_from_qdict() and clarify the fact that
> a primary device must have an id.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


