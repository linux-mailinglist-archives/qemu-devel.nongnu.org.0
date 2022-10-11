Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D58F5FB405
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 16:00:51 +0200 (CEST)
Received: from localhost ([::1]:48300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiFoO-0005Bq-Rx
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 10:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oiFR8-00057o-0j
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 09:36:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oiFR4-0008HM-Kn
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 09:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665495400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pm+pA4P5JNoZhwY7P/k970AtA1Znegfk6qJ4kZC85QE=;
 b=hsh3s885IFkj1I1ghXDy25oFxYYlGW8FVIiXhCzVqd2BJ+fr+lTATdKDbAC2RqBv0VxKAU
 BtEDq2ILnIobDCtomY/I93I10DRDlEURmaxJUUuhKZcmeJD4B//kRtJi+2UAQEC1i5eips
 yzienzwCIOJhlAz3AElAv392eDo4s6g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-6y2oYGRwMkmEmCFMk2PzvA-1; Tue, 11 Oct 2022 09:36:39 -0400
X-MC-Unique: 6y2oYGRwMkmEmCFMk2PzvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4428D3C01DF8;
 Tue, 11 Oct 2022 13:36:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF51E1111C60;
 Tue, 11 Oct 2022 13:36:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4F9EC1800082; Tue, 11 Oct 2022 15:36:37 +0200 (CEST)
Date: Tue, 11 Oct 2022 15:36:37 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: qemu-devel@nongnu.org, tangpeng@qianxin.com
Subject: Re: [PATCH] ui/vnc-clipboard: fix integer underflow in
 vnc_client_cut_text_ext
Message-ID: <20221011133637.f56bj4btaqirl64c@sirius.home.kraxel.org>
References: <20220925204511.1103214-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220925204511.1103214-1-mcascell@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Sun, Sep 25, 2022 at 10:45:11PM +0200, Mauro Matteo Cascella wrote:
> Extended ClientCutText messages start with a 4-byte header. If len < 4,
> an integer underflow occurs in vnc_client_cut_text_ext. The result is
> used to decompress data in a while loop in inflate_buffer, leading to
> CPU consumption and denial of service. Prevent this by checking dlen in
> protocol_client_msg.
> 
> Fixes: CVE-2022-3165
> Fixes: 0bf41cab93e5 ("ui/vnc: clipboard support")
> Reported-by: TangPeng <tangpeng@qianxin.com>
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>

Added to queue.

thanks,
  Gerd


