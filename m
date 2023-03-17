Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134BB6BEAD1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 15:14:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdAql-0005TO-H1; Fri, 17 Mar 2023 10:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pdAqj-0005TE-LJ
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:14:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pdAqi-0003qp-92
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679062466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L+EjyYLsUdcwIuhiGRSQc5QBxxULaagwf/qDgRJjAi0=;
 b=GgYfAlmAwh37bEuZnj2cVXOr6vIXkIjQZIsAgBJ/HpkJIYEg7zdn0R2oDJHpQarOZspieW
 Nzpfz3p3C/1b51EJdR4M/23juBhPagF2AiitfYBH2Dnphtr1RZYpwDx5nsp1Dcciy/CjFT
 nPnaVwgbeBIfG+xhfZO/7dgIKLWENys=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-j_ncna6yP0aEuWaYDRt_BA-1; Fri, 17 Mar 2023 10:14:25 -0400
X-MC-Unique: j_ncna6yP0aEuWaYDRt_BA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E985585A588;
 Fri, 17 Mar 2023 14:14:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66FDC40D1C7;
 Fri, 17 Mar 2023 14:14:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5D41121E681C; Fri, 17 Mar 2023 15:14:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,
 marcandre.lureau@redhat.com,  berrange@redhat.com,  jsnow@redhat.com
Subject: Re: [PATCH 11/14] tests/qapi-schema: Clean up positive test for
 conditionals
References: <20230316071325.492471-1-armbru@redhat.com>
 <20230316071325.492471-12-armbru@redhat.com>
 <20230317010950.6oxwhloomaup4m2l@redhat.com>
 <87jzzfoqkz.fsf@pond.sub.org>
 <20230317122924.lbx4kni45tes5byo@redhat.com>
Date: Fri, 17 Mar 2023 15:14:23 +0100
In-Reply-To: <20230317122924.lbx4kni45tes5byo@redhat.com> (Eric Blake's
 message of "Fri, 17 Mar 2023 07:29:24 -0500")
Message-ID: <87lejvh3cw.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

Eric Blake <eblake@redhat.com> writes:

> On Fri, Mar 17, 2023 at 07:10:52AM +0100, Markus Armbruster wrote:
>> Eric Blake <eblake@redhat.com> writes:
>> 
>> > On Thu, Mar 16, 2023 at 08:13:22AM +0100, Markus Armbruster wrote:
>> >> Union TestIfUnion is conditional on macros TEST_IF_UNION and
>> >> TEST_IF_STRUCT.  It uses TestIfEnum, which is conditional on macro
>> >> TEST_IF_ENUM.  If TEST_IF_ENUM and TEST_IF_STRUCT are defined, but
>> >> TEST_IF_ENUM isn't, the generated code won't compile.
>> >
>> > s/ENUM/UNION/ in one of these two uses in this sentence.
>> 
>> Yes: If TEST_IF_UNION and TEST_IF_UNION are defined, ...
>
> If TEST_IF_UNION and TEST_IF_STRUCT are defined, ...
>
> (you are stuck in a maze of twisty little passages, all alike)

I am!

Thanks :)


