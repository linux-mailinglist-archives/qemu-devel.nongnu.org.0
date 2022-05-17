Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2722529B60
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 09:48:33 +0200 (CEST)
Received: from localhost ([::1]:38154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqrwW-0006nf-SI
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 03:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqrub-00066N-Cc
 for qemu-devel@nongnu.org; Tue, 17 May 2022 03:46:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqruY-0002nE-93
 for qemu-devel@nongnu.org; Tue, 17 May 2022 03:46:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652773588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gcoTkf7/I5HskQ2yajloHlxiIFE5T+xA4QWPCjwPIDY=;
 b=IFEsJriOyAKmkA6yiUBqBRChhRcheGj873DoIY+nSe43oxsk79bg2AIDvDCaftf68FoVXi
 4ZN7osuLbl+QDYB1SWHG8J8WeVLUfWF0gl4bEMIoRGRNsImPQeTf5g0MZpzcZu77cCkA55
 GSn4TxjDsPVywYFut+bAuBXRymY2hGU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-LnzPjo0AOEaq9QeqCSxj3g-1; Tue, 17 May 2022 03:46:25 -0400
X-MC-Unique: LnzPjo0AOEaq9QeqCSxj3g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14670299E75B;
 Tue, 17 May 2022 07:46:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E201C573540;
 Tue, 17 May 2022 07:46:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ACF6E21E690D; Tue, 17 May 2022 09:46:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>,  Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>,  qemu-devel@nongnu.org,  philmd@redhat.com,
 pbonzini@redhat.com,  Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 1/3] ui/gtk: new param monitor to specify target monitor
 for launching QEMU
References: <20220428231304.19472-1-dongwon.kim@intel.com>
 <20220428231304.19472-2-dongwon.kim@intel.com>
 <YnDyodis9sdnyh3O@redhat.com>
 <20220509213105.GA180@dongwonk-MOBL.amr.corp.intel.com>
 <20220510105810.erlgwqjtlauwf6pk@sirius.home.kraxel.org>
Date: Tue, 17 May 2022 09:46:23 +0200
In-Reply-To: <20220510105810.erlgwqjtlauwf6pk@sirius.home.kraxel.org> (Gerd
 Hoffmann's message of "Tue, 10 May 2022 12:58:10 +0200")
Message-ID: <875ym4txdc.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Gerd Hoffmann <kraxel@redhat.com> writes:

> On Mon, May 09, 2022 at 02:31:05PM -0700, Dongwon Kim wrote:
>> Daniel,
>> 
>> I found a way to make the monitor arguments in array type (['uint32']).
>> And I know how to retrieve monitor values from it but I could not find
>> how to pass the monitor values when starting qemu. Like,
>> 
>> qemu-system-x86_64 ..... gtk,gl=on.....monitor=????
>> 
>> I tried several different things but it keeps getting error saying
>> Invalid parameter type, expected 'array'.
>> 
>> Do you know how to pass this arg?
>
> qemu accepts json for -display, that should work:
>
> -display '{ "type": "gtk", "monitor": [ 1, 2 ] }'
>
> Not sure whenever there is some way to specify arrays using
> the -display gtk,$options style.

There is, but it's somewhat ugly:

    -display gtk,monitor.0=1,monitor.1=2

See util/keyval.c.


