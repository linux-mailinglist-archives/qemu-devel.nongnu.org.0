Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B7324663B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 14:22:44 +0200 (CEST)
Received: from localhost ([::1]:44248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7e9y-000453-8e
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 08:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k7e9C-0003dI-GM
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 08:21:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k7e9A-0005vr-14
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 08:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597666910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8U5MsYFGwKMXnKXDq2Mwe8WVIdzWbihbhKGx8FJKmI=;
 b=Tl16D4yBYLcuasmc8mrYer09P1jlhK2tdq38wOK4IUesRn7UGjQuM6QqstLtPu2a/n7OBI
 Y62UkLE8Lb2kDZBoEwDL1ClT30oG8b3k4fo7Oz0iZttWt4BokjM0hTMWJdpkJyBdS6UFjW
 idvduJ/hzMcBbmxglAfiYAWcxnc5G3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-GwsRCDpWMdSonvCLOc8cMw-1; Mon, 17 Aug 2020 08:21:48 -0400
X-MC-Unique: GwsRCDpWMdSonvCLOc8cMw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4445100CED1
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 12:21:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41E1C5D9D2;
 Mon, 17 Aug 2020 12:21:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D63601753B; Mon, 17 Aug 2020 14:21:35 +0200 (CEST)
Date: Mon, 17 Aug 2020 14:21:35 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 1/4] edid: use physical dimensions if available
Message-ID: <20200817122135.cmi2lfhoggsfpx3d@sirius.home.kraxel.org>
References: <20200817120056.56751-1-marcandre.lureau@redhat.com>
 <20200817120056.56751-2-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200817120056.56751-2-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 01:24:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 17, 2020 at 04:00:53PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Add width_mm/height_mm to qemu_edid_info, and use it if it is
> set (non-zero) to generate the EDID.

Any specific reason why you switch from dpi to xmm/ymm?

take care,
  Gerd


