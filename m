Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA97D5EECFB
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 07:04:12 +0200 (CEST)
Received: from localhost ([::1]:43512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odliV-0000Ro-Fc
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 01:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odlej-0006z0-TA
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 01:00:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odlee-0001Iz-Ei
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 01:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664427611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=13EC812OqoAlIkvPTtn8TWrLU5Hk9ePA8McjdAaF51M=;
 b=ZnD+4kqMVmhlffy4y+1ZCY3Q8x3D3/ShOXBtGReDHZxiQNA2iM8w7YASFfohNeN/vpSBVF
 0yP0907a8DgGHwh1jopLfXxGgJiD2GwOPEDg2FDk8JtOUb8LOiWb6nVb2SAWH3eFZOUNSi
 dqYQZWRiYDUh1M2wIEFIxAQAQw2UUKs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-wTUyEimAMoumlLz0yJU8Dw-1; Thu, 29 Sep 2022 01:00:06 -0400
X-MC-Unique: wTUyEimAMoumlLz0yJU8Dw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E177083394A;
 Thu, 29 Sep 2022 05:00:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D84940C6EC2;
 Thu, 29 Sep 2022 05:00:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4E77421E691D; Thu, 29 Sep 2022 07:00:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Kim, Dongwon" <dongwon.kim@intel.com>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,  "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>,  Gerd Hoffmann <kraxel@redhat.com>,  Daniel
 =?utf-8?Q?P=2EBerrang=C3=A9?= <berrange@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v1 0/3] ui/gtk: Add a new parameter to assign
 connectors/monitors to Guests' windows
References: <20220917000731.465003-1-vivek.kasireddy@intel.com>
 <87a66uhytr.fsf@pond.sub.org>
 <IA0PR11MB718538F0549024D9D66C2410F84C9@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pmfpfei8.fsf@pond.sub.org>
 <c18c0afd-9902-cf28-9249-b5df61deda96@intel.com>
Date: Thu, 29 Sep 2022 07:00:03 +0200
In-Reply-To: <c18c0afd-9902-cf28-9249-b5df61deda96@intel.com> (Dongwon Kim's
 message of "Wed, 28 Sep 2022 16:29:01 -0700")
Message-ID: <87tu4qvkq4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

"Kim, Dongwon" <dongwon.kim@intel.com> writes:

> Hi Markus,
>
> Vivek and I have discussed this already. I am fine with replacing my old series with this.

Good to know, thank you!


