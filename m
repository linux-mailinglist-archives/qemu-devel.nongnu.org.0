Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DC869DEDF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:33:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQt7-0004zI-5S; Tue, 21 Feb 2023 06:32:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pUQt5-0004vU-Me
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:32:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pUQt4-00061q-CL
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676979165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=86mGxHc6egLEXG/BPbm2C/s9W7xW4SV4IdHXWPFuQYQ=;
 b=DUeS+fD84/UKXabqlo1afgMLL7KCG4XCh9abWImWqCcZ4DAeFl7/hnoEafSKjXyHgzZkNk
 ekkGfEOVD3io+V3jgY8qO+rsuflXe2Mq0276IkqchCQnxg4eEdoWJnNcPug+IKIexvtquz
 BeyuNkqusG+J/6JRUa2vk5MkLTEJRZY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-3QrQvUYAPNqrJlPucj9TfA-1; Tue, 21 Feb 2023 06:32:44 -0500
X-MC-Unique: 3QrQvUYAPNqrJlPucj9TfA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05C0F858F09;
 Tue, 21 Feb 2023 11:32:44 +0000 (UTC)
Received: from redhat.com (dhcp-192-225.str.redhat.com [10.33.192.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35F1C1121314;
 Tue, 21 Feb 2023 11:32:43 +0000 (UTC)
Date: Tue, 21 Feb 2023 12:32:41 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, qemu-block@nongnu.org
Subject: Re: [PATCH] hw/ide/ahci: trace ncq write command as write instead of
 read
Message-ID: <Y/Sr2dkBcOMbO3uP@redhat.com>
References: <20230217103130.42077-1-f.ebner@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217103130.42077-1-f.ebner@proxmox.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 17.02.2023 um 11:31 hat Fiona Ebner geschrieben:
> Fixes: e4baa9f00b ("AHCI: Replace DPRINTF with trace-events")
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


