Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24D738AF85
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 15:02:34 +0200 (CEST)
Received: from localhost ([::1]:50270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljiJt-00079Z-9L
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 09:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ljiIJ-0006Pm-ST
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:00:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ljiIG-0004XN-Qt
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:00:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621515651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Afy/lb29QywDRupATyag7e5UlojXal6p1BTCS6yI78=;
 b=WhX7Cb2InUi7iqazmxBkRLpJqL2v/SA/nj1BEzAWxdbZBWIZiJwj+VtnDolBD1YQa/AfPC
 4MlxJkizlxuQ3K3Vrld2wT3AUJb9e+TOLb0o8EvhtnuD/qU7WLZgo4raSh3ystD6yf2BE8
 Pnw2jAcvVGP2duRvgjDa2LznRdnC8o4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-ujZxGe-UPLy61kH5rliBVg-1; Thu, 20 May 2021 09:00:48 -0400
X-MC-Unique: ujZxGe-UPLy61kH5rliBVg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC70979ECE;
 Thu, 20 May 2021 13:00:39 +0000 (UTC)
Received: from work-vm (ovpn-115-44.ams2.redhat.com [10.36.115.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AD1819C71;
 Thu, 20 May 2021 13:00:36 +0000 (UTC)
Date: Thu, 20 May 2021 14:00:33 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V3 00/22] Live Update [reboot]
Message-ID: <YKZdcSt0ltCBqVsz@work-vm>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
 <4d3dd5ff-5180-16df-ab48-11de610dd396@oracle.com>
 <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
 <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com>
 <YKOPnkefxgRZ8PoQ@work-vm>
 <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com>
 <YKQULUn5F+x1wrYI@work-vm>
 <38dc91ab-b96b-1cc3-bf8b-84ff77b334fd@oracle.com>
MIME-Version: 1.0
In-Reply-To: <38dc91ab-b96b-1cc3-bf8b-84ff77b334fd@oracle.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Steven,
  I'd like to split the discussion into reboot and restart,
so I can make sure I understand them individually.

So reboot mode;
Can you explain which parts of this series are needed for reboot mode;
I've managed to do a kexec based reboot on qemu with the current qemu -
albeit with no vfio devices, my current understanding is that for doing
reboot with vfio we just need some way of getting migrate to send the
metadata associated with vfio devices if the guest is in S3.

Is there something I'm missing and which you have in this series?

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


