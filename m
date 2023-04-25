Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4686F6EE300
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:30:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIjv-00077i-Jg; Tue, 25 Apr 2023 09:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prIjr-00075i-G1
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:29:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prIjq-0001EC-34
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:29:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682429385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M9FBRqIqNaIXkbWq9RFdfdcVb2DMTdSbgasWyKOMJLc=;
 b=b37/MDnU/SeSsif3o1yY+mkxGu3nMcMqYX2S+AVPUkIuZhND81hy2tIyRUwGT3yLIjmk4m
 xTL+BCyeGQK+5QnIDYbbjgza9XPqDpQK12Lx0OM+ZWAj2RFYy8Hq1eLhE2ep243pJRLQ4R
 tPIuGWKM7jC39WKE0CgyQfdKkKbul4g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-Zd-h5rVzMYqwSZsPbtxI7g-1; Tue, 25 Apr 2023 09:29:40 -0400
X-MC-Unique: Zd-h5rVzMYqwSZsPbtxI7g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBBB038149AE;
 Tue, 25 Apr 2023 13:29:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AE68492C13;
 Tue, 25 Apr 2023 13:29:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9FD2921F1672; Tue, 25 Apr 2023 15:29:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,  Eric
 Blake <eblake@redhat.com>,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v2 0/3] qapi: allow unions to contain further unions
References: <20230223134027.2294640-1-berrange@redhat.com>
 <87v8ize5j3.fsf@pond.sub.org>
 <deee0bde-86a7-5264-550b-a8650aaec88d@nutanix.com>
 <c12d88b2-7e04-79b5-d195-919c32c58e61@nutanix.com>
Date: Tue, 25 Apr 2023 15:29:38 +0200
In-Reply-To: <c12d88b2-7e04-79b5-d195-919c32c58e61@nutanix.com> (Het Gala's
 message of "Fri, 14 Apr 2023 12:02:43 +0530")
Message-ID: <87bkjct7i5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Het Gala <het.gala@nutanix.com> writes:

> Hi, this is just a reminder mail to check if Daniel has plan to post v3 patches in the coming days. Would like these patches to get merged in qemu as soon as possible, so that we all can focus on restructuring of 'migrate' QAPI :)

I just queued v3.  Expect a pull request today or tomorrow.


