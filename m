Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5BA6C652D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 11:34:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfIGa-00060g-La; Thu, 23 Mar 2023 06:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfIGY-00060W-BX
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 06:33:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfIGW-0000px-Us
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 06:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679567631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IuNcbmu2Pf7ow1UKPuRpwa9IxXTbbF/Hl4UXBzFtKfU=;
 b=Nm5tYFaCz3xwHhNeObCYb0fQg7z/L/uFOKA7LN1zSh2sLqt/0SDVf3Dw6G+BXOg8AbL9p9
 HZWYYBlGSrgFYW6XkTPfVtsnaH3dEqFqfTledazc6zXZvcax5Fd7Mq7c4mFbtxUXFxLBIs
 bYUdAU7tcbXk9noMHXFE2Xu0mlMF+vg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-4UUs5tZdMaaczQ3Tag3G-g-1; Thu, 23 Mar 2023 06:33:50 -0400
X-MC-Unique: 4UUs5tZdMaaczQ3Tag3G-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57235185A78F;
 Thu, 23 Mar 2023 10:33:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 378B42027041;
 Thu, 23 Mar 2023 10:33:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DBC0521E6926; Thu, 23 Mar 2023 11:33:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Cc: qemu-devel@nongnu.org,  Peter Xu <peterx@redhat.com>,  David Alan
 Gilbert <dgilbert@redhat.com>
Subject: Re: QMP command set-vcpu-dirty-limit hangs
References: <87fs9w2c0x.fsf@pond.sub.org>
 <94f4538d-a6e1-1f6d-5371-09942ba39539@chinatelecom.cn>
Date: Thu, 23 Mar 2023 11:33:46 +0100
In-Reply-To: <94f4538d-a6e1-1f6d-5371-09942ba39539@chinatelecom.cn> (Hyman
 Huang's message of "Thu, 23 Mar 2023 18:02:48 +0800")
Message-ID: <87r0tfzrhx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hyman Huang <huangy81@chinatelecom.cn> writes:

> =E5=9C=A8 2023/3/23 14:54, Markus Armbruster =E5=86=99=E9=81=93:
>> Watch this:
>>      $ qemu-system-x86_64 -S -display none -qmp stdio -accel kvm,dirty-r=
ing-size=3D1024
>>      {"QMP": {"version": {"qemu": {"micro": 90, "minor": 2, "major": 7},=
 "package": "v8.0.0-rc0-15-g918ee397b6-dirty"}, "capabilities": ["oob"]}}
>>      {"execute": "qmp_capabilities"}
>>      {"return": {}}
>>      {"execute": "set-vcpu-dirty-limit","arguments": {"dirty-rate": 200}}
>> Hangs.
>> If I'm using it incorrectly (I have no idea), it should fail, not hang.
> Indeed, it seems that the command syntax is right.

No, it isn't, the closing brace is missing.  Ignore me while I look for
a place to hide!

[...]


