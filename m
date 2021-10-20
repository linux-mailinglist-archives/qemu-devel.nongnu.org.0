Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC78434787
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 11:01:47 +0200 (CEST)
Received: from localhost ([::1]:32886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md7Tl-0004yp-Bb
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 05:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1md7QG-0003W7-V2
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:58:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1md7QE-0003S4-Ou
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:58:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634720285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ns9ZaXPEoZS6V/jzfSPmX0Wo16OjRqos6vErXDbx/HM=;
 b=caW+N7vEBlrbvf6eyiQWec9BHybfwQ+GSLr1AtchDePdJccxcPixDeIROArpcVMyBUYrZ0
 aIcT+xGlZZ4LknFTc/pZpSaBoDIn6OTK8oczNUyzyz5lOuhGYPovPGFZmC7vq/0JrIyGZo
 VpxKDBQVshGDhOY66Ac2ps4agfdnEkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-mfhBXKvKOROlLcL9hf6T1g-1; Wed, 20 Oct 2021 04:58:02 -0400
X-MC-Unique: mfhBXKvKOROlLcL9hf6T1g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CFE4814247;
 Wed, 20 Oct 2021 08:58:01 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDDC31045E87;
 Wed, 20 Oct 2021 08:57:59 +0000 (UTC)
Date: Wed, 20 Oct 2021 10:57:58 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Samuel Thibault <samuel.thibault@gnu.org>
Subject: Re: [PATCH] ide: Cap LBA28 capacity announcement to 2^28-1
Message-ID: <YW/aFkIM67jtd28X@redhat.com>
References: <20210824104344.3878849-1-samuel.thibault@ens-lyon.org>
 <20211005235713.iodzsdcfazo6gtme@begin>
MIME-Version: 1.0
In-Reply-To: <20211005235713.iodzsdcfazo6gtme@begin>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: damien@zamaudio.com, John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.10.2021 um 01:57 hat Samuel Thibault geschrieben:
> Ping?
> 
> Samuel Thibault, le mar. 24 août 2021 12:43:44 +0200, a ecrit:
> > The LBA28 capacity (at offsets 60/61 of identification) is supposed to
> > express the maximum size supported by LBA28 commands. If the device is
> > larger than this, we have to cap it to 2^28-1.
> > 
> > At least NetBSD happens to be using this value to determine whether to use
> > LBA28 or LBA48 for its commands, using LBA28 for sectors that don't need
> > LBA48. This commit thus fixes NetBSD access to disks larger than 128GiB.
> > 
> > Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks, applied to the block branch. (I hope John doesn't have a problem
with me stealing this patch from his maintainership area.)

Kevin


