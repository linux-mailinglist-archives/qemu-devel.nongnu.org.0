Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374726FF36C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 15:51:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px6hp-0002ef-Np; Thu, 11 May 2023 09:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1px6hg-0002WN-46
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:51:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1px6hd-0000NU-Vo
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683813089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wz8lByrzMIwNb+5jbXLrc4qE6hSdr4rSxif0TacHG6A=;
 b=K8L3KrFnwnzUe7Znkats3nxQB/Sb4fBNy8ceF7rShH/qqX/E+YY0BCrgqqg+wWS9MGv6VJ
 VCaDeQiJh5ltp28oCM/ZFJhKJnS40duicWGPOV0b2ZNWV11pxqpJC4XcNmFEA1ZbYxqJb6
 Zn+j4uY9MpHULaSzZyvvjbHzZS4TJHM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-wHdI-tqgPVSPBp6Ev9Huwg-1; Thu, 11 May 2023 09:51:27 -0400
X-MC-Unique: wHdI-tqgPVSPBp6Ev9Huwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 013AA870833;
 Thu, 11 May 2023 13:51:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D28714078906;
 Thu, 11 May 2023 13:51:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A13C521F166D; Thu, 11 May 2023 15:51:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Dinah Baum <dinahbaum123@gmail.com>,  qemu-devel@nongnu.org
Subject: Re: [RESEND PATCH v2 0/3] Enable -cpu <cpu>,help
References: <20230404011956.90375-1-dinahbaum123@gmail.com>
 <CAFEAcA-wGkaf0jXVoj-Qp5fC8UbBUBH3jWyunObuuTPZ8dk_Kg@mail.gmail.com>
Date: Thu, 11 May 2023 15:51:22 +0200
In-Reply-To: <CAFEAcA-wGkaf0jXVoj-Qp5fC8UbBUBH3jWyunObuuTPZ8dk_Kg@mail.gmail.com>
 (Peter Maydell's message of "Thu, 11 May 2023 13:16:47 +0100")
Message-ID: <87r0rnht7p.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Maydell <peter.maydell@linaro.org> writes:

> Markus, I think you said you would review this patchset?

I did, but it got crowded out.  I'm going to look at it now.  Wish me
absence of interruptions...


