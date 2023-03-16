Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F156BC5FA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 07:09:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcgly-0003rW-Iu; Thu, 16 Mar 2023 02:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pcglv-0003ps-VP
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 02:07:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pcglt-0007rv-BF
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 02:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678946847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hncmZl5hbFYiiRVTF1mbXSFVVvbJbe4MB5I4PCvMudk=;
 b=HbGuewRIJYi1YEtH8Y/nOMtU3KRdOpnsyiC7wUT1vbfaw8svo+o4aSQh3IgZjmYnD7sLer
 f9qHeeBl3KnInCzZx0R1X81t1l/MeOQ5mJoUKF7geIGoyQ4UKNTLQPllo4hz2MZgahKeM5
 LPgYt7YEMI8rytxd+yBjmqSe6V9L6Jw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-Kt4YI-eFMT6uLUMqJyWSOA-1; Thu, 16 Mar 2023 02:07:23 -0400
X-MC-Unique: Kt4YI-eFMT6uLUMqJyWSOA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30C0B85A5B1;
 Thu, 16 Mar 2023 06:07:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03812400F5D;
 Thu, 16 Mar 2023 06:07:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E726E21E675B; Thu, 16 Mar 2023 07:07:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Marco Liebel <quic_mliebel@quicinc.com>,
 qemu-devel@nongnu.org,  Taylor Simpson <tsimpson@quicinc.com>,  Cleber
 Rosa <crosa@redhat.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH] Use f-strings in python scripts
References: <20230313172535.2409370-1-quic_mliebel@quicinc.com>
 <c05ddbd3-8f26-5492-3961-7f3d564373d7@linaro.org>
 <ZBGo8WNlnRZUGYJZ@redhat.com>
 <36dae49c-34c9-0850-82ef-4a098b3e6d5d@linaro.org>
 <CAFn=p-YH0Ak6nmFygvBHQA5CMcF0LrZMSNcwmKAgtWRm-Ydjng@mail.gmail.com>
Date: Thu, 16 Mar 2023 07:07:21 +0100
In-Reply-To: <CAFn=p-YH0Ak6nmFygvBHQA5CMcF0LrZMSNcwmKAgtWRm-Ydjng@mail.gmail.com>
 (John Snow's message of "Wed, 15 Mar 2023 19:40:54 -0400")
Message-ID: <87wn3hw7om.fsf@pond.sub.org>
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

John Snow <jsnow@redhat.com> writes:

[...]

> Until then, docstrings should use triple-double quotes. Any other
> string can use whatever quoting style happens to be most convenient
> for the string being written to minimize escaping. Consistency is nice
> where reasonable, but minimizing escapes by using different styles on
> an as-needed basis is a respectable and good thing.
>
> I glanced *very quickly* at these files and it looks like the style is
> to use double quotes for format strings and single quotes for constant
> strings. That seems fine to me.

I agree, and so does PEP 8:

    String Quotes

    In Python, single-quoted strings and double-quoted strings are the
    same.  This PEP does not make a recommendation for this.  Pick a
    rule and stick to it.  When a string contains single or double quote
    characters, however, use the other one to avoid backslashes in the
    string.  It improves readability.

    For triple-quoted strings, always use double quote characters to be
    consistent with the docstring convention in PEP 257.

[...]


