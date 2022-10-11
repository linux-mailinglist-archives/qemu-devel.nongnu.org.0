Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2398A5FB433
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 16:07:04 +0200 (CEST)
Received: from localhost ([::1]:39592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiFuQ-0000yT-I7
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 10:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oiFLk-0008Ai-KA
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 09:31:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oiFLg-0007Ey-Cj
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 09:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665495067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qpoe1Hs4BeCKxOHJUDPgv41IWz3wpU1VUxKl0b6kU2g=;
 b=Ztlpykb7U3lVXRet5YEpFdBI73tCbtTGvZamfw+vpg9q/M7PPWR7WSuptzkrE7uFPn+i5+
 J0dPNxmHTlYiOSTGxY3cvwJx72uwCfrIbnMmOHQ/YOCNUrbyDtV/+Kf8c46j6PleAYegJv
 opdMF0toUNSFn516AYWS0vZXmqf9oUU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-_s3RlphLP5Wlp38QeCNvaA-1; Tue, 11 Oct 2022 09:31:04 -0400
X-MC-Unique: _s3RlphLP5Wlp38QeCNvaA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 691D4185A794;
 Tue, 11 Oct 2022 13:31:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15EE22166B26;
 Tue, 11 Oct 2022 13:31:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9E13B180093B; Tue, 11 Oct 2022 15:31:01 +0200 (CEST)
Date: Tue, 11 Oct 2022 15:31:01 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Geoffrey McRae <geoff@hostfission.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 00/12] audio: misc. improvements and bug fixes
Message-ID: <20221011133101.olhdhaahepeisk2t@sirius.home.kraxel.org>
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, Sep 23, 2022 at 08:34:58PM +0200, Volker Rümelin wrote:
> A series of audio improvements and fixes.
> 
> One note:
> 
> Patch 11/12 "audio: fix sw->buf size for audio recording":
> If this patch is applied without the patch series "[PATCH 0/2] audio:
> prevent a class of guest-triggered aborts" at
> https://lists.nongnu.org/archive/html/qemu-devel/2022-09/msg02347.html,
> issue #71 triggers a QEMU abort. Patch 11/12 is nevertheless correct.

Added to patch queue.

thanks,
  Gerd


