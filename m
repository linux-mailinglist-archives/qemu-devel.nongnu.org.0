Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24EF455D51
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:05:10 +0100 (CET)
Received: from localhost ([::1]:52166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mni2H-0003RH-TF
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:05:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mnhp9-0001J6-AK
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:51:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mnhp4-0005Nb-W2
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:51:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637243490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J+3ymuJau1WCrjRqEvBxBWVtBJh01Tn8okHuOz4y32M=;
 b=gsosL77jOKU3f3nhf6g8AV3a+EYO0A2IS/EQsjXtFoSxTYrYh1hnf9HLwVEgDwpSOCWb7V
 2Bon0UkixxLe4jAUePkeDVsgC8MjpkZ1SwmVl2ksrpMK0awCxw/njlbAnshyGyXji5LolA
 Kt76k9seBkMWw36r3s2IRTjXhpTYDsc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-aYenik42OoGv0kL7iGH4Dg-1; Thu, 18 Nov 2021 08:51:27 -0500
X-MC-Unique: aYenik42OoGv0kL7iGH4Dg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D71E19251A4;
 Thu, 18 Nov 2021 13:51:26 +0000 (UTC)
Received: from [10.39.192.245] (unknown [10.39.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D03960BF1;
 Thu, 18 Nov 2021 13:50:50 +0000 (UTC)
Message-ID: <a2891f6d-f383-f252-4b82-da08b2a2c1d7@redhat.com>
Date: Thu, 18 Nov 2021 14:50:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 00/25] block layer: split block APIs in global state
 and I/O
To: Hanna Reitz <hreitz@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <93821bd8-2ac0-a19e-7029-900e6a6d9be1@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <93821bd8-2ac0-a19e-7029-900e6a6d9be1@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 17:03, Hanna Reitz wrote:
> 
> I only really see four solutions for this:
> (1) We somehow make the amend job run in the main context under the BQL 
> and have it prevent all concurrent I/O access (seems bad)
> (2) We can make the permission functions part of the I/O path (seems 
> wrong and probably impossible?)
> (3) We can drop the permissions update and permanently require the 
> permissions that we need when updating keys (I think this might break 
> existing use cases)
> (4) We can acquire the BQL around the permission update call and perhaps 
> that works?
> 
> I don’t know how (4) would work but it’s basically the only reasonable 
> solution I can come up with.  Would this be a way to call a BQL function 
> from an I/O function?

I think that would deadlock:

	main				I/O thread
	--------			-----
	start bdrv_co_amend
					take BQL
	bdrv_drain
	... hangs ...

(2) is definitely wrong.

(3) I have no idea.

Would it be possible or meaningful to do the bdrv_child_refresh_perms in 
qmp_x_blockdev_amend?  It seems that all users need it, and in general 
it seems weird to amend a qcow2 or luks header (and thus the meaning of 
parts of the file) while others can write to the same file.

Paolo


