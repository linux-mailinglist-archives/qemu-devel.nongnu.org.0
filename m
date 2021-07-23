Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A2E3D3804
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 11:47:17 +0200 (CEST)
Received: from localhost ([::1]:48650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6rm0-0002PA-3d
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 05:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6rl6-0001jM-Uw
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 05:46:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6rl4-0007PT-IY
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 05:46:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627033577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9HgamgFluq47Bc5OqZJKTeT+KbYTavRqzCOIvXlzbqc=;
 b=NaiTzmGwtTPllsEWzBtRC+xZNfB345D2ZGknRwXrXDZp/C7q5eZ5Ofm8wtg1K+fXWrO50Z
 mj2XDJQVY7fkrsd36bjCemz4Oc4/DIi+e5Fvo8ngpmatposEHyEXuJ1wrTRT422i7C1dzE
 Kygl4Y564MchufGvtESo28ayp3m2LQw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-oKnLiQGBOTmLGa_zv2Kx0g-1; Fri, 23 Jul 2021 05:46:16 -0400
X-MC-Unique: oKnLiQGBOTmLGa_zv2Kx0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43529CC624
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 09:46:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07BC93AC1;
 Fri, 23 Jul 2021 09:46:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6BF7018000A3; Fri, 23 Jul 2021 11:46:13 +0200 (CEST)
Date: Fri, 23 Jul 2021 11:46:13 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/2] qxl: remove assert in qxl_pre_save.
Message-ID: <20210723094613.zyhljyfhnb5kl2xv@sirius.home.kraxel.org>
References: <20210721093347.338536-1-kraxel@redhat.com>
 <20210721093347.338536-2-kraxel@redhat.com>
 <YPmEZnBuCMwXq98p@work-vm>
 <20210723063233.ktjex5knfgz77pbq@sirius.home.kraxel.org>
 <13c8a40f-a879-a981-12f0-36a5289b39b1@redhat.com>
 <20210723065527.glqc44gyga2lnqyc@sirius.home.kraxel.org>
 <0196b381-47ca-fb37-d809-e2a25f3c677e@redhat.com>
 <87im11beuw.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87im11beuw.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> >> Migration fails and you want know why.
> >> 
> >> Reason migration fails is the guest violates qxl specs (which doesn't
> >> cause actual problems unless you want migrate the guest).
> >
> > Then I agree error_report() is better ("Report an error to the current
> > monitor if we have one, else stderr").
> 
> No good for QMP, I'm afraid.
> 
> error_report() reports to stderr in QMP monitor context.  To get an
> error to the QMP client, you need to use error_setg() and propagate all
> the way to the QMP core.
> 
> Back to the patch.  If the thing we report is actually an *error*,
> i.e. something that makes migration fail, then the QMP failure will
> contain an error message.  That error must come from further up the call
> stack.  If it's good enough, we don't need error_report() here.  Else,
> we should error_setg() here.

Caller is here (migration/vmstate.c):

int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
                         void *opaque, JSONWriter *vmdesc, int version_id)
{
    [ ... ]
    if (vmsd->pre_save) {
        ret = vmsd->pre_save(opaque);
        trace_vmstate_save_state_pre_save_res(vmsd->name, ret);
        if (ret) {
            error_report("pre-save failed: %s", vmsd->name);
            return ret;
        }
    }
    [ ... ]
}

No error_setg() anywhere close, it's error_report() all over the place.
I guess that makes adding error_report() the only short-term (aka 6.1)
option.

take care,
  Gerd


