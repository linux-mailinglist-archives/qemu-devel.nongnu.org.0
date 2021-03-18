Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945CF3403E5
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:52:10 +0100 (CET)
Received: from localhost ([::1]:53298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMqG9-0005Hp-LM
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lMqEC-00046B-6G
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:50:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lMqEA-0008Un-Ob
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616064606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zt17+p1jzY4+wlO4NpLfrOlxJtdQsoyr4Is53iGFfwI=;
 b=gbCPF8yZOCm0rHQLZSwuwXaGMJtLQhWYMlAjeL4qsm6OpfdlST131pbZyWOnaCTvDGeCmq
 p4wACaWEH9ZEMh5gjthEqVCgmRIrSZbEKrM4pefITqXQc7Oh8FP18LJbQ5g4Tf8doNrYly
 GtKIhPf00AR422GH8MP/fQQkRuEpTF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-I_8rgbesPciGI4gyubTFfg-1; Thu, 18 Mar 2021 06:50:04 -0400
X-MC-Unique: I_8rgbesPciGI4gyubTFfg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 510221009460;
 Thu, 18 Mar 2021 10:50:03 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-127.ams2.redhat.com [10.36.114.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F1C91A839;
 Thu, 18 Mar 2021 10:50:02 +0000 (UTC)
Date: Thu, 18 Mar 2021 11:50:00 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: Can not use hmp block_resize command with -blockdev option
Message-ID: <YFMwWFbRi6wNWFtG@merkur.fritz.box>
References: <CAAeqyDvGXBLRxB-KRe2QZH6SV7KKZp=oFQ3wQ_bdsUo1z1_rvw@mail.gmail.com>
 <ac58e1ea-6745-7e62-f8c2-68fceebe1c2d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ac58e1ea-6745-7e62-f8c2-68fceebe1c2d@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: zhao xiaojun <xiaojun.zhao141@gmail.com>, qemu-devel@nongnu.org,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.03.2021 um 23:49 hat John Snow geschrieben:
> On 3/16/21 11:43 PM, zhao xiaojun wrote:
> > Hi,
> > I use -blockdev option to specify a drive when qemu boot and i want to
> > resize it with hmp block_resize command. The hmp block_resize comand's
> > arguments: block_resize device new_size.
> > So I query the device by qmp query_block command, but the device filed
> > of the result output is NULL string.
> > 
> > result output:
> > {
> >    "return": [
> >      {
> >        "io-status": "ok",
> >        "device": "",
> >          ...
> > }
> > 
> > I noticed that the qmp block_resize command supports device or node-name
> > as argument.
> > 
> > If i can continue use the the hmp block_resize command with the device
> > argument?
> > 
> > Regards.
> 
> I'm not sure what you're asking: hmp's block_resize doesn't accept node-name
> arguments as you've found. Are you not able to use QMP's block_resize?

We should probably fix HMP block_resize to accept node names.

Kevin


