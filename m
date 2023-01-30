Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FF86804CC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 05:13:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMLWQ-00075e-I4; Sun, 29 Jan 2023 23:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLWP-00074p-4H
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:11:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLWM-00014T-On
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:11:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675051912;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=MGdaT5bvuLQsbnKTmhYEgxvxJGVouGB8/uGbyCZ1Syk=;
 b=gXFDob/+ms3ifJV8Kk5KlIzk6Z3SlWZKcTxgmzCNUdUv8m9pQ42cNIoq6+U6qBDp6wc/Sk
 jaKyNGXk7O6qHLxSgj5wF2uWT7HMuIg3OqS6dKYpv5YZbvSQmt08EcQvPtW6CYP0pscs1k
 97vYvSlOwkZrqtfg8tBKWVxbHLljW+w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-czx0CfWLMqeVKsy4SNhwCA-1; Sun, 29 Jan 2023 23:11:51 -0500
X-MC-Unique: czx0CfWLMqeVKsy4SNhwCA-1
Received: by mail-wm1-f72.google.com with SMTP id
 h18-20020a05600c351200b003dc25fc1849so6384675wmq.6
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 20:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MGdaT5bvuLQsbnKTmhYEgxvxJGVouGB8/uGbyCZ1Syk=;
 b=Pf5RD58bE81IrpMsoQ4TJAZTrN2EBQ8RDbyvTSeEq3LfAEuJH4ocadrfR0GLfYqcTf
 PYlsiqP88fE1hMsZOjBfSTRbsxVTlFpaQc5oq0gcipV+wMMEkutMNRyNLsfKN3mlu+hB
 hfyw523IDx9wZH5mDbVwJ3A4IlVTVB6n0F3jK8pHqQnpLP1brH3k0fUCkXWIchIBCYL+
 9wlUwgFIo87j7GItomTTEXV040ahkc0mvxEjcrsRKwbgAneg386Yynyqn2aMkGxm5bLC
 H+/7y8cVGr/5cONFSDtlaQyJWhkiUzyfOaXMSUWcYrWRffZW9haG4fZT8IRMYSre8ZcO
 9ngw==
X-Gm-Message-State: AO0yUKXREAbp63GCFWRd2T+gouR+lRFEa6LV9M0RyuZaF0x7oP1KClQO
 IjJSWYF4MzmNKXjRdfIaeRjQ3BIgsTJdruhZHw5hbapKba5RlNhzLn4DThNTwmHRARz0sNkP6dP
 F9lHdKQ5TulTwuOY=
X-Received: by 2002:a05:600c:1c9f:b0:3dc:5aa8:952e with SMTP id
 k31-20020a05600c1c9f00b003dc5aa8952emr1331285wms.21.1675051910179; 
 Sun, 29 Jan 2023 20:11:50 -0800 (PST)
X-Google-Smtp-Source: AK7set9PrQoiJWa4Jju2OJXeaQpCMAKn/3ZFDL05ufOnJUvHZgjK5BymTZTePkBgeWvTc4M9o00Dbw==
X-Received: by 2002:a05:600c:1c9f:b0:3dc:5aa8:952e with SMTP id
 k31-20020a05600c1c9f00b003dc5aa8952emr1331245wms.21.1675051909833; 
 Sun, 29 Jan 2023 20:11:49 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 l4-20020a7bc444000000b003db03725e86sm11403628wmi.8.2023.01.29.20.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:11:49 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  qemu-devel@nongnu.org,
 richard.henderson@linaro.org,  pbonzini@redhat.com,  kwolf@redhat.com,
 hreitz@redhat.com,  imp@bsdimp.com,  kevans@freebsd.org,
 berrange@redhat.com,  groug@kaod.org,  qemu_oss@crudebyte.com,
 mst@redhat.com,  philmd@linaro.org,  peter.maydell@linaro.org,
 alistair@alistair23.me,  jasowang@redhat.com,
 jonathan.cameron@huawei.com,  kbastian@mail.uni-paderborn.de,
 michael.roth@amd.com,  kkostiuk@redhat.com,  tsimpson@quicinc.com,
 palmer@dabbelt.com,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 10/19] migration: Clean up includes
In-Reply-To: <87wn5hoeqf.fsf@pond.sub.org> (Markus Armbruster's message of
 "Fri, 20 Jan 2023 08:19:04 +0100")
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-11-armbru@redhat.com>
 <Y8kOj6m4jhtUVg+A@work-vm> <87wn5ivmru.fsf@pond.sub.org>
 <Y8ktYMfKahtAZ83A@work-vm> <87wn5hoeqf.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:11:48 +0100
Message-ID: <87bkmgpsor.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
>
>> * Markus Armbruster (armbru@redhat.com) wrote:
>>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
>>> 
>>> > * Markus Armbruster (armbru@redhat.com) wrote:
>>> >> Clean up includes so that osdep.h is included first and headers
>>> >> which it implies are not included manually.
>>> >
>>> > That change doesn't seem to match the message; the patch is removing the
>>> > osdep.h include.
>>> 
>>> It's the commit message scripts/clean-includes creates :)
>>> 
>>> I can throw in another patch to the script so it mentions it also
>>> removes qemu/osdep.h from headers.
>>
>> Oh hmm it would be clearer;
>
> What about
>
>     $GITSUBJ: Clean up includes
>
>     Clean up includes so that osdep.h is included first in .c and not in
>     .h, and headers which it implies are not included manually.
>
>     This commit was created with scripts/clean-includes.
>
>
>>                             but OK then, so 
>>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Sounds ok to me.

Reviewed-by: Juan Quintela <quintela@redhat.com>


