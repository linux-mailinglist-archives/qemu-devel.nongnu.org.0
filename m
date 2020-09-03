Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAD025BF15
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 12:28:32 +0200 (CEST)
Received: from localhost ([::1]:49724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDmTn-0005cl-M2
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 06:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDmSL-0004el-Vj
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 06:27:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23466
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDmSK-0008M5-A2
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 06:27:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599128819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VwOuVD+urA2C4M2s0U54fmAH6KZ9ln/lRI462xBA4DU=;
 b=JZ5r8Ucaf9Va6pefbxGKCM4VD2TE/AooOezLbD0CxCW0uv4L9xY8SbYHqKMcbg2CFmvPwb
 VOx9ECguFNf2YujoTZkX0hXhX84oTUlRNgSXjK22jA1OB7NZhJqMuWvj5u42aL/miuurEu
 vO7LCuw8PXfbWNcZPtgC7U8CY3/aaYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-ef6AOMXKNDKolJ_rP82WCw-1; Thu, 03 Sep 2020 06:26:56 -0400
X-MC-Unique: ef6AOMXKNDKolJ_rP82WCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58D3781CAFA;
 Thu,  3 Sep 2020 10:26:55 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E13888D5C;
 Thu,  3 Sep 2020 10:26:54 +0000 (UTC)
Subject: Re: [PATCH] stubs: Move qemu_fd_register stub to util/main-loop.c
To: luoyonggang@gmail.com
References: <20200903054503.425435-1-thuth@redhat.com>
 <CAE2XoE85T-BcpDqKSO7Buc8MxSZ-jsQEV+8BsTXoShHz=eOwDw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c702d97e-d8da-29b8-a79f-f43e931ee2a5@redhat.com>
Date: Thu, 3 Sep 2020 12:26:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE85T-BcpDqKSO7Buc8MxSZ-jsQEV+8BsTXoShHz=eOwDw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 00:24:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.324, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/2020 09.08, 罗勇刚(Yonggang Luo) wrote:
> I am also facing some problem alike:
> 
>   LINK    tests/test-qdev-global-props.exe
>   LINK    tests/test-timed-average.exe
> C:/CI-Tools/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/10.2.0/../../../../x86_64-w64-mingw32/bin/ld.exe:
> libqemuutil.a(util_main-loop.c.obj): in function `qemu_notify_event':
> C:\work\xemu\qemu-build/../qemu/util/main-loop.c:139: multiple
> definition of `qemu_notify_event';
> libqemuutil.a(stubs_notify-event.c.obj):C:\work\xemu\qemu-build/../qemu/stubs/notify-event.c:6:
> first defined here

For the qemu_notify_event, I also got a patch here:

 https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg00724.html

I just saw that you also posted a patch ... but I think the whole file
can be removed, not only the function, so maybe you could replace your
patch with mine in your series?

Thanks,
  Thomas



