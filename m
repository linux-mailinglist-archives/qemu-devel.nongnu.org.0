Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070BF59BDB6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 12:41:41 +0200 (CEST)
Received: from localhost ([::1]:34898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ4sE-00020t-Rx
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 06:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oQ4oX-0004XN-Nb
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 06:37:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oQ4oV-0005sr-4N
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 06:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661164665;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uUTrh00bgEHpGs7nRNO5vMyuIxurMWYBrt+xlBIPMPk=;
 b=dePihds7QPmuu90Ct+IN1qp2bZ0RIaCJWebWL4MAftcweLzBc8g+wgw/PsSPPEyHUfNU0O
 dr3UGfwJEG3AOlKoTO6Dfx3G3kSWYgQGYS/gjajU2xZUL0l/MAKu/+hbpPW5E1UIhcgVIE
 VX+PKR1J8V6pX6EZpSkC9ZzwiwC0ZRA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2--Azir9f4MzaP2V3dW29Hvw-1; Mon, 22 Aug 2022 06:37:42 -0400
X-MC-Unique: -Azir9f4MzaP2V3dW29Hvw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C0F8101A54E;
 Mon, 22 Aug 2022 10:37:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E96C2166B26;
 Mon, 22 Aug 2022 10:37:40 +0000 (UTC)
Date: Mon, 22 Aug 2022 11:37:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] qemu-options: try and clarify preferred block
 semantics
Message-ID: <YwNccrTnnIfshz80@redhat.com>
References: <20220819174757.3551361-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220819174757.3551361-1-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 19, 2022 at 06:47:57PM +0100, Alex Bennée wrote:
> Try to correct any confusion about QEMU's Byzantine disk options by
> laying out the preferred "modern" options as-per:
> 
>  "<danpb> (best:  -device + -blockdev,  2nd obsolete syntax: -device +
>      -drive,  3rd obsolete syntax: -drive, 4th obsolete syntax: -hdNN)"

Hmm, i guess my numbering of obsolete syntaxes was off-by-1  as
I missed a "1st obsolete syntax" :-)

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: qemu-block@nongnu.org
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> ---
>  qemu-options.hx | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


