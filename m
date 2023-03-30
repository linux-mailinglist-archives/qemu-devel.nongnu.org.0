Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5E56D0E55
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 21:08:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phxc6-0003Du-D7; Thu, 30 Mar 2023 15:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1phxc3-0003Dk-T2
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 15:07:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1phxc2-0006b9-5A
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 15:07:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680203224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uIRFGDPg14oZmYYKq+mGiRXG/9PTDEeIRc++/KM9Ma4=;
 b=L9KDNcPnMV99j5vIDwoZwh10pzHlGH3KztcJIGqb+9iLV050pL8/KHQN35GihPDhSRVX6o
 3VMO6gGvIEo8nR+3dxtwM2OnzZVaUWoHtnDmk+tC3mtlZJBIkA/KEviQRlMim4JpTtrXSO
 JEwAIDclFn43Kg+dPY2DlW6Xlv2jC7A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-roNUKrF8OEaUT7QJHA50aw-1; Thu, 30 Mar 2023 15:07:01 -0400
X-MC-Unique: roNUKrF8OEaUT7QJHA50aw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7C18801206;
 Thu, 30 Mar 2023 19:07:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E41640BC797;
 Thu, 30 Mar 2023 19:07:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4782221E6926; Thu, 30 Mar 2023 21:06:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Yohei Kojima <y-koj@outlook.jp>
Cc: qemu-devel@nongnu.org,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Daniel P
 . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v3 1/4] util: Add thread-safe qemu_strerror() function
References: <TYZPR06MB5418D71BB6F2BBFD80C01E559D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
 <TYZPR06MB5418A6BDB94FB0D97ABA31299D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
Date: Thu, 30 Mar 2023 21:06:59 +0200
In-Reply-To: <TYZPR06MB5418A6BDB94FB0D97ABA31299D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
 (Yohei Kojima's message of "Fri, 31 Mar 2023 02:13:19 +0900")
Message-ID: <87edp6oy7g.fsf@pond.sub.org>
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

Yohei Kojima <y-koj@outlook.jp> writes:

> Add qemu_strerror() which follows the POSIX specification for
> strerror(). While strerror() is not guaranteed to be thread-safe, this
> function is thread-safe.

Why not g_strerror()?

> This function is added to solve the following issue:
> https://gitlab.com/qemu-project/qemu/-/issues/416

The issue even asks for it...

> Signed-off-by: Yohei Kojima <y-koj@outlook.jp>


