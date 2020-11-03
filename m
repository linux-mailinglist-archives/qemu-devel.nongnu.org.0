Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC492A4069
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 10:36:40 +0100 (CET)
Received: from localhost ([::1]:48864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZsk3-0000ou-Qs
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 04:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kZshr-0008DC-6t
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 04:34:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kZshp-0007Xk-A0
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 04:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604396060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pRv2+8OcrmO2oFwJgIlOcpbZBtq115/VHjU+TWrgje8=;
 b=JV4ld3FCOYLl+FFGG65YkXDgFTVKTE3/uUzniOx9rNEorVuxDAyZgj1f+w48hlXKPVoj/o
 EchdkG9cDlRBmrlhyq7Pa2cYf0JPzYl/LpWXGfw7Ykj8kozmF1tefooowTo4cNZu77T1gq
 Uysngy3bGck1DHvinOTHQEBp6Dc/DZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-krz3cIwBPSeUzNRcM-6AWA-1; Tue, 03 Nov 2020 04:34:18 -0500
X-MC-Unique: krz3cIwBPSeUzNRcM-6AWA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D634064169;
 Tue,  3 Nov 2020 09:34:17 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-164.ams2.redhat.com [10.36.113.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA2585B4AE;
 Tue,  3 Nov 2020 09:34:16 +0000 (UTC)
Date: Tue, 3 Nov 2020 10:34:14 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Tuguoyi <tu.guoyi@h3c.com>
Subject: Re: [PATCH] qemu-img: Make sure @sn_opts can be deleted in all error
 cases
Message-ID: <20201103093414.GC5509@merkur.fritz.box>
References: <6ff1c5d372944494be3932274f75485d@h3c.com>
MIME-Version: 1.0
In-Reply-To: <6ff1c5d372944494be3932274f75485d@h3c.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.11.2020 um 10:04 hat Tuguoyi geschrieben:
> @sn_opts is initialized at the beginning, so it should be deleted
> after jumping to the lable 'fail_getopt'
> 
> Signed-off-by: Guoyi Tu <tu.guoyi@h3c.com>

Thanks, applied to the block branch.

Kevin


