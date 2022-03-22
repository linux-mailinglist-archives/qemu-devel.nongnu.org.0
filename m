Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695034E3BF0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:51:53 +0100 (CET)
Received: from localhost ([::1]:58732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbBA-0003WJ-Hq
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:51:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nWb7R-0007aJ-Hp
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:48:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nWb7P-00028m-Pp
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647942479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ilo8T9F1SDvf0x56/MjU0Hsm1930I9aTwEdlsnveZB0=;
 b=YN33uJ8aYuR4DE7sJXB4pmeYZ4CKXIvAkriPF103jnIAu3Ql1CriH3q+jfbQSgQlbvJR0M
 ZaO6kh2S7YCARwbfELNyIcU/HhbPod4EpICc/lCdvuHR0lFzknNGe5onZt+9dlHyatWGRg
 66grZFQs8v0TkhptnW06UN7bJSnSMkw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-MRvm1VR7PyqdGWNAyVgKOA-1; Tue, 22 Mar 2022 05:47:57 -0400
X-MC-Unique: MRvm1VR7PyqdGWNAyVgKOA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79CFB800882;
 Tue, 22 Mar 2022 09:47:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B83C4B8D43;
 Tue, 22 Mar 2022 09:47:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3A8B821D1F58; Tue, 22 Mar 2022 10:47:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/3] qapi-schema: test: add a unit test for parsing
 array alternates
References: <20220321164243.200569-1-pbonzini@redhat.com>
 <20220321164243.200569-4-pbonzini@redhat.com>
Date: Tue, 22 Mar 2022 10:47:56 +0100
In-Reply-To: <20220321164243.200569-4-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 21 Mar 2022 17:42:43 +0100")
Message-ID: <878rt2jp2r.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/qapi-schema/qapi-schema-test.json |  1 +
>  tests/qapi-schema/qapi-schema-test.out  |  4 +++
>  tests/unit/test-qobject-input-visitor.c | 43 +++++++++++++++++++++++++
>  3 files changed, 48 insertions(+)
>
> diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
> index 43b8697002..ba7302f42b 100644
> --- a/tests/qapi-schema/qapi-schema-test.json
> +++ b/tests/qapi-schema/qapi-schema-test.json
> @@ -119,6 +119,7 @@
>  { 'alternate': 'AltEnumNum', 'data': { 'e': 'EnumOne', 'n': 'number' } }
>  { 'alternate': 'AltNumEnum', 'data': { 'n': 'number', 'e': 'EnumOne' } }
>  { 'alternate': 'AltEnumInt', 'data': { 'e': 'EnumOne', 'i': 'int' } }
> +{ 'alternate': 'AltListInt', 'data': { 'l': ['int'], 'i': 'int' } }
>  
>  # for testing use of 'str' within alternates
>  { 'alternate': 'AltStrObj', 'data': { 's': 'str', 'o': 'TestStruct' } }
> diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
> index 1f9585fa9b..043d75c655 100644
> --- a/tests/qapi-schema/qapi-schema-test.out
> +++ b/tests/qapi-schema/qapi-schema-test.out
> @@ -121,6 +121,10 @@ alternate AltEnumInt
>      tag type
>      case e: EnumOne
>      case i: int
> +alternate AltListInt
> +    tag type
> +    case l: intList
> +    case i: int
>  alternate AltStrObj
>      tag type
>      case s: str
> diff --git a/tests/unit/test-qobject-input-visitor.c b/tests/unit/test-qobject-input-visitor.c
> index 6f59a7f432..2af002dd82 100644
> --- a/tests/unit/test-qobject-input-visitor.c
> +++ b/tests/unit/test-qobject-input-visitor.c
> @@ -776,6 +776,7 @@ static void test_visitor_in_alternate_number(TestInputVisitorData *data,
>      AltEnumNum *aen;
>      AltNumEnum *ans;
>      AltEnumInt *asi;
> +    AltListInt *ali;
>  
>      /* Parsing an int */
>  
> @@ -802,6 +803,12 @@ static void test_visitor_in_alternate_number(TestInputVisitorData *data,
>      g_assert_cmpint(asi->u.i, ==, 42);
>      qapi_free_AltEnumInt(asi);
>  
> +    v = visitor_input_test_init(data, "42");
> +    visit_type_AltListInt(v, NULL, &ali, &error_abort);
> +    g_assert_cmpint(ali->type, ==, QTYPE_QNUM);
> +    g_assert_cmpint(ali->u.i, ==, 42);
> +    qapi_free_AltListInt(ali);
> +
>      /* Parsing a double */
>  
>      v = visitor_input_test_init(data, "42.5");
> @@ -827,6 +834,40 @@ static void test_visitor_in_alternate_number(TestInputVisitorData *data,
>      qapi_free_AltEnumInt(asi);
>  }
>  
> +static void test_visitor_in_alternate_list(TestInputVisitorData *data,
> +                                 const void *unused)
> +{
> +    intList *item;
> +    Visitor *v;
> +    AltListInt *ali;
> +    int i;
> +
> +    v = visitor_input_test_init(data, "[ 42, 43, 44 ]");
> +    visit_type_AltListInt(v, NULL, &ali, &error_abort);
> +    g_assert(ali != NULL);
> +
> +    g_assert_cmpint(ali->type, ==, QTYPE_QLIST);
> +    for (i = 0, item = ali->u.l; item; item = item->next, i++) {
> +        char string[12];
> +
> +        snprintf(string, sizeof(string), "string%d", i);

This appears to be unused.  Can drop in my tree.

> +        g_assert_cmpint(item->value, ==, 42 + i);
> +    }
> +
> +    qapi_free_AltListInt(ali);
> +    ali = NULL;
> +
> +    /* An empty list is valid */
> +    v = visitor_input_test_init(data, "[]");
> +    visit_type_AltListInt(v, NULL, &ali, &error_abort);
> +    g_assert(ali != NULL);
> +
> +    g_assert_cmpint(ali->type, ==, QTYPE_QLIST);
> +    g_assert(!ali->u.l);
> +    qapi_free_AltListInt(ali);
> +    ali = NULL;
> +}
> +
>  static void input_visitor_test_add(const char *testpath,
>                                     const void *user_data,
>                                     void (*test_func)(TestInputVisitorData *data,
> @@ -1188,6 +1229,8 @@ int main(int argc, char **argv)
>                             NULL, test_visitor_in_wrong_type);
>      input_visitor_test_add("/visitor/input/alternate-number",
>                             NULL, test_visitor_in_alternate_number);
> +    input_visitor_test_add("/visitor/input/alternate-list",
> +                           NULL, test_visitor_in_alternate_list);
>      input_visitor_test_add("/visitor/input/fail/struct",
>                             NULL, test_visitor_in_fail_struct);
>      input_visitor_test_add("/visitor/input/fail/struct-nested",

Other than that:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


