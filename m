Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789E8476ED2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:26:11 +0100 (CET)
Received: from localhost ([::1]:48296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnxi-0006hc-0B
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:26:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxnvw-0005vE-A6
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:24:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxnvu-00058Q-Hn
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:24:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639650258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=db5InbVjEdDVlvNi8d2C0RSPrKq4CX2cT67mg/FgUMQ=;
 b=avhXeePTRxjJT1/fVCC9FzU3FTtn/DEakJO2Jar3zc73ErI1CKcbzuGO3F+FJ8aGbD6Foq
 NUlSYaj8umQP1lWt2ZUjwMDv4PcIRCzrapScDrMc0T5uNOt3t0m1x99ab2c1E8iav4mxF9
 6xmqmx+dD2gfyjlDcm0YoZbb8lArwas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-QWqcrwASPnqpeKqbaeR4TQ-1; Thu, 16 Dec 2021 05:24:15 -0500
X-MC-Unique: QWqcrwASPnqpeKqbaeR4TQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBDBA18C8C00;
 Thu, 16 Dec 2021 10:24:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE60C7A437;
 Thu, 16 Dec 2021 10:23:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 586B6113865F; Thu, 16 Dec 2021 11:23:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v10 3/3] cpus-common: implement dirty page limit on
 virtual CPU
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <cover.1639479557.git.huangy81@chinatelecom.cn>
 <d54bfe75d5d64e64a21bda977d40f62579cd0222.1639479557.git.huangy81@chinatelecom.cn>
 <874k7anwtc.fsf@dusky.pond.sub.org>
 <4397f17c-4431-8480-127b-4228271523c8@chinatelecom.cn>
 <Ybmiw59Qh3sHukyh@xz-m1.local> <87y24m2df7.fsf@dusky.pond.sub.org>
 <YbrbQYiEMGz864aB@xz-m1.local>
 <a6dc86b7-29c2-fa08-ad16-017d8b1301d9@chinatelecom.cn>
Date: Thu, 16 Dec 2021 11:23:37 +0100
In-Reply-To: <a6dc86b7-29c2-fa08-ad16-017d8b1301d9@chinatelecom.cn> (Hyman
 Huang's message of "Thu, 16 Dec 2021 17:16:55 +0800")
Message-ID: <877dc4yhjq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hyman Huang <huangy81@chinatelecom.cn> writes:

[...]

> So the final format of qmp we conclude are:
>
> case 1: setup vcpu 0 dirty page limit 100MB/s
> set-vcpu-dirty-limit cpu-index=0 dirty-rate=100
>
> case 2: setup all vcpu dirty page limit 100MB/s
> set-vcpu-dirty-limit dirty-rate=100
>
> case 3: cancel vcpu 0 dirty page limit
> cancel-vcpu-dirty-limit cpu-index=0
>
> case 4: cancel all vcpu dirty page limit
> cancel-vcpu-dirty-limit
>
> case 5: query limit infomatioin of all vcpu enabled
> query-vcpu-dirty-limit
>
> And the corresponding hmp format keep the same style:
>
> Is there any advice? :)

Looks okay to me.


