Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BB6690604
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 12:03:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ4gP-0005Y9-Lb; Thu, 09 Feb 2023 06:01:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ4gH-0005XQ-18
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 06:01:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ4gF-0005iK-DJ
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 06:01:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675940490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vc0DSMnZaEmx4Ba1MZHPgqAwccXFxgxiLCcfbi3VRYg=;
 b=MlxAd4DZMEdPvIzOPvYxw6zlK80SzqE3/bNhq5GcHVFkdJUgOJVs6/em2HtcxQq78eEM4d
 EePmxocKcJ48s7J64AjLX4qicj4I6DC6SYccv3Hqpbm/OUapcvttQq57omFaQZJHURdn+a
 qBuoGBU/hH/93RjRwouNKEmez1pwpYE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-i0C8-PPmN_CTg5EcThKN2w-1; Thu, 09 Feb 2023 06:01:19 -0500
X-MC-Unique: i0C8-PPmN_CTg5EcThKN2w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60B0D3C0F675;
 Thu,  9 Feb 2023 11:01:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27D3B400DB1E;
 Thu,  9 Feb 2023 11:01:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 98D0921E6A1F; Thu,  9 Feb 2023 12:01:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,  Pierre Morel
 <pmorel@linux.ibm.com>,  qemu-s390x@nongnu.org,  qemu-devel@nongnu.org,
 borntraeger@de.ibm.com,  pasic@linux.ibm.com,
 richard.henderson@linaro.org,  david@redhat.com,  thuth@redhat.com,
 cohuck@redhat.com,  mst@redhat.com,  pbonzini@redhat.com,
 kvm@vger.kernel.org,  ehabkost@redhat.com,  marcel.apfelbaum@gmail.com,
 eblake@redhat.com,  armbru@redhat.com,  seiden@linux.ibm.com,
 nrb@linux.ibm.com,  frankja@linux.ibm.com,  clg@kaod.org
Subject: Re: [PATCH v15 10/11] qapi/s390x/cpu topology: CPU_POLARITY_CHANGE
 qapi event
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-11-pmorel@linux.ibm.com>
 <5b26ee514ccbbfaf5670cbf0cb006d8e706fe5ae.camel@linux.ibm.com>
 <Y+TFRNoOAfZ7QTvp@redhat.com>
Date: Thu, 09 Feb 2023 12:01:16 +0100
In-Reply-To: <Y+TFRNoOAfZ7QTvp@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 9 Feb 2023 10:04:52 +0000")
Message-ID: <87mt5n5chv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Feb 08, 2023 at 06:35:39PM +0100, Nina Schoetterl-Glausch wrote:

[...]

>> I also wonder if you should add 'feature' : [ 'unstable' ].
>> On the upside, it would mark the event as unstable, but I don't know wha=
t the
>> consequences are exactly.
>
> The intention of this flag is to allow mgmt apps to make a usage policy
> decision.
>
> Libvirt's policy is that we'll never use features marked unstable.
>
> IOW, the consequence of marking it unstable is that it'll likely
> go unused until the unstable marker gets removed.
>
> Using 'unstable' is useful if you want to get complex code merged
> before you're quite happy with the design, and then iterate on the
> impl in-tree. This is OK if there's no urgent need for apps to
> consume the feature. If you want the feature to be used for real
> though, the unstable flag is not desirable and you need to finalize
> the design.

Another use of 'unstable' is debugging aids.  Making these stable can be
plenty of pain for precious little gain.

[...]


