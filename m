Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D31607491
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:58:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olond-0002Yy-ML
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:58:46 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloHl-00021P-9X
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oloHc-0001KL-C0
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:25:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oloHa-00056Z-VI
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:25:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666344338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VaQGscKtgUp3nraZrmMcM0BHS2JrPYu9HBDwy1VHC3w=;
 b=HSk1deG4v4l188e8AzRLdFV+vsVE6OHAQAfrEyNTn5nn6ukTvQ2Ro6xNFBraJCtEM9YEHw
 9fJHBvp+PDAg2McezbGY6hFkNY0vl+6n6uj4FEP4vbbMGE1PaD2Pgl7ivPWSaXmPk064JM
 m/8QaDqTwU+Ev4QvVA9qQTb1jtqames=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-snajutpmPkmx07O951NcVA-1; Fri, 21 Oct 2022 05:25:33 -0400
X-MC-Unique: snajutpmPkmx07O951NcVA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 909051C05B0F;
 Fri, 21 Oct 2022 09:25:33 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75AAA2166B2D;
 Fri, 21 Oct 2022 09:25:32 +0000 (UTC)
Date: Fri, 21 Oct 2022 11:25:31 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Bin Meng <bin.meng@windriver.com>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v6 1/2] block: Ignore close() failure in get_tmp_filename()
Message-ID: <Y1Jli6J5de4wpSGK@redhat.com>
References: <20221010040432.3380478-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010040432.3380478-1-bin.meng@windriver.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Am 10.10.2022 um 06:04 hat Bin Meng geschrieben:
> The temporary file has been created and is ready for use. Checking
> return value of close() does not seem useful. The file descriptor
> is almost certainly closed; see close(2) under "Dealing with error
> returns from close()".
> 
> Let's simply ignore close() failure here.
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Thanks, series applied to the block branch.

Kevin


