Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ED620520F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 14:11:52 +0200 (CEST)
Received: from localhost ([::1]:54994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnhmJ-0005M3-DS
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 08:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jnhXv-0000gK-Qr
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 07:56:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21942
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jnhXu-00052b-2F
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 07:56:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592913417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1QFzTS34iRNj6woSz6Clqghuwwrz+vCcPyQtTKpBFCQ=;
 b=I2yqVrtAISnP20KnUV3dSQQ/5fnW62JaUW3Ji7SG3LPI5ZMwxPTI9D6yYgGT3Weoo38EIA
 fL7NnZtbywMFXyipE/599bzYmHEy6fSM6x6PLObBlDDaAaKibeGAIVfM5+iSLD2TVo7HCO
 q6WLztyEU+b/tQqmuw7+em8p9Wu7d/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-Ep7oyi7BOlSyOciTOongaA-1; Tue, 23 Jun 2020 07:56:53 -0400
X-MC-Unique: Ep7oyi7BOlSyOciTOongaA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C255107ACCD;
 Tue, 23 Jun 2020 11:56:52 +0000 (UTC)
Received: from linux.fritz.box (ovpn-115-78.ams2.redhat.com [10.36.115.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B5F66EF8F;
 Tue, 23 Jun 2020 11:56:48 +0000 (UTC)
Date: Tue, 23 Jun 2020 13:56:46 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 0/2] qemu-storage-daemon: memory leak and --object opts
 fixes
Message-ID: <20200623115646.GB15708@linux.fritz.box>
References: <20200619101132.2401756-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200619101132.2401756-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 02:55:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.06.2020 um 12:11 hat Stefan Hajnoczi geschrieben:
> Small fixes for qemu-storage-daemon.

Thanks, applied to the block branch.

Kevin


