Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698C22F0DDF
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 09:21:41 +0100 (CET)
Received: from localhost ([::1]:50358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kysSJ-0006de-5t
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 03:21:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kysRP-00068k-P6
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 03:20:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kysRN-0001Vm-4f
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 03:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610353238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KjiTyONmzHxywRhkp6ecVeafGzBNCSE6Gc1zxWLw+FI=;
 b=Xy0yqeHkk5o3bVSIlsHhUl59iE46R012Uo+e1noptcVxx2cSiituCQckAw/MPcH7pDbJHI
 RIHSUBf/S6FpKIxcKxHKR61HW6aPDwP/cFhDCf0t0DQMYynKmEp7Hfz8ZKNYU7AA2CWKvr
 eCX+NBcuk1L61M7mFw/8WHtUP1MUW50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61--RsQtV1ONwqW2yHo0hcgLQ-1; Mon, 11 Jan 2021 03:20:37 -0500
X-MC-Unique: -RsQtV1ONwqW2yHo0hcgLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B72581005D56;
 Mon, 11 Jan 2021 08:20:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-197.ams2.redhat.com
 [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66F317444F;
 Mon, 11 Jan 2021 08:20:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 71CE1180009A; Mon, 11 Jan 2021 09:20:33 +0100 (CET)
Date: Mon, 11 Jan 2021 09:20:33 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Zihao Chang <changzihao1@huawei.com>
Subject: Re: [PATCH] vnc: add qmp to support change authz
Message-ID: <20210111082033.2izlpltm7gi5o5fa@sirius.home.kraxel.org>
References: <20210107124657.650-1-changzihao1@huawei.com>
 <20210107160410.bh27ibafc2szsayh@sirius.home.kraxel.org>
 <9b83b14a-61b1-d638-8924-af5ed32c55a3@huawei.com>
MIME-Version: 1.0
In-Reply-To: <9b83b14a-61b1-d638-8924-af5ed32c55a3@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: oscar.zhangbo@huawei.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> >> +{ 'command': 'change-vnc-authz',
> >> +  'data': { 'type' : 'str',
> >> +            'index': 'str'},
> >> +  'if': 'defined(CONFIG_VNC_SASL)' }
> > 
> > type should be an enum I think.
> It is a good idea to set type to enum, I will fix it in the next version.
> 
> > Also index should be an int (and possibly an optional argument so you
> > can just not specify index to unset).
> > 
> Index is the id of authz object(myauthz, user can set it as they wanted), may not use int.
> -object authz-simple,id=myauthz,identity=test1

Name it "auth-id" then?  "index" sounds like a number ...

> BTW, Daniel P . Berrangé suggests that all property set QMP commands should be integrated
> as an general purpose "display_update" QMP command. That's really a good idea.

Makes sense indeed.

take care,
  Gerd


