Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510E73B297
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 11:56:38 +0200 (CEST)
Received: from localhost ([::1]:43062 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haH2b-0004YX-H7
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 05:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50343)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1haH0h-0003IA-3K
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 05:54:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1haH0e-0003K9-SD
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 05:54:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44622)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1haH0X-0003Ds-6B
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 05:54:31 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A30E4356E8;
 Mon, 10 Jun 2019 09:54:25 +0000 (UTC)
Received: from redhat.com (ovpn-116-138.ams2.redhat.com [10.36.116.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 380D15D705;
 Mon, 10 Jun 2019 09:54:25 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
In-Reply-To: <20190521024748.GA23193@richard> (Wei Yang's message of "Tue, 21
 May 2019 10:47:48 +0800")
References: <20190515121544.4597-1-quintela@redhat.com>
 <20190515121544.4597-7-quintela@redhat.com>
 <20190521024748.GA23193@richard>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Mon, 10 Jun 2019 11:54:22 +0200
Message-ID: <87a7epvk8h.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 10 Jun 2019 09:54:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 6/8] migration: Make none operations
 into its own structure
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wei Yang <richardw.yang@linux.intel.com> wrote:
> On Wed, May 15, 2019 at 02:15:42PM +0200, Juan Quintela wrote:
>>+
>>+MultifdMethods multifd_none_ops = {
>>+    .send_prepare = none_send_prepare,
>>+    .send_write = none_send_write,
>>+    .recv_pages = none_recv_pages
>>+};
>>+
>> static int multifd_send_initial_packet(MultiFDSendParams *p, Error **errp)
>> {
>>     MultiFDInit_t msg;
>>@@ -904,6 +938,8 @@ struct {
>>     uint64_t packet_num;
>>     /* send channels ready */
>>     QemuSemaphore channels_ready;
>>+    /* multifd ops */
>>+    MultifdMethods *ops;
>> } *multifd_send_state;
>> 
>> /*
>>@@ -1093,6 +1129,8 @@ static void *multifd_send_thread(void *opaque)
>>     /* initial packet */
>>     p->num_packets = 1;
>> 
>>+    multifd_send_state->ops = &multifd_none_ops;
>>+
>
> I am afraid it is not a good practice to assign ops when each thread starts
> work.

Agreed.

Thanks, Juan.

