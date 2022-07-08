Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA49156BA19
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 14:53:19 +0200 (CEST)
Received: from localhost ([::1]:39854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9nTy-0006aI-IL
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 08:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o9nRw-0005uL-2k
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 08:51:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o9nRr-0001w5-JS
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 08:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657284666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mORBhYMes42rNo5YADPFkiCglpufZ5QMEgSovUXhW5o=;
 b=fVxCIUNfyYRQm/epNADkWSU61aUmm/N6ukoWWpJMxDCNU1p0BXNd2rMsnmD11RBO9jkNMY
 tLVoxNn1mg/eD3SpNVgKlENdpzMn1KioH8bFI3zaQ7hyih5nayE68hVmwaK50crqixttp/
 HtsA8u+thy++DZUKohPdx8T1iBBSe00=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-UdCkKbA6MpmtHBfC0Nv-7w-1; Fri, 08 Jul 2022 08:51:05 -0400
X-MC-Unique: UdCkKbA6MpmtHBfC0Nv-7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F223B38149B4;
 Fri,  8 Jul 2022 12:51:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A35B41121314;
 Fri,  8 Jul 2022 12:51:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 447AE21E690D; Fri,  8 Jul 2022 14:51:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>,  Liuxiangdong
 <liuxiangdong5@huawei.com>,  Harpreet Singh Anand <hanand@xilinx.com>,
 Eric Blake <eblake@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,  Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>,  "Gonglei (Arei)"
 <arei.gonglei@huawei.com>,  Zhu Lingshan <lingshan.zhu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC PATCH v9 23/23] vdpa: Add x-svq to NetdevVhostVDPAOptions
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-24-eperezma@redhat.com>
 <87ilo9igph.fsf@pond.sub.org>
 <CAJaqyWff6kfi6UAwvU64vj-q6CuncYBQnE4=P_3cGAGeL-rNVg@mail.gmail.com>
Date: Fri, 08 Jul 2022 14:51:03 +0200
In-Reply-To: <CAJaqyWff6kfi6UAwvU64vj-q6CuncYBQnE4=P_3cGAGeL-rNVg@mail.gmail.com>
 (Eugenio Perez Martin's message of "Fri, 8 Jul 2022 12:53:55 +0200")
Message-ID: <87let37op4.fsf@pond.sub.org>
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

Eugenio Perez Martin <eperezma@redhat.com> writes:

> On Thu, Jul 7, 2022 at 8:23 AM Markus Armbruster <armbru@redhat.com> wrot=
e:
>>
>> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
>>
>> > Finally offering the possibility to enable SVQ from the command line.
>>
>> QMP, too, I guess.
>>
>
> Hi Markus,
>
> I'm not sure what you mean. Dynamic enabling / disabling of SVQ was
> delayed, and now it's only possible to enable or disable it from the
> beginning of the run of qemu. Do you mean to enable SVQ before
> starting the guest somehow?

QMP command netdev_add takes a Netdev argument.  Branch 'vhost-vdpa' has
member x-svq.  Are you telling me it doesn't work there?  Or only before
the guest runs?

[...]


