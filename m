Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E333B607597
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 13:04:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olppO-0004Ev-8L
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 07:04:38 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpgs-0001BE-TK
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1olpgl-0001Ad-By
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:55:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1olpgj-0006LN-Sp
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:55:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666349740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fL4PnehEm8f13PDLz7kiV4oIdcucSxynau12gJFqJSA=;
 b=CWq4ueXocTojoZ25G8nhze41Rj+G66jv1GjsakP0IZ6ufxgytb/kxkIABhD7YDwZdVmrbp
 m7L//HWpDc93wfAda35ptBYTGbEPRp1j9PNSqJLW3ERNtP0XsuikzuNnlwYtGFxm4noViI
 97uauPpdwUY+D/tRIrF6q9VFhMVCAtE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-1VDSkEuqP8Ka01rnX2mVLA-1; Fri, 21 Oct 2022 06:55:37 -0400
X-MC-Unique: 1VDSkEuqP8Ka01rnX2mVLA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A1F4811E75;
 Fri, 21 Oct 2022 10:55:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC052C5FEC0;
 Fri, 21 Oct 2022 10:55:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A5D6221E6936; Fri, 21 Oct 2022 12:55:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefano Brivio <sbrivio@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,  qemu-devel@nongnu.org,  Paul
 Durrant <paul@xen.org>,  Thomas Huth <thuth@redhat.com>,  =?utf-8?Q?Danie?=
 =?utf-8?Q?l_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,  "Dr. David Alan
 Gilbert"
 <dgilbert@redhat.com>,  Greg Kurz <groug@kaod.org>,  Stefano Stabellini
 <sstabellini@kernel.org>,  David Gibson <david@gibson.dropbear.id.au>,
 Eric Blake <eblake@redhat.com>,  xen-devel@lists.xenproject.org,
 "Michael S. Tsirkin" <mst@redhat.com>,  Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>,  Jason Wang <jasowang@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,  Anthony Perard
 <anthony.perard@citrix.com>,  Laine Stump <laine@redhat.com>
Subject: Re: [PATCH v13 17/17] net: stream: add QAPI events to report
 connection state
References: <20221020162558.123284-1-lvivier@redhat.com>
 <20221020162558.123284-18-lvivier@redhat.com>
 <87pmel4th4.fsf@pond.sub.org>
 <52e989b9-6f8d-99c6-ef04-3ce32006b002@redhat.com>
 <87lep935hn.fsf@pond.sub.org> <20221021114052.339f6aac@elisabeth>
Date: Fri, 21 Oct 2022 12:55:35 +0200
In-Reply-To: <20221021114052.339f6aac@elisabeth> (Stefano Brivio's message of
 "Fri, 21 Oct 2022 11:40:52 +0200")
Message-ID: <87o7u51m54.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefano Brivio <sbrivio@redhat.com> writes:

> [Cc: Laine, full quote]
>
> On Fri, 21 Oct 2022 11:12:20 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> Cc: Stefano Brivio
>> 
>> Laurent Vivier <lvivier@redhat.com> writes:
>> 
>> > On 10/21/22 07:48, Markus Armbruster wrote:  
>> >> Laurent Vivier <lvivier@redhat.com> writes:
>> >>   
>> >>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
>> >>> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.  
>> >>
>> >> Use cases?  
>> >
>> > This is asked by Stefano Brivio to allow libvirt to detect if connection to passt is lost and to restart passt.  
>> 
>> Let's add something like this to the commit message:
>> 
>>     This lets libvirt notice when the connection is lost somehow, and
>>     restart the peer (such as passt).
>> 
>> Who's working on the libvirt part?
>
> Laine Stump and myself. Nothing to show yet, though.

Good enough for me :)

[...]


