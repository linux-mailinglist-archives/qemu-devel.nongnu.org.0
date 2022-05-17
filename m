Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67F052A06A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 13:30:57 +0200 (CEST)
Received: from localhost ([::1]:43434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqvPk-0003NU-Cj
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 07:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqvEy-00036M-O5
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:19:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqvEv-0007wW-5U
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:19:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652786383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sb9iRzzn6Fjxft49RoYu0HjAbiO8zZCpnroABXOdKYY=;
 b=dAULOhhv/lv83p8AvfDPZAs/OPfbo3YCUX0c/y/1VmFA01Nhog/rA4qfzfRrPCjZStCI+M
 oD+nXsoe1XmB1Qxd6RdCMFEJDthnIziNWS/sjLdDpCLJvbI4ZAGU+f6D0+0tULb9hcF5hz
 ync43BuKZ5Ew2bkDYIBwJk1ModBSxEw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-9pvx6nvIP7KHDvP2JsuL1Q-1; Tue, 17 May 2022 07:19:42 -0400
X-MC-Unique: 9pvx6nvIP7KHDvP2JsuL1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34421299E765
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 11:19:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 892681121314;
 Tue, 17 May 2022 11:19:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7DCFF21E690D; Tue, 17 May 2022 13:19:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,  qemu-devel@nongnu.org,  Gerd Hoffmann
 <kraxel@redhat.com>,  Eric Blake <eblake@redhat.com>,
 libvir-list@redhat.com
Subject: Re: [PATCH 2/3] ui: Switch "-display sdl" to use the QAPI parser
References: <20220511175147.917707-1-thuth@redhat.com>
 <20220511175147.917707-3-thuth@redhat.com>
 <878rr77xpn.fsf@pond.sub.org>
 <870d24be-6c37-ff3d-616b-68255345ebb9@redhat.com>
 <a0c572b3-243a-2ee7-67c6-47744a5ac330@redhat.com>
Date: Tue, 17 May 2022 13:19:28 +0200
In-Reply-To: <a0c572b3-243a-2ee7-67c6-47744a5ac330@redhat.com> (Paolo
 Bonzini's message of "Tue, 17 May 2022 11:49:35 +0200")
Message-ID: <87zgjgqudb.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 5/17/22 10:34, Thomas Huth wrote:
>>> This remains, and that's fine.=C2=A0 One step at time.
>> Not sure how we want to proceed with that in the long run, though
>> ... IIRC clearly, Paolo once said that it doesn't really belong into=20
>> "-display" anyway and should be handled with the separate "-vnc"
>> option instead?
>
> Not me, Gerd
> (https://lore.kernel.org/all/20210825092023.81396-2-thuth@redhat.com/T/#e=
8c4f826cc8ff48b9afad37703e11704137f540c8):
>
>> Other way around, -display vnc should be dropped.  -display is about
>> local displays, and there can be only one instance.  -vnc / -spice
>> enable remote access, and this can be done in addition to a local
>> display.
>> not possible:
>>  -display gtk + -display sdl
>> possible:
>>  -display gtk + -vnc
>>  -display gtk + -vnc + -spice
>>  -display none + -vnc + -spice
>
> For what it's worth, Libvirt uses both -vnc and -spice, so we might
> very well proceed with Gerd's idea.  If we don't like -vnc and -spice
> then it may be possible to QOMify them and go with -object.

Are we ready to deprecate -display vnc?


