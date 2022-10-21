Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864846073F6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:25:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloGf-0008ME-M3
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:24:53 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oln7p-0004Wd-O9
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oln7O-0003sv-Vi
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:11:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oln7M-0000lT-6c
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666339835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tRDGNDwcvxtrmyBeq34sLEQgVoY7GCY8+p/lcGrM0MM=;
 b=hOykQI1jYC7yh3A4pmEOJ2MLL103E+kS4MyPTgWtnuJeBUCQasF+pjNO2iK2gt9H4UBngC
 GI324KiblWagCjoylRTUYNU7fmRJcBKbKg1/VOHy7bAZkejrqbJzj3UVocQ/G2CFBIudKq
 Ax6a1YrurRARtnB0uMmbvXtXcriQNY8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-eS0rTczZPT-P60j3I0j9ZA-1; Fri, 21 Oct 2022 04:10:31 -0400
X-MC-Unique: eS0rTczZPT-P60j3I0j9ZA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D098887400;
 Fri, 21 Oct 2022 08:10:31 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 238884B3FC6;
 Fri, 21 Oct 2022 08:10:29 +0000 (UTC)
Date: Fri, 21 Oct 2022 10:10:27 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Bin Meng <bin.meng@windriver.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "open list:vvfat" <qemu-block@nongnu.org>
Subject: Re: [PATCH  v3 12/26] block/vvfat: Unify the mkdir() call
Message-ID: <Y1JT86nFDeZ6fx8T@redhat.com>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-13-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221020115209.1761864-13-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.10.2022 um 13:51 hat Alex Bennée geschrieben:
> From: Bin Meng <bin.meng@windriver.com>
> 
> There is a difference in the mkdir() call for win32 and non-win32
> platforms, and currently is handled in the codes with #ifdefs.
> 
> glib provides a portable g_mkdir() API and we can use it to unify
> the codes without #ifdefs.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20221006151927.2079583-6-bmeng.cn@gmail.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


