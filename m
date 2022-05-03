Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D93518332
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 13:22:13 +0200 (CEST)
Received: from localhost ([::1]:51268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlqbb-0002wk-Q1
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 07:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nlqKp-0004Gn-7R
 for qemu-devel@nongnu.org; Tue, 03 May 2022 07:04:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nlqKm-0002m2-C8
 for qemu-devel@nongnu.org; Tue, 03 May 2022 07:04:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651575887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ozjDgRqWhGOF87P0/JgjiSVZttrS/jIQ07745Ua++mc=;
 b=D46Hp+v+q6IPCYxRoAiu/Pt0OB2ctykC/zJQSJBEQu1S/dKDphtxdiRBTKKYfv5MBemlZf
 MbMMf4LFYU3kJGuat9mW0lmj/JMl51eCPQDrh9Cy3ewFYyj7NNIy1z2ZyNytUMJ28UkYuL
 iiLgQ+Jf1S11Jnhlv+FaJjYCvWCAYfk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-fie4DuZ4NBmSIzKgiG0vcg-1; Tue, 03 May 2022 07:04:46 -0400
X-MC-Unique: fie4DuZ4NBmSIzKgiG0vcg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13D42800B21
 for <qemu-devel@nongnu.org>; Tue,  3 May 2022 11:04:46 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2FB79E60;
 Tue,  3 May 2022 11:04:36 +0000 (UTC)
Date: Tue, 3 May 2022 13:04:35 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Victor Toso <victortoso@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <YnEMQ/07wozNLref@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
 <87a6c52u68.fsf@pond.sub.org>
 <CABJz62NaEgEzEkvdYbNZ5qfkx_gAYfnxt_YbQhGyD08gRH6EYg@mail.gmail.com>
 <87v8uos8lb.fsf@pond.sub.org>
 <CABJz62MTVhDHZo5+sTJKm5b+SZM_W+_o5VmMgx0NVyibYfs=hw@mail.gmail.com>
 <875ymop374.fsf@pond.sub.org>
 <CABJz62OsaZo0hJB=ucereGDOHbK-5Ym4ASqhgVePJr65JRu0gQ@mail.gmail.com>
 <87bkwff3q0.fsf@pond.sub.org>
 <CABJz62PcEPwiZfV9dBQooELvDnrqPTc_iKWYph8CR6_cGUzmWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABJz62PcEPwiZfV9dBQooELvDnrqPTc_iKWYph8CR6_cGUzmWA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 03.05.2022 um 11:40 hat Andrea Bolognani geschrieben:
> So the issues preventing us from producing a "perfect" Go API are
> 
>   1. inconsistent capitalization in type names
> 
>    -> could be addressed by simply changing the schema, as type
>       names do not travel on the wire
> 
>   2. missing dashes in certain command/member names
> 
>    -> leads to Incorrectcamelcase. Kevin's work is supposed to
>       address this

I am surprised that Markus pointed you to my aliases work because the
conclusion after reviewing my last attempt was that he doesn't want the
feature in the proposed form and he wasn't sure if he wants it at all.
To be honest, I considered this one dead.

Even if magically a solution appeared that everyone agreed to, don't
hold your breath, I'm working on different things now and not planning
to get back to QAPI stuff before 7.1 (and preferably not before meeting
Markus in person and discussing the design before I spend the time to
produce another thing that will never be merged). I am hoping to get
back to QAPI later, but I was mostly planning with continuing the QOM
integration, not aliases.

Kevin


