Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219DB5A4FDC
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 17:09:20 +0200 (CEST)
Received: from localhost ([::1]:51360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSgO6-0005vv-VP
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 11:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSgLf-0004FX-CA
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 11:06:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSgLb-0006wz-O9
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 11:06:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661785601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kpospIacgUUqKr6Oyxebh+M2xhBoKVNmSxb6KbBlPwA=;
 b=Eq3sV50WfUXm975x6UPVjvzzWeLQnxYsCCFIEzsPsi0TRyguA2uhH0HRZgXhbBxowVLKMN
 LN2W6XAwJc2gcYeeWJ/HCcCW195Q37JPzWgF3nXxf9fRhJ+rUMgKD6ZkPh1IgBVAfUlNPI
 WHvIGLAM+KAnDM8nrtK1iekCAVB9we8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-3CB6zX5_MqaFAaDgrpH6DQ-1; Mon, 29 Aug 2022 11:06:34 -0400
X-MC-Unique: 3CB6zX5_MqaFAaDgrpH6DQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B343380A0C2;
 Mon, 29 Aug 2022 15:06:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A92440149B4;
 Mon, 29 Aug 2022 15:06:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 108ED21E6900; Mon, 29 Aug 2022 17:06:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,  Bin Meng
 <bin.meng@windriver.com>,  Laurent Vivier <lvivier@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 22/51] tests/qtest: qmp-test: Skip running test_qmp_oob
 for win32
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-23-bmeng.cn@gmail.com>
 <87y1v7nqe9.fsf@pond.sub.org>
 <CAEUhbmVryzMRNJiOzev6cjHCN2FBNHEYqCwhcwh0P0HuymHX8A@mail.gmail.com>
Date: Mon, 29 Aug 2022 17:06:31 +0200
In-Reply-To: <CAEUhbmVryzMRNJiOzev6cjHCN2FBNHEYqCwhcwh0P0HuymHX8A@mail.gmail.com>
 (Bin Meng's message of "Mon, 29 Aug 2022 22:23:47 +0800")
Message-ID: <87ler7m6mg.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Bin Meng <bmeng.cn@gmail.com> writes:

> Hi Markus,
>
> On Mon, Aug 29, 2022 at 9:14 PM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Bin Meng <bmeng.cn@gmail.com> writes:
>>
>> > From: Bin Meng <bin.meng@windriver.com>
>> >
>> > The test_qmp_oob test case calls mkfifo() which does not exist on
>> > win32. Exclude it.
>> >
>> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> > ---
>> >
>> >  tests/qtest/qmp-test.c | 6 ++++++
>> >  1 file changed, 6 insertions(+)
>> >
>> > diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
>> > index b950dbafaf..4a165447f8 100644
>> > --- a/tests/qtest/qmp-test.c
>> > +++ b/tests/qtest/qmp-test.c
>> > @@ -159,6 +159,8 @@ static void test_qmp_protocol(void)
>> >      qtest_quit(qts);
>> >  }
>> >
>> > +#ifndef _WIN32
>> > +
>> >  /* Out-of-band tests */
>> >
>> >  char *tmpdir;
>> > @@ -279,6 +281,8 @@ static void test_qmp_oob(void)
>> >      qtest_quit(qts);
>> >  }
>> >
>> > +#endif /* _WIN32 */
>> > +
>> >  /* Preconfig tests */
>> >
>> >  static void test_qmp_preconfig(void)
>> > @@ -338,7 +342,9 @@ int main(int argc, char *argv[])
>> >      g_test_init(&argc, &argv, NULL);
>> >
>> >      qtest_add_func("qmp/protocol", test_qmp_protocol);
>> > +#ifndef _WIN32
>> >      qtest_add_func("qmp/oob", test_qmp_oob);
>> > +#endif
>> >      qtest_add_func("qmp/preconfig", test_qmp_preconfig);
>> >      qtest_add_func("qmp/missing-any-arg", test_qmp_missing_any_arg);
>>
>> I'd appreciate a comment explaining why we have to disable this test on
>> Windows.
>
> The reason is explained in the commit message.

Yes, and putting it there is a good idea.  But I'd appreciate if you
*also* put it in the code, so future readers of the code don't have to
dig through git history.


